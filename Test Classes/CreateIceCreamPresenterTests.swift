

import XCTest
@testable import IceCreamCreator

class CreateIceCreamPresenterTests: XCTestCase {
  
  // MARK: - Test doubles
  class CreateIceCreamViewSpy: CreateIceCreamDisplayLogic {
    
    var iceCream: IceCream?
    var viewModelIceCreamCalled = false
    
    func displayIceCream(viewModel: CreateIceCream_VIP.LoadIceCream.ViewModel) {
      viewModelIceCreamCalled = true
      iceCream = Seeds.iceCream
    }
  }
  
  var sut: CreateIceCream_PRESENTER!
  var viewSpy: CreateIceCreamViewSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCream_PRESENTER()
    viewSpy = CreateIceCreamViewSpy()
  }

  // MARK: - Tests
  override func tearDownWithError() throws {
    sut = nil
    viewSpy = nil
    try super.tearDownWithError()
  }
  
  func testLoadIceCreamCallsViewToPresentIceCream() {
    
    // GIVEN
    sut.view = viewSpy
    let iceCream = Seeds.iceCream
    
    // WHEN
    let response = CreateIceCream_VIP.LoadIceCream.Response(iceCreamData: iceCream)
    sut.presentIceCream(response: response)
    
    // THEN
    XCTAssertEqual(
      viewSpy.iceCream,
      iceCream,
      "loadIceCream(request:) should ask the presenter to present the same ice cream data it loaded"
    )
  }
}
