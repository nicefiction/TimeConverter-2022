/// Source:
/// https://www.hackingwithswift.com/100/swiftui/19

import SwiftUI



struct ContentView: View {
    
    // MARK: - Property wrappers
    @State private var startTimeUnit: String = "minutes"
    @State private var convertedTimeUnit: String = "seconds"
    @State private var startValue: Double = 1
    
    @FocusState private var inputFieldIsActive: Bool
    
    
    
    // MARK: - Properties
    let timeUnits: Array<String> = [
        "seconds", "minutes", "hours", "days"
    ]
    
//    let formatter: NumberFormatter = {
//        let formatter = NumberFormatter.init()
//        formatter.numberStyle = .decimal
//        return formatter
//    }()
    
    
    
    // MARK: - Computed properties
    
    var convertedTime: Double {
        
        switch (startTimeUnit, convertedTimeUnit) {
        case ("seconds", "seconds"): return startValue
        case ("seconds", "minutes"): return startValue / 60
        case ("seconds", "hours"): return startValue / (60 * 60)
        case ("seconds", "days"): return startValue / (60 * 60 * 24)
            
        case ("minutes", "seconds"): return startValue * 60
        case ("minutes", "minutes"): return startValue
        case ("minutes", "hours"): return startValue / 60
        case ("minutes", "days"): return startValue / (60 * 24)
            
        case ("hours", "seconds"): return startValue * (60 * 60)
        case ("hours", "minutes"): return startValue * 60
        case ("hours", "hours"): return startValue
        case ("hours", "days"): return startValue / 24
            
        case ("days", "seconds"): return startValue / (24 * 60 * 60)
        case ("days", "minutes"): return startValue / (24 * 60)
        case ("days", "hours"): return startValue / 24
        default: return startValue
        }
    }
    
    
    var body: some View {
        
        Form {
            Section(header: Text("convert")) {
                // Text("\(startValue)")
                TextField("Your start value...",
                          value: $startValue,
                          // formatter: formatter)
                          format: .number)
                .focused($inputFieldIsActive)
            }
            Section(header: Text("from")) {
                Picker("From:",
                       selection: $startTimeUnit) {
                    ForEach(timeUnits,
                            id: \.self) {
                        Text("\($0)")
                    }
                }
                   .pickerStyle(.segmented)
            }
            
            Section(header: Text("to")) {
                Picker("To",
                       selection: $convertedTimeUnit) {
                    ForEach(timeUnits,
                            id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section(header: Text("end result")) {
                Text("\(convertedTime.formatted())")
            }
        }
        .keyboardType(.numberPad)
        .toolbar(content: {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done",
                       action: {
                    inputFieldIsActive.toggle()
                })
            }
        })
    }
}





// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
