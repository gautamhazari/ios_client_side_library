import UIKit
import WebKit

class WebViewController: BaseWebController  {
    
    var request: URLRequest!
    
    @IBOutlet weak var ResultWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultWebView.navigationDelegate = self
        // NSUUID().uuidString
        //request.setValue("qweryhghgh", forHTTPHeaderField: X_REQUEST_ID)
        ResultWebView.load(request)
    }

}


