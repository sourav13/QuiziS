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
    let grammer  = Grammar()
    var questions = [Question]()
    weak var questionTimer:Timer?
    var questioncount :Double = 10
    var categoryType:Int = 0
    var reviewQuestions = [Question]()
    var yourAnswers :  [Int:Int] = [:]
    var questionCountNum = 0
    var isEnded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    func setUp(){
        pauseScreen.isHidden = true
        endScreen.isHidden = true
        switch categoryType{
            case 0: loadRespectiveQuestions()
            case 1: loadRespectiveWords()
            default: loadRespectiveQuestions()
        }
        initialSetup()
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
    
    
    func loadRespectiveWords(){
        switch(selectedGrammarType){
           case 0: questions = grammer.grammar(grammarType: WordType.foodAndRestaurants.rawValue)
           case 1: questions = grammer.grammar(grammarType: WordType.smallTalk.rawValue)
           case 2: questions = grammer.grammar(grammarType: WordType.travelAndGettingAround.rawValue)
           case 3: questions = grammer.grammar(grammarType: WordType.hobbies.rawValue)
           case 4: questions = grammer.grammar(grammarType: WordType.idioms.rawValue)
           case 5: questions = grammer.grammar(grammarType: WordType.expressYourself.rawValue)
           case 6: questions = grammer.grammar(grammarType: WordType.filmsTvInternet.rawValue)
           case 7: questions = grammer.grammar(grammarType: WordType.atWork.rawValue)
           case 8: questions = grammer.grammar(grammarType: WordType.takingItEasy.rawValue)
           case 9: questions = grammer.grammar(grammarType: WordType.shopping.rawValue)
           default: questions = grammer.grammar(grammarType:WordType.foodAndRestaurants.rawValue)
        }
    }
    
    
    func getCurrentQuestion(currentQuestion:Int)->Question?{
        if questions.isEmpty{
            return nil
        }else{
            return questions[currentQuestion]
        }
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
        setButtonTitles(question: getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
        setQuestionText(question:getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)

    }
    
    func startTimer(){
        if timer != nil{
            timer?.invalidate()
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
                if reviewQuestions.contains(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
                }else{
                    reviewQuestions.append(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
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
        checkAnswer(question: getCurrentQuestion(currentQuestion: currentQuestionNumber!)!,sender: sender)
    
        if reviewQuestions.contains(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
         let index =  reviewQuestions.firstIndex(of: getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
            //set isanswered to true and the answer to the button tag.
            reviewQuestions[index!].isAnswered = true
            reviewQuestions[index!].wrongAns = sender.tag
        }else{
            reviewQuestions.append(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
            reviewQuestions[reviewQuestions.count-1].isAnswered = true
            reviewQuestions[reviewQuestions.count-1].wrongAns = sender.tag
          
        }
       if sender.title(for: .normal) ==  getCurrentQuestion(currentQuestion: currentQuestionNumber!)!.options[ getCurrentQuestion(currentQuestion: currentQuestionNumber!)!.correctAns]{
                questions.remove(at:currentQuestionNumber!)
       }else{
        
        }
        currentQuestionNumber = getRandomQuestion()

        questioncount = 10
        startQuestionTimer()
        
    }
    func getRandomQuestion()->Int{
       var randomIndex = 0

        if questions.count > 0{
            randomIndex = Int(arc4random_uniform(UInt32(questions.count-1)))
            currentQuestionNumber = randomIndex
            currentQuestion = getCurrentQuestion(currentQuestion: currentQuestionNumber!)
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
        if reviewQuestions.contains(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!){
   //      let index =  reviewQuestions.firstIndex(of: getCurrentQuestion(currentQuestion: currentQuestionNumber!))
           
        }else{
            reviewQuestions.append(getCurrentQuestion(currentQuestion: currentQuestionNumber!)!)
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
        questions[currentQuestionNumber!].isAnswered = true
        questions[currentQuestionNumber!].wrongAns = sender.tag
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
        endScreen?.questionLabel.text = reviewQuestions[0].questionText
        endScreen?.correctAnsLabel.text = reviewQuestions[0].options[reviewQuestions[0].correctAns]
        if reviewQuestions[0].isAnswered{
            endScreen?.yourAnsLabel.text = reviewQuestions[0].options[reviewQuestions[0].wrongAns]
            displayAnswerButtonImage(question: reviewQuestions[0], endScreen: endScreen!)
        }else{
            endScreen?.yourAnsLabel.text = ""
            endScreen?.currentAnswerButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        endScreen?.numberofQuestions = reviewQuestions.count - 1
        
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
