

import XCTest
@testable import ScoopsAndScones

class CreateIceCreamViewTests: XCTestCase {
  
  // MARK: - Test doubles
  class CreateIceCreamInteractorSpy: CreateIceCreamBusinessLogic {
    var loadIceCreamCalled = false
    
    func loadIceCream(request: CreateIceCream_VIP.LoadIceCream.Request) {
      loadIceCreamCalled = true
    }
  }
  
  // swiftlint:disable implicitly_unwrapped_optional
  var sut: CreateIceCream_VIEW!
  var interactorSpy: CreateIceCreamInteractorSpy!
  // swiftlint:enable implicitly_unwrapped_optional
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCream_VIEW()
    interactorSpy = CreateIceCreamInteractorSpy()
  }
  
  // MARK: - Tests
  override func tearDownWithError() throws {
    sut = nil
    interactorSpy = nil
    try super.tearDownWithError()
  }
  
  func testShouldLoadIceCreamOnViewAppear() {
    
    // GIVEN
    sut.interactor = interactorSpy
    
    // WHEN
    sut.fetchIceCream()
    
    // THEN
    XCTAssertTrue(
      interactorSpy.loadIceCreamCalled,
      "fetchIceCream() should ask the interactor to load the ice cream"
    )
  }
}
