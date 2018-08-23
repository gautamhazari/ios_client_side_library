//
//  HttpUtils.swift
//  ClientSideSDK
//
//  Created by user on 8/15/18.
//  Copyright © 2018 a1qa. All rights reserved.
//

import Foundation

class HttpUtils {
    static func createUrlWithParams(url:String, params: [String: String]) -> URL {
        var components = URLComponents(string: url)!
        components.queryItems = params.map {
            URLQueryItem(name: $0, value: $1)
        }
        return components.url!
    }   
}
