//
//  File.swift
//  
//
//  Created by Amaal on 24/08/1444 AH.
//

import Fluent
import Vapor


final class FDrone: Model, Content{
    static let schema = "drone"
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "droneType")
    var droneType: String
    
    @Field(key: "feedback")
    var feedback: String
    
//    @Field(key: "pilotId")
//    var pilotId: String
    
    
    init(){}
    
    init(id: UUID? = nil, droneType: String, feedback: String)  {
        
        self.id = id
        self.droneType = droneType
        self.feedback = feedback
        
    }
    
}
