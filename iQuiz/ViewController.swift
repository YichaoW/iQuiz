//
//  ViewController.swift
//  iQuiz
//
//  Created by Yichao Wang on 5/1/17.
//  Copyright © 2017 Yichao Wang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    @IBAction func settingPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "Settings go here", preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }

      
    override func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = subjects[indexPath.row]
        cell.detailTextLabel!.text = "description"
        cell.imageView!.image = UIImage(named: "black-dot")
        return cell
      
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController

        self.navigationController?.pushViewController(vc, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

