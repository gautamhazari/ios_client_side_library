public enum Status: String {
    case authOk = "code"
    case error = "error"
    case smsWait = "sms-wait"
}

public enum AddrType: String {
    case wifi = "en0"
    case local = "lo0"
    case cellular = "pdp_ip0"    
}

public let MSISDN = "msisdn"
public let MCC = "mcc"
public let MNC = "mnc"
public let SOURCE_IP = "sourceIp"
public let OK = "Ok"
public let ERROR = "Error"
public let SUCCESS = "Success"
public let FAIL = "Fail"
public let CONN_TIMEOUT = "Connection timeout"
public let AUTH_SUCCESS = "You was authenticated successfully"
public let AUTH_ERROR = "Authentication failed, error"
public let MSG_FORMAT = "%@ = %@"
public let EMPTY = ""
