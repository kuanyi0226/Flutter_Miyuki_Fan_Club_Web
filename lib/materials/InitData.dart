import '../class/MiyukiUser.dart';

class InitData {
  static MiyukiUser miyukiUser =
      MiyukiUser(name: 'No Name', email: 'No data', vip: false);
  static String todaySong = 'No Song';

  //const
  static List<String> YAKAIS = [
    'y1989',
    'y1990',
    'y1991',
    'y1992',
    'y1993',
    'y1994',
    'y1995',
    'y1996',
    'y1997',
    'y1998',
    'y2000',
    'y2002',
    'y2004',
    'y2006',
    'y2008',
    'y2009',
    'y2011',
    'y2013',
    'y2014',
    'y2016',
    'y2017',
    'y2019',
  ];
  static List<String> allSongs = [
    '100人目の恋人',
    '20才になれば',
    '4._2._3.',
    'ALONE,_PLEASE',
    'B.G.M.',
    'BA-NA-NA',
    'C.Q.',
    'CAP(詩篇)',
    'Clavis─鍵─',
    'DIAMOND_CAGE',
    'DOORS_TO_DOORS',
    'EAST_ASIA',
    'F.O.',
    'FU-JI-TSU',
    'Good Morning,_Ms.YAMASHINA',
    'HALF',
    'I_Love_You，答えてくれ',
    'I_am',
    'I_love_him',
    'India_Goose',
    'LA-LA-LA',
    'LADY_JANE',
    'LAST_SCENE',
    'LOVERS_ONLY',
    'MEGAMI',
    'MERRY-GO-ROUND',
    'Maybe',
    'NEVER_CRY_OVER_SPILT_MILK',
    'NIGHT_WING',
    'NOW',
    'Nobody_Is_Right',
    'PAIN',
    'RAIN',
    'SE・TSU・NA・KU・TE',
    'SINGLES_BAR',
    'SMILE,_SMILE',
    'TOURIST',
    'Tell_Me,_Sister',
    'Why_&_No',
    'YOU_NEVER_NEED_ME',
    'You_don\'t_know',
    'with',
    '“のぅさんきゅう”',
    '「元気ですか」',
    'あした',
    'あしたバーボンハウスで',
    'あした天気になれ',
    'あたいの夏休み',
    'あたしのやさしい人',
    'あたし時々おもうの',
    'あどけない話',
    'あなたが海を見ているうちに',
    'あなたでなければ',
    'あなたの言葉がわからない',
    'あなた恋していないでしょ',
    'あのさよならにさよならを',
    'あのバスに',
    'あの人に似ている',
    'あの娘',
    'あばうとに行きます',
    'あばよ',
    'あぶな坂',
    'あほう鳥',
    'あり、か',
    'あわせ鏡',
    'いちど会ったらどうかしら',
    'いつか夢の中へ',
    'いつ帰ってくるの',
    'いない私(詩篇)',
    'いらない町',
    'うそつきが好きよ',
    'うらみ・ます',
    'おかえり(詩篇)',
    'おだやかな時代',
    'おとぎばなし',
    'おはよう',
    'おまえの家',
    'おもいで河',
    'お月さまほしい',
    'かなしみ笑い',
    'かもめの歌',
    'かもめはかもめ',
    'きつねの嫁入り',
    'くらやみ乙女',
    'こどもの宝',
    'この世に二人だけ',
    'この思いに偽りはなく',
    'この空を飛べたら',
    'これが僕らの道なのか',
    'こんばんわ',
    'ごまめの歯ぎしり',
    'さぐり(詩篇)',
    'ささやかな花',
    'さよなら さよなら',
    'さよならの鐘',
    'しあわせ芝居',
    'すあまの約束',
    'すずめ',
    'ずっと待ってたのに(詩篇)',
    'ずれてるあたしたち',
    'その手にのるな',
    'それは愛ではない',
    'それ以上言わないで',
    'たかが愛',
    'ただ・愛のためにだけ',
    'たとえ世界が空から落ちても',
    'ためになる恋(詩篇)',
    'た・わ・わ',
    'ちゃらちゃら',
    'つめたい別れ',
    'てんびん秤',
    'とろ',
    'どうしてそんなに愛がほしいの',
    'どこにいても',
    'なぜか橋の下',
    'なつかない猫',
    'ねぇ、つらら',
    'はじめまして',
    'ばいばいどくおぶざべい',
    'ばりほれとんぜ',
    'ひとり',
    'ひとりぽっちで踊らせて',
    'ひとりぽっちの闘い(詩篇)',
    'ひとり上手',
    'ひとり遊び',
    'ひまわり“SUNWARD”',
    'ふたつの炎',
    'ふたりは',
    'ふらふら',
    'ほうせんか',
    'ほうやれほ',
    'まつりばやし',
    'まるで高速電車のようにあたしたちは擦れ違う',
    'みにくいあひるの子',
    'みのむし（鬼の捨て子）',
    'もういちど雨が',
    'もう桟橋に灯りは点らない',
    'やさしい女',
    'やばい恋',
    'やまねこ',
    'らいしょらいしょ',
    'りばいばる',
    'わかれうた',
    'わたしの子供になりなさい',
    'アイス・フィッシュ',
    'アザミ嬢のララバイ',
    'アンテナの街',
    'エコー',
    'エレーン',
    'オリエンタル・ヴォイス',
    'カナリア',
    'カム・フラージュ',
    'カレンダー',
    'カーニヴァルだったね',
    'キツネ狩りの歌',
    'ギヴ・アンド・テイク',
    'クレンジング_クリーム',
    'グッバイガール',
    'コマーシャル',
    'サッポロSNOWY',
    'サバイバル・ロード',
    'サメの歌',
    'サヨナラを伝えて',
    'サヨナラ・コンニチハ',
    'サーチライト',
    'サーモン・ダンス',
    'シニカル・ムーン',
    'シャッター街',
    'シャングリラ',
    'シュガー',
    'ショウ・タイム',
    'シーサイド・コーポラス',
    'ジェラシー_ジェラシー',
    'ジョークにしないか',
    'スクランブル交差点の渡り方',
    'タクシー_ドライバー',
    'タグ・ボート（Tug・Boat）',
    'ダイヤル117',
    'ツンドラ・バード',
    'ティムを探して',
    'ティーンエイジャーだった頃(詩篇)',
    'テキーラを飲みほして',
    'トラックに乗せて',
    'トーキョー迷子',
    'ナイトキャップ・スペシャル',
    'ノスタルジア',
    'ハリネズミ',
    'ハリネズミだって恋をする',
    'バクです',
    'バス通り',
    'バラ色の未来',
    'パラダイス・カフェ',
    'パーティー・ライツ',
    'ピアニシモ',
    'ピエロ',
    'ファイト！',
    'フォーチュン・クッキー',
    'フロンティア',
    'ヘッドライト・テールライト',
    'ベッドルーム',
    'ペルシャ',
    'ホームにて',
    'ボギーボビーの赤いバラ',
    'ボディ・トーク',
    'ミュージシャン',
    'ミラージュ・ホテル',
    'ミルク32',
    'メビウスの帯はねじれる',
    'ヤコブの梯子(詩篇)',
    'ライカＭ４',
    'ララバイSINGER',
    'ランナーズ・ハイ',
    'リゾート・ラッシュ',
    'リトル・トーキョー',
    'リラの花咲く頃',
    'ルチル（Rutile Quartz）',
    'ルージュ',
    'ロンリー_カナリア',
    'ローリング',
    '一夜草',
    '一族',
    '一期一会',
    '一生と一日(詩篇)',
    '三日月の湖',
    '下町の上、山の手の下',
    '不良',
    '世情',
    '世迷い言',
    '乞(詩篇)',
    '乱世',
    '二隻の舟',
    '五才の頃',
    '五月の陽ざし',
    '人待ち歌',
    '人柱',
    '人生の素人',
    '人間になりたい',
    '今日以来',
    '仮面',
    '休石',
    '伝説',
    '体温',
    '何か話して',
    '何を待っているの',
    '作業灯(詩篇)',
    '信じられない頃に',
    '信じ難いもの',
    '俱に',
    '倒木の敗者復活戦',
    '傷(詩篇)',
    '傷ついた翼',
    '傾斜',
    '僕たちの将来',
    '僕は青い鳥',
    '儀式（セレモニー）',
    '兆しのシーズン',
    '公然の秘密',
    '六花',
    '冬を待つ季節',
    '凍原楼閣',
    '分水嶺',
    '勝ち女',
    '勝手にしやがれ',
    '匂いガラス〜安寿子の靴',
    '化粧',
    '北の国の習い',
    '十二天',
    '十二月',
    '十年',
    '十文字',
    '南三条',
    '友情',
    '古い帽子(詩篇)',
    '台風情報',
    '叶わぬ夢',
    '君の昔を',
    '吹雪',
    '呑んだくれのラヴレター',
    '命のリレー',
    '命の別名',
    '問題集',
    '噂',
    '噤',
    '囁く雨',
    '国捨て',
    '土用波',
    '地上の星',
    '地下から陽時計を見上げれば(詩篇)',
    '地吹雪を御存知ない(詩篇)',
    '夏土産',
    '夜いらんかいね',
    '夜の色',
    '夜をくだされ',
    '夜を往け',
    '夜曲',
    '夜行',
    '夜風の中から',
    '夢だったんだね',
    '夢だもの',
    '夢の京',
    '夢の代わりに',
    '夢の通り道を僕は歩いている',
    '夢みる勇気',
    '夢を叶えて',
    '夢中遊行',
    '大きな忘れ物',
    '大人たちはみんな',
    '大雪警報',
    '天使の階段',
    '天女の話',
    '天鏡',
    '失せ物探し',
    '奇妙な音楽',
    '女という商売',
    '女なんてものに',
    '妬いてる訳じゃないけれど',
    '妹じゃあるまいし',
    '姉妹になるがいい',
    '子守歌',
    '孤独の肖像',
    '孤独の肖像1st.',
    '安らけき寿を捨て',
    '宙船',
    '家出',
    '寄り添う風',
    '小さき負傷者たちの為に',
    '小石のように',
    '少年たちのように',
    '島より',
    '川の音が聞こえる',
    '川風',
    '市場は眠らない',
    '帰れない者たちへ',
    '帰省',
    '帰郷群',
    '帳簿(詩篇)',
    '常夜灯',
    '幸せ',
    '幸せになりなさい',
    '幸福論',
    '幽霊交差点',
    '店の名はライフ',
    '廃線のお知らせ',
    '強がりはよせヨ',
    '彼と私と、もう１人',
    '彼女によろしく',
    '彼女の生き方',
    '後悔',
    '後悔はないけれど',
    '御機嫌如何',
    '心守歌',
    '心月',
    '忘れてはいけない',
    '忘れな草をもう一度',
    '忘れられるものならば',
    '怜子',
    '思い出させてあげる',
    '思い出だけではつらすぎる',
    '恋とはかぎらない',
    '恋なんていつでもできる',
    '恋文',
    '恩知らず',
    '悪女',
    '悲しいことはいつもある',
    '悲しみに',
    '情婦の証言',
    '惜しみなく愛の言葉を',
    '愚かな禿',
    '愛から遠く離れて',
    '愛が私に命ずること',
    '愛される花_愛されぬ花',
    '愛だけを残せ',
    '愛と云わないラヴレター',
    '愛よりも',
    '愛情物語',
    '愛詞（あいことば）',
    '慕情',
    '慟哭',
    '憂き世ばなれ',
    '成人世代',
    '成就(詩篇)',
    '我が祖国は風の彼方',
    '手を出すな(詩篇)',
    '招かれざる客',
    '拾われた猫のように',
    '捨てるほどの愛でいいから',
    '捨て子選び',
    '捨て石',
    '掌',
    '放生',
    '故国',
    '敵(詩篇)',
    '断崖─親愛なる者へ─',
    '新しい風',
    '新品のスーツを着た男(詩篇)',
    '新品の眺め(詩篇)',
    '新曾根崎心中',
    '旅は始まる',
    '旅人のうた',
    '旅人よ我に帰れ',
    '旅支度なされませ',
    '明日なき我等',
    '昔々あるところに',
    '昔から雨が降ってくる',
    '春なのに',
    '春までなんぼ',
    '時は流れて',
    '時代',
    '時刻表',
    '時効',
    '暗闇のジャスミン',
    '暦売りの歌',
    '最後の女神',
    '最悪',
    '最愛',
    '月の赤ん坊',
    '月はそこにいる',
    '月夜同舟',
    '月虹',
    '月迎え',
    '有機体は過去を喰らふ',
    '朝焼け',
    '木曜の夜',
    '未完成',
    '未明に',
    '本日、未熟者',
    '朱を奪う紫',
    '朱色の花を抱きしめて',
    '朱色の花を抱きしめて(詩篇)',
    '杏村から',
    '来ませ救い主',
    '根雪（ねゆき）',
    '桜らららら',
    '梅が枝',
    '極楽通りへいらっしゃい',
    '横恋慕',
    '樹高千丈_落葉帰根',
    '歌うことが許されなければ',
    '歌をあなたに',
    '歌姫',
    '此処じゃない何処かへ',
    '毎時200ミリ',
    '毒をんな',
    '気にしないで',
    '水',
    '水の線路',
    '水を点して火を汲んで',
    '水晶球',
    '水琴窟',
    '氷の花',
    '氷を踏んで',
    '氷中花',
    '氷女',
    '氷室守(詩篇)',
    '氷河零時(詩篇)',
    '氷脈',
    '永久欠番',
    '永遠の嘘をついてくれ',
    '波の上',
    '泣いてもいいんだよ',
    '泣かないでアマテラス',
    '泣きたい夜に',
    '泥は降りしきる',
    '泥海の中から',
    '流星',
    '流浪の詩',
    '浅い眠り',
    '海と宝石',
    '海に絵を描く',
    '海のカルテ',
    '海よ',
    '海鳴り',
    '涙─Made_in_tears─',
    '清流',
    '渚へ',
    '渚便り',
    '渡らず鳥',
    '湾岸24時',
    '湿原であります(詩篇)',
    '激情',
    '火をかざせ(詩篇)',
    '炎と水',
    '無限軌道',
    '煙草',
    '熱病',
    '熱病（NewVersion）',
    '爪(詩篇)',
    '片想',
    '片袖のない着物(詩篇)',
    '狂言日誌(詩篇)',
    '狼になりたい',
    '猫なで声プリーズ',
    '猫にだけ見えるもの',
    '猫籠',
    '献灯',
    '獲物とった(詩篇)',
    '生きてゆくおまえ',
    '生まれた時から',
    '産声',
    '田舎のネズミ(詩篇)',
    '男の仕事',
    '異国',
    '異国の女',
    '疑えばきりがない',
    '病院童',
    '白菊',
    '白都より(詩篇)',
    '白銀霜髪(詩篇)',
    '白闇(詩篇)',
    '白鳥の歌が聴こえる',
    '百九番目の除夜の鐘',
    '目を開けて最初に君を見たい',
    '目撃者の証言',
    '相席',
    '真夜中の動物園',
    '真直な線',
    '眠らないで',
    '瞬きもせず',
    '知人・友人・愛人・家人',
    '砂の船',
    '祝福(詩篇)',
    '私たちは春の中で',
    '私と一緒に',
    '私の罪は水の底',
    '空からアスピリン(詩篇)',
    '空がある限り',
    '空しき人へ',
    '空と君のあいだに',
    '空港日誌',
    '童話',
    '竹の歌',
    '竹を渡る風の中で',
    '笑ってよエンジェル',
    '笑わせるじゃないか',
    '笹舟',
    '粉雪は忘れ薬',
    '糸',
    '紅い河',
    '紅灯の海',
    '紅蓮は目を醒ます',
    '紫の桜',
    '終り初物',
    '結婚',
    '緘口令',
    '線路の外の風景',
    '縁',
    '羊の言葉',
    '美貌の都',
    '群衆',
    '翼をあげて',
    '肩に降る雨',
    '肩幅の未来',
    '背広の下のロックンロール',
    '能書き(詩篇)',
    '自画像',
    '自白',
    '船を出すのなら九月',
    '花暖房(詩篇)',
    '花束を私のために',
    '茉莉花',
    '荒野より',
    '萩野原',
    '蒼い時代',
    '蕎麦屋',
    '虫(詩篇)',
    '血の音が聞こえる',
    '街路樹',
    '袋のネズミ',
    '裸爪のライオン',
    '裸足で走れ',
    '見返り美人',
    '見返り美人（NEW_VERSION）',
    '親愛なる者へ',
    '観音橋',
    '計画(詩篇)',
    '記憶',
    '誕生',
    '誘惑',
    '誰かが私を憎んでいる',
    '誰だってナイフになれる',
    '誰のせいでもない雨が',
    '謎な女',
    '谷地眼(詩篇)',
    '負けんもんね',
    '質問［1977］（朗読）',
    '赦され河、渡れ',
    '走（そう）',
    '越境者(詩篇)',
    '足の下に何かがあるので(詩篇)',
    '踊り明かそう',
    '身体の中を流れる涙',
    '轍(詩篇)',
    '追いかけてヨコハマ',
    '逃げよ、少年',
    '途方に暮れて',
    '進化樹',
    '遍路',
    '過ぎゆく夏',
    '遠近法',
    '遠近法(詩篇)',
    '遠雷',
    '遺失物預り所',
    '都の灯り',
    '重き荷を負いて',
    '野ウサギのように',
    '野守草(詩篇)',
    '金魚',
    '銀の龍の背に乗って',
    '鏡の中の他人',
    '闇夜のテーブル',
    '闘りゃんせ',
    '阿檀の木の下で',
    '陽時計・月時計(詩篇)',
    '陽紡ぎ唄',
    '離郷の歌',
    '難破船',
    '雨…',
    '雨が空を捨てる日は',
    '雨のテーマ',
    '雨天順延',
    '雨月の使者',
    '雪',
    '雪の粒はいくつ(詩篇)',
    '雪・月・花',
    '雪傘',
    '霙の音',
    '霧に走る',
    '顔のない街の中で',
    '風にならないか',
    '風の姿',
    '風の笛',
    '騙りの庭',
    '髪',
    '髪を洗う女',
    '鳥になって',
    '鶺鴒（セキレイ）',
    '鷹の歌',
    '麦の唄',
    '黄砂に吹かれて',
    '黄色い犬',
    '齢寿天任せ',
    '０３時',
    '１人で生まれて来たのだから',
    '１人旅のススメ',
    '３分後に捨ててもいい',
    '３６時間',
    '７月のジャスミン',
    'ＪＢＣのテーマ',
  ];
}