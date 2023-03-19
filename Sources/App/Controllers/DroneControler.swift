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
        let drones = routes.grouped("drone")
        drones.get(use: index)
        drones.post(use: create)
        drones.put(use: update)
        drones.delete( ":id", use: getById)
        
        
        //Drone route
        func index(req: Request) async throws -> [FDrone] {
            try await FDrone.query(on: req.db).all()
        }
        
        func create(req: Request) async throws -> FDrone {
            let drone = try req.content.decode(FDrone.self)
            try await drone.save(on: req.db)
            return drone
        }
        
        
        func update(req: Request) async throws -> HTTPStatus {
            return .ok
        }
        
        func delete (req: Request) async throws -> HTTPStatus{
            
            guard let drone = try  await FDrone.find(req.parameters.get("id"), on: req.db)
            else{
                throw Abort(.notFound)
            }
            try await drone.delete(on: req.db)
            
            return .ok
            
        }
        
        func getById(req: Request) async throws -> FDrone{
            guard let drone = try  await FDrone.find(req.parameters.get("id"), on: req.db)
                    
            else{
                throw Abort(.notFound)
            }
            
            return drone
            
        }
    }
}
