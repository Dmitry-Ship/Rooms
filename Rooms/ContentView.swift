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

    @State private var isCreateViewOpen = false
    
    func openCreateView() {
        self.isCreateViewOpen.toggle()
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
                    Button(action: openCreateView) {
                          Text("Add Room")
                    }.sheet(isPresented: $isCreateViewOpen) {
                        CreateRoom(store: self.store)
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

