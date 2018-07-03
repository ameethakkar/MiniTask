//
//  ViewController.swift
//  MiniTask
//
//  Created by Amee Thakkar on 7/2/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

var taskArray = [String]()
var dateArray = [String]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var addBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        addBtn.layer.cornerRadius = 25
        addBtn.clipsToBounds = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        taskTableView.reloadData()
    }

    @IBAction func close(segue:UIStoryboardSegue) {
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = taskArray[indexPath.row]
        cell.detailTextLabel?.text = dateArray[indexPath.row]
        
        return cell
    }
}

