 /* Copyright 2020
  * Cameron W.C. Troy,
  *
  * This software is the intellectual property of the author, and can not be distributed, used, copied, or
  * reproduced, in whole or in part, for any purpose, commercial or otherwise. The author grants the ASU
  * Software Engineering program the right to copy, execute, and evaluate this work for the purpose of
  * determining performance of the author in coursework, and for Software Engineering program evaluation,
  * so long as this copyright and right-to-use statement is kept in-tact in such use.
  * All other uses are prohibited and reserved to the author
  *
  * @author Cameron Troy cwtroy@asu.edu
  * @version October 2020
  */

import XCTest

class ser423UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
