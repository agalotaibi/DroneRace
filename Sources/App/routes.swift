import Fluent
import Vapor

func routes(_ app: Application) throws {
    
//---------------------------------------------------------------- type 1
//    app.post("FDrone") { req -> EventLoopFuture<FDrone> in
//
//        let drone = try req.content.decode(FDrone.self)
//        return drone.create(on: req.db).map { drone }
//    }
  
//---------------------------------------------------------------- type 2
    func create(req:Request) async throws -> FDrone {
            let drone = try req.content.decode(FDrone.self)
            try await drone.create(on: req.db)
            return drone
        }

//---------------------------------------------------------------- type 3
//    app.post("FDrone") { req -> EventLoopFuture<FDrone> in
//
//        let drone = try req.content.decode(FDrone.self)
//        return drone.save(on: req.db).transform(to: .ok)
//    }
    
}// END
    
//---------------------------------------------------------------- old code
//    app.get { req async throws in
//        try await req.view.render("index", ["title": "Hello Vapor!"])
//    }
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//    try app.register(collection: DroneControler())
//    try app.register(collection: PilotControler())
