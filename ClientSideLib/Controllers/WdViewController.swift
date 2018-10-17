import UIKit
import WebKit

class WdViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var config = Config()
    var url = URL (string: EMPTY);
        
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func getLogin(_ sender: Any) {
        var parameters : [String: String] = [:]
        parameters = NetworkUtils.requestConstructor(subId:textView.text)
        url = HttpUtils.createUrlWithParams(url:config.getWdEndpoint(), params:parameters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WdResultSegue" {
            if let destinationVC = segue.destination as? WebViewController {
                destinationVC.url = url
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.setBorders()
        setValues()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setValues() {
        textView.text = self.config.getSubId()
    }
}
