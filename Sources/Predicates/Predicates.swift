prefix operator ==

public prefix func == <T: Equatable>(rhs: T) -> ( (T) -> Bool ) {
    { lhs in lhs == rhs }
}

prefix operator !=

public prefix func != <T: Equatable>(rhs: T) -> ( (T) -> Bool ) {
    { lhs in lhs != rhs }
}

public prefix func ! <T>(predicate: @escaping (T) -> Bool) -> (T) -> Bool {
    return { !predicate($0) }
}
