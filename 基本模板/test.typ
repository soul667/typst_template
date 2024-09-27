#let data=yaml("./data.yml")
#import "template.typ": *

#show: doc => conf(

  linespacing: 1em,
  outlinedepth: 3,
  blind: false,
  listofimage: true,

  listoftable: true,

  listofcode: true,

  alwaysstartodd: true,

  doc

)
#let setting=data.模板设置;
// // 首先是论文标题
#if(setting.模板选择=="论文"){
align(center,[
  // #v(24pt)
  #text([#data.文章信息.标题], size:字号.三号,weight: "bold",font:字体.黑体)
  #if data.文章信息.副标题!="#data.文章信息.标题"{
    v(-0.2em)
    let len_=data.文章信息.副标题.len();
    if len_!=0 {
      for j in data.文章信息.副标题{
text([#j], size:字号.小四) 
h(1em)
      }
    } 
  }
])
[
#v(1em)
#h(-2em) *摘要* 吱吱吱吱
#v(0em)
#h(-2em) *关键词 * 吱吱吱吱
#v(1em)

]

}

// 以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文以下是正文
// 对于论文模式要做修改
= 11111111
== 一1111111111就
这是 基本模板的测试，您看，基本模板没有问题吧。
== 111111111111111111111
=== 111111111111
1111111111111111111111111111111