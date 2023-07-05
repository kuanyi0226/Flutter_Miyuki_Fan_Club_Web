class MyDecoder {
  // Year_Index to Concert Year
  static String yearToConcertYear(String year_index) {
    if (year_index.startsWith('y')) {
      return year_index.substring(1, 5);
    } else {
      return year_index.substring(0, 4);
    }
  }

  static String songNameToPure(String songName) {
    String sub;
    if (songName.trim().substring(0, 2) == '//') {
      //poem
      sub = songName.trim().substring(5);
    } else {
      //song
      sub = songName.trim().substring(3);
    }

    int spaceIndex = sub.indexOf(' '); //has space
    String result;
    if (spaceIndex >= 0) {
      result = sub.substring(0, spaceIndex);
    } else {
      result = sub;
    }
    return result;
  }

  // Year_Index to Concert Name
  static String yearToConcertName(String year_index) {
    if (year_index.startsWith('y')) {
      switch (year_index) {
        case "y1989":
          return '夜会 1989';
        case "y1990":
          return '夜会 1990';
        case "y1991":
          return '夜会VOL.3「KAN-TAN（邯鄲）」';
        case "y1992":
          return '夜会VOL.4「金環蝕」';
        case "y1993":
          return '夜会VOL.5「花の色はうつりにけりないたづらに わが身世にふるながめせし間に」';
        case "y1994":
          return '夜会VOL.6「シャングリラ」';
        case "y1995":
          return '夜会VOL.7「 ２／２ 」';
        case "y1996":
          return '夜会VOL.8「問う女」';
        case "y1997":
          return '夜会VOL.9「 ２／２ 」';
        case "y1998":
          return '夜会VOL.10「海嘯」';
        case "y2000":
          return '夜会VOL.11「ウィンター・ガーデン」';
        case "y2002":
          return '夜会VOL.12「ウィンター・ガーデン」';
        case "y2004":
          return '夜会VOL.13「24時着 ０時発」';
        case "y2006":
          return '夜会VOL.14「24時着00時発」';
        case "y2008":
          return '夜会VOL.15～夜物語～「元祖・今晩屋」';
        case "y2009":
          return '夜会VOL.16～夜物語～「本家・今晩屋」';
        case "y2011":
          return '夜会VOL.17「 ２／２ 」';
        case "y2013":
          return '夜会工場 VOL.1';
        case "y2014":
          return '夜会VOL.18─橋の下のアルカディア';
        case "y2016":
          return '夜会VOL.19─橋の下のアルカディア';
        case "y2017":
          return '夜会工場 VOL.2';
        case "y2019":
          return '夜会VOL.20「リトル・トーキョー」';
        default:
          return 'No live';
      }
    } else {
      switch (year_index) {
        case "1972_0":
          return '72全国フォーク音楽祭 全国大会';
        case "1976_0":
          return '近畿大学工学部大学祭';
        case "1978_0":
          return '1978年・春のツアー';
        case "1978_1":
          return '1978年・秋のツアー';
        case "1979_0":
          return '1979年・春のツアー';
        case "1979_1":
          return '1979年・秋のツアー';
        case "1980_0":
          return '1980年・春のツアー';
        case "1980_1":
          return '1980年・秋のツアー';
        case "1981_0":
          return '寂しき友へ';
        case "1981_1":
          return '寂しき友へ II';
        case "1982_0":
          return '浮汰姫';
        case "1983_0":
          return '蕗く季節に';
        case "1984_0":
          return '明日を撃て！';
        case "1984_1":
          return '月光の宴';
        case "1985_0":
          return 'のぅさんきゅう';
        case "1985_1":
          return '歌暦 Page 85';
        case "1986_0":
          return '五番目の季節';
        case "1986_1":
          return '歌暦 Page 86 恋唄';
        case "1987_0":
          return 'SUPPIN VOL.1';
        case "1989_0":
          return '野ウサギのように';
        case "1990_0":
          return 'Night Wings';
        case "1992_0":
          return 'カーニヴァル1992';
        case "1993_0":
          return 'EAST ASIA';
        case "1995_0":
          return 'LOVE OR NOTHING';
        case "1997_0":
          return 'パラダイス・カフェ';
        case "1998_0":
          return 'TOUR \'98 試行錯誤';
        case "2001_1":
          return 'XXIc. 1st. 中島みゆき in KEIO';
        case "2005_0":
          return 'TOUR 2005';
        case "2007_0":
          return 'TOUR 2007 歌旅';
        case "2010_0":
          return 'TOUR2010';
        case "2012_0":
          return '縁会2012～3';
        case "2015_0":
          return '一会（いちえ）2015~2016';
        case "2020_0":
          return 'ラスト・ツアー 「 結果オーライ」';
        default:
          return 'No live';
      }
    }
  }

  //Return song list
  static List<String> getYakaiSongList({required String yakai}) {
    switch (yakai) {
      //Yakai
      case "y1989":
        return [
          '01	泣きたい夜に',
          '02	毒をんな',
          '03	杏村から',
          '04	０３時',
          '05	時は流れて',
          '06	群衆',
          '07	あり、か',
          '08	黄砂に吹かれて',
          '09	わかれうた',
          '10	悪女',
          '11	あした',
          '12	気にしないで',
          '13	MEGAMI',
          '14	あわせ鏡',
          '15	鳥になって',
          '16	十二月',
          '17	二隻の舟',
        ];
      case "y1990":
        return [
          '01	二隻の舟',
          '02	彼女によろしく',
          '03	ミルク32',
          '04	流浪の詩',
          '05	窓ガラス',
          '06	うそつきが好きよ',
          '07	「元気ですか」',
          '08	クレンジング_クリーム',
          '09	月の赤ん坊',
          '10	断崖─親愛なる者へ─',
          '11	孤独の肖像',
          '12	強がりはよせヨ',
          '13	北の国の習い',
          '14	ショウ・タイム',
          '15	Maybe',
          '16	ふたりは',
        ];
      case "y1991":
        return [
          '01	涙─Made_in_tears─',
          '02	トーキョー迷子',
          '03	タクシー_ドライバー',
          '04	キツネ狩りの歌',
          '05	僕は青い鳥',
          '06	ロンリー_カナリア',
          '07	ひとり遊び',
          '08	萩野原',
          '09	キツネ狩りの歌',
          '10	わかれうた',
          '11	ひとり上手',
          '12	さよならの鐘',
          '13	LA-LA-LA',
          '14	サーチライト',
          '15	キツネ狩りの歌',
          '16	B.G.M.',
          '17 シュガー',
          '18 黄色い犬',
          '19 キツネ狩りの歌',
          '20 ふたつの炎',
          '21 傾斜',
          '22 二隻の舟',
          '23 傾斜',
          '24 殺してしまおう',
          '25 雪',
          '26 I_love_him',
          '27 I_love_him',
          '28 I_love_him （Instrumental）',
          '29 I_love_him （Instrumental）',
        ];
      case "y1992":
        return [
          '01	インストゥルメンタル「金環蝕」',
          '02	C.Q.',
          '03	砂の船',
          '04	ほうせんか',
          '05	歌をあなたに',
          '06	泣かないでアマテラス',
          '07	エレーン',
          '08	遠雷',
          '09	冬を待つ季節',
          '10	泣かないでアマテラス',
          '11	世迷い言',
          '12	熱病',
          '13	最悪',
          '14	遠雷',
          '15	冬を待つ季節',
          '16	泣かないでアマテラス',
          '17 真直な線',
          '18 やまねこ',
          '19 新曾根崎心中',
          '20 泣かないでアマテラス',
          '21 EAST_ASIA',
          '22 泣かないでアマテラス',
          '23 二隻の舟',
          '24 DIAMOND_CAGE',
          '25 インストゥルメンタル「金環蝕」',
          '26 泣かないでアマテラス',
        ];
      case "y1993":
        return [
          '01	雨のテーマ （Instrumental）',
          '02	どこにいても',
          '03	雨が空を捨てる日は',
          '04	家出',
          '05	バス通り',
          '06	笑わせるじゃないか',
          '07	人待ち歌',
          '08	信じ難いもの',
          '09	サッポロSNOWY',
          '10	ノスタルジア',
          '11	船を出すのなら九月',
          '12	遍路',
          '13	まつりばやし',
          '14	３分後に捨ててもいい',
          '15	りばいばる',
          '16	二隻の舟',
          '17 雨月の使者',
          '18 孤独の肖像1st.',
          '19 雨のテーマ （Instrumental）',
          '20 彼女の生き方',
          '21 テキーラを飲みほして',
          '22 たとえ世界が空から落ちても',
          '23 くらやみ乙女',
          '24 愛よりも',
          '25 人待ち歌',
          '26 夜曲',
          '27 人待ち歌 （Instrumental）',
        ];
      case "y1994":
        return [
          '01	思い出させてあげる （Instrumental）',
          '02	怜子',
          '03	煙草',
          '04	噂',
          '05	波の上',
          '06	南三条',
          '07	縁',
          '08	あの娘',
          '09	朝焼け',
          '10	五才の頃',
          '11	F.O.',
          '12	忘れてはいけない',
          '13	思い出させてあげる',
          '14	思い出させてあげる',
          '15	あり、か',
          '16	春までなんぼ （Instrumental）',
          '17 子守歌',
          '18 グッバイガール',
          '19 黄砂に吹かれて',
          '20 思い出させてあげる',
          '21 友情',
          '22 シャングリラ',
          '23 思い出させてあげる',
          '24 春までなんぼ',
          '25 波の上',
          '26 二隻の舟',
          '27 生きてゆくおまえ',
          '28 誕生',
          '29 生きてゆくおまえ',
          '30 シャングリラ （Instrumental）',
        ];
      case "y1995":
        return [
          '01	TOURIST',
          '02	LAST_SCENE',
          '03	TOURIST',
          '04	誰かが私を憎んでいる',
          '05	１人旅のススメ',
          '06	拾われた猫のように',
          '07	奇妙な音楽',
          '08	誰かが私を憎んでいる',
          '09	NEVER_CRY_OVER_SPILT_MILK',
          '10	奇妙な音楽',
          '11	この思いに偽りはなく',
          '12	１人で生まれて来たのだから',
          '13	TOURIST',
          '14	TOURIST',
          '15	途方に暮れて',
          '16	ハリネズミ',
          '17 市場は眠らない',
          '18 TOURIST',
          '19 拾われた猫のように',
          '20 竹の歌',
          '21 紅い河',
          '22 ７月のジャスミン',
          '23 自白',
          '24 目撃者の証言',
          '25 幸せになりなさい',
          '26 二隻の舟',
          '27 幸せになりなさい',
          '28 紅い河',
          '29 市場は眠らない （Instrumental）',
        ];
      case "y1996":
        return [
          '01	羊の言葉',
          '02	コマーシャル',
          '03	ＪＢＣのテーマ',
          '04	エコー',
          '05	SMILE,_SMILE',
          '06	台風情報 （Instrumental）',
          '07	エコー',
          '08	誰だってナイフになれる （Instrumental）',
          '09	SMILE,_SMILE',
          '10	RAIN',
          '11	ＪＢＣのテーマ',
          '12	公然の秘密',
          '13	エコー',
          '14	誰だってナイフになれる',
          '15	女という商売',
          '16	二隻の舟',
          '17 あなたの言葉がわからない',
          '18 血の音が聞こえる',
          '19 未明に',
          '20 異国の女 （Instrumental）',
          '21 ＪＢＣのテーマ',
          '22 未明に （Instrumental）',
          '23 PAIN',
          '24 RAIN （Instrumental）',
        ];
      case "y1997":
        return [
          '01	LAST_SCENE',
          '02	奇妙な音楽 （Instrumental）',
          '03	誰かが私を憎んでいる',
          '04	この思いに偽りはなく',
          '05	いつか夢の中へ (※新曲)',
          '06	拾われた猫のように',
          '07	奇妙な音楽 （Instrumental）',
          '08	拾われた猫のように',
          '09	NEVER_CRY_OVER_SPILT_MILK',
          '10	１人で生まれて来たのだから',
          '11	TOURIST',
          '12	TOURIST',
          '13	途方に暮れて',
          '14	ハリネズミ',
          '15	市場は眠らない',
          '16	誰かが私を憎んでいる',
          '17 竹の歌',
          '18 紅い河',
          '19 ７月のジャスミン',
          '20 自白',
          '21 目撃者の証言',
          '22 幸せになりなさい',
          '23 二隻の舟',
          '24 幸せになりなさい',
          '25 市場は眠らない （Instrumental）'
        ];
      case "y1998":
        return [
          '01	夢を叶えて',
          '02	夢の代わりに',
          '03	夢を叶えて',
          '04	I_am',
          '05	故国',
          '06	I_am',
          '07	カレンダー',
          '08	知人・友人・愛人・家人',
          '09	空しき人へ',
          '10	夢の代わりに',
          '11	二隻の舟',
          '12	難破船',
          '13	愛から遠く離れて',
          '14	Good_Morning,_Ms.YAMASHINA',
          '15	献灯',
          '16	白菊',
          '17 明日なき我等',
          '18 時効',
          '19 フロンティア',
          '20	夢の代わりに （Instrumental）',
          '21 紫の桜',
          '22 叶わぬ夢',
          '23 フロンティア',
        ];
      case "y2000":
        return [
          '01	水琴窟 （Instrumental）',
          '//01	いない私(詩篇)',
          '//02	新品の眺め(詩篇)',
          '02	騙りの庭',
          '//03	片袖のない着物(詩篇)',
          '//04	傷(詩篇)',
          '//05	おかえり(詩篇)',
          '//06	能書き(詩篇)',
          '//07	新品のスーツを着た男(詩篇)',
          '03	凍原楼閣 （Instrumental）',
          '//08	谷地眼(詩篇)',
          '//09	計画(詩篇)',
          '//10	湿原であります(詩篇)',
          '//11	朱色の花を抱きしめて(詩篇)',
          '04	朱色の花を抱きしめて',
          '//12	花暖房(詩篇)',
          '//13	一生と一日(詩篇)',
          '//14	狂言日誌(詩篇)',
          '05	朱を奪う紫',
          '//15	野守草(詩篇)',
          '//16	ためになる恋(詩篇)',
          '//17	獲物とった(詩篇)',
          '//18	ティーンエイジャーだった頃(詩篇)',
          '//19	陽時計・月時計(詩篇)',
          '06	陽紡ぎ唄',
          '//20	火をかざせ(詩篇)',
          '//21	手を出すな(詩篇)',
          '//22	ひとりぽっちの闘い(詩篇)',
          '//23	爪(詩篇)',
          '//24	さぐり(詩篇)',
          '07	疑えばきりがない',
          '//25	虫(詩篇)',
          '//26	雪の粒はいくつ(詩篇)',
          '//27	古い帽子(詩篇)',
          '08	ツンドラ・バード',
          '//28	白銀霜髪(詩篇)',
          '//29	白闇(詩篇)',
          '//30	白都より(詩篇)',
          '09	氷の花 （Instrumental）',
          '//31	田舎のネズミ(詩篇)',
          '10	街路樹',
          '//32	轍(詩篇)',
          '//33	作業灯(詩篇)',
          '//34	ひとりぽっちの闘い(詩篇)',
          '//35	氷河零時(詩篇)',
          '//36	氷室守(詩篇)',
          '//37	遠近法(詩篇)',
          '11	氷脈',
          '//38	足の下に何かがあるので(詩篇)',
          '//39	地下から陽時計を見上げれば(詩篇)',
          '//40	ヤコブの梯子(詩篇)',
          '//41	成就(詩篇)',
          '//12	水琴窟 （Instrumental）',
          '//13	朱色の花を抱きしめて （Instrumental）',
          '//42	ずっと待ってたのに(詩篇)',
          '14	天使の階段',
          '//43	CAP(詩篇)',
          '15	記憶',
          '//44	空からアスピリン(詩篇)',
          '16	何を待っているの',
          '//45	祝福(詩篇)',
          '//46	越境者(詩篇)',
          '//47	敵(詩篇)',
          '17	六花',
          '//48	帳簿(詩篇)',
          '//49	地吹雪を御存知ない(詩篇)',
          '18	粉雪は忘れ薬',
        ];
      case "y2002":
        return [
          '01	水琴窟 （Instrumental）',
          '//01	いない私(詩篇)',
          '02	騙りの庭',
          '//02	新品の眺め(詩篇)',
          '//03	片袖のない着物(詩篇)',
          '//04	傷(詩篇)',
          '//05	おかえり(詩篇)',
          '03	凍原楼閣 （Instrumental）',
          '//06	能書き(詩篇)',
          '//07	新品のスーツを着た男(詩篇)',
          '//08	谷地眼(詩篇)',
          '//09	計画(詩篇)',
          '//10	湿原であります(詩篇)',
          '//11	朱色の花を抱きしめて(詩篇)',
          '04	朱色の花を抱きしめて',
          '//12	花暖房(詩篇)',
          '//13	一生と一日(詩篇)',
          '//14	狂言日誌(詩篇)',
          '05	朱を奪う紫',
          '//15	野守草(詩篇)',
          '//16	ためになる恋(詩篇)',
          '//17	獲物とった(詩篇)',
          '//18	ティーンエイジャーだった頃(詩篇)',
          '//19	陽時計・月時計(詩篇)',
          '06	陽紡ぎ唄',
          '//20	火をかざせ(詩篇)',
          '//21	手を出すな(詩篇)',
          '//22	ひとりぽっちの闘い(詩篇)',
          '//23	爪(詩篇)',
          '07	疑えばきりがない',
          '//24	さぐり(詩篇)',
          '//25	虫(詩篇)',
          '//26	雪の粒はいくつ(詩篇)',
          '//27	古い帽子(詩篇)',
          '08	ツンドラ・バード',
          '//28	白銀霜髪(詩篇)',
          '//29	白闇(詩篇)',
          '09	氷の花 （Instrumental）',
          '//30	白都より(詩篇)',
          '//31	田舎のネズミ(詩篇)',
          '10	街路樹',
          '//32	轍(詩篇)',
          '11	街路樹',
          '//33	作業灯(詩篇)',
          '//34	ひとりぽっちの闘い(詩篇)',
          '//35	氷河零時(詩篇)',
          '//36	氷室守(詩篇)',
          '//37	遠近法(詩篇)',
          '12	氷脈',
          '//38	足の下に何かがあるので(詩篇)',
          '//39	地下から陽時計を見上げれば(詩篇)',
          '//40	ヤコブの梯子(詩篇)',
          '//41	成就(詩篇)',
          '13	水琴窟 （Instrumental）',
          '14	朱色の花を抱きしめて （Instrumental）',
          '15	天使の階段',
          '//42	ずっと待ってたのに(詩篇)',
          '//43	CAP(詩篇)',
          '16	何を待っているの',
          '//44	祝福(詩篇)',
          '//45	乞(詩篇)',
          '17	氷を踏んで',
          '//46	帳簿(詩篇)',
          '18	六花',
          '//47	空からアスピリン(詩篇)',
          '19	粉雪は忘れ薬',
          '//48	いない私(詩篇)',
          '20	記憶',
        ];
      case "y2004":
        return [
          '01	サヨナラ・コンニチハ （中島）',
          '02	線路の外の風景 （中島）',
          '03	分水嶺 （中島・杉本）',
          '04	フォーチュン・クッキー （中島・杉本）',
          '05	パーティー・ライツ （中島）',
          '06	闇夜のテーブル （杉本・宮下）',
          '07	情婦の証言 （中島）',
          '08	ティムを探して （中島）',
          '09	廃線のお知らせ （中島）',
          '10	遺失物預り所 （宮下）',
          '11	水を点して火を汲んで （杉本）',
          '12	ミラージュ・ホテル （中島）',
          '13	ミラージュ・ホテル （中島）',
          '14	メビウスの帯はねじれる （杉本・中島）',
          '15	DOORS_TO_DOORS （中島）',
          '16	リゾート・ラッシュ （宮下・杉本・中島）',
          '17 水の線路 （宮下・杉本）',
          '18 我が祖国は風の彼方 （中島・宮下・杉本・濱田・香坂）',
          '19 三日月の湖 （中島）',
          '20	帰れない者たちへ （中島）',
          '21 月夜同舟 （中島）',
          '22 命のリレー （中島）',
          '23 サーモン・ダンス （中島）',
          '24 二隻の舟 （中島）',
          '25 無限軌道 （中島）',
          '26 ミラージュ・ホテル （中島）',
          '27 サーモン・ダンス （中島）',
          '28 命のリレー （中島）',
        ];
      case "y2006":
        return [
          '01	サヨナラ・コンニチハ （中島）',
          '02	線路の外の風景 （中島）',
          '03	分水嶺 （杉本）',
          '04	フォーチュン・クッキー （中島）',
          '05	パーティー・ライツ （中島）',
          '06	闇夜のテーブル （杉本・宮下）',
          '07	情婦の証言 （中島）',
          '08	ティムを探して （中島）',
          '09	廃線のお知らせ （中島）',
          '10	遺失物預り所 （コビヤマ・宮下）',
          '11	水を点して火を汲んで （杉本）',
          '12	ミラージュ・ホテル （中島）',
          '13	ミラージュ・ホテル',
          '14	メビウスの帯はねじれる （杉本・中島）',
          '15	DOORS_TO_DOORS （中島）',
          '16	リゾート・ラッシュ （宮下・杉本・中島）',
          '17 水の線路 （宮下・杉本）',
          '18 我が祖国は風の彼方 （中島・宮下・杉本・コビヤマ・香坂）',
          '19	帰れない者たちへ （中島）',
          '20 月夜同舟 （中島）',
          '21 命のリレー （中島）',
          '22 サーモン・ダンス （中島）',
          '23 二隻の舟 （中島）',
          '24 無限軌道 (※無限・軌道)（中島）',
          '25 ミラージュ・ホテル （Instrumental）',
          '26 サーモン・ダンス （中島）',
          '27 命のリレー （中島）',
        ];
      case "y2008":
        return [
          '01	十二天 （Inst.）',
          '02	暦売りの歌 （中島）',
          '03	百九番目の除夜の鐘 （中島）',
          '04	夜をくだされ （中島・杉本・宮下）',
          '05	海に絵を描く （宮下・コビヤマ）',
          '06	旅支度なされませ （香坂）',
          '07	私の罪は水の底 （中島・杉本）',
          '08	逃げよ、少年 （中島・宮下）',
          '09	百九番目の除夜の鐘 （中島）',
          '10	愚かな禿 （中島・杉本）',
          '11	らいしょらいしょ （杉本・香坂・宮下）',
          '12	ちゃらちゃら （中島）',
          '13	憂き世ばなれ （香坂・杉本）',
          '14	夜いらんかいね （中島）',
          '15	百九番目の除夜の鐘 （中島）',
          '16	旅支度なされませ （中島）',
          '17 らいしょらいしょ （中島）',
          '18 都の灯り （宮下・中島）',
          '19	暦売りの歌 （中島）',
          '20 幽霊交差点 （中島）',
          '21 旅支度なされませ （杉本）',
          '22 百九番目の除夜の鐘 （中島）',
          '23 安らけき寿を捨て （中島）',
          '24 夜をくだされ （香坂・杉本・宮下）',
          '25 有機体は過去を喰らふ （宮下・中島）',
          '26 私の罪は水の底 （中島）',
          '27 有機体は過去を喰らふ （宮下）',
          '28	らいしょらいしょ （中島）',
          '29	百九番目の除夜の鐘 （中島）',
          '30	十文字 （中島）',
          '31	ほうやれほ （中島）',
          '32	十二天 （宮下・中島・杉本）',
          '33	紅蓮は目を醒ます （中島）',
          '34	赦され河、渡れ （宮下・中島）',
          '35 夜いらんかいね （中島）',
          '36	天鏡 （中島）',
        ];
      case "y2009":
        return [
          '01	十二天 （Inst.）',
          '02	暦売りの歌 （中島）',
          '03	百九番目の除夜の鐘 （中島）',
          '04	夜をくだされ （中島・杉本・宮下）',
          '05	海に絵を描く （宮下・コビヤマ）',
          '06	旅支度なされませ （香坂）',
          '07	私の罪は水の底 （中島・杉本）',
          '08	逃げよ、少年 （中島・宮下）',
          '09	百九番目の除夜の鐘 （中島）',
          '10	愚かな禿 （中島・杉本）',
          '11	らいしょらいしょ （杉本・香坂・宮下）',
          '12	ちゃらちゃら （中島）',
          '13	憂き世ばなれ （香坂・杉本）',
          '14	夜いらんかいね （中島）',
          '15	百九番目の除夜の鐘 （中島）',
          '16	旅支度なされませ （中島）',
          '17 らいしょらいしょ （中島）',
          '18 都の灯り （宮下・中島）',
          '19	暦売りの歌 （中島）',
          '20 幽霊交差点 （中島）',
          '21 旅支度なされませ （杉本）',
          '22 百九番目の除夜の鐘 （中島）',
          '23 安らけき寿を捨て （中島）',
          '24 夜をくだされ （香坂・杉本・宮下）',
          '25 有機体は過去を喰らふ （宮下・中島）',
          '26 私の罪は水の底 （中島）',
          '27 有機体は過去を喰らふ （宮下）',
          '28	らいしょらいしょ （中島）',
          '29	百九番目の除夜の鐘 （中島）',
          '30	十文字 （中島）',
          '31	ほうやれほ （中島）',
          '32	十二天 （宮下・中島・杉本）',
          '33	紅蓮は目を醒ます （中島）',
          '34	赦され河、渡れ （宮下・中島）',
          '35 夜いらんかいね （中島）',
          '36	天鏡 （中島）',
        ];
      case "y2011":
        return [
          '01	旅は始まる',
          '02	新しい風',
          '03	笹舟',
          '04	遠近法',
          '05	ささやかな花',
          '06	Last_Scene',
          '07	奇妙な音楽',
          '08	鏡の中の他人',
          '09	Never_Cry_Over_Spilt_Milk',
          '10	ギヴ・アンド・テイク',
          '11	奇妙な音楽',
          '12	彼と私と、もう１人',
          '13	誰かが私を憎んでいる',
          '14	夢中遊行',
          '15	ばりほれとんぜ',
          '16	暗闇のジャスミン',
          '17 誰かが私を憎んでいる',
          '18 暗闇のジャスミン',
          '19	１人で生まれて来たのだから',
          '20 市場は眠らない',
          '21 途方に暮れて',
          '22 この思いに偽りはなく',
          '23 帰郷群',
          '24 帰郷群',
          '25 竹を渡る風の中で',
          '26 姉妹になるがいい',
          '27 鶺鴒（セキレイ）',
          '28	緘口令',
          '29	旅人よ我に帰れ',
          '30	茉莉花',
          '31	竹の歌',
          '32	紅い河',
          '33	７月のジャスミン',
          '34	海のカルテ',
          '35 自白',
          '36	目撃者の証言',
          '37	７月のジャスミン',
          '38	目撃者の証言',
          '39	暗闇のジャスミン',
          '40	幸せになりなさい',
          '41	二隻の舟 (※二雙の舟)',
          '42	幸せになりなさい （旅人よ我に帰れ）',
          '43	彼と私と、もう１人',
        ];
      case "y2013":
        return [
          '01	二隻の舟 (※二雙の舟)（Inst.）',
          '02	産声',
          '03	十二月',
          '04	月の赤ん坊',
          '05	さよならの鐘',
          '06	Last_Scene',
          '07	泣かないでアマテラス',
          '08	笑わせるじゃないか',
          '09	シャングリラ',
          '10	TOURIST',
          '11	SMILE,_SMILE',
          '12	女という商売',
          '13	NEVER_CRY_OVER_SPILT_MILK',
          '14	明日なき我等',
          '15	白菊',
          '16	街路樹',
          '17 天使の階段',
          '18 ミラージュ・ホテル',
          '19	命のリレー',
          '20 らいしょらいしょ',
          '21 都の灯り',
          '22 竹の歌',
          '23 産声',
          '24 二隻の舟 (※二雙の舟)（カーテンコール）',
        ];
      case "y2014":
        return [
          '01	なぜか橋の下 （中島）',
          '02	水晶球 （中島）',
          '03	謎な女 （中村）',
          '04	問題集 （中島、中村）',
          '05	いらない町 （石田）',
          '06	失せ物探し （中島）',
          '07	恋なんていつでもできる （中村）',
          '08	いちど会ったらどうかしら （中島）',
          '09	大きな忘れ物 （石田）',
          '10	猫なで声プリーズ （中村）',
          '11	川の音が聞こえる （中島）',
          '12	一族 （石田）',
          '13	昔々あるところに （中島）',
          '14	捨て子選び （中島、石田）',
          '15	すあまの約束 （中島）',
          '16	男の仕事 （石田）',
          '17 身体の中を流れる涙 （中島）',
          '18 男の仕事 （石田）',
          '19	みのむし（鬼の捨て子） （中村）',
          '20 私と一緒に （中島）',
          '21 猫籠 （中村）',
          '22 人柱 （中島）',
          '23 人間になりたい （中村）',
          '24 問題集 （コーラス）',
          '25 身体の中を流れる涙 （中村、中島）',
          '26 どうしてそんなに愛がほしいの （中島）',
          '27 雨天順延 （中村）',
          '28	ペルシャ （中島、中村）',
          '29	袋のネズミ （コーラス）',
          '30	シャッター街 （中島、中村）',
          '31	恋なんていつでもできる （中村）',
          '32	雨天順延 （中村）',
          '33	二隻の舟 (※二雙の舟)（中島）',
          '34	水晶球 （石田）',
          '35 一族 （中島）',
          '36	呑んだくれのラヴレター （中村、宮下）',
          '37	一夜草 （宮下）',
          '38	毎時200ミリ （中村）',
          '39	いらない町 （中島）',
          '40	呑んだくれのラヴレター （中村、中島）',
          '41	猫にだけ見えるもの （中村）',
          '42	国捨て （石田、中島）',
          '43	India_Goose （石田、中島）',
          '44	私と一緒に （中村）',
          '45	India_Goose （中島、石田）',
          '46	なぜか橋の下 （中島）',
        ];
      case "y2016":
        return [
          '01	なぜか橋の下 （中島）',
          '02	水晶球 （中島）',
          '03	謎な女 （中村）',
          '04	問題集 （中島、中村）',
          '05	いらない町 （石田）',
          '06	失せ物探し （中島）',
          '07	恋なんていつでもできる （中村）',
          '08	いちど会ったらどうかしら （中島）',
          '09	大きな忘れ物 （石田）',
          '10	猫なで声プリーズ （中村）',
          '11	川の音が聞こえる （中島）',
          '12	一族 （石田）',
          '13	昔々あるところに （中島）',
          '14	捨て子選び （中島、石田）',
          '15	すあまの約束 （中島）',
          '16	男の仕事 （石田）',
          '17 身体の中を流れる涙 （中島）',
          '18 男の仕事 （石田）',
          '19	みのむし（鬼の捨て子） （中村）',
          '20 私と一緒に （中島）',
          '21 猫籠 （中村）',
          '22 人柱 （中島）',
          '23 人間になりたい （中村）',
          '24 問題集 （コーラス）',
          '25 身体の中を流れる涙 （中村、中島）',
          '26 どうしてそんなに愛がほしいの （中島）',
          '27 雨天順延 （中村）',
          '28	ペルシャ （中島、中村）',
          '29	袋のネズミ （コーラス）',
          '30	シャッター街 （中島、中村）',
          '31	恋なんていつでもできる （中村）',
          '32	雨天順延 （中村）',
          '33	二隻の舟 (※二雙の舟)（中島）',
          '34	水晶球 （石田）',
          '35 一族 （中島）',
          '36	呑んだくれのラヴレター （中村、宮下）',
          '37	一夜草 （宮下）',
          '38	毎時200ミリ （中村）',
          '39	いらない町 （中島）',
          '40	呑んだくれのラヴレター （中村、中島）',
          '41	猫にだけ見えるもの （中村）',
          '42	国捨て （石田、中島）',
          '43	India_Goose （石田、中島）',
          '44	私と一緒に （中村）',
          '45	India_Goose （中島、石田）',
          '46	なぜか橋の下 （中島）',
        ];
      case "y2017":
        return [
          '01	二隻の舟 (※二雙の舟)（Inst.）',
          '02	泣きたい夜に （中島、杉本）',
          '03	Maybe （中村）',
          '04	LA-LA-LA （中島）',
          '05	熱病 （中村、石田）',
          '06	最悪 （石田）',
          '07	EAST_ASIA （中島）',
          '08	船を出すのなら九月 （中村）',
          '09	南三条 （石田）',
          '10	子守歌 （Inst.）',
          '11	羊の言葉 （中村、石田）',
          '12	愛から遠く離れて （香坂、植野、中島）',
          '//01 谷地眼(詩篇) （中島）',
          '//02 傷(詩篇) （宮下）',
          '13	朱色の花を抱きしめて （中島）',
          '14	陽紡ぎ唄 （香坂、植野、杉本）',
          '15	帰れない者たちへ （石田、中島）',
          '16	フォーチュン・クッキー （中村） ',
          '17 我が祖国は風の彼方 （杉本、宮下、中村、石田、香坂、植野、中島）',
          '18 百九番目の除夜の鐘 （中島、中村）',
          '19	海に絵を描く （宮下、石田）',
          '20 彼と私と、もう１人 （中島、植野）',
          '21 ばりほれとんぜ （石田、宮下）',
          '22 １人で生まれて来たのだから （中島）',
          '23 すあまの約束 （中島、中村）',
          '24 袋のネズミ （石田、宮下、杉本）',
          '25	毎時200ミリ （中村）',
          '26	思い出させてあげる （中島）',
          '27	旅人よ我に帰れ （幸せになりなさい）（宮下、中島）',
          '28	あなたの言葉がわからない （中島、杉本）',
          'MC 慕情 （中島）',
          '29	産声 （中島）',
        ];
      case "y2019":
        return [
          '01	リトル・トーキョー （Inst.）',
          '02	渡らず鳥 （中島）',
          '03	何か話して （中島）',
          '04	リトル・トーキョー （中島）',
          '05	野ウサギのように （中島）',
          '06	大雪警報 （石田）',
          '07	BA-NA-NA （石田,植野）',
          '08	カナリア （植野,渡辺）',
          '09	いつ帰ってくるの （中島）',
          '10	思い出だけではつらすぎる （中島,渡辺）',
          '11	勝ち女 （渡辺）',
          '12	招かれざる客 （石田）',
          '13	テキーラを飲みほして （石田,植野,渡辺）',
          '14	後悔はないけれど （渡辺,石田）',
          '15	ねぇ、つらら （中島）',
          '16	LOVERS_ONLY （中島,渡辺,石田,植野）',
          '17 いつ帰ってくるの （渡辺）',
          '18 いつ帰ってくるの （渡辺）',
          '19	氷女 （中島）',
          '20 リトル・トーキョー （渡辺,香坂,中島）',
          '21 ずれてるあたしたち （中島,渡辺,香坂）',
          '22 大人たちはみんな （石田）',
          '23 捨て石 （泉谷,中島）',
          '24 紅灯の海 （宮下）',
          '25	梅が枝 （植野）',
          '26	リトル・トーキョー （渡辺,石田,中島,植野,香坂）',
          '27	月虹 （中島）',
          '28	二隻の舟 (※二雙の舟)（中島,渡辺,宮下,植野,香坂）',
          '29 放生 （中島）',
          '30 いつ帰ってくるの （中島, 宮下）',
          '31	放生 （中島）',
          '32	リトル・トーキョー （Inst.）',
        ];
      default:
        return [];
    }
  }
}
