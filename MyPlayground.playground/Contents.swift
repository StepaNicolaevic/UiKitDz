import UIKit

class ViewController: UIViewController {
     override func viewDidLoad() {
              super.viewDidLoad()
              print(2)
              DispatchQueue.global().sync {
                      print(3)
                      DispatchQueue.global().sync {
                            print(5)
                      }
               print(4)
             }
           print(6)
     }
}

let vc = ViewController()
print(1)
let view = vc.view
print(7)
