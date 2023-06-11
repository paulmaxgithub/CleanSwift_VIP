

import Foundation

enum CreateIceCream_VIP {
  
  enum LoadIceCream {
    
    struct Request {}
    
    struct Response {
      var iceCreamData: IceCream
    }
    
    struct ViewModel {
      var cones: [String]
      var flavors: [String]
      var toppings: [String]
    }
  }
  
  /*
   If the app had extra logic such as saving or deleting the data,
   you’d create separate enums called SaveIceCream and DeleteIceCream.
   Both of them would then have their own data models.
   `enum DeleteIceCream {}`
   `enum SaveIceCream {}`
   */
}
