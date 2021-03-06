//
//  PauseScreenViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 15/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class PauseScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resumeButtonAction(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.isHidden = true
        (self.parent as? QuestionViewController)?.pauseScreen.isHidden = true
        (self.parent as? QuestionViewController)?.startTimer()
        (self.parent as? QuestionViewController)?.startQuestionTimer()
    }
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
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
