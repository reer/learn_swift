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
 enumにエンドポイントを定義する
 TargetTypeに準拠してリクエスト内容を記述
 */

import Moya

enum Sample {
    case getHealth(request: [String: Any])
}

//指定したAPIにアクセスする
extension Sample: TargetType {
    var baseURL: URL { return URL(string: "https://us-central1-tub-89275.cloudfunctions.net/api_docs")! }
    var path: String {
        switch self {
        case .getHealth:
            return "/api_docs"
        }
    }
  
  //HTTPメソッド(POST)に設定している
    var method: Moya.Method {
        switch self {
        case .getHealth:
            return .post
        }
    }

  //リクエストを送る
    var task: Task {
        switch self {
        case .getHealth(let request):
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

