//
//  ContentView.swift
//  sbo
//
//  Created by nepta on 14/11/2019.
//  Copyright © 2019 nepta. All rights reserved.
//

import SwiftUI

struct FibonacciNum: Identifiable {
    var id: Int
    var value: String
}

func getSeries(q: Int) -> [FibonacciNum] {
    var fibonacciNums: [FibonacciNum] = []
    var x = -1 ,y = 1, sum = 0;
    for i in 0..<q {
    sum = x+y;
    x   = y;
    y   = sum;
        fibonacciNums.append(FibonacciNum(id: i+1, value: String(sum)))
    }
    return fibonacciNums
}

struct FibonacciRow: View {
    var fibonacciNum: FibonacciNum
    var body: some View {
        HStack{
            Text("\(fibonacciNum.id) position:")
            Spacer()
            Text("\(fibonacciNum.value)")
        }
    }
}

struct ContentView: View {
    
    @State var rowsToDisplay: Int = 30
    @State var fibonacciNums = getSeries(q: 30)
    var body: some View {
        VStack {
            NavigationView {
                List(fibonacciNums){el in
                    FibonacciRow(fibonacciNum: el)
                }.navigationBarTitle(Text("Fibonacci List"))
                    .accessibilityScrollAction {                }
            }
            HStack {
                Button(action: {
                    self.rowsToDisplay -= 10
                    self.fibonacciNums = getSeries(q: self.rowsToDisplay)
                }) {
                    HStack {
                        Image(systemName: "minus")
                            .frame(width: nil)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                    .shadow(radius: 2)

                }
                Spacer()
                Text("\(rowsToDisplay)")
                    .font(.headline)
                Spacer()
                Button(action: {
                    self.rowsToDisplay += 10
                    self.fibonacciNums = getSeries(q: self.rowsToDisplay)
                }) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                .shadow(radius: 2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
