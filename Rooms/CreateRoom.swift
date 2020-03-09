//
//  CreateRoom.swift
//  Rooms
//
//  Created by Dmitry Shipunov on 09.03.2020.
//  Copyright © 2020 Dmitry Shipunov. All rights reserved.
//

import SwiftUI

struct CreateRoom: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var roomName = ""
    @State private var capacity = 0
    
    var store: RoomStore
    
    func addRoom() {
        store.rooms.append(Room(name: String(self.roomName), capacity: self.capacity))
        self.presentationMode.wrappedValue.dismiss()

    }
    
    var body: some View {
        VStack {
            TextField("Enter room name", text: $roomName)
            Stepper(value: $capacity) {
                Text("Capacity \(self.capacity)")
            }
            
            Button(action: addRoom) {
               Text("Create")
            }
        }.padding(30)
    }
}

struct CreateRoom_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoom(store: RoomStore())
    }
}
