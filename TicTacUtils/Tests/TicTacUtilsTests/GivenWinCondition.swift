    import XCTest
    @testable import TicTacUtils

    final class GivenWinCondition: XCTestCase {
        func testThatHasCorrectLine() {
            let middleRow = WinCondition.row(y: 1).line
             
            XCTAssert(middleRow == [3,4,5])
            
            let lastColumn = WinCondition.col(x: 2).line
                 
            XCTAssert(lastColumn == [2,5,8])
            
            let diag = WinCondition.diag(slant: .forward).line
                 
            XCTAssert(diag == [0,4,8])
        }
    
    }
