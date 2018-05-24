import Vapor
import FluentMySQL

/// Called before your application initializes.
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
    
    ) throws {
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    let myService = NIOServerConfig.default(port: 5000)
    services.register(myService)
    
    try services.register(FluentMySQLProvider())
    
    let mysqlConfig = MySQLDatabaseConfig(
        hostname: "localhost",
        port: 3306,
        username: "root",
        password: "root",
        database: "mycooldb"
    )
    services.register(mysqlConfig)

    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .mysql)
    services.register(migrations)
}
