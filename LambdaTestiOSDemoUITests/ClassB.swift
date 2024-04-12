//
//  ClassB.swift
//  LambdaTestiOSDemoUITests
//
//  Created by Sahil Sharma on 2024-03-21.
//

import XCTest

final class ClassB: XCTestCase {

    let app = XCUIApplication()
    let loginScreen = LoginScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_4() throws {
        loginScreen.login()
        app.buttons["Add"].tap()
        app.collectionViews.textFields["Address"].type("789 Test Dr")
        app.collectionViews.textFields["Rent"].type("999")
        app.buttons["Save"].tap()
    }
    
    func test_5() throws {
        loginScreen.login()
        app.buttons["Add"].tap()
        app.collectionViews.textFields["Address"].type("789 Test Dr")
        app.collectionViews.textFields["Rent"].type("999")
        app.buttons["Save"].tap()
    }
    
    func test_6() throws {
        loginScreen.login()
        app.buttons["Add"].tap()
        app.collectionViews.textFields["Address"].type("789 Test Dr")
        app.collectionViews.textFields["Rent"].type("999")
        app.buttons["Save"].tap()
    }
}
