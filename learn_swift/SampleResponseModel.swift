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
    var bmi: Float?
    var suitable_weight: Float?
    var degree_of_obesity: String?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bmi = try? container.decode(Float.self, forKey: .bmi)
        suitable_weight = try? container.decode(Float.self, forKey: .suitable_weight)
        degree_of_obesity = try? container.decode(String.self, forKey: .degree_of_obesity)
    }

    private enum CodingKeys: String, CodingKey {
        case bmi = "bmi"
        case suitable_weight = "suitable_weight"
        case degree_of_obesity = "degree_of_obesity"
    }
}




