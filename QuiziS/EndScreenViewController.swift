//
//  EndScreenViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 15/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnsLabel: UILabel!
    @IBOutlet weak var yourAnsLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var currentAnswerButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    var currentQuesNo = 0
    var numberofQuestions =  0
    override func viewDidLoad() {
        super.viewDidLoad()
         previousButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    func reset(){
        currentQuesNo = 0
        previousButton.isHidden = true
        nextButton.isHidden = false
    }
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        hideNavigationBar()
    }
    
    @IBAction func anotherRoundButtonAction(_ sender: UIButton) {
        reset()
        hideNavigationBar()
        (self.parent as? QuestionViewController)?.setUp()
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if currentQuesNo < numberofQuestions{
            currentQuesNo = currentQuesNo + 1
            questionLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].questionText
            if  ((self.parent as? QuestionViewController)?.questions[currentQuesNo].isAnswered)!{
                yourAnsLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].options[((self.parent as? QuestionViewController)?.questions[currentQuesNo].wrongAns)!]
                displayAnswerButtonImage(question: ((self.parent as? QuestionViewController)?.questions[currentQuesNo])!)
            }else{
                yourAnsLabel.text = ""
                currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            }
            previousButton.isHidden = false
      
            if currentQuesNo == numberofQuestions{
                nextButton.isHidden = true
            }
        }
    }
    @IBAction func previousButtonAction(_ sender: UIButton) {
        if currentQuesNo > 0{
             currentQuesNo = currentQuesNo - 1
              questionLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].questionText
                 if  ((self.parent as? QuestionViewController)?.questions[currentQuesNo].isAnswered)!{
                     yourAnsLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].options[((self.parent as? QuestionViewController)?.questions[currentQuesNo].wrongAns)!]
                     displayAnswerButtonImage(question: ((self.parent as? QuestionViewController)?.questions[currentQuesNo])!)
                 }else{
                     yourAnsLabel.text = ""
                     currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
                 }
            nextButton.isHidden = false
            if currentQuesNo == 0 {
                previousButton.isHidden = true
            }
        }
    }
    func displayAnswerButtonImage(question:Question){
        if question.options[question.correctAns] == question.options[question.wrongAns]{
            currentAnswerButton.setImage(UIImage.checkmark, for: .normal)
        }else{
            currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
    }
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
