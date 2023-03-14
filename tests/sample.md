---
title: Markdown demo for kroki4tcl
author: Detlef Groth
date: 2023-05-14
---

Below follows a short Kroki graphics:

```{.kroki label="dotsample" dia="dot"}
digraph g {
   H -> W;
   H[label="Hello",style=filled,fillcolor=salmon];
   W[label="World!",style=filled,fillcolor=skyblue];
}
```
 
Now an other example where we use PlantUml code:

```{.kroki label="pumlcode" dia="puml"}
class A { }
class B { }
A --> B
```
