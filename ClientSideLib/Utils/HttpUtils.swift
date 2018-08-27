import Foundation

class HttpUtils {
    static func createUrlWithParams(url:String, params: [String: String]) -> URL {
        var components = URLComponents(string: url)!
        components.queryItems = params.map {
            URLQueryItem(name: $0, value: $1)
        }
        return components.url!
    }
    
    static func getQueryStringParameter(url: String?, param: String) -> String? {
        if let url = url, let urlComponents = NSURLComponents(string: url), let queryItems = (urlComponents.queryItems) {
            return queryItems.filter({ (item) in item.name == param }).first?.value!
        }
        return nil
    }
    
}
