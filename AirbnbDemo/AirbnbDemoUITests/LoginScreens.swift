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
    
    static let textFields = TextFields(email: airbnbApp.scrollViews.otherElements.staticTexts["EMAIL ADDRESS"],
                                       password: airbnbApp.scrollViews.otherElements.staticTexts["PASSWORD"])
    
    
    static func type(text: String) {
        for char in text {
            airbnbApp.keyboards.keys[String(char)].tap()
        }
    }
    
    static func typePassword(letters: String, numbers: String){
        airbnbApp/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        type(text: letters)
        airbnbApp/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        type(text: numbers)
    }

    
    static func logIn(with email: String){
        guard buttons.login.waitForExistence(timeout: 30) else {
            XCTFail("Log in button is not visible")
            return
        }
        
        XCTAssert(buttons.login.exists, "Login button is not visible")
        buttons.login.tap()
        XCTAssert(textFields.email.exists, "Email text field is not visible")
        textFields.email.tap()
        type(text: email)
        textFields.password.tap()
        typePassword(letters: "", numbers: "") //for this application .typeText() method would not work. The easiest solution for this demo is to provide separate strings of numeric/special characters and letters.
        guard buttons.submitlogin.waitForExistence(timeout: 30) else {
            XCTFail("No log in button")
            return
        }
        
        XCTAssert(buttons.submitlogin.exists, "Log in button is not visible after user entered credentials")
        buttons.submitlogin.tap()
        
        
        
    }
    
}
