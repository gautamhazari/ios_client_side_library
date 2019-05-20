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
public let SUB_ID = "subscriberId"
public let SCOPE = "scope"
public let VERSION = "version"
public let OK = "Ok"
public let ERROR = "Error"
public let SUCCESS = "Success"
public let FAIL = "Fail"
public let CONN_TIMEOUT = "Connection timeout"
public let AUTH_SUCCESS = "You were successfully authenticated"
public let AUTH_ERROR = "Authentication failed, error"
public let MSG_FORMAT = "%@ = %@"
public let EMPTY = ""
public let SEPARATOR = "-"

public let IOS_NAME = "iOS"
public let VERS_HEADER = "Client-Side-Version"
public let X_REQUEST_ID = "X-Request-ID"


public let MC_V1_1 = "mc_v1.1"
public let MC_V2_0 = "mc_v2.0"
public let MC_DI_R2_V2_3 = "mc_di_r2_v2.3"

public let OPENID = "openid"
public let MC_INDIA_TC = "openid mc_india_tc"
public let MC_MMV_VALIDATE = "openid mc_mnv_validate"
public let MC_MMV_VALIDATE_PLUS = "openid mc_mnv_validate_plus"
public let MC_ATTR_VM_SHARE = "openid mc_attr_vm_share"
public let MC_ATTR_VM_HASH = "openid mc_attr_vm_hash"
public let IDENTITY_PHONE = "openid mc_phonenumber"
public let IDENTITY_SIGNUP = "openid mc_signup"
public let IDENTITY_NATIONALID = "openid mc_nationalid"
public let PROFILE = "openid profile"
public let EMAIL = "openid email"
public let ADDRESS = "openid address"
public let PHONE = "openid phone"
public let OFFLINE_ACCESS = "openid offline_access"
public let AUTHN = "openid mc_authn";
public let AUTHZ = "openid mc_authz";
