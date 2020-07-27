//
//  SampleRequestModel.swift
//  learn_swift
//
//  Created by sari oba on 2020/07/04.
//  Copyright © 2020 Swift-Biggners. All rights reserved.
//

import Foundation

struct SampleRequestModel: Codable {
    let weight: Int
    let height: Int

    private enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case height = "height"
    }

}
