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
// 首先是论文标题
#align(center,[
  红外液晶前沿综述
])