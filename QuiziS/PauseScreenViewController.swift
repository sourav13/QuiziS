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
        (self.parent as? QuestionViewController)?.timer =  Timer.scheduledTimer(timeInterval: 1.0, target: (self.parent as? QuestionViewController)!, selector: #selector((self.parent as? QuestionViewController)?.updateTime), userInfo: nil, repeats: true)
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
