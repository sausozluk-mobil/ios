//
//  TopicModel.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 29.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import ObjectMapper
import Moya_ObjectMapper

class Topics: Mappable {
    
    var success: Bool?
    var data: TopicData?
    
    required init?(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
    
}

class TopicData: Mappable {
    
    var entries_count: Int?
    var topics: [Topic]?
    var topic_counts: Int?
    
    required init?(map: Map) {
        entries_count <- map["entries_count"]
        topics <- map["topics"]
        topic_counts <- map["topic_counts"]
    }
    
    func mapping(map: Map) {
        entries_count <- map["entries_count"]
        topics <- map["topics"]
        topic_counts <- map["topic_counts"]
    }
}

class Topic: Mappable {
    
    var id: Int?
    var slug: String?
    var title: String?
    var count: Int?
    var updated_at: String?
    var created_at: String?
    var page: Int?
    
    required init?(map: Map) {
        id <- map["id"]
        slug <- map["slug"]
        title <- map["title"]
        count <- map["count"]
        updated_at <- map["updated_at"]
        created_at <- map["created_at"]
        page <- map["page"]
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        slug <- map["slug"]
        title <- map["title"]
        count <- map["count"]
        updated_at <- map["updated_at"]
        created_at <- map["created_at"]
        page <- map["page"]
    }
}
