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
    
    @IBOutlet weak var progressView: UIProgressView!
    
    weak var timer: Timer?
    
    
    var currentQuestion: Question?
    var currentQuestionNumber:Int?
    var count = 60
    var score = 0
    var selectedGrammarType: Int = 0

    weak var questionTimer:Timer?
    var questioncount :Double = 10
    var categoryType:Int = 0
    var yourAnswers :  [Int:Int] = [:]
    var questionCountNum = 0
    var isEnded = false
  
    var reviewQuestions = ReviewQuestions()
    var Ques = Questions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func setUp(){
        pauseScreen.isHidden = true
        endScreen.isHidden = true
        switch categoryType{
            case 0: Ques.questions =  Ques.loadRespectiveQuestions(selectedGrammarType:selectedGrammarType )
            case 1: Ques.questions =  Ques.loadRespectiveWords(selectedGrammarType:selectedGrammarType )
            default:  Ques.questions = Ques.loadRespectiveQuestions(selectedGrammarType:selectedGrammarType )
        }
        initialSetup()
    }
  

    
    func initialSetup(){
        setintialScore()
        setinitialQuestion()
        count = 60
        questioncount = 10
        startTimer()
        startQuestionTimer()
    }
    
    func setintialScore(){
         score = 0
         scoreLabel.text = "Score:0"
    }
    
    func setinitialQuestion(){
        questionCountNum = 0
        currentQuestionNumber = getRandomQuestion()
        //setup Initial question text and button titles.
        setButtonTitles(question: Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
        setQuestionText(question:Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)

    }
    
    func startTimer(){
        if timer != nil{
            timer?.invalidate()
            timer = nil
        }
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func startQuestionTimer(){
        if self.questionTimer != nil{
            self.questionTimer?.invalidate()
            self.questionTimer = nil
        }
            self.questionTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuestionTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime(){
        if timer != nil{
            if count >= 0 {
                if count == 60{
                    let seconds = String(60)
                    timeLabel.text = "Time: \(seconds)"
                }else{
                    let seconds = String(count%60)
                    timeLabel.text = "Time: \(seconds)"
                }
                count -= 1
            }else{
               endGame()
            }
        }
    }
    
    @objc func updateQuestionTimer(){
        if !isEnded{
        if self.questionTimer != nil{
            if questioncount >= 2 {
                if questioncount.truncatingRemainder(dividingBy: 10) == 0{
                        progressView.setProgress(Float(1), animated: true)
                }else{
                        let number :Double = questioncount.truncatingRemainder(dividingBy: 10)
                        let y = Double(round(10*number)/100)
                        progressView.setProgress(Float(y), animated: true)
                }
                questioncount -= 1
            }else{
                progressView.setProgress(Float(0.1), animated: true)
                questioncount = 10
                if  !reviewQuestions.reviewQuestions.contains(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
                    reviewQuestions.reviewQuestions.append(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
                }
                currentQuestionNumber = getRandomQuestion()
            }
        }
    }
    }
    
    func showEndScreen(){
        endScreen.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
        checkAnswer(question: Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!,sender: sender)
    
        if reviewQuestions.reviewQuestions.contains(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
            let index =  reviewQuestions.reviewQuestions.firstIndex(of: Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
            //set isanswered to true and the answer to the button tag.
            reviewQuestions.reviewQuestions[index!].isAnswered = true
            reviewQuestions.reviewQuestions[index!].wrongAns = sender.tag
        }else{
            reviewQuestions.reviewQuestions.append(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
            reviewQuestions.reviewQuestions[reviewQuestions.reviewQuestions.count-1].isAnswered = true
            reviewQuestions.reviewQuestions[reviewQuestions.reviewQuestions.count-1].wrongAns = sender.tag
          
        }
        if sender.title(for: .normal) ==  Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!.options[ Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!.correctAns]{
            Ques.questions.remove(at:currentQuestionNumber!)
       }else{
        
        }
        currentQuestionNumber = getRandomQuestion()

        questioncount = 10
        startQuestionTimer()
        
    }
    func getRandomQuestion()->Int{
       var randomIndex = 0

        if Ques.questions.count > 0{
            randomIndex = Int(arc4random_uniform(UInt32(Ques.questions.count-1)))
            currentQuestionNumber = randomIndex
            currentQuestion = Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)
            setButtonTitles(question: currentQuestion!)
            setQuestionText(question: currentQuestion!)
            questionNumberLabel.text = "\(questionCountNum + 1)"
            questionCountNum += 1
        }else{
            endGame()
        }
        return randomIndex

    }

    @IBAction func pauseButtonAction(_ sender: UIBarButtonItem) {
        invalidateTimers()
        pauseScreen.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        (self.children.first as? PauseScreenViewController)?.view.isHidden = false
    }
    
    @IBAction func skipButtonAction(_ sender: Any) {
        if reviewQuestions.reviewQuestions.contains(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
   //      let index =  reviewQuestions.firstIndex(of: getCurrentQuestion(currentQuestion: currentQuestionNumber!))
           
        }else{
            reviewQuestions.reviewQuestions.append(Ques.getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
        }
        
        currentQuestionNumber = getRandomQuestion()
        questioncount = 10
        startQuestionTimer()
    }
    
    func checkAnswer(question:Question,sender:UIButton){
        if sender.title(for: .normal) == question.options[question.correctAns]{
            score = score+1
            scoreLabel.text = "Score:\(score)"
        }
        yourAnswers[currentQuestionNumber!] = sender.tag
        setvaluesForAnsweredQuestion(sender:sender)
    }
    func setvaluesForAnsweredQuestion(sender:UIButton){
        Ques.questions[currentQuestionNumber!].isAnswered = true
        Ques.questions[currentQuestionNumber!].wrongAns = sender.tag
    }
    
    func invalidateTimers(){
        self.timer?.invalidate()
        self.questionTimer?.invalidate()
        self.timer = nil
        self.questionTimer = nil
    }
    func gameReview(){
        //get child
        let endScreen = children.last as? EndScreenViewController
        endScreen?.questionLabel.text = reviewQuestions.reviewQuestions[0].questionText
        endScreen?.correctAnsLabel.text = reviewQuestions.reviewQuestions[0].options[reviewQuestions.reviewQuestions[0].correctAns]
        if reviewQuestions.reviewQuestions[0].isAnswered{
            endScreen?.yourAnsLabel.text = reviewQuestions.reviewQuestions[0].options[reviewQuestions.reviewQuestions[0].wrongAns]
            displayAnswerButtonImage(question: reviewQuestions.reviewQuestions[0], endScreen: endScreen!)
        }else{
            endScreen?.yourAnsLabel.text = ""
            endScreen?.currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        endScreen?.numberofQuestions = reviewQuestions.reviewQuestions.count - 1
        endScreen?.reviewQuestions = reviewQuestions
        
    }
    func displayAnswerButtonImage(question:Question,endScreen:EndScreenViewController){
        if question.options[question.correctAns] == question.options[question.wrongAns]{
            endScreen.currentAnswerButton.setImage(UIImage.checkmark, for: .normal)
        }else{
            endScreen.currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
    }
    func endGame(){
        isEnded  = true
        invalidateTimers()
        gameReview()
        showEndScreen()
    }
}
