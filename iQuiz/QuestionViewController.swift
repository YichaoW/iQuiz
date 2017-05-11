//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Yichao Wang on 5/11/17.
//  Copyright © 2017 Yichao Wang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var currentQuestion = 1
    var selected = ""
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!

  
    @IBOutlet var answers: [UIButton]!
    @IBAction func answerPressed(_ sender: UIButton) {
        for item in answers {
            item.backgroundColor = UIColor.white
        }
        sender.backgroundColor = UIColor.blue
        selected = sender.currentTitle!
    }

    @IBAction func submitPressed(_ sender: UIButton) {
        if (selected != "") {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
            vc.currentQuestion = currentQuestion
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
