//
//  File.swift
//  
//
//  Created by Amaal on 24/08/1444 AH.
//

import Fluent
import Vapor


final class FDrone: Model, Content{
    static let schema = "pilot"
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "droneType")
    var droneType: String
    
    @Field(key: "feedback")
    var feedback: String
    
    init(){}
    
    init(id: UUID? = nil, droneType: String, feedback: String)  {
        
        self.id = id
        self.droneType = droneType
        self.feedback = feedback
        
    }
    
}