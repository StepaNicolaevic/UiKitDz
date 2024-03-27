import UIKit

class NetworkManager {
    func fetchData(url: URL) {
        // Запрос к API
    }
}

class ViewController {
    
    func updateUI() {
        // обновляет пользовательский интерфейс
    }
}


class Animal {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Cat")
    }
}


protocol Figure {
    var size: CGFloat { get }
}

struct Circle: Figure {
    var size: CGFloat
    let radius: CGFloat
}

struct Rectangle: Figure {
    var size: CGFloat
    let width: CGFloat
    let height: CGFloat
}

class SizePrinter {
    
    func printSize(size: Figure) {
        print(size)
    }
}

class Bird {
    func fly() {
        // Реализация полета
    }
}

class NotFlyBird {
    func walk() {}
}

class Penguin: NotFlyBird {
   
}

let myBird: NotFlyBird = Penguin()
myBird.walk()  // Приведет к ошибке во время выполнения


protocol Worker {
    func work()
    func eat()
}

protocol WorkerRobot {
    func work()
    func addOil()
}

class Robot: WorkerRobot {
    func work() {
        // Робот работает
    }

    func addOil() {
        // Робот заливает топливо
    }
}

protocol Light {
    func turnOn()
    func turnOff()

}

class LightBulb: Light {
    func turnOn() {
        // включает свет
    }

    func turnOff() {
        // включает свет
    }
}

class Switch {
    let bulb: Light

    init(bulb: Light) {
        self.bulb = bulb
    }

    func toggle() {
        bulb.turnOn()
    }
}
