//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    //object of QuestionList
    let allQuestions = QuestionList ()
    var userAnswer : Bool = true
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = " \(questionNumber + 1) /13"
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
       
        
        if sender.tag == 1{
            userAnswer = true
            }
        else if sender.tag == 2 {
            userAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    func checkAnswer() {
        if userAnswer == allQuestions.list[questionNumber].modelAnswer {
            score = score + 10
            ProgressHUD.showSuccess("3aaash")
        }
        else {
            ProgressHUD.showError("a7aaa")
        }
    }
    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].modelQuestion
           updateUI()
        }
        else{
            
            let alert = UIAlertController(title: "7aaaaseb", message: "inta 5alst ya m3lm alf mabrook", preferredStyle: .alert )
            let restartOption = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartOption)
            present(alert, animated: true, completion: nil)
        }
        
    }
    func updateUI() {
        
        scoreLabel.text = "score :\(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
