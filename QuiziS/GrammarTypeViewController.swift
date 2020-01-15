//
//  GrammarTypeViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class GrammarTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let grammarTableViewController = segue.destination as! GrammarTableViewController
        grammarTableViewController.selectedType = (sender as! UIButton).tag
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
