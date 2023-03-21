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
        drones.get(use: getAll) //working
        drones.post(use: create) //working
        drones.put(":id", use: update) //working
        drones.delete( ":id", use: delete) //working
        drones.get( ":id", use: getById) //working
        
        
        
        //Drone route
        func getAll(req: Request) throws -> EventLoopFuture<[FDrone]> {
                return FDrone.query(on: req.db).all()
            }
        
        func create(req: Request) async throws -> FDrone {
            let drone = try req.content.decode(FDrone.self)
            try await drone.save(on: req.db)
            return drone
        }
        
        
        func update(req: Request) async throws -> HTTPStatus {
            let newDrone = try req.content.decode(FDrone.self)
            guard let drone = try  await FDrone.find(req.parameters.get("id"), on: req.db)
            else{
                throw Abort(.notFound)
            }
            drone.droneType = newDrone.droneType
            drone.feedback = newDrone.feedback
            try await drone.save(on: req.db)
            return .ok
        }
        
//        func update(req: Request)  throws -> EventLoopFuture<FDrone> {
//            let newDrone = try req.content.decode(FDrone.self)
//            return FDrone.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound)).flatMap{
//                drone in drone.droneType = newDrone.droneType
//                return newDrone.save(on: req.db).map{
//                    FDrone(id: newDrone.id, droneType: newDrone.droneType, feedback: newDrone.feedback)
//                }
//            }
//        }
            
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
