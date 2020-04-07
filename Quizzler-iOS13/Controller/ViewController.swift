//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    var quizeBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizeBrain.checkAnswer(userAnswer)
        
        quizeBrain.nextQuestion()
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI (){
        questionLabel.text = quizeBrain.getQuestionText()
        firstAnswerButton.setTitle(quizeBrain.getAnswerText(location: 0), for: .normal)
        secondAnswerButton.setTitle(quizeBrain.getAnswerText(location: 1), for: .normal)
        thirdAnswerButton.setTitle(quizeBrain.getAnswerText(location: 2), for: .normal)

        progressBar.progress = quizeBrain.getProgressValue()
        scoreLabel.text = "Score: \(quizeBrain.getScore())"
        
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
    }
    
}

