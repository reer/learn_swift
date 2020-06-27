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
    var message: String?
    var results: [Result]?
    var status: Int

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try? container.decode(String.self, forKey: .message)
        results = try? container.decode([Result].self, forKey: .results)
        status = try container.decode(Int.self, forKey: .status)
    }

    private enum CodingKeys: String, CodingKey {
        case message = "message"
        case results = "results"
        case status = "status"
    }
}

struct Result: Codable {
    var address1: String
    var address2: String
    var address3: String
    var kana1: String
    var kana2: String
    var kana3: String
    var prefcode: String
    var zipcode: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address1 = try container.decode(String.self, forKey: .address1)
        address2 = try container.decode(String.self, forKey: .address2)
        address3 = try container.decode(String.self, forKey: .address3)
        kana1 = try container.decode(String.self, forKey: .kana1)
        kana2 = try container.decode(String.self, forKey: .kana2)
        kana3 = try container.decode(String.self, forKey: .kana3)
        prefcode = try container.decode(String.self, forKey: .prefcode)
        zipcode = try container.decode(String.self, forKey: .zipcode)
    }

    private enum CodingKeys: String, CodingKey {
        case address1 = "address1"
        case address2 = "address2"
        case address3 = "address3"
        case kana1 = "kana1"
        case kana2 = "kana2"
        case kana3 = "kana3"
        case prefcode = "prefcode"
        case zipcode = "zipcode"
    }
}


