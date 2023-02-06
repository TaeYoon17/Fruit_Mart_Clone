//
//  Popup.swift
//  Fruit_Mart_Clone
//
//  Created by 김태윤 on 2023/02/06.
//

import SwiftUI

enum PopupStyle{
    case none
    case blur
    case dimmed
}

struct Popup<Message: View> : ViewModifier{
    let size: CGSize?
    let style: PopupStyle
    let message: Message
    init(size: CGSize? = nil, style: PopupStyle = .none, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }
    func body(content: Content) -> some View {
        
        content
            .blur(radius: style == .blur ? 2 : 0)
            .overlay(
                Rectangle().fill(
                    Color.black.opacity(style == .dimmed ? 0.4 : 0)
                )
            )
            .overlay(
                popupContent,alignment: .center
            )
    }
    private var popupContent: some View{
        GeometryReader{proxy in
            VStack{
                self.message
                Text(proxy.size.debugDescription)
            }.frame(width: proxy.size.width * 0.6,
                    height: proxy.size.height * 0.25,
                    alignment: .center)
            .background(Color.primary.colorInvert())
            .cornerRadius(12)
            .shadow(color: .primaryShadow,radius: 15,x: 5,y: 5)
            .overlay(self.checkMark, alignment:.top)
            .position(x: proxy.frame(in: .local).midX,y:proxy.frame(in: .local).midY)
        }
    }
    private var checkMark: some View{
        Symbol("checkmark.circle.fill",color:.peach)
            .font(.system(size:60).weight(.semibold))
            .background(Color.white.scaleEffect(0.8))
            .offset(x:0,y:-20)
    }
}

//MARK: -- 팝업 토글
fileprivate struct PopupToggle: ViewModifier{
    @Binding var isPresented: Bool
    func body(content: Content) -> some View {
        content.disabled(isPresented)
            .onTapGesture {
                isPresented.toggle()
            }
    }
}
extension View{
    func popup<Content: View>(isPresendted:Binding<Bool>,size: CGSize? = nil,style: PopupStyle = .none
                              ,@ViewBuilder content: ()->Content)->some View{
        if isPresendted.wrappedValue{
            let popup = Popup(size:size,style: style,message: content())
            let popupToggle = PopupToggle(isPresented: isPresendted)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        }else{
            return AnyView(self)
        }
    }
}


// MARK: -- 아이템 토글
fileprivate struct ItemToggle<Item: Identifiable>: ViewModifier{
    //@Binding var isPresented: Bool
    @Binding var item: Item?
    func body(content: Content) -> some View {
        content.disabled(item != nil)
            .onTapGesture {
                self.item = nil
            }
    }
}
extension View{
    func popup<Content: View,Item: Identifiable>(item: Binding<Item?>,size: CGSize?, style:PopupStyle = .none,
                                                 @ViewBuilder content:(Item) -> Content)->some View{
        if let selectedItem = item.wrappedValue{
            let content = content(selectedItem)
            let popup = Popup(size: size,style:style,message: content)
            let popupToggle = ItemToggle(item: item)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        }else{
            return AnyView(self)
        }
    }
}


