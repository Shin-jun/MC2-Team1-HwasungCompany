//
//  OnBoardingPageView.swift
//  MC2-Team1
//
//  Created by Kim Insub on 2022/06/14.
//

import SwiftUI

struct OnBoardingPageView: View {
    
    // Param
    let pageNumber: Int 
    
    // Define
    @EnvironmentObject var modelData: ModelData
    let fontSize: Double = 18
    let paragraphId: Int = 1
    var currentParagraph: Paragraph {modelData.filterPara(currentChapter: modelData.currentChapterIndex, id: paragraphId)}
    
    // Color
    private let shadowColor = Color.black.opacity(0.3)
    private let shadowRadius = CGFloat(1)
    private let shadowY = CGFloat(4)
    private let cornerRadius = CGFloat(5)

    var body: some View {
        ZStack{
            
            // Background
            Group{
                // Background
                Color.bgColor
            
                // Tool Bar
                VStack{
                    toolbarViewBuilder()
                    Spacer()
                }
                
                // Content && History
                VStack{
                    Spacer()
                    contentViewBuiler()
                        .padding(.horizontal)
                    Spacer()
                }
                
                // Choice Buttons
                VStack{
                    Spacer()
                    ButtonViewBuilder()
                }
            }
            
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            switch(pageNumber){
            case 2:
                pageTwoViewBuilder()
            case 3:
                pageThreeViewBuilder()
            case 4:
                pageFourViewBuilder()
            default:
                pageOneViewBuilder()
            }
            
        }
    }
}

// Custom ViewBuilder Extension
extension OnBoardingPageView{
    
    // Page One
    @ViewBuilder func pageOneViewBuilder() -> some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: RatioSize.getResWidth(width: 20), height: RatioSize.getResWidth(width: 20))
                    .padding(5)
                    .background(Color.bgColor)
                    .cornerRadius(cornerRadius)
                    .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                    .foregroundColor(.fontColor)
                    .padding()
            }
            .frame(height: RatioSize.getResheight(height: 40))
            Spacer()
        }
        
        VStack{
            Text("seq1")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.bgColor)
                .cornerRadius(5)
                .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                .padding()
            Spacer()
        }
        .padding(.top, 120)
    }
    
    // Page Two
    @ViewBuilder func pageTwoViewBuilder() -> some View {
        
        // Button
        VStack{
            Spacer()
            VStack{
                Text("sampleChoice1".localized())
                    .foregroundColor(.fontColor)
                    .font(.custom(modelData.choiceFontName, size: 18))
                    .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                    .background(Color.bgColor)
                    .cornerRadius(50)
                    .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                    .padding(.horizontal)
                    .padding(.vertical, RatioSize.getResheight(height: 5))
                    .padding(.top, 10)

                Text("sampleChoice2".localized())
                    .foregroundColor(.fontColor)
                    .font(.custom(modelData.choiceFontName, size: 18))
                    .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                    .background(Color.bgColor)
                    .cornerRadius(50)
                    .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                    .padding(.horizontal)
                    .padding(.vertical, RatioSize.getResheight(height: 5))
                    .padding(.bottom, 10)
            }
            .background(Color.bgColor)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        // Message
        VStack{
            Text("seq2".localized())
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.bgColor)
                .cornerRadius(5)
                .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                .padding()
            Spacer()
        }
        .padding(.top, 120)
    }
    
    // Page Three
    @ViewBuilder func pageThreeViewBuilder() -> some View {
        // Arrow
        VStack{
            Image("arrow")
                .foregroundColor(Color.bgColor)
                .font(.system(size: 50))
                .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                .padding(.top, 100)
            Spacer()

        }
        // Message
        VStack{
            Text("seq3".localized())
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.bgColor)
                .cornerRadius(5)
                .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                .padding()
            Spacer()
        }
        .padding(.top, 460)
    }
    
    // Page Four
    @ViewBuilder func pageFourViewBuilder() -> some View {
        
        // Toolbar
        VStack{
            ZStack{
                ZStack{
                    Divider()
                        .frame(height: RatioSize.getResheight(height: 1))
                        .overlay(Color.fontColor)
                    HStack{
                        Divider()
                            .frame(width: RatioSize.getResWidth(width: 1), height: RatioSize.getResWidth(width: 5))
                            .overlay(Color.fontColor)
                    }
                }
                HStack{
                    Text("?")
                        .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                        .foregroundColor(.fontColor)
                        .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                        .background(Color.tapFontColor)
                        .cornerRadius(50)
                    
                    Spacer()
                    
                    Text("?")
                        .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                        .foregroundColor(.fontColor)
                        .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                        .background(Color.tapFontColor)
                        .cornerRadius(50)
                }//HStack
                
                Text("Ahn".localized())
                    .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                    .foregroundColor(.fontColor)
                    .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                    .background(Color.bgColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.tapFontColor, lineWidth: 1)
                    )
                    .offset(x: -30)
            }
            .frame(width: RatioSize.getResWidth(width: 230))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.bgColor)
            .cornerRadius(5)
            .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
            .frame(height: RatioSize.getResheight(height: 40))
            Spacer()
        }
        // Message
        VStack{
            Text("seq4".localized())
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.bgColor)
                .cornerRadius(5)
                .shadow(color: shadowColor, radius: shadowRadius, y: shadowY)
                .padding()
            Spacer()
        }
        .padding(.top, 120)
    }
}

