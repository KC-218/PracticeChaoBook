// 【ChaoCode】 Swift 基礎篇 11：Switch 實作作業
//
// 1. 請使用 Switch 的條件控制語法，根據月份和地理位置印出季節資訊。
// 北半球： 1~3 月是春天；4~6 月是夏天；7~9 月是秋天；10~12 月是冬天。
// 南半球： 1~3 月是秋天；4~6 月是冬天；7~9 月是春天；10~12 月是夏天。

func 季節判斷(地點: String, 是北半球: Bool, 月份: Int)
{
    //👇 請在以下 print 之前的範圍編輯，不限行數。記得最後要把 print 那行的季節答案改好。
    
    enum Season {
        case Spring, Summer, Autumn, Winter
    }
    
    var season: Season = .Spring
    
    switch (地點, 是北半球, 月份) {
    case (_, true, 1...3), (_, false, 7...9):
        season = .Spring
    case (_, true, 4...6), (_, false, 10...12):
        season = .Summer
    case (_, true, 7...9), (_, false, 1...3):
        season = .Autumn
    case (_, true, 10...12), (_, false, 4...6):
        season = .Winter
    default:
        break
    }
    
    print("\(地點)在 \(月份) 月時會是 \(season) 季節")
}





// 2. 請使用 Switch 的條件控制語法，根據以下條件幫你朋友篩選約會對象。
// 理想對象：30 歲以內（不含），是男生的話身高至少 180，女生的話身高至少 165。
// 可以考慮：40 歲以內（不含），是男生的話身高至少 177，女生的話身高至少 162，距離在 10.0 公里以內(含）。
// 值得關注：20 歲以內（不含），距離在 15.0 公里以內(含）。

// Person 裡面的資料依序代表是：名字、是否是男生、年齡、身高、距離、自我介紹。
func 過濾配對(_ person: Person)
{
    // 👇 請只在以下這個 switch 的範圍內編輯，並且不使用 if 語句。
    switch person {
    case (let 名字, true, ..<30, let 身高, _, let 自我介紹) where 身高 >= 180, (let 名字, false, ..<30, let 身高, _,let 自我介紹) where 身高 >= 165 :
        print("💘 理想對象：\(名字)「\(自我介紹)」")
    case (let 名字, true, ..<40, let 身高, ...10, let 自我介紹) where 身高 >= 177, (let 名字, false, ..<40, let 身高, ...10, let 自我介紹) where 身高 >= 162 :
        print("🤗 可以考慮：\(名字)「\(自我介紹)」")
    case (let 名字, true, ..<20, let 身高, ...15, let 自我介紹), (let 名字, false, ..<20, let 身高, ...15, let 自我介紹) :
        print("👀 值得關注：\(名字)「\(自我介紹)」")
    default:
        break
    }
}

// 請記得下載 checkHelper 才能執行下面這行作業檢查喔 ☺️
作業檢查(weather: 季節判斷, match: 過濾配對)
