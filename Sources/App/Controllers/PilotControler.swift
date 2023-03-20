//
//  DroneControler.swift
//
//
//  Created by Maimuna on 24/08/1444 AH.
//

import Fluent
import Vapor

struct PilotControler: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let pilots = routes.grouped("pilot")
        pilots.get(use: getAll)
        pilots.post(use: create)
        pilots.put(use: update)
        pilots.delete( ":id", use: getById)
        
        
        //Drone route
        func getAll(req: Request) throws -> EventLoopFuture<[DPilot]> {
                return DPilot.query(on: req.db).all()
            }
        
        func create(req: Request) async throws -> DPilot {
            let pilot = try req.content.decode(DPilot.self)
            try await pilot.save(on: req.db)
            return pilot
        }
        
        
        func update(req: Request) async throws -> HTTPStatus {
            let newPilot = try req.content.decode(DPilot.self)
                    guard let pilot = try await DPilot.find(newPilot.id, on: req.db) else {
                        throw Abort(.notFound)
                    }
            pilot.pilotName = newPilot.pilotName
            pilot.score = newPilot.score
                    try await pilot.save(on: req.db)
                    return .ok
        }
        
        func delete (req: Request) async throws -> HTTPStatus{
            
            guard let drone = try  await DPilot.find(req.parameters.get("id"), on: req.db)
            else{
                throw Abort(.notFound)
            }
            try await drone.delete(on: req.db)
            
            return .ok
            
        }
        
        func getById(req: Request) async throws -> DPilot{
            guard let pilot = try  await DPilot.find(req.parameters.get("id"), on: req.db)
                    
            else{
                throw Abort(.notFound)
            }
            
            return pilot
            
        }
    }
}
