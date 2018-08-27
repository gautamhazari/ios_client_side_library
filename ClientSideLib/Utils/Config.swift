import Foundation

class Config{
   
    var mcc = ""
    var mnc = ""
    var msisdn = ""
    var ipAdress = ""
    var serverEndpoint = ""
    var serverTimeout = 0.0
    
    init(){
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            mcc = dict["mcc_value"] as! String
            mnc = dict["mnc_value"] as! String
            msisdn = dict["msisdn"] as! String
            ipAdress = dict["ip_adress"] as! String
            serverEndpoint = dict["server_endpoint"] as! String
            serverTimeout = (dict["server_timeout"] as! NSString).doubleValue
        }
    }

    func getMcc() -> String {
        return mcc
    }
    
    func getMnc() -> String {
        return mnc
    }
    
    func getMsisdn() -> String {
        return msisdn
    }
    
    func getIpAdress() -> String {
        return ipAdress
    }
    
    func getEndpoint() -> String {
        return serverEndpoint
    }
    
    func getServerTimeout() -> Double {
        return serverTimeout
    }
}

