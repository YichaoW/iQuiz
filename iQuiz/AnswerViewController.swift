//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Yichao Wang on 5/11/17.
//  Copyright © 2017 Yichao Wang. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var totalQuestion = 2
    var currentQuestion = 1
    var score = 0

    @IBAction func nextPressed(_ sender: Any) {
        print(currentQuestion)
        if currentQuestion < totalQuestion {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            self.navigationController?.pushViewController(vc, animated: true)
            currentQuestion += 1
            vc.currentQuestion = currentQuestion
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            vc.totalscore = totalQuestion
            vc.scores = score
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
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
