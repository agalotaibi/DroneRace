//
//  DroneControler.swift
//  
//
//  Created by Maimuna on 24/08/1444 AH.
//

import Fluent
import Vapor

struct DroneControler: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let drones = routes.grouped("drones")
        drones.get(use: index)
    }
    
    //Drone route
    func index(req: Request) throws -> EventLoopFuture<[FDrone]> {
        return FDrone.query(on: req.db).all()
    }
}
