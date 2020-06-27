//
//  SampleRequestModel.swift
//  SwiftLesson
//
//  Created by sari oba on 2020/06/27.
//  Copyright © 2020 Swift-Biggners. All rights reserved.
//
/**
 Api Response Model Sample.
 Please refer to this Class when making API response.
 http://zipcloud.ibsnet.co.jp/doc/api
 */

import Foundation

struct SampleRequestModel: Codable {
    let zipcode: Int

    private enum CodingKeys: String, CodingKey {
        case zipcode = "zipcode"
    }

}


