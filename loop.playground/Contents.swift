import UIKit

//var greeting = "Hello, playground"
//class TimeThread: Thread { override func main() {
//    // Настраиваем таймер
//    Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in print("Tick")
//    } }
//}

class TimeThread: Thread { 
    override func main() {
    // Настраиваем таймер
    Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in print("Tick")
    }
    // Запускаем петлю
    RunLoop.current.run() }
}
RunLoop.current.perform(#selector(mySelector), target: self, argument: nil, order: 0, modes: [RunLoopMode.defaultRunLoopMode])
