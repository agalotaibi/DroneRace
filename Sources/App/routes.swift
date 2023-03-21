import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.post("pilot") { req -> EventLoopFuture<DPilot> in
        // 2
        let pilot = try req.content.decode(DPilot.self)
        // 3
        return pilot.save(on: req.db).map {
            // 4
            pilot
        }
    }
    
    app.get("pilot") { req -> EventLoopFuture<DPilot> in
        // 2
        let pilot = try req.content.decode(DPilot.self)
        // 3
        return pilot.save(on: req.db).map {
            // 4
            pilot
        }
    }
    
    app.post("drone") { req -> EventLoopFuture<FDrone> in
        // 2
        let drone = try req.content.decode(FDrone.self)
        // 3
        return drone.save(on: req.db).map {
            // 4
            drone
        }
    }

    app.get("drone") { req -> EventLoopFuture<FDrone> in
        // 2
        let drone = try req.content.decode(FDrone.self)
        // 3
        return drone.save(on: req.db).map {
            // 4
            drone
        }
    }
    try app.register(collection: DroneControler())
    try app.register(collection: PilotControler())
}
