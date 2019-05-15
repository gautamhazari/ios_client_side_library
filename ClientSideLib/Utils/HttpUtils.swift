import Foundation
import UIKit

class HttpUtils {
    static let iosVersion = "\(IOS_NAME)\(SEPARATOR)\(UIDevice.current.systemVersion)";
    
    static func createRequestWithParams(url:String, params: [String: String]?) -> URLRequest {
        var components = URLComponents(string: url)!
            if let params = params {
                components.queryItems = params.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        return createRequestFromUrl(url: components.url!)
    }
    
    static func getQueryStringParameter(url: String?, param: String) -> String? {
        if let url = url, let urlComponents = NSURLComponents(string: url), let queryItems = (urlComponents.queryItems) {
            return queryItems.filter({ (item) in item.name == param }).first?.value!
        }
        return nil
    }
    
    private static func createRequestFromUrl(url: URL?) -> URLRequest {
        var aRequest = URLRequest(url: url!)
        aRequest.setValue(iosVersion, forHTTPHeaderField: VERS_HEADER)
        aRequest.setValue(NSUUID().uuidString, forHTTPHeaderField: X_REQUEST_ID)
        return aRequest
    }
}
