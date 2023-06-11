import Foundation

class IceCreamDataStore: ObservableObject {
  
  @Published var displayedCones:    [String] = []
  @Published var displayedFlavors:  [String] = []
  @Published var displayedToppings: [String] = []
}

#if DEBUG
extension IceCreamDataStore {
  
  static var sample: IceCreamDataStore {
    let model = IceCreamDataStore()
    model.displayedCones = ["Sugar Cone", "Cake Cone"]
    model.displayedFlavors = ["Chocolate", "Strawberry"]
    model.displayedToppings = ["Hot Fudge", "Caramel"]
    return model
  }
}
#endif
