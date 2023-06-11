

import SwiftUI

protocol CreateIceCreamDisplayLogic {
  func displayIceCream(viewModel: CreateIceCream_VIP.LoadIceCream.ViewModel)
}

struct CreateIceCream_VIEW: View {
  
  // MARK: INTERACTOR
  var interactor: CreateIceCreamBusinessLogic?
  
  @ObservedObject var iceCream = IceCreamDataStore()
  
  @State private var selectedCone     = ""
  @State private var selectedFlavor   = ""
  @State private var selectedTopping  = ""
  @State private var showDoneAlert    = false
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker("Select a cone or cup", selection: $selectedCone) {
            ForEach(iceCream.displayedCones, id: \.self) {
              Text($0)
            }
          }
          
          Picker("Choose your flavor", selection: $selectedFlavor) {
            ForEach(iceCream.displayedFlavors, id: \.self) {
              Text($0)
            }
          }
          .disabled(selectedCone.isEmpty)
          
          Picker("Choose a topping", selection: $selectedTopping) {
            ForEach(iceCream.displayedToppings, id: \.self) {
              Text($0)
            }
          }
          .disabled(selectedCone.isEmpty || selectedFlavor.isEmpty)
        } header: {
          Text("Let's make an ice cream!")
        }
        
        Section {
          Button {
            showDoneAlert = true
          } label: {
            Text("DONE")
              .font(.title3)
              .frame(
                maxWidth: .infinity,
                alignment: .center
              )
          }
          .disabled(showIceCreamImage())
          .alert(isPresented: $showDoneAlert) {
            Alert(
              title: Text("Your ice cream is ready!"),
              message: Text("Let's make a new one. You can never have too much ice cream..."),
              dismissButton: .default(Text("OK")) {
                selectedCone = ""
                selectedFlavor = ""
                selectedTopping = ""
              })
          }
        }
        
        Section {
          CreateIceCreamImageView(
            selectedCone: $selectedCone,
            selectedFlavor: $selectedFlavor,
            selectedTopping: $selectedTopping
          )
        }
      }
      .navigationTitle("Scoops & Scones")
      .onAppear { fetchIceCream() }
    }
    .navigationViewStyle(.stack)
  }
}

//MARK: EXTENSIONS
extension CreateIceCream_VIEW {
  
  // MARK: Call interactor to fetch data
  func fetchIceCream() {
    let request = CreateIceCream_VIP.LoadIceCream.Request()
    interactor?.loadIceCream(request: request)
  }
  
  // HELPER VIEW FUNCTION
  func showIceCreamImage() -> Bool {
    if selectedCone.isEmpty || selectedFlavor.isEmpty || selectedTopping.isEmpty {
      return true
    }
    return false
  }
}

extension CreateIceCream_VIEW: CreateIceCreamDisplayLogic {
  func displayIceCream(viewModel: CreateIceCream_VIP.LoadIceCream.ViewModel) {
    iceCream.displayedCones = viewModel.cones
    iceCream.displayedFlavors = viewModel.flavors
    iceCream.displayedToppings = viewModel.toppings
  }
}

struct IceCreamSelectView_Previews: PreviewProvider {
  static var previews: some View {
    CreateIceCream_VIEW(iceCream: IceCreamDataStore())
  }
}
