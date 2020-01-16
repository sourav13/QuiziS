//
//  EndScreenViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 15/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
         self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func anotherRoundButtonAction(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        (self.parent as? QuestionViewController)?.pauseScreen.isHidden = true
        (self.parent as? QuestionViewController)?.endScreen.isHidden = true
        (self.parent as? QuestionViewController)?.loadRespectiveQuestions()
        (self.parent as? QuestionViewController)?.initialSetup()
   //      (self.parent as? QuestionViewController)?.pauseScreen.isHidden = true
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
