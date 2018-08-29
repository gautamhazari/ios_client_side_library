import UIKit
import WebKit
import CoreTelephony

extension UITextField {
    func setBorders() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5
    }
}

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var config = Config()
    var url = URL (string: "");
    var mcc: String = ""
    var mnc: String = ""
    var isMsisdnRequest: Bool = false
    var isMccMncRequest: Bool = false
    var isWithIP: Bool = false
    
    @IBOutlet weak var msisdnField: UITextField!
    @IBOutlet weak var discoveryRequestParameters: UISegmentedControl!
    
    @IBOutlet weak var mccField: UITextField!
    @IBOutlet weak var mncField: UITextField!
    
    @IBOutlet weak var withIPAddressSwitch: UISwitch!
    @IBOutlet weak var ipAddressField: UITextField!
   
    @IBAction func discoveryParametersTapped(_ sender: Any) {
        if discoveryRequestParameters.selectedSegmentIndex == 0 {
            UIView.transition(with: self.msisdnField, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = true
                self.mncField.isHidden = true
                self.msisdnField.isHidden = false
            }, completion: nil)
            isMsisdnRequest = true
            isMccMncRequest = false
        } else if discoveryRequestParameters.selectedSegmentIndex == 1 {
            UIView.transition(with: self.mccField, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = false
                self.mncField.isHidden = false
                self.msisdnField.isHidden = true
            }, completion: nil)
            isMccMncRequest = true
            isMsisdnRequest = false
        } else {
            isMsisdnRequest = false
            isMccMncRequest = false
            UIView.transition(with: self.msisdnField, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.mccField.isHidden = true
                self.mncField.isHidden = true
                self.msisdnField.isHidden = true
            }, completion: nil)
        }
    }
    
    @IBAction func ipAdressTapped(_ sender: Any) {
        if (withIPAddressSwitch.isOn) {
            self.ipAddressField.isHidden = false
            self.isWithIP = true
        } else {
            self.ipAddressField.isHidden = true
            self.isWithIP = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        msisdnField.setBorders()
        mccField.setBorders()
        mncField.setBorders()
        ipAddressField.setBorders()
        if let addr = NetworkUtils.getIPAddress() {
            ipAddressField.text = addr
        } else {
            ipAddressField.text = config.getIpAdress()
        }
        msisdnField.text = self.config.getMsisdn()
        mccField.text = getCellularInformation().mcc
        if mccField.text!.isEmpty {
            mccField.text = self.config.getMcc()
        }
        mncField.text = getCellularInformation().mnc
        if mncField.text!.isEmpty {
            mncField.text = self.config.getMnc()
        }
        discoveryRequestParameters.selectedSegmentIndex = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCellularInformation() -> (mcc: String, mnc: String){
        let networkInfo =  CTTelephonyNetworkInfo()
        if let carrier = networkInfo.subscriberCellularProvider {
            let mcc = carrier.mobileCountryCode
            let mnc = carrier.mobileNetworkCode
            return(mcc!, mnc!)
        } else {
            return("", "")
        }
    }

    func requestConstructor(msisdn: String? = nil, mcc: String? = nil, mnc: String? = nil, sourceIp: String? = nil)-> [String : String] {
        var parameters : [String : String] = [:]
        if let msisdn = msisdn {
            parameters["msisdn"] = msisdn
        }
        if let mcc = mcc {
            parameters["mcc"] = mcc
        }
        if let mnc = mnc {
            parameters["mnc"] = mnc
        }
        if let sourceIp = sourceIp {
            if (isWithIP) {
                parameters["sourceIp"] = sourceIp
            }
        }
        
        return parameters
    }
    
    @IBAction func getLogin(_ sender: Any) {
        var parameters : [String: String] = [:]
        if(isMsisdnRequest) {
            parameters = requestConstructor(msisdn: msisdnField.text, sourceIp: ipAddressField.text)
        } else if (isMccMncRequest) {
            parameters = requestConstructor(mcc: mccField.text, mnc: mncField.text, sourceIp: ipAddressField.text)
        } else {
            parameters = requestConstructor(sourceIp: ipAddressField.text)            
        }
        url = HttpUtils.createUrlWithParams(url:config.getEndpoint(), params:parameters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResultSegue" {
            if let destinationVC = segue.destination as? WebViewController {
                    destinationVC.url = url
            }
        }
    }
}
