//
//  CellViewController.swift
//  libswift
//
//  Created by sora on 2016/11/15.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import libswift

class TestCell: UITableViewCell {
    
}

class CellViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate  {
    @IBOutlet weak var tableView: UITableView!

    fileprivate let rows = [
        "SwitchCellのサンプル",
        "通常のセル",
        "TextFieldCellのサンプル",
        "PureTextViewCellのサンプル",
        "TextViewCellのサンプル"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerPodCell(type: SwitchCell.self)
        tableView.registerPodCell(type: TextFieldCell.self)
        tableView.registerPodCell(type: TextViewCell.self)
        tableView.registerPodCell(type: PureTextViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = tableView.rowHeight
        if indexPath.row == 3 {
            height = 80
        } else if indexPath.row == 4 {
            height = 100
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var resultCell: UITableViewCell? = nil
        if indexPath.row == 0 {
            let cell = tableView.dequeueCell(type: SwitchCell.self, indexPath: indexPath)
            cell.configure(title: "PlaceHolder", value: true)
            cell.setValueFieldDelegate(self)
            resultCell = cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            cell.textLabel?.text = "PlaceHolder"
            resultCell = cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueCell(type: TextFieldCell.self, indexPath: indexPath)
            cell.setTitle("PlaceHolder")
            cell.setValue("PlaceHolder")
            resultCell = cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueCell(type: PureTextViewCell.self, indexPath: indexPath)
//            cell.setTitle("PlaceHolder")
            cell.setValue("PlaceHolder")
            resultCell = cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueCell(type: TextViewCell.self, indexPath: indexPath)
            cell.setTitle("PlaceHolder")
            cell.setValue("PlaceHolder")
            resultCell = cell
        }
        return resultCell!
    }
    
    @IBAction func backWithSegue(_ segue: UIStoryboardSegue) {
        NSLog("back")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func switchCellChanged(sender: UISwitch) {
        print(sender.isOn)
    }
}
