

import Foundation


protocol CreateIceCreamBusinessLogic {
  func loadIceCream(request: CreateIceCream_VIP.LoadIceCream.Request)
}

class CreateIceCream_INTERACTOR {
  var presenter: CreateIceCreamPresentationLogic?
}

extension CreateIceCream_INTERACTOR: CreateIceCreamBusinessLogic {
  
  func loadIceCream(request: CreateIceCream_VIP.LoadIceCream.Request) {
    let iceCream = Bundle.main.decode(IceCream.self, from: "icecream.json")
    let response = CreateIceCream_VIP.LoadIceCream.Response(iceCreamData: iceCream)
    presenter?.presentIceCream(response: response)
  }
}
