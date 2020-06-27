//
//  SampleEndpoint.swift
//  SwiftLesson
//
//  Created by sari oba on 2020/06/27.
//  Copyright © 2020 Swift-Biggners. All rights reserved.
//
/**
 Moya Sample.
 Please refer to this class when making API request using Moya.
 http://zipcloud.ibsnet.co.jp/doc/api
 */

import Moya

enum SampleEndpoint {
    case getAddressSample(request: [String: Any])
}

extension SampleEndpoint: TargetType {
    var baseURL: URL { return URL(string: "http://zipcloud.ibsnet.co.jp")! }
    var path: String {
        switch self {
        case .getAddressSample:
            return "/api/search"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getAddressSample:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getAddressSample(let request):
            return .requestParameters(parameters: request, encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? { return ["content-type": "application/json"] }

    // テストの時などに、実際にAPIを叩かずにローカルのjsonファイルを読み込める
    var sampleData: Data {
        let path = Bundle.main.path(forResource: "samples", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
}

