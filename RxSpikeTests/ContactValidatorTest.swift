import XCTest
@testable import RxSpike

class ContactValidatorTest: XCTestCase {

    func testEmptyContactIsInvalid() {
        let emptyContact = Contact(name: "", number: "")

        let isValid = emptyContact.isValid

        XCTAssertFalse(isValid)
    }

    func testEmptyNameReturnEmptyNameError() {
        let emptyContact = Contact(name: "", number: "")

        let errors = emptyContact.errors

        XCTAssert(errors.contains(.emptyName))
    }

    func testEmptyNumberReturnEmptyNumberError() {
        let emptyContact = Contact(name: "", number: "")

        let errors = emptyContact.errors

        XCTAssert(errors.contains(.emptyNumber))
    }

    func testContactWithNameDoesNotReturnEmptyNameError() {
        let contactWithName = Contact(name: "some name", number: "")

        let errors = contactWithName.errors

        XCTAssertFalse(errors.contains(.emptyName))
    }

    func testContactWithNumberDoesNotReturnEmptyNumberError() {
        let contactWithNumber = Contact(name: "", number: "some number")

        let errors = contactWithNumber.errors

        XCTAssertFalse(errors.contains(.emptyNumber))
    }

    func testContactNumberReturnErrorWhenItDoesNotStartWithPlusSign() {
        let contactWithNumber = Contact(name: "", number: "some number")

        let errors = contactWithNumber.errors

        XCTAssert(errors.contains(.numberDoesNotStartWithPlus))
    }

    func testContactDoesNotReturnErrorWhenItDoesStartWithPlusSign() {
        let contactWithNumber = Contact(name: "", number: "+")

        let errors = contactWithNumber.errors

        XCTAssertFalse(errors.contains(.numberDoesNotStartWithPlus))
    }

    func testValidContact() {
        let validContact = Contact(name: "some name", number: "+39 02 1234567")

        let isValid = validContact.isValid

        XCTAssert(isValid)
    }

    func testValidContactDoesNotContainErrors() {
        let validContact = Contact(name: "some name", number: "+39 02 1234567")

        let errors = validContact.errors

        XCTAssert(errors.isEmpty)
    }
}
