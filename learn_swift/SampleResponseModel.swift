//
//  SampleResponseModel.swift
//  SwiftLesson
//
//  Created by sari oba on 2020/06/27.
//  Copyright © 2020 Swift-Biggners. All rights reserved.
//
/**
 Api Request Model Sample.
 Please refer to this Class when making API request.
 http://zipcloud.ibsnet.co.jp/doc/api
 */

import Foundation

class SampleResponseModel: Codable {
    var bmi: Int?
    var suitable_weight: Int?
    var degree_of_obesity: String?
//    var results: [Result]?
//    var status: Int

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bmi = try? container.decode(Int.self, forKey: .bmi)
        suitable_weight = try? container.decode(Int.self, forKey: .suitable_weight)
        degree_of_obesity = try? container.decode(String.self, forKey: .degree_of_obesity)
    }

    private enum CodingKeys: String, CodingKey {
        case bmi = "bmi"
        case suitable_weight = "suitable_weight"
        case degree_of_obesity = "degree_of_obesity"
    }
}




