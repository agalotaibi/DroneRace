//
//  File.swift
//  
//
//  Created by Amaal on 24/08/1444 AH.
//

import Fluent

struct Drone: Migration{
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("drone")
            .id()
            .field("droneType", .string, .required)
            .field("feedback", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("drone")
            .delete()
    }
    
    
}

