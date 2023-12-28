

import XCTest
@testable import IceCreamCreator

class CreateIceCreamInteractorTests: XCTestCase {
  
  // MARK: - Test doubles
  class CreateIceCreamPresenterSpy: CreateIceCreamPresentationLogic {
    var iceCream: IceCream?
    var presentIceCreamCalled = false
    
    func presentIceCream(response: CreateIceCream_VIP.LoadIceCream.Response) {
      presentIceCreamCalled = true
      iceCream = response.iceCreamData
    }
  }
  
  // swiftlint:disable implicitly_unwrapped_optional
  var sut: CreateIceCream_INTERACTOR!
  var presenterSpy: CreateIceCreamPresenterSpy!
  // swiftlint:enable implicitly_unwrapped_optional
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCream_INTERACTOR()
    presenterSpy = CreateIceCreamPresenterSpy()
  }
  
  // MARK: - Tests
  override func tearDownWithError() throws {
    sut = nil
    presenterSpy = nil
    try super.tearDownWithError()
  }

  func testLoadIceCreamCallsPresenterToPresentIceCream() {
    
    // GIVEN
    sut.presenter = presenterSpy
    let iceCream = Seeds.iceCream
    
    // WHEN
    let request = CreateIceCream_VIP.LoadIceCream.Request()
    sut.loadIceCream(request: request)
    
    // THEN
    XCTAssertEqual(
      presenterSpy.iceCream,
      iceCream,
      "loadIceCream(request:) should ask the presenter to present the same ice cream data it loaded"
    )
  }
}
