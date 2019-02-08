import UIKit
import WebKit

class WdViewController: BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func getLogin(_ sender: Any) {
        var parameters : [String: String] = [:]
        parameters = NetworkUtils.requestConstructor(msisdn:textView.text)
        request = HttpUtils.createRequestWithParams(url:config.getWdEndpoint(), params:parameters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WdResultSegue" {
            if let destinationVC = segue.destination as? WebViewController {
                destinationVC.request = request
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
        textView.text = self.config.getMsisdnWd()
    }
    
}
