//
//  SwitchCell.swift
//  
//
//  Created by sora on 2016/11/15.
//
//

import UIKit

public class SwitchCell: UITableViewCell {

//    @IBOutlet weak var valueSwitch: UISwitch!
    var valueSwitch: UISwitch!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.valueSwitch = UISwitch()
        valueSwitch.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        self.accessoryView = valueSwitch
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(title: String, value: Bool) {
        self.textLabel!.text = title
        self.valueSwitch.isOn = value
    }
}
