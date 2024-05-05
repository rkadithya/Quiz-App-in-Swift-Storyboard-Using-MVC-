//
//  ViewController.swift
//  Quiz
//
//  Created by Adithya on 05/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var lblScore:UILabel!
    @IBOutlet weak var progressBar : UIProgressView!
    @IBOutlet weak var lblQuestion : UILabel!
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func btnAnswerPressed(_ sender:UIButton){
        
        
        let selectedAnswer = sender.currentTitle
        let actualAnswer = quiz.getActualAnswer()
        
        if(selectedAnswer == actualAnswer){
            sender.backgroundColor = UIColor.green
            quiz.score += 1
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quiz.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        lblQuestion.text = quiz.currentQuestion()
        progressBar.layer.cornerRadius = 5
        progressBar.layer.masksToBounds = true
        progressBar.progress = Float(quiz.questionNumber + 1)/Float(quiz.quizArray.count)
        lblScore.text = "Score : \(quiz.score)"
        btnOption1 .setTitle(quiz.currentAnswers()[0], for: .normal)
        btnOption2 .setTitle(quiz.currentAnswers()[1], for: .normal)
        btnOption3 .setTitle(quiz.currentAnswers()[2], for: .normal)
        btnOption1.backgroundColor = UIColor.clear
        btnOption2.backgroundColor = UIColor.clear
        btnOption3.backgroundColor = UIColor.clear
        
    }
    
}

