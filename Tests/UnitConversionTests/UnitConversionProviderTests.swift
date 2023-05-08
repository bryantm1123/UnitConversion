import XCTest
@testable import UnitConversion

final class UnitConversionProviderTests: XCTestCase {
    
    var subject: UnitConversionProviding!
    
    override func setUpWithError() throws {
        subject = UnitConversionProvider()
    }
    
    override func tearDownWithError() throws {
        subject = nil
    }
    
    func testConversionFromCelciusToFahrenheit() throws {
        let testValue = 0.0
        let converted = subject.convertTemperature(value: testValue, fromUnit: .celsius, toUnit: .fahrenheit)
        XCTAssertEqual(converted.value, 32.0)
    }
    
    func testConversionFromFahrenheitToCelcius() throws {
        let testValue = 32.0
        let converted = subject.convertTemperature(value: testValue, fromUnit: .fahrenheit, toUnit: .celsius)
        XCTAssertEqual(converted.value, 0.0)
    }
    
    @available(iOS 13.0, *)
    func testConversionFromSecondsToMilliseconds() {
        let testValue = 1.0
        let milliseconds = subject.convertTime(value: testValue, fromUnit: .seconds, toUnit: .milliseconds)
        XCTAssertEqual(milliseconds.value.rounded(.toNearestOrAwayFromZero), 1000.0)
    }
    
    @available(iOS 13.0, *)
    func testConversionFromMillisecondsToSeconds() {
        let testValue = 1000.0
        let seconds = subject.convertTime(value: testValue, fromUnit: .milliseconds, toUnit: .seconds)
        XCTAssertEqual(seconds.value.rounded(.toNearestOrAwayFromZero), 1.0)
    }
}
