//
//  Utility.swift
//  LambdaTestiOSDemoUITests
//
//  Created by Sahil Sharma on 2024-03-21.
//

import Foundation
import XCTest

extension XCUIElement {
    func type(_ string: String) {
        self.tap()
        self.typeText(string)
    }
}

