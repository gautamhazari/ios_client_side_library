enum Status: String {
    case authOk = "code"
    case error = "error"
    case smsWait = "sms-wait"
}

enum AddrType: String {
    case wifi = "en0"
    case local = "lo0"
    case cellular = "pdp_ip0"    
}


