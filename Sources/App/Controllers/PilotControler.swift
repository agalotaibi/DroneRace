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
        let pilots = routes.grouped("pilot")
        pilots.get(use: index)
        pilots.post(use: create)
        pilots.put(use: update)
        pilots.delete( ":id", use: getById)
        
        
        //Drone route
        func index(req: Request) async throws -> [DPilot] {
            try await DPilot.query(on: req.db).all()
        }
        
        func create(req: Request) async throws -> DPilot {
            let pilot = try req.content.decode(DPilot.self)
            try await pilot.save(on: req.db)
            return pilot
        }
        
        
        func update(req: Request) async throws -> HTTPStatus {
            return .ok
        }
        
        func delete (req: Request) async throws -> HTTPStatus{
            
            guard let pilot = try  await DPilot.find(req.parameters.get("id"), on: req.db)
            else{
                throw Abort(.notFound)
            }
            try await pilot.delete(on: req.db)
            
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
