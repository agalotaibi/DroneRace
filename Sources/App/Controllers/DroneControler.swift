//
//  DroneControler.swift
//  
//
//  Created by Maimuna on 24/08/1444 AH.
//

import Fluent
import Vapor

struct DroneControler: RouteCollection {
    
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let drones = routes.grouped("drones")
        drones.get(use: getAll) //get all
        drones.put(use: update) //update
        drones.delete(":id", use: delete) //delete
        drones.get(":id", use: getById) //get by id
    }
    
    //-----------------------------------------------
    //Drone route (get)
    func getAll(req: Request) throws -> EventLoopFuture<[FDrone]> {
        return FDrone.query(on: req.db).all()
    }
    
    //Drone route (update)
    func update(req: Request) async throws -> HTTPStatus {
        let newDrone = try req.content.decode(FDrone.self)
        guard let drone = try await FDrone.find(newDrone.id, on: req.db) else {
            throw Abort(.notFound)
        }
        drone.droneType = newDrone.droneType
        drone.feedback = newDrone.feedback
        try await drone.save(on: req.db)
        return .ok
    }
    
    //Drone route (delete)
    func delete(req: Request) async throws -> HTTPStatus {
        guard let drone = try await FDrone.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await drone.delete(on: req.db)
        return .ok
    }
    
    //Drone route (get by id)
    func getById(req: Request) async throws -> FDrone{
        guard let drone = try await FDrone.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return drone
    }
    
}
