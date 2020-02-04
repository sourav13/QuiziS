//
//  PauseScreenViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 15/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class PauseScreenViewController: UIViewController {
    var questionViewController : QuestionViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resumeButtonAction(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.isHidden = true
        resumeActions()
    }
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func resumeActions(){
        questionViewController = (self.parent as? QuestionViewController)
        questionViewController?.pauseScreen.isHidden = true
        questionViewController?.startTimer()
        questionViewController?.startQuestionTimer()
    }
}
