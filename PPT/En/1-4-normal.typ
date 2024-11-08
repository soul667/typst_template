#import "@preview/rubber-article:0.1.0": *
#import "@preview/mitex:0.2.4": *
#import "@preview/cmarker:0.1.1"
// #import "@preview/quick-maths:0.1.0": shorthands

// 设置公式标号 
#import "@preview/i-figured:0.2.4"
#show math.equation: i-figured.show-equation.with(only-labeled: true)
// 设置代码块
#import "@preview/codly:1.0.0": *
#codly(
   languages: (
   python: (
    name: "Python",
    // icon: [#tabler-icon("brand-github-filled")]
   )
   )
)
#import "@preview/showybox:2.0.3": showybox

#show: codly-init.with()

#show: article.with()
#import "@preview/physica:0.9.3":*

#set text(font:("Times New Roman","Source Han Serif SC"), size: 12pt) 
// #import "@preview/cuti:0.2.1": show-cn-fakebold
// #show: show-cn-fakebold
#let 行间距转换(正文字体,行间距) = ((行间距)/(正文字体)-0.75)*1em
// // #show par: set block(spacing: 行间距转换(12,20))
#set par(leading: 行间距转换(12,20),justify: true,first-line-indent: 2em)
#show heading: it =>  {
    // set text(font: ("Times New Roman","Source Han Serif SC"), size: 12pt)
    it
    par()[
      #if it.level==1{
        v(-0.3em)
      }
      #if it.level==2{
        v(0.2em)
      }
      #if it.level==3{
        v(0.2em)
      }
      #text()[#h(0.0em)]
      #v(-1em)
      ]
      }
       

// #set page(columns: 2)

#set page(columns: 2)

1. 任何人 #underline("     ")
2. 某人 #underline("     ")
3. 在任何地方 #underline("     ")
4. 在某处 #underline("     ")
5. 某物 #underline("     ")
6. 没有什么 #underline("     ")
7. 每个人 #underline("     ")
8. 精彩的 #underline("     ")
9. 有趣的 #underline("     ")
10. 活动 #underline("     ")
11. 滑翔伞运动 #underline("     ")
12. 不多；很少 #underline("     ")
13. 相当多；不少 #underline("     ")
14. 最多 #underline("     ")
15. 当然；自然 #underline("     ")
16. 我自己 #underline("     ")
17. 你自己 #underline("     ")
18. 你们自己 #underline("     ")
19. 我们自己 #underline("     ")
20. 他们自己 #underline("     ")
21. 母鸡 #underline("     ")
22. 猪 #underline("     ")
23. 鸭子 #underline("     ")
24. 似乎；好像 #underline("     ")
25. 决定 #underline("     ")
26. 试图；设法 #underline("     ")
27. 想要；愿意 #underline("     ")
28. 日记 #underline("     ")
29. 鸟 #underline("     ")
30. 自行车 #underline("     ")
31. 建筑物 #underline("     ")
32. 商人\交易者 #underline("     ")
33. 差别 #underline("     ")
34. 不同的 #underline("     ")
35. 伞 #underline("     ")
36. 等待 #underline("     ")
37. 由于；因为 #underline("     ")
38. 在……下面 #underline("     ")
39. 足够的 #underline("     ")
40. 抓住 #underline("     ")
41. 饥饿的 #underline("     ")
42. 小山 #underline("     ")
43. 中央公园 #underline("     ")
44. 黄果树瀑布 #underline("     ")
45. 香港 #underline("     ")
46. 马来西亚 #underline("     ")
47. 马来西亚的；马来西亚人 #underline("     ")
52. 山丘 #underline("     ")
53. 天安门广场 #underline("     ")
54. 故宫博物院 #underline("     ")
#set page(columns: 2)
1. 任何人 #underline("Anyone")
2. 某人 #underline("Someone")
3. 在任何地方 #underline("Anywhere")
4. 在某处 #underline("Somewhere")
5. 某物 #underline("Something")
6. 没有什么 #underline("Nothing")
7. 每个人 #underline("Everyone")
8. 精彩的 #underline("Wonderful")
9. 有趣的 #underline("Enjoyable")
10. 活动 #underline("Activity")
11. 滑翔伞运动 #underline("Paragliding")
12. 不多；很少 #underline("Few")
13. 相当多；不少 #underline("Quite a few")
14. 最多 #underline("Most")
15. 当然；自然 #underline("Of course")
16. 我自己 #underline("Myself")
17. 你自己 #underline("Yourself")
18. 你们自己 #underline("Yourselves")
19. 我们自己 #underline("Ourselves")
20. 他们自己 #underline("Themselves")
21. 母鸡 #underline("Hen")
22. 猪 #underline("Pig")
23. 鸭子 #underline("Duck")
24. 似乎；好像 #underline("Seem")
25. 决定 #underline("Decide")
26. 试图；设法 #underline("Try")
27. 想要；愿意 #underline("Feel like")
28. 日记 #underline("Diary")
29. 鸟 #underline("Bird")
30. 自行车 #underline("Bicycle")
31. 建筑物 #underline("Building")
32. 商人\交易者 #underline("Trader")
33. 差别 #underline("Difference")
34. 不同的 #underline("Different")
35. 伞 #underline("Umbrella")
36. 等待 #underline("Wait")
37. 由于；因为 #underline("Because of")
38. 在……下面 #underline("Below")
39. 足够的 #underline("Enough")
40. 抓住 #underline("Catch")
41. 饥饿的 #underline("Hungry")
42. 小山 #underline("Hill")
43. 中央公园 #underline("Central Park")
44. 黄果树瀑布 #underline("Huangguoshu Waterfall")
45. 香港 #underline("Hong Kong")
46. 马来西亚 #underline("Malaysia")
47. 马来西亚的；马来西亚人 #underline("Malaysian")
48. 乔治市 #underline("Georgetown")
49. 海墘街 #underline("Weld")
50. 码头 #underline("Quay")
51. 槟城 #underline("Penang")
52. 山丘 #underline("Hill")
53. 天安门广场 #underline("Tian'anmen Square")
54. 故宫博物院 #underline("The Palace Museum")

