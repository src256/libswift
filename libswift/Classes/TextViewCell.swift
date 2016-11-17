//
//  TextViewCell.swift
//  Pods
//
//  Created by sora on 2016/11/16.
//
//

import UIKit

public class TextViewCell: UITableViewCell {

    @IBOutlet weak var textView: UIPlaceHolderTextView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setTitle(_ title: String) {
        textView.placeHolder = title
    }
    
    public func setValue(_ value: String) {
        textView.text = value
    }
    
    public func setValueFieldDelegate(_ delegate : UITextViewDelegate) {
        textView.delegate = delegate
    }
    
}
