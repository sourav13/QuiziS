//
//  QuestionViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit
import Foundation

class QuestionViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
  
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var pauseScreen: UIView!
    
    @IBOutlet weak var endScreen: UIView!
    
    var timer: Timer?
    var currentQuestion: Question?
    var currentQuestionNumber: Int = 0
    var count = 10
    var score = 0
    var selectedGrammarType: Int = 0
    let grammer  = Grammar()
    var questions = [Question]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseScreen.isHidden = true
        endScreen.isHidden = true
        loadRespectiveQuestions()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    func loadRespectiveQuestions(){
        switch(selectedGrammarType){
            case 0: questions = grammer.grammar(grammarType: GrammarType.prepositions.rawValue)
            case 1: questions = grammer.grammar(grammarType: GrammarType.irregularverbs.rawValue)
            case 2: questions = grammer.grammar(grammarType: GrammarType.adjectivesandadverbs.rawValue)
            case 3: questions = grammer.grammar(grammarType: GrammarType.countableanduncountables.rawValue)
            case 4: questions = grammer.grammar(grammarType: GrammarType.infinitivesorgerunds.rawValue)
            case 5: questions = grammer.grammar(grammarType: GrammarType.moreorless.rawValue)
            case 6: questions = grammer.grammar(grammarType: GrammarType.expressionsofcolor.rawValue)
            case 7: questions = grammer.grammar(grammarType: GrammarType.fewandlittle.rawValue)
            case 8: questions = grammer.grammar(grammarType: GrammarType.adverbialclauses.rawValue)
            case 9: questions = grammer.grammar(grammarType: GrammarType.modals.rawValue)
            case 10: questions = grammer.grammar(grammarType:GrammarType.linkers.rawValue)
            case 11: questions = grammer.grammar(grammarType:GrammarType.conjunctions.rawValue)
            default: questions = grammer.grammar(grammarType:GrammarType.prepositions.rawValue)
        }
    }
    func getCurrentQuestion(currentQuestion:Int)->Question{
            return questions[currentQuestion]
    }
    func initialSetup(){
        score = 0
        count = 10
        currentQuestionNumber = 0
        if timer != nil {
            timer?.invalidate()
        }
        //initial score setup
        scoreLabel.text = "Score:0"
        //create timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        //setup Initial question text and button titles.
        setButtonTitles(question: getCurrentQuestion(currentQuestion: currentQuestionNumber))
        setQuestionText(question:getCurrentQuestion(currentQuestion: currentQuestionNumber))
        //setup Question Number
        questionNumberLabel.text = "1"
    }
    @objc func updateTime(){
        if count >= 0 {
            let seconds = String(count%60)
            timeLabel.text = "Time: \(seconds)"
            count -= 1
        }else{
            endScreen.isHidden = false
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
 
   
    func setButtonTitles(question:Question){
        firstButton.setTitle(question.options[0], for: .normal)
        secondButton.setTitle(question.options[1], for: .normal)
        thirdButton.setTitle(question.options[2], for: .normal)
        fourthButton.setTitle(question.options[3], for: .normal)
    }
    func setQuestionText(question:Question){
        questionLabel.text = question.questionText
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        checkAnswer(question: getCurrentQuestion(currentQuestion: currentQuestionNumber),sender: sender)
        setupNextQuestion(questionNumber: setRandomQuestion())
        
    }
    func setRandomQuestion()->Int{
        
        if currentQuestionNumber < questions.count-1{
            currentQuestionNumber = currentQuestionNumber+1
        }else{
            //load alert or another viewcontroller to exit and reset.
            return 0
        }
        
          //create a random int for question whose isAnswered is false and set to currentQuestionNumber
        return currentQuestionNumber
    }
    
    func setupNextQuestion(questionNumber:Int){
        currentQuestionNumber = questionNumber
        currentQuestion = getCurrentQuestion(currentQuestion: questionNumber)
        setButtonTitles(question: currentQuestion!)
        setQuestionText(question: currentQuestion!)
        questionNumberLabel.text = "\(currentQuestionNumber+1)"
    }
    
    func checkAnswer(question:Question,sender:UIButton){
        if sender.title(for: .normal) == question.options[question.correctAns]{
            score = score+1
            scoreLabel.text = "Score:\(score)"
        }
        
    }
    
    @IBAction func pauseButtonAction(_ sender: UIBarButtonItem) {
        timer?.invalidate()
        pauseScreen.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        (self.children.first as? PauseScreenViewController)?.view.isHidden = false
    }
    @IBAction func skipButtonAction(_ sender: Any) {
        
        
    }

}
