//
//  ViewController.swift
//  Quizzler
//
//  Created by Валерий Клименко on 07.12.2020.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var choice1Button: UIButton!
  @IBOutlet weak var choice2Button: UIButton!
  @IBOutlet weak var choice3Button: UIButton!
  
  
  var questionBrain = QuestionBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    updateUI()
  }

  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    
    if questionBrain.checkAnswer(userAnswer) {
      sender.backgroundColor = UIColor.green
    } else {
      sender.backgroundColor = UIColor.red
    }
    
    questionBrain.nextQuestion()
    
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
  }
  
  @objc func updateUI() {
    questionLabel.text = questionBrain.getQuestionText()
    progressBar.progress = questionBrain.getProgress()
    scoreLabel.text = "Score: \(questionBrain.getScore())"
    
    choice1Button.backgroundColor = UIColor.clear
    choice2Button.backgroundColor = UIColor.clear
    choice3Button.backgroundColor = UIColor.clear
    
    let answers = questionBrain.getAnswers()
    choice1Button.setTitle(answers[0], for: .normal)
    choice2Button.setTitle(answers[1], for: .normal)
    choice3Button.setTitle(answers[2], for: .normal)
  }


}

