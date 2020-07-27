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

enum SampleEndpoint {
  case getHealth(request: [String: Any])
}

//指定したAPIにアクセスする
extension SampleEndpoint: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://us-central1-tub-89275.cloudfunctions.net")!
  }
  
  //パス指定する
  var path: String {
    switch self {
    case .getHealth:
        return "/postHealthcare"
    }
  }
 //HTTPメソッド(POST)に設定している
  var method: Method {
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
    case .getHealth(let request):
      return .requestParameters(parameters: request, encoding: URLEncoding.default)
    }
  }
  //ヘッダー
  var headers: [String : String]? {
    return nil
  }
}
