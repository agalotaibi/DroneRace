//
//  PilotControler.swift
//  
//
//  Created by Maimuna on 24/08/1444 AH.
//

import Fluent
import Vapor

struct PilotControler: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let pilots = routes.grouped("pilots")
        pilots.get(use: index)
    }
    
    //Pilot route
    func index(req: Request) throws -> EventLoopFuture<[DPilot]> {
        return DPilot.query(on: req.db).all()
    }
}
