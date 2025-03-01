// 基本模板
#import "@preview/rubber-article:0.1.0": *
#show: article.with()
#import "@preview/mitex:0.2.4": * // latex 兼容包
#import "@preview/cmarker:0.1.1" //  md兼容包
#import "@preview/codly:1.0.0": * // 设置代码块
#import "@preview/note-me:0.3.0": * //提示
// #show: codly-init.with()
#import "@preview/showybox:2.0.3": showybox // 彩色盒子
#import "@preview/i-figured:0.2.4"
#show math.equation: i-figured.show-equation.with(only-labeled: true) // 只有引用的公式才会显示编号
#show figure: i-figured.show-figure // 图1.x
#import "@preview/physica:0.9.3":* // 数学公式简写
#import "@preview/lovelace:0.3.0": * // 伪代码算法
#set text(font:("Times New Roman","Source Han Serif SC"), size: 12pt) // 设置中英语文字体 小四宋体 英语新罗马 
// #import "@preview/cuti:0.2.1": show-cn-fakebold  // 中文伪粗体 像我们使用的Source Han Serif SC是粗体字体不用开启
// #show: show-cn-fakebold
#import "@preview/dashy-todo:0.0.1": todo
#import "@preview/pavemat:0.1.0":* // show matrix beautifully
#let 行间距转换(正文字体,行间距) = ((行间距)/(正文字体)-0.75)*1em
#set par(leading: 行间距转换(12,20),justify: true,first-line-indent: 2em)
#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent() // 修复第一段的问题
#show heading: it =>  {it;par()[#let level=(-0.3em,0.2em,0.2em);#for i in (1, 2, 3) {if it.level==i{v(level.at(int(i)-1))}};#text()[#h(0.0em)];#v(-1em);]} // 修复标题下首行 以及微调标题间距
#show ref: it => {
  let eq = math.equation;let el = it.element;
  if el != none and el.func() == eq {link(el.location(),"式"+numbering(el.numbering,..counter(eq).at(el.location())))} else {it}
} // 设置引用公式为式
#show figure.where(kind:image): set figure(supplement: [图]) // 设置图
#show figure.where(kind:"tablex"): set figure(supplement: [表]) // 设置表
#import "@preview/mannot:0.1.0": * // 公式突出
// #import "@preview/oasis-align:0.1.0" // 自动布局
#import "@preview/tablex:0.0.9": * // 表格
// ------------定理 证明----------------
// 默认可间断了，可调
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#let theorem = thmbox("定理", "定理", stroke: rgb("#ada693a1") + 1pt,breakable: true) //定理环境
#let example = thmbox("例", "例", stroke:(paint: blue, thickness: 0.5pt, dash: "dashed") ,breakable: true) //定理环境

#let definition = thmbox("定义", "定义", inset: (x: 0.5em, top: -0.25em,bottom:-0.25em),stroke: rgb("#ada693a1") + 0pt,breakable: false) // 定义环境
#let proof = thmproof("证", "证",breakable: true) //证明环境
// ----------------------------

== 2023 6.2
=== Passage Two
#set page(columns: 1)

#h(2em) Many oppose workplace surveillance, because of the inherent dehumanizing effect it has and the relentless pressure it brings. But it's on the rise around the world as firms look to become more efficient by squeezing more productivity from their workers. More than half of companies with over \$750m in annual revenue used “non-traditional”monitoring techniques on staff last year.
Monitoring employee performance gives firms the ability to assess how their staff are performing and interacting, which can be good for both the firm and employees themselves. A growing number of analytics companies offer this service. They gather“data exhaust”left by employees’ email and instant messaging apps,and use name badges equipped with radio-frequency identification devices and microphones. These can check how much time you spend talking, your volume and tone of voice, even if you do not dominate conversations.While this may sound intrusive, exponents argue that it can also protect employees against bullying and sexual harassment.

Some of this data analysis can produce unexpected results. For example, it was found that people who sat at 12-person lunch tables tended to interact, share ideas more and outperform those who regularly sat at four-person tables, a fact that would probably have gone undetected without such data analysis.
Over the last few years a Stockholm co-working space called Epicenter has gone much further and holds popular“chipping parties”, where people can have microchips implanted in their hands. They can use the implants to access electronically-controlled doors, or monitor how typing speed correlates with heart rate.Implanted chips may seem extreme, but it is a relatively small step from ID cards and biometrics to such devices.


As long as such schemes are voluntary, there will probably be a growing number of convenience-oriented uses so that a substantial number of workers would opt to have a chip inserted. But if implanted chips are used to reduce slack time or rest breaks, that could prove to be detrimental. And if surveillance tools take away autonomy, that's when they prove most unpopular. A lot depends on how such monitoring initiatives are communicated and this could prevent possible revolts being staged.

If bosses don't communicate effectively, employees assume the worst. But if they're open about the information they're collecting and what they're doing with it, research suggests 46% of employees are generally okay with it. Although many such monitoring schemes use anonymised data and participation is voluntary,many staffers remain sceptical and fear an erosion of their civil liberties.

So workplace surveillance could be empowering for staff and useful for companies looking to become more efficient and profitable. But implemented in the wrong way, it could also become an unpopular tool of oppression that proves counterproductive.
51. Why are many people opposed to monitoring employee performance?
A It puts workers under constant pressure.
B It is universally deemed anti-human by nature.
C It does both mental and physical harm to employees monitored.
D It enables firms to squeeze maximal productivity from employees.
52. What is the supporters’ argument for workplace surveillance?
A It enables employees to refrain from dominating conversations.
B It enhances employees’ identification with firms they work in.
C It can alert employees to intrusion into their privacy.
D It can protect employees against aggressive behavior.
53. What does the author want to show by the example of different numbers of people interacting at lunch tables?
A Data analysis is key to the successful implementation of workplace surveillance.
B Analyzing data gathered from workers can yield something unexpected.
C More workmates sitting at a lunch table tend to facilitate interaction and idea sharing.
D It is hard to decide on how many people to sit at a lunch table without data analysis.
54. What does much of the positive effect of monitoring initiatives depend on?
A How frequently employees are to be monitored.
B What specific personal information is being excluded.
C What steps are taken to minimize their detrimental impact.
D How well bosses make known their purpose of monitoring.
55. What concern do monitoring initiatives cause among many staffers?
A They may empower employers excessively.
B They may erode the workplace environment.
C They may infringe upon staffers' entitled freedom.
D They may become counterproductive in the long run.

// = 一些其他概率论知识
// #set page(columns: 1)
// #bibliography(("use.bib","mylib.bib"), title: [
// 参考文献#v(1em)
// ],style: "nature")
 