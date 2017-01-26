import Foundation
import UIKit

public class UIKitUtils {
    public class func openUrl(url: String) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    public class func nextViewController(segue: UIStoryboardSegue) -> UIViewController? {
        if let nav = segue.destination as? UINavigationController {
            return nav.topViewController
        }
        return segue.destination
    }
    
    public class func isIpad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
