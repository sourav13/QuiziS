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
        hideNavigationBar()
    }
    
    @IBAction func anotherRoundButtonAction(_ sender: UIButton) {
        hideNavigationBar()
        (self.parent as? QuestionViewController)?.setUp()
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
