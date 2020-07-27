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
    var weight: String?
    var height: String?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        weight = try? container.decode(String.self, forKey: .weight)
        height = try? container.decode(String.self, forKey: .height)
    }

    private enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case height = "height"
    }
}




