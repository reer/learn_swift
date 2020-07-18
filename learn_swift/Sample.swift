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
  case getHealth(bmi: String, suitable_weight:  String, degree_of_obesity: String)
}

//指定したAPIにアクセスする
extension Sample: TargetType {
    var baseURL: URL { return URL(string: "https://us-central1-tub-89275.cloudfunctions.net/api_docs")! }
    }

//パス指定する
  var path: String {
    switch self {
    case .getHealth:
        return "/api_docs"
  }
  
  //HTTPメソッド(POST)に設定している
    var method: Moya.Method {
        switch self {
        case .getHealth:
            return .post
        }
    }
    
  // スタブデータ
    var sampleData: Data {
        let path = Bundle.main.path(forResource: "samples", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }


  //リクエストパラメータ等
    var task: Task {
        switch self {
        case .getHealth(let bmi, let suitable_weight, let degree_of_obesity):
          return .requestParameters(parameters: ["bmi" : bmi, "suitable_weight" : suitable_weight, "degree_of_obesity" : degree_of_obesity], encoding: URLEncoding.default)
        }
    }
    
  //ヘッダー
    var headers: [String: String]? {
      return nil
    }

}

