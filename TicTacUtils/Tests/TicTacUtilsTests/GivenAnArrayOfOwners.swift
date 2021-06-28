    import XCTest
    @testable import TicTacUtils

    final class GivenAnArrayOfOwners: XCTestCase {
        func testReturnedByBuilderMethod_ThenHasCorrectSize() {
            let emptySquares = Owner.blankSquares(9)
             
            XCTAssert(emptySquares.count == 9)
        }
        func testWhenAreVacant_Then_IsFull_isFalse() {
            let emptySquares = Owner.blankSquares(9)
             
            XCTAssertFalse(emptySquares.isFull)
        }
        func testWhenAreOwned_Then_IsFull_isTrue() {
            let crossedSquares = [Owner](repeating: .cross, count: 9)
             
            XCTAssertTrue(crossedSquares.isFull)
        }
        func testWhenHasOneSpace_Then_MoveReturnsOnlyChoice() {
            var oneLeft = [Owner](repeating: .cross, count: 9)
            let freeIndex = 3
            oneLeft[freeIndex] = .vacant
            XCTAssertFalse(oneLeft.isFull)
            XCTAssert(oneLeft.randomFreeIndex == freeIndex)
        }
    }
