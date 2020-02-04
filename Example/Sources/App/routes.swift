import Fluent
import Vapor

func routes(_ app: Application) throws {
    let todoController = TodoController(googleCloudTtsClient: app.googleCloudTts.client)
    app.get("todos", use: todoController.index)
}
