

import SwiftUI

extension CreateIceCream_VIEW {
  func configureView() -> some View {
    var view = self
    let interactor = CreateIceCream_INTERACTOR()
    let presenter = CreateIceCream_PRESENTER()
    
    view.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    
    return view
  }
}