// Base ViewBuilder Extension
extension OnBoardingPageView {
    
    // Toolbar
    @ViewBuilder func toolbarViewBuilder() ->  some View{
        ZStack{
            // Friendship Indicator
            ZStack{
                ZStack{
                    Divider()
                        .frame(height: RatioSize.getResheight(height: 1))
                        .overlay(Color.fontColor)
                    HStack{
                        Divider()
                            .frame(width: RatioSize.getResWidth(width: 1), height: RatioSize.getResheight(height: 5))
                            .overlay(Color.fontColor)
                    }
                }
                HStack{
                    Text("?")
                        .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                        .foregroundColor(.fontColor)
                        .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                        .background(Color.tapFontColor)
                        .cornerRadius(50)
                    
                    Spacer()
                    
                    Text("?")
                        .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                        .foregroundColor(.fontColor)
                        .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                        .background(Color.tapFontColor)
                        .cornerRadius(50)
                }//HStack
                
                Text("Ahn".localized())
                    .font(.custom(modelData.contentFontName, size: RatioSize.getResWidth(width: 18)))
                    .foregroundColor(.fontColor)
                    .frame(width: RatioSize.getResWidth(width: 30), height: RatioSize.getResWidth(width: 30))
                    .background(Color.bgColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.tapFontColor, lineWidth: 1)
                    )
                    .offset(x: -30)
            }
            .frame(width: RatioSize.getResWidth(width: 230))
            // Gear Icon
            HStack{
                Spacer()
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: RatioSize.getResWidth(width: 20), height: RatioSize.getResWidth(width: 20))
                    .foregroundColor(.fontColor)
                    .padding()
            }
        }
        .frame(height: RatioSize.getResheight(height: 40))
    }
    
    // ContentViewBuilder
    @ViewBuilder func contentViewBuiler() -> some View {
        Text("sampleContent".localized())
            .font(.custom(modelData.contentFontName, size: 18))
            .lineSpacing(12)
    }
    
    // ButtonViewReloader
    @ViewBuilder func ButtonViewBuilder() -> some View {
        VStack{
            Text("sampleChoice1".localized())
                .foregroundColor(.fontColor)
                .font(.custom(modelData.choiceFontName, size: 18))
                .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                .padding(.horizontal, 40)
                .padding(.vertical, RatioSize.getResheight(height: 5))

            Text("sampleChoice2".localized())
                .foregroundColor(.fontColor)
                .font(.custom(modelData.choiceFontName, size: 18))
                .frame(maxWidth: .infinity, maxHeight: RatioSize.getResheight(height: 60))
                .background(Color.bgColor)
                .cornerRadius(50)
                .shadow(color: Color("ButtonShadow"), radius: 3, x: 0, y: 0)
                .padding(.horizontal, 40)
                .padding(.vertical, RatioSize.getResheight(height: 5))
                .padding(.bottom, 10)
        }
        .padding(.bottom, 40)
    }
}
