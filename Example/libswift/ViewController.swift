//
//  ViewController.swift
//  libswift
//
//  Created by src on 11/04/2016.
//  Copyright (c) 2016 src. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let rows = [
        "テーブルセルのサンプル",
        "UI部品のサンプル"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = rows[indexPath.row]
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    @IBAction func backWithSegue(_ segue: UIStoryboardSegue) {
        NSLog("back")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "cell", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "parts", sender: self)
        }
    }

}

