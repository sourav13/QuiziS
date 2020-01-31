//
//  GrammarTableViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class GrammarTableViewController: UITableViewController {

    var grammarTypeLabels = ["Prepositions","Irregular verbs","Adjectives & adverbs","Countable & uncountable","Infinitives or gerunds","More or less","Expressions with colour","Few and little","Adverbial Clauses","Modals","Linkers","Conjunctions"]
    var wordsTypeLabels = ["Food & Restaurants","Small Talk","Travel & Getting Around","Hobbies","Idioms","Films, TV, Internet","At Work","Taking It Easy","Shopping"]
    var selectedType:Int = 0 
    var selectedGrammarType : Int  = 0
    var selectedtypeArray  = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedtypeArray = setSelectedType()
    }
    func setSelectedType()->[String]{
        switch selectedType{
        case 0: return grammarTypeLabels
        case 1: return wordsTypeLabels
//        case 2: return grammarTypeLabels
        default: return grammarTypeLabels
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedtypeArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GrammarTableViewCell
      
        cell.grammarTypeButton.setTitle(selectedtypeArray[indexPath.row], for: .normal)
        cell.grammarTypeButton.tag = indexPath.row
        
        return cell
    }
 

  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionViewController = segue.destination as? QuestionViewController
        questionViewController?.selectedGrammarType = (sender as! UIButton).tag
        questionViewController?.categoryType = selectedType
    }


}
