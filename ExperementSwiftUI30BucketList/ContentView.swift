//
//  ContentView.swift
//  ExperementSwiftUI30BucketList
//
//  Created by Валерия Дементьева on 29.09.2023.
//
import LocalAuthentication
import MapKit
import SwiftUI


struct ContentView: View {
    @State private var isUnlock = false

    var body: some View {
        VStack {
            if isUnlock {
                Text("Unlock")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: {
            authenticate()
        })
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to anlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { saccess, authenticationError in
                if saccess {
isUnlock = true
                } else {

                }
            }
        } else {

        }
    }
}



////работа с картами
//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//
//struct ContentView: View {
//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//
//    let location = [Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))]
//
//    var body: some View {
//        NavigationView {
//            Map(coordinateRegion: $mapRegion, annotationItems: location) { location in
//                //            MapMarker(coordinate: location.coordinate)
//
//                //            MapAnnotation(coordinate: location.coordinate) {
//                //                VStack {
//                //                    Circle()
//                //                        .stroke(.red, lineWidth: 3)
//                //                        .frame(width: 20, height: 20)
//                //                    Text(location.name)
//                //                        .onTapGesture {
//                //                            print("Tapped on \(location.name)")
//                //                        }
//                //                }
//                //            }
//
//                MapAnnotation(coordinate: location.coordinate) {
//                    NavigationLink {
//                        Text(location.name)
//                    } label: {
//                        Circle()
//                            .stroke(.red, lineWidth: 3)
//                            .frame(width: 20, height: 20)
//                    }
//                }
//            }
//
//            .navigationTitle("London Explorer")
//        }
//    }
//}
//





//переключение состояний
//enum LoadingStste {
//    case loading, success, faild
//}
//
//struct LoadingView: View {
//    var body: some View {
//        VStack{
//            Text("Loading...")
//                .shadow(color: .black, radius: 5)
//                .foregroundStyle(.blue)
//            Rectangle()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//
//
//        } .padding(50)
//            .background(.yellow)
//
//    }
//
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FaildView: View {
//    var body: some View {
//        Text("Faild.")
//    }
//}
//
//struct ContentView: View {
//    var loadindState = LoadingStste.loading
//
//     var body: some View {
//         switch loadindState {
//         case .loading:
//             LoadingView()
//         case .success:
//             SuccessView()
//         case .faild:
//             FaildView()
//         }
//         }
//
//     }





////запись данных в хранилище и получение их от туда
//struct ContentView: View {
//
//     var body: some View {
//       Text("Hello World!")
//             .onTapGesture {
//                 let str = "Test massage"
//                 let url = getDocumentsDirictory().appendingPathComponent("vassage.txt")
//                 do {
//                     try str.write(to: url, atomically: true, encoding: .utf8)
//
//                     let input = try String(contentsOf: url)
//                     print(input)
//                 } catch {
//                     print(error.localizedDescription)
//                 }
//             }
//         }
//    func getDocumentsDirictory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//     }





////сортировка
//struct User: Identifiable, Comparable {
//    let id = UUID()
//    let firstName: String
//    let lastName: String
//
//    static func < (lhs: User, rhs: User) -> Bool {
//            lhs.lastName < rhs.lastName
//    }
//}
//
//struct ContentView: View {
//    let users = [
//         User(firstName: "Arnold", lastName: "Rimmer"),
//         User(firstName: "Kristine", lastName: "Kochanski"),
//         User(firstName: "David", lastName: "Lister"),
//     ].sorted()
//    //working sorted(static func <)
//
//     var body: some View {
//         List(users) { user in
//             Text("\(user.lastName) \(user.firstName)")
//         }
//     }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
