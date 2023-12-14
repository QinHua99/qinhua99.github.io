+++
title = 'Hello_Blog'
date = 2023-12-14T17:11:24+08:00
draft = true
+++
summary : "立于好于"
# 你好！
> "IMC(Inter-Module Communication)是Neptus系统中模块之间通信的一种协议或机制。"
- IMC是一种轻量级的，消息封装式的通信协议。
- IMC定义了一系列的消息类型(Message)，每个消息都包含消息头和消息体。消息头包含源、目标、时间戳等元信息，消息体为实际的数据。
- 通过IMC，可以实现相互模块之间的收发。
< !---more --->
- IMC支持点对点通信和发布-订阅两种模式。
- IMC基于UDP通信，提供了比较高效和实时的消息传递。
- Neptus系统中的控制器、控制面板、计划执行器等模块都通过IMC进行交互。新模块可以通过实现IMC来加入系统。
- IMC为Neptus系统提供了一个可扩展和灵活的内部通信机制,大大减少了模块间的耦合,也方便新增模块。
```SQL
  <!-- neptus地址 -->
  <arg name="neptus_addr" default="172.22.179.105"/>
  <!-- ros端地址 -->
  <arg name="bridge_addr" default="172.22.49.214"/>
  <arg name="bridge_port" default="6002"/>
```