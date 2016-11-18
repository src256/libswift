//
//  TextFieldCell.swift
//  Pods
//
//  Created by sora on 2016/11/16.
//
//

import UIKit

// UITextFieldを内蔵したテーブルセル。
public class TextFieldCell: UITableViewCell {

    //アウトレットの宛先をCellにしないとクラッシュする
    @IBOutlet weak var valueField: UITextField!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    public func setTitle(_ title: String) {
        valueField.placeholder = title
    }
    
    public func setValue(_ value: String) {
        valueField.text = value
    }
    
    public func setSecureTextEntry(_ enabled: Bool) {
        valueField.isSecureTextEntry = enabled
    }
    
    public func setValueFieldTag(_ tag: Int) {
        valueField.tag = tag
    }
    
    public func setValueFieldDelegate(_ delegate: UITextFieldDelegate) {
        valueField.delegate = delegate
    }
}
