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
        pilots.get(use: getAll) //get all
        pilots.put(use: update) //update
        pilots.delete(":id", use: delete) //delete
        pilots.get(":id", use: getById) //get by id
    }
    
    //-----------------------------------------------
    //pilot route (get all)
    func getAll(req: Request) throws -> EventLoopFuture<[DPilot]> {
        return DPilot.query(on: req.db).all()
    }
    
    //pilot route (update/post)
    func update(req: Request) async throws -> HTTPStatus {
        let newPilot = try req.content.decode(DPilot.self)
        guard let pilot = try await DPilot.find(newPilot.id, on: req.db) else {
            throw Abort(.notFound)
        }
        pilot.droneType = newPilot.droneType
        pilot.pilotName = newPilot.pilotName
        pilot.score = newPilot.score
        try await pilot.save(on: req.db)
        return .ok
    }
    
    //pilot route (delete)
    func delete(req: Request) async throws -> HTTPStatus {
        guard let pilot = try await DPilot.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await pilot.delete(on: req.db)
        return .ok
    }
    
    //pilot route (get by id)
    func getById(req: Request) async throws -> DPilot{
        guard let pilot = try await DPilot.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return pilot
    }
    
}
