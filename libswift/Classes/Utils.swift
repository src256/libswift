//
//  Utils.swift
//  Pods
//
//  Created by sora on 2016/11/15.
//
//

import Foundation
import UIKit
//http://himaratsu.hatenablog.com/entry/swift/extension
//https://gist.github.com/himaratsu/a7e35241dba0b11be0f8

public extension NSObject {
    class var className: String {
        get {
            return NSStringFromClass(self).components(separatedBy: ".").last!
        }
    }
    var className: String {
        get {
            return type(of: self).className
        }
    }
}

public extension UITableView {

    func registerPodCell<T: UITableViewCell>(type: T.Type) {
        let bundle = Utils.podBundle()
        registerCell(type: type, bundle: bundle)
    }
    
    func registerMainCell<T: UITableViewCell>(type: T.Type) {
        registerCell(type: type, bundle: nil)
    }
    
    func registerCell<T: UITableViewCell>(type: T.Type, bundle: Bundle?) {
        let className = type.className
//        let podBundle = Bundle(for: type)
//        let bundleURL = podBundle.url(forResource: "libswift", withExtension: "bundle")
//        let bundle = Bundle(url: bundleURL!)
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

public class Utils {
    public class func podBundle() -> Bundle? {
        let podBundle = Bundle(for: self)
        let bundleURL = podBundle.url(forResource: "libswift", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        return bundle
    }
}
