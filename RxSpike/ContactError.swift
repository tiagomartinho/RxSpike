enum ContactError: String {
    case emptyName = "Name is empty"
    case emptyNumber = "Number is empty"
    case numberDoesNotStartWithPlus = "Number does not start with a \"+\""
}

extension Collection where Iterator.Element == ContactError {
    var text: String {
        var text = ""
        for error in self {
            text.append(error.rawValue)
            text.append("\n")
        }
        return text
    }
}