#set page(columns: 2)
= 1

== Vocabulary
1. *anyone* /ˈeniwʌn/ - pron. 任何人 (p.2)
  - *any one* Is any one of us ...  
  - anyone important / anything useful / anyone else interested
  - Is there anyone here who could be the team leader?
17. *someone* /ˈsʌmwʌn/ - pron. 某人 (p.3)
  - someone=somebody /ˈsʌmwʌn/ - pron.
2. *anywhere* /ˈeniweə(r)/ - adv. 在任何地方 (p.2)
 - I can't find my keys anywhere.(我找不到我的钥匙了。)
 - Is there anywhere you want to go?"（有你想去的地方吗？）
 - You can sit anywhere you like." / go anywhere you like.
6. *somewhere* /ˈsʌmweə(r)/ - adv. 在某处 (p.2)
  - somewhere=someplace /ˈsʌmweə(r)/ - adv.
  - I left my keys somewhere in the house.
  - I want to go somewhere warm for my vacation
7. *something* /ˈsʌmθɪŋ/ - pron. 某物 (p.2)
8. *nothing* /ˈnʌθɪŋ/ - pron. 没有什么 (p.2)
9. *everyone* /ˈevriwʌn/ - pron. 每个人 (p.2)
3. *wonderful* /ˈwʌndəfl/ - adj. 精彩的 (p.2)
19. *enjoyable* /ɪnˈdʒɔɪəbl/ - adj. 有趣的 (p.4)
20. *activity* /ækˈtɪvəti/ - n. 活动 (p.5)
  - outdoor activities / physical activities
  - enjoyable activities / wonderful activities
23. *paragliding* /ˈpærəɡlaɪdɪŋ/ - n. 滑翔伞运动 (p.5)
4. *few* /fjuː/ - adj. & pron. 不多；很少 (p.2)
5. *quite a few* - 相当多；不少 (p.2)
  - My friend has few close friends, but she has a few good friends she can rely on. She has little free time, but she tries to take a little time for herself each day.
6. *most* - adj., adv. & pron. 最多 (p.2)
  - Most students in the class passed the exam.
  - This is the most expensive restaurant in the city.
  - I most definitely agree with you.
  - The train will most likely be delayed due to the weather.
