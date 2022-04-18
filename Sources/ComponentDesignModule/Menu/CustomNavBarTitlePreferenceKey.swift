import SwiftUI


struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubtitlePreferenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPrefenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavBarSettingsButtonPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


extension View {
    public func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    public func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    
    public func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPrefenceKey.self, value: hidden)
    }
    
    public func customNavigationBarSettingsButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarSettingsButtonPreferenceKey.self, value: hidden)
    }
    
    public func customNavBarItems(title: String, subtitle: String?, backButtonHidden: Bool, settingsButtonHidden: Bool) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
            .customNavigationBarSettingsButtonHidden(settingsButtonHidden)
    }
}
