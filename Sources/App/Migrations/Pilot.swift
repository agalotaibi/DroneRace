//
//  File.swift
//  
//
//  Created by Amaal on 24/08/1444 AH.
//

import Fluent
import FluentPostgresDriver

struct Pilot: Migration{
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("pilot")
            .id()
            .field("pilotName", .string, .required)
            .field("score", .int16, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("pilot")
            .delete()
    }
    
    
}
