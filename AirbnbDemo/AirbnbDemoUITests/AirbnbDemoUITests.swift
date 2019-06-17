//
//  AirbnbDemoUITests.swift
//  AirbnbDemoUITests
//
//  Created by Eugene Berezin on 6/16/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class AirbnbDemoUITests: XCTestCase {
    
    

    override func setUp() {
        
        continueAfterFailure = false
        LoginScreens.airbnbApp.launch()
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() {
        
        LoginScreens.logIn(email: TestData.email, password: TestData.password)
        
        guard LoginScreens.errorMessage.waitForExistence(timeout: 30) else {
            XCTFail("Error message does not exist")
            return
           
        }
        
        XCTAssert(LoginScreens.errorMessage.exists, "Error message is not visible")
        
    }
    

}
