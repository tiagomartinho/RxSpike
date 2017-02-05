import XCTest

class ContactValidatorTest: XCTestCase {
    
    func testEmptyContactIsInvalid() {
        let contact = Contact()

        let isValid = contact.isValid

        XCTAssertFalse(isValid)
    }
}

struct Contact {
    var isValid = false
}
