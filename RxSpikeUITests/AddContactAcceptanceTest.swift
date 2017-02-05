import XCTest

class AddContactAcceptanceTest: XCTestCase {

    let app = XCUIApplication()

    let randomName = AddContactAcceptanceTest.randomString()
    let randomNumber = AddContactAcceptanceTest.randomPhoneNumber()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testAddContact() {
        insertContactFromMainScreen(name: randomName, number: randomNumber)

        XCTAssert(XCUIApplication().tables.cells.staticTexts[randomName].exists)
        XCTAssert(XCUIApplication().tables.cells.staticTexts[randomNumber].exists)
    }

    func insertContactFromMainScreen(name: String, number: String){
        app.navigationBars["Contacts"].buttons["Add"].tap()
        insert(name: name)
        insert(number: number)
        app.navigationBars["Add Contact"].buttons["Save"].tap()
    }

    func insert(name textToInsert:String){
        insert(text: textToInsert, AtIndex: 0)
    }

    func insert(number textToInsert:String){
        insert(text: textToInsert, AtIndex: 1)
    }

    func insert(text textToInsert:String, AtIndex index:UInt){
        let cell = app.tables.children(matching: .cell).element(boundBy: index)
        let textField = cell.children(matching: .textField).element
        textField.tap()
        if textField.buttons["Clear text"].exists {
            textField.buttons["Clear text"].tap()
        }
        textField.typeText(textToInsert)
    }

    // MARK: Helpers

    static func randomString() -> String {
        return NSUUID().uuidString
    }

    static func randomPhoneNumber() -> String {
        return "+\(randomInt(min: 1, max:999)) \(randomInt(min: 1, max: 999)) \(randomInt(min: 100000, max: 999999))"
    }

    static func randomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
}
