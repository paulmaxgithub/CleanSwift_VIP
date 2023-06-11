

import Foundation

protocol CreateIceCreamPresentationLogic {
  func presentIceCream(response: CreateIceCream_VIP.LoadIceCream.Response)
}

class CreateIceCream_PRESENTER {
  var view: CreateIceCreamDisplayLogic?
}

extension CreateIceCream_PRESENTER: CreateIceCreamPresentationLogic {
  func presentIceCream(response: CreateIceCream_VIP.LoadIceCream.Response) {
    
    let _cones = response.iceCreamData.cones
    let _flavors = response.iceCreamData.flavors
    let _toppings = response.iceCreamData.toppings
    
    let vm = CreateIceCream_VIP.LoadIceCream.ViewModel(cones: _cones, flavors: _flavors, toppings: _toppings)
    
    view?.displayIceCream(viewModel: vm)
  }
}
