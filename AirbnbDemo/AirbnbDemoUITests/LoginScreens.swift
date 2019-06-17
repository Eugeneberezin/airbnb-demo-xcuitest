//
//  LoginScreens.swift
//  AirbnbDemoUITests
//
//  Created by Eugene Berezin on 6/16/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import Foundation
import XCTest

class LoginScreens {
    
    static let airbnbApp = XCUIApplication(bundleIdentifier: "com.airbnb.app")
    
    struct TextFields {
        let email: XCUIElement
        let password: XCUIElement
    }
    
    struct Buttons {
        let login: XCUIElement
        let submitlogin: XCUIElement
    }
    
    static let buttons = Buttons(login: airbnbApp.buttons["Log in"],
                                 submitlogin: airbnbApp/*@START_MENU_TOKEN@*/.buttons["SubmitLoginButton"]/*[[".buttons[\"Log in\"]",".buttons[\"SubmitLoginButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/)
    
    static let errorMessage = airbnbApp.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .textView).element
    
    static let textFields = TextFields(email: airbnbApp.scrollViews.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element,
                                       password: airbnbApp.scrollViews.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .secureTextField).element)
    
    
    
    static func logIn(email: String, password: String){
        guard buttons.login.waitForExistence(timeout: 30) else {
            XCTFail("Log in button is not visible")
            return
        }
        
        XCTAssert(buttons.login.exists, "Login button is not visible")
        buttons.login.tap()
        XCTAssert(textFields.email.exists, "Email text field is not visible")
        textFields.email.tap()
        textFields.email.typeText(email)
        textFields.password.tap()
        textFields.password.typeText(password)
       
       
        guard buttons.submitlogin.waitForExistence(timeout: 30) else {
            XCTFail("No log in button")
            return
        }
        
        XCTAssert(buttons.submitlogin.exists, "Log in button is not visible after user entered credentials")
        buttons.submitlogin.tap()
        
        
        
    }
    
}
