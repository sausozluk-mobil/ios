//
//  NetworkLayer.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 29.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import Foundation
import Moya

enum ServerAPI {
    
    case topics(count: Int?)
}

extension ServerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://sausozluk.net/service/proxy/api/v1")!
    }
    
    var path: String {
        switch self {
        case .topics:
            return "/topics"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .topics:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .topics(let count):
            var parameters = [String: Any]()
            parameters["count"] = count
            return parameters
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        case .topics:
            return ["Content-Type": "applcation/json"]
        }
    }
    
    
}
