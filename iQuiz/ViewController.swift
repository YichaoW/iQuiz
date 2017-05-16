//
//  ViewController.swift
//  iQuiz
//
//  Created by Yichao Wang on 5/1/17.
//  Copyright © 2017 Yichao Wang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var quizSet = [quiz]()
    
    struct quiz {
        var title : String
        var desc : String
        var questions : [Dictionary<String, AnyObject>]
    }
    
    @IBAction func settingPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Setting", message: "Please input an url to get quizzes", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter an url: "
        }
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            alert -> Void in

            let urlText = alertController.textFields![0].text!
            self.getJSON(jsonurl: urlText)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func parseJSON(json: [Dictionary<String, AnyObject>]) {
        for item in json {
            self.quizSet.append(quiz(title: item["title"] as! String, desc: item["desc"] as! String, questions: item["questions"] as! [Dictionary<String, AnyObject>]))
        }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getJSON(jsonurl: String) {
        let url = URL(string: jsonurl)
        if (url != nil) {
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    self.quizSet.removeAll()
                    let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Dictionary<String, AnyObject>]
                    UserDefaults.standard.setValue(json, forKey: "localJSON")
                    self.parseJSON(json: json!)
                
                } else {
                    self.quizSet.removeAll()
                    self.parseJSON(json: UserDefaults.standard.value(forKey: "localJSON") as! [Dictionary<String, AnyObject>])
                }


            }.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        getJSON(jsonurl: "http://tednewardsandbox.site44.com/questions.json")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedR(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
    
        self.tableView.tableFooterView = UIView()
    }
    
    func swipedR(_ gesture: UIGestureRecognizer) {
        //nextScreen()
    }
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        getJSON(jsonurl: "http://tednewardsandbox.site44.com/questions.json")
        refreshControl.endRefreshing()
    }
    
    
    func nextScreen(questions: [Dictionary<String, AnyObject>]) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        vc.questions = questions
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizSet.count
    }

      
    override func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = quizSet[indexPath.row].title
        cell.detailTextLabel!.text = quizSet[indexPath.row].desc
        cell.imageView!.image = UIImage(named: "black-dot")
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        for quiz in quizSet {
            if quiz.title == cell?.textLabel!.text {
                nextScreen(questions: quiz.questions)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

