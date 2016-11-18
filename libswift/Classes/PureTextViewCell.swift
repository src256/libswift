//
//  PureTextViewCell.swift
//  Pods
//
//  Created by sora on 2016/11/17.
//
//

import UIKit

public class PureTextViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!

    override public func awakeFromNib() {
        super.awakeFromNib()
        textView.textContainer.lineFragmentPadding = 0
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setValue(_ value: String) {
        textView.text = value
    }
    
}
