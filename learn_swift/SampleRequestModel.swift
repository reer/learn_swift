//
//  SampleRequestModel.swift
//  learn_swift
//
//  Created by sari oba on 2020/07/04.
//  Copyright © 2020 Swift-Biggners. All rights reserved.
//

import Foundation

struct SampleRequestModel: Codable {
    let bmi: String
    let suitable_weight: String
    let degree_of_obesity: String

    private enum CodingKeys: String, CodingKey {
        case bmi = "bmi"
        case suitable_weight = "suitable_weight"
        case degree_of_obesity = "degree_of_obesity"
    }

}
