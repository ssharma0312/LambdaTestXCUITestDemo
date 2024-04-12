//
//  LambdaTestiOSDemoUITests.swift
//  LambdaTestiOSDemoUITests
//
//  Created by Sahil Sharma on 2024-03-16.
//

import XCTest

final class ClassA: XCTestCase {

    let app = XCUIApplication()
    let loginScreen = LoginScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_1() throws {
        loginScreen.login()
    }
    
    func test_2() throws {
        loginScreen.login()
        XCTAssertTrue(app.staticTexts["123 Main St"].exists)
        XCTAssertTrue(app.staticTexts["A beautiful house with a spacious garden."].exists)
        XCTAssertTrue(app.staticTexts["$1,450"].exists)
    }
    
    func test_3() throws {
        loginScreen.login()
        app.buttons["Add"].tap()
        app.collectionViews.textFields["Address"].type("789 Test Dr")
        app.collectionViews.textFields["Rent"].type("999")
        app.buttons["Save"].tap()
    }
}
