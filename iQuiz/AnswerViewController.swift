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
    var correctAnswer = "Answer 1"
    var answer = ""
    
    @IBOutlet weak var caText: UILabel!
    @IBOutlet weak var rwText: UILabel!
    
    @IBAction func nextPressed(_ sender: Any) {
        nextScreen()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        homeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caText.text = correctAnswer
        if (answer == correctAnswer) {
            score += 1
            rwText.text = "Right!"
        } else {
            rwText.text = "Wrong!"
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(AnswerViewController.swipedR(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(AnswerViewController.swipedL(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func swipedR(_ gesture: UIGestureRecognizer) {
        nextScreen()
    }
    
    func swipedL(_ gesture: UIGestureRecognizer) {
        homeScreen()
    }
    
    func nextScreen() {
        if currentQuestion < totalQuestion {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            self.navigationController?.pushViewController(vc, animated: true)
            currentQuestion += 1
            vc.currentQuestion = currentQuestion
            vc.score = score
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            vc.totalscore = totalQuestion
            vc.scores = score
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func homeScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
