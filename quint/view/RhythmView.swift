//
//  RhythmView.swift
//  quint
//
//  Created by Rinaldi Alfian on 20/05/22.
//

import SwiftUI

struct RhythmView: View {
    @State var Currenpage = 0
    @State var percent: CGFloat = 34
    
    var color1 = Color(red: 94/255, green: 194/255, blue: 225/255)
    var color2 = Color(red: 202/255, green: 86/252, blue: 242/255)
    
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 239/255, green: 241/255, blue: 245/255).edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    ProgressBar(width: 350, height: 10, percent: percent, color1: color1, color2: color2)
                    
                    ZStack{
                        
                        if Currenpage == 0 {
                            ZStack{
                                Image("rhythm").cornerRadius(30).padding()
                                VStack{
                                    Text("Notes")
                                        .padding()
                                        .font(.system(size: 35, weight: .bold))
                                    
                                    Text("Note duration is the amount of time taken to play a note, which is determined by note type.")
                                        .padding()
                                        .font(.system(size: 20, weight: .regular))
                                        .multilineTextAlignment(.center)
                                } .padding()
                            }
                           
                        
                        }
                        else if Currenpage == 1 {
                            ZStack{
                                Image("rhythm").cornerRadius(30).padding()
                                VStack{
                                    Text("Notes")
                                        .padding()
                                        .font(.system(size: 24, weight: .bold))
                                    
                                    Image("rhythmIntro")
                                        .resizable()
                                        .frame(width: 270, height: 200)
                                    
                                    
                                    Text("The stem the value of the note and each additional flag added to ad note stem halves the value of the note (i.e. an eight to a sixteen note)")
                                        .padding()
                                        .font(.system(size: 16, weight: .regular))
                                        .multilineTextAlignment(.center)
                                } .padding()
                            }
                        }
                        else  {
                            ZStack{
                                Image("rhythm").cornerRadius(30).padding()
                                VStack{
                                    Text("Rests")
                                        .padding()
                                        .font(.system(size: 35, weight: .bold))
                                    
                                    Text("A rest in music is a type of symbol that indicates that the musician should not play and that there should be silence.")
                                        .padding()
                                        .font(.system(size: 20, weight: .regular))
                                        .multilineTextAlignment(.center)
                                    
                                    Text("Rest follow a simmilar pattern of note duration.")
                                
                                        .font(.system(size: 20, weight: .regular))
                                        .multilineTextAlignment(.center)
                                } .padding()
                            }
                        }
                        
                        
                        
                    }
                    HStack{
                        if Currenpage > 0 {
                            Button(action: {
                                withAnimation(.easeInOut){
                                    if Currenpage != 0{
                                        self.Currenpage -= 1
                                        self.percent -= 33
                                    }
                                }
                               
                            }) {
                                Image(systemName: "arrow.left.to.line.circle.fill")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(red: 94/255, green: 194/255, blue: 225/255))
                            }.padding()
                        }
                        
                        
                        Spacer()
                        if Currenpage < 2 {
                            Button(action: {
                                withAnimation(.easeInOut){
                                    if Currenpage < 2{
                                        self.Currenpage += 1
                                        self.percent += 33
                                    }
                                }
                                
                                
                            }) {
                                Image(systemName: "arrow.right.to.line.circle.fill")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(red: 94/255, green: 194/255, blue: 225/255))
                            }.padding()
                        }
                        else {
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Finish")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal)
                            }.buttonStyle(.borderedProminent)
                            
                                .padding()
                        }
                        
                       
                        
                       
                      
                    }.padding()
                    
                   
                   
                }
            }
            
           
            
        }.navigationBarTitle("Rhythm Introduction", displayMode: .inline)
        
        
    }
}



struct RhythmView_Previews: PreviewProvider {
    static var previews: some View {
        RhythmView()
    }
}
