//
//  File.swift
//  
//
//  Created by Amaal on 24/08/1444 AH.
//

import Fluent
import Vapor


final class DPilot: Model, Content{
    static let schema = "pilot"
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "pilotName")
    var pilotName: String
    
    @Field(key: "score")
    var score: Int
    

    
    init(){}
    
    init(id: UUID? = nil, pilotName: String, score: Int)  {
        
        self.id = id
        self.pilotName = pilotName
        self.score = score
        
        
    }
}
