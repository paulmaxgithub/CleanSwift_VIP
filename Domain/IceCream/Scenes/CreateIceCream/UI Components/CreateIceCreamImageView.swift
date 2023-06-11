

import SwiftUI

struct CreateIceCreamImageView: View {
  @Binding var selectedCone: String
  @Binding var selectedFlavor: String
  @Binding var selectedTopping: String

  var body: some View {
    HStack(alignment: .center) {
      Spacer()
      ZStack {
        if selectedCone.isEmpty &&
          selectedFlavor.isEmpty &&
          selectedTopping.isEmpty {
          Text("Preparing...")
        }
        if !selectedCone.isEmpty {
          Image(selectedCone)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 220)
            .offset(y: 40)
        }
        if !selectedFlavor.isEmpty {
          Image(selectedFlavor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
            .offset(y: -63)
        }
        if !selectedTopping.isEmpty {
          Image(selectedTopping)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
            .offset(y: -63)
        }
      }
      Spacer()
    }
  }
}

struct CreateIceCreamImageView_Previews: PreviewProvider {
  static var previews: some View {
    CreateIceCreamImageView(
      selectedCone: .constant("Sugar Cone"),
      selectedFlavor: .constant("Chocolate"),
      selectedTopping: .constant("Sprinkles")
    )
  }
}
