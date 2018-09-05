import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate  {
    
    var url = URL (string: EMPTY)
    var config = Config()
    var timeOut: Timer!
    @IBOutlet weak var ResultWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultWebView.navigationDelegate = self;
        ResultWebView.load(URLRequest(url: url!))
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        self.timeOut.invalidate()
        if let text = webView.url?.absoluteString{
            if HttpUtils.getQueryStringParameter(url: text, param: Status.authOk.rawValue) != nil {
                authOk()
            }
            if let err = HttpUtils.getQueryStringParameter(url: text, param: Status.error.rawValue) {
                authFailed(message:err)
            }
            if HttpUtils.getQueryStringParameter(url: text, param: Status.smsWait.rawValue) != nil {
                return
            }
        }
    }
  
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
        self.timeOut = Timer.scheduledTimer(timeInterval:TimeInterval(config.getServerTimeout()), target: self,selector: #selector(cancelWeb), userInfo: nil, repeats: false)
    }
    
    func webView(_ webView: WKWebView, didFailNavigation navigation: WKNavigation) {
        self.timeOut.invalidate()
    }
    
    @objc private func cancelWeb() {
        let alert = UIAlertController(title: ERROR, message: CONN_TIMEOUT, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func authOk() {
        let alert = UIAlertController(title: SUCCESS, message: AUTH_SUCCESS, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func authFailed(message: String) {
        let alert = UIAlertController(title: FAIL, message: String(format: MSG_FORMAT, AUTH_ERROR, message), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


