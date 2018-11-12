import Foundation

class Config{
   
    var mcc = EMPTY
    var mnc = EMPTY
    var msisdn = EMPTY
    var ipAdress = EMPTY
    var serverEndpoint = EMPTY
    var serverEndpointWd = EMPTY
    var serverTimeout = 0.0
    var msisdnWd = EMPTY
    
    init(){
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            mcc = dict["mcc_value"] as! String
            mnc = dict["mnc_value"] as! String
            msisdn = dict["msisdn"] as! String
            ipAdress = dict["ip_address"] as! String
            serverEndpoint = dict["server_endpoint"] as! String
            serverEndpointWd = dict["server_endpoint_wd"] as! String
            serverTimeout = (dict["server_timeout"] as! NSString).doubleValue
            msisdnWd = dict["msisdn_wd"] as! String        }
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
        return serverEndpointWd
    }
    
    func getServerTimeout() -> Double {
        return serverTimeout
    }
    
    func getMsisdnWd() -> String {
        return msisdnWd
    }
    
}