10. *of course* /əv ˈkɔːs/ - 当然；自然 (p.3)
  - of course not / of course I will,no problem at all.
11. *myself* /maɪˈself/ - pron. 我自己 (p.3)
12. *yourself* /jɔːˈself/ - pron. 你自己 (p.3)
13. *yourselves* /jɔːˈselvz/ - pron. 你们自己 (p.3)
 - ourselves /ɑːrˈselvz/ - pron. 我们自己
 - themselves /ðəmˈselvz/ - pron. 他们自己
14. *hen* /hen/ - n.  母鸡
  - Chicken 🐔
  - Chick 🐥
  - Rooster 🐓
15. *pig* /pɪɡ/ - n. 猪 (p.3)
  - When pigs fly. /ˈflaɪ/ - 永远不可能发生的事情
  - Make a pig of oneself. - 吃得很多
39. *duck* /dʌk/ - n. 鸭子 (p.7)
16. *seem* /siːm/ - vi. 似乎；好像 (p.3)
    - They seem to enjoy the wonderful concert
    - She seems happy today
21. *decide* /dɪˈsaɪd/ - v. 决定 (p.5)
  - 常与动词不定式（to do）、从句（that）、介词短语等连用。
  - decide to do sth. / decide (that) ... / ~ what where which
  - He decided to study abroad next year.（他决定明年出国留学。）
  - I can’t decide what to eat for dinner.（我决定不下来晚餐吃什么。）
22. *try* /traɪ/ - v. 试图；设法 (p.5)
  - 后面可以接动词不定式（to do），表示试图做某事；也可以接动词-ing形式，表示尝试某种体验
  - I’ll try to finish the project by tomorrow.（我会努力明天完成项目。）
  - She tried calling him, but he didn’t answer.（她试着给他打电话，但他没有接。）
24. *feel like* - 想要；愿意 (p.5)
  - I feel like going for a walk.
  - I feel like a cup of coffee.
18. *diary* /ˈdaɪəri/ - n. 日记 (p.4)
25. *bird* /bɜːd/ - n. 鸟 (p.5)
26. *bicycle* /ˈbaɪsɪkl/ - n. 自行车 (p.5)
  - bike /baɪk/ - n. 自行车
27. *building* /ˈbɪldɪŋ/ - n. 建筑物 (p.5)
  - The building is over 100 years old.
  - The company is building a new factory to expand its production.
28. *trader* /ˈtreɪdə(r)/ - n. 商人\交易者 (p.5)
  - trader
    - China has a large volume of international trade
    - to trade or exchange goods
29. *difference* /ˈdɪfrəns/ - n. 差别 (p.5)
    - Make a difference 有所影响，带来不同。
    - Tell the difference：分辨差异
30. *different* /ˈdɪfrənt/ - adj. 不同的 (p.5)
31. *umbrella* /ʌmˈbrelə/ - n. 伞 (p.5)
    - I put up my umbrella. 我撑起了伞。
32. *wait* /weɪt/ - v. 等待 (p.5)
33. *because of* - 由于；因为 (p.6)
  - because of the rain / because of the traffic  #box[短语]
  - because of this / that / someone / something
34. *below* /bɪˈləʊ/ - prep. & adv. 在……下面 (p.6)
35. *enough* /ɪˈnʌf/ - adj., adv. & n. 足够的 (p.6)
36. *catch* /kætʃ/ - v. 抓住 (p.6)
37. *hungry* /ˈhʌŋɡri/ - adj. 饥饿的 (p.6)
38. *hill* /hɪl/ - n. 小山 (p.6)
40. *dislike* /dɪsˈlaɪk/ - v. 不喜欢 (p.7)
41. *Central Park*（中央公园）  
42. *Huangguoshu Waterfall*（黄果树瀑布）  
43. *Hong Kong*（香港）  
44. *Malaysia*（马来西亚）  
45. *Malaysian*（马来西亚的；马来西亚人）  
46. *Georgetown*（乔治市）  
47. *Weld*（海墘街）  
48. *Quay*（码头）  
49. *Penang*（槟城）  
50. *Hill*（山丘）  
51. *Tian'anmen Square*（天安门广场）  
52. *the Palace Museum*（故宫博物院）