import Foundation

public protocol UnitConversionProviding {
    func convertTemperature(value: Double, fromUnit: UnitTemperature, toUnit: UnitTemperature) -> Measurement<UnitTemperature>
    func convertDistance(value: Double, fromUnit: UnitLength, toUnit: UnitLength) -> Measurement<UnitLength>
    func convertTime(value: Double, fromUnit: UnitDuration, toUnit: UnitDuration) -> Measurement<UnitDuration>
}

final class UnitConversionProvider: UnitConversionProviding {
    func convertTemperature(value: Double, fromUnit: UnitTemperature, toUnit: UnitTemperature) -> Measurement<UnitTemperature> {
        let converted = Measurement(value: value, unit: fromUnit).converted(to: toUnit)
        return Measurement(value: converted.value.asWholeNumber(), unit: toUnit)
    }
    
    func convertDistance(value: Double, fromUnit: UnitLength, toUnit: UnitLength) -> Measurement<UnitLength> {
        let converted = Measurement(value: value, unit: fromUnit).converted(to: toUnit)
        return Measurement(value: converted.value.asWholeNumber(), unit: toUnit)
    }
    
    func convertTime(value: Double, fromUnit: UnitDuration, toUnit: UnitDuration) -> Measurement<UnitDuration> {
        let converted = Measurement(value: value, unit: fromUnit).converted(to: toUnit)
        return Measurement(value: converted.value.asWholeNumber(), unit: fromUnit)
    }
}

private extension Double {
    func asWholeNumber() -> Double {
        return Double(Int(self))
    }
}
