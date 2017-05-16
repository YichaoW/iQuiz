//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Yichao Wang on 5/11/17.
//  Copyright © 2017 Yichao Wang. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    var totalscore = Int()
    var scores = Int()
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBAction func nextPressed(_ sender: Any) {
        nextScreen()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        nextScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = "\(scores) / \(totalscore)"
        if scores == totalscore {
            descript.text = "Perfect!"
        } else if scores == 0 {
            descript.text = ":("
        } else {
            descript.text = "Almost!"
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
        nextScreen()
    }
    
    func nextScreen() {
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
