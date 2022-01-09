//
//  CourseModel.swift
//  MVVMParsingJson
//
//  Created by velcharan sridhar on 09/01/22.
//

import Foundation

struct HomeCourse: Codable {
    
    let status: Int?
    let BaseURL: String?
    let course: [MyCourse]
    
    enum CodingKeys: String, CodingKey {
        case status
        case BaseURL = "base_path"
        case course
    }
}

struct MyCourse: Codable {
    let Heading: String?
    let ChapterCount: String?
    
    enum CodingKeys: String, CodingKey {
        case Heading = "heading"
        case ChapterCount = "chapter_count"
    }
}

//MARK: FAQ
struct HomeFaq: Codable {
    let status: Int?
    let faq: [Faq]
    let base_url: String?
    
//    enum coding: String, CodingKey {
//        case status
//        case faq
//        case baseURL = "base_url"
//    }
}

struct Faq: Codable {
    let question: String?
    let added_date: String?
    
//    enum coding: String, CodingKey {
//        case question = "question"
//        case date = "added_date"
//    }
}
