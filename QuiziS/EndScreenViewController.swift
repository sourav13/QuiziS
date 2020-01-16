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
    
    @IBOutlet weak var previousButton: UIButton!
    var currentQuesNo = 0
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
        if currentQuesNo < ((self.parent as? QuestionViewController)?.questions.count)! - 1{
            currentQuesNo = currentQuesNo + 1
            questionLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].questionText
            if  ((self.parent as? QuestionViewController)?.questions[currentQuesNo].isAnswered)!{
                yourAnsLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].options[((self.parent as? QuestionViewController)?.questions[currentQuesNo].wrongAns)!]
            }else{
                yourAnsLabel.text = ""
            }
            previousButton.isHidden = false
      
            if currentQuesNo == ((self.parent as? QuestionViewController)?.questions.count)!-1{
                nextButton.isHidden = true
            }
        }else{
   //         previousButton.isHidden = false
        }
             
       
//        for (index, q) in questions.enumerated() {
//                if q.isAnswered{
//                    print("\(yourAnswers[index] ?? -1)")
//                    print("correct answer: \(q.correctAns)")
//                }else{
//                    print("correct answer: \(q.correctAns)")
//                    print("\(yourAnswers[index] ?? -1)")
//                }
//            }
      //  (self.parent as? QuestionViewController)?.yourAnswers
    }
    @IBAction func previousButtonAction(_ sender: UIButton) {
        if currentQuesNo > 0{
             currentQuesNo = currentQuesNo - 1
              questionLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].questionText
                 if  ((self.parent as? QuestionViewController)?.questions[currentQuesNo].isAnswered)!{
                     yourAnsLabel.text = (self.parent as? QuestionViewController)?.questions[currentQuesNo].options[((self.parent as? QuestionViewController)?.questions[currentQuesNo].wrongAns)!]
                 }else{
                     yourAnsLabel.text = ""
                 }
            nextButton.isHidden = false
            if currentQuesNo == 0 {
                previousButton.isHidden = true
            }
        }else{
    
        }
    }
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
