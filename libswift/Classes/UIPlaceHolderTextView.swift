//
//  UIPlaceHolderTextView.swift
//  Pods
//
//  Created by sora on 2016/11/16.
//
//

import UIKit

// http://stackoverflow.com/questions/1328638/placeholder-in-uitextview
// http://qiita.com/matsuhisa_h/items/5f4877e8ec89729de824 2015/01/04
// http://qiita.com/k_kinukawa/items/eeb0f91980dfb086976a 2015/12/23

@IBDesignable public class UIPlaceHolderTextView: UITextView {
    static let kPlaceHolderTag = 999
    lazy var placeHolderLabel = UILabel()
    @IBInspectable public var placeHolderColor = UIColor.lightGray
    @IBInspectable public var placeHolder = ""
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(notification:)), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(notification:)), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func draw(_ rect: CGRect) {
        if placeHolder.count > 0 {
            placeHolderLabel.frame           = CGRect(x: 4, y: 8, width: bounds.size.width - 16, height: 0)
            placeHolderLabel.lineBreakMode   = NSLineBreakMode.byWordWrapping
            placeHolderLabel.numberOfLines   = 0
//            self.font = UIFont.boldSystemFont(ofSize: 20)
            placeHolderLabel.font            = font
            placeHolderLabel.backgroundColor = UIColor.clear
            placeHolderLabel.textColor       = placeHolderColor
            placeHolderLabel.alpha           = 0
            placeHolderLabel.tag             = UIPlaceHolderTextView.kPlaceHolderTag
            placeHolderLabel.text            = placeHolder
            placeHolderLabel.sizeToFit()
            addSubview(placeHolderLabel)
        }
        sendSubview(toBack: placeHolderLabel)
        changePlaceHolderColor()
        super.draw(rect)
    }
    
    @objc func textChanged(notification: Notification?) {
        changePlaceHolderColor()
    }
    
    private func changePlaceHolderColor() {
        if placeHolder.count == 0 {
            return
        }
        let alpha: CGFloat = text.count == 0 ? 1.0 : 0.0
        viewWithTag(UIPlaceHolderTextView.kPlaceHolderTag)?.alpha = alpha
    }
}

