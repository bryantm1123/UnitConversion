import Foundation

public protocol UnitConversionProviding {
    func convertTemperature(value: Double, from: UnitTemperature, to: UnitTemperature) -> Measurement<UnitTemperature>
    func convertDistance(value: Double, from: UnitLength, to: UnitLength) -> Measurement<UnitLength>
    func convertTime(value: Double, from: UnitDuration, to: UnitDuration) -> Measurement<UnitDuration>
    func convertTime(from time: String) -> String?
}

public final class UnitConversionProvider: UnitConversionProviding {
    
    public init() {}
    
    public func convertTemperature(value: Double, from: UnitTemperature, to: UnitTemperature) -> Measurement<UnitTemperature> {
        Measurement(value: value, unit: from).converted(to: to)
    }
    
    public func convertDistance(value: Double, from: UnitLength, to: UnitLength) -> Measurement<UnitLength> {
        Measurement(value: value, unit: from).converted(to: to)
    }
    
    public func convertTime(value: Double, from: UnitDuration, to: UnitDuration) -> Measurement<UnitDuration> {
        Measurement(value: value, unit: from).converted(to: to)
    }
    
    public func convertTime(from time: String) -> String? {
        let dateFormatter = DateFormatter()
        
        // Handle 12 hour to 24 hour conversion
        dateFormatter.dateFormat = "h:mm a"
        if let date = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        
        // Handle 24 hour to 12 hour conversion
        dateFormatter.dateFormat = "HH:mm"
        if let date = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        }

        return nil // Invalid input format
    }
}
