//
//  GrammarTableViewController.swift
//  QuiziS
//
//  Created by sourav sachdeva on 14/01/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import UIKit

class GrammarTableViewController: UITableViewController {

    var grammarTypeLabels = ["Prepositions","Irregular verbs","Adjectives & adverbs","Countable and uncountable","Infinitives or gerunds","More or less","Expressions with colour","Few and little","Adverbial Clauses","Modals","Linkers","Conjunctions"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return grammarTypeLabels.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GrammarTableViewCell
        
        cell.grammarTypeButton.setTitle(grammarTypeLabels[indexPath.row], for: .normal)

        return cell
    }
 

  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
