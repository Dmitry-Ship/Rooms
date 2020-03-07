//
//  ContentView.swift
//  Rooms
//
//  Created by Dmitry Shipunov on 07.03.2020.
//  Copyright © 2020 Dmitry Shipunov. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var store = RoomStore()
    
    func addRoom() {
        withAnimation {
            store.rooms.append(Room(name: "Elephant Room", capacity: 2000))
        }
    }
    
    func deleteRoom(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func moveRoom(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                          Text("Add Room")
                    }
                }
   
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: deleteRoom)
                    .onMove(perform: moveRoom)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())

        }
        
    }
    

 }


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
    
        }
    }
}
#endif

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                
            }
        }
    }
}
