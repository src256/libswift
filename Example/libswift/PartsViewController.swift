//
//  PartsViewController.swift
//  libswift
//
//  Created by sora on 2016/11/16.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import libswift

class PartsViewController: UIViewController {
    @IBOutlet weak var placeHolderTextView: UIPlaceHolderTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.automaticallyAdjustsScrollViewInsets = false
        
        placeHolderTextView.placeHolder = "abc"
//        placeHolderTextView.text = "xxxxxxxxxxxxxxxxxxxxxxxx"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
