import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let userController = UserController()
    
    router.get("users", use: userController.list)
    router.post("users", use: userController.create)

    //    router.get("users") { req in
//        return User.query(on: req).all()
//    }
    
//    router.post("users") { req -> Future<HTTPResponse> in
//        return try req.content.decode(User.self).flatMap { user in
//            return user.save(on: req).map { _ in
//                return HTTPResponse(status: .ok, body: "Saved")
//            }
//        }
//    }
    
    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
    
}
