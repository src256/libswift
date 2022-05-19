//
//  SwitchCell.swift
//  
//
//  Created by sora on 2016/11/15.
//
//

import UIKit


public protocol SwitchCellDelegate : AnyObject {
    func switchCellChanged(sender: UISwitch)
}

// UISwitchを内蔵したテーブルセル
public class SwitchCell: UITableViewCell {

    var valueSwitch: UISwitch!
    weak var delegate: SwitchCellDelegate?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.valueSwitch = UISwitch()
        valueSwitch.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        valueSwitch.addTarget(self, action: #selector(valueChanged(sender:)), for: .touchUpInside)
        self.accessoryView = valueSwitch
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(title: String, value: Bool) {
        self.textLabel!.text = title
        self.valueSwitch.isOn = value
    }
    
    public func setValueFieldDelegate(_ delegate : SwitchCellDelegate) {
        self.delegate = delegate
    }
    
    @objc public func valueChanged(sender: UISwitch) {
        if let delegate = delegate {
            delegate.switchCellChanged(sender: valueSwitch)
        }
    }
}
