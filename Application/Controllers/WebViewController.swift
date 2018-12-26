import UIKit
import WebKit

class WebViewController: BaseWebController  {
    
    var request: URLRequest!
    
    @IBOutlet weak var ResultWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultWebView.navigationDelegate = self
        ResultWebView.load(request)
    }  

}


