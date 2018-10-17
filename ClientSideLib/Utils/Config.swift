import Foundation

class Config{
   
    var mcc = EMPTY
    var mnc = EMPTY
    var msisdn = EMPTY
    var ipAdress = EMPTY
    var serverEndpoint = EMPTY
    var wdServerEndpoint = EMPTY
    var serverTimeout = 0.0
    var subId = EMPTY
    
    init(){
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            mcc = dict["mcc_value"] as! String
            mnc = dict["mnc_value"] as! String
            msisdn = dict["msisdn"] as! String
            ipAdress = dict["ip_address"] as! String
            serverEndpoint = dict["server_endpoint"] as! String
            wdServerEndpoint = dict["wd_server_endpoint"] as! String
            serverTimeout = (dict["server_timeout"] as! NSString).doubleValue
            subId = dict["subId"] as! String        }
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
    
    func getWdEndpoint() -> String {
        return wdServerEndpoint
    }
    
    func getServerTimeout() -> Double {
        return serverTimeout
    }
    
    func getSubId() -> String {
        return subId
    }
    
}

