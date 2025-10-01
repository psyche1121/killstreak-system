![Lua](https://img.shields.io/badge/language-Lua-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Version](https://img.shields.io/badge/version-v1.0.0-orange.svg)
![Status](https://img.shields.io/badge/status-stable-brightgreen.svg)

# ?? Killstreak System 连杀系统 | Killstreak System

一个轻量级的 Lua 连杀统计模块，适用于游戏服务端。支持击杀者提示、全服公告、死亡清除、地图切换重置等功能，兼容自定义接口文件（Functions.txt 与 Bridges.txt），可扩展奖励机制与特效展示。

A lightweight Lua-based killstreak tracking system for game servers. Supports killer notifications, global announcements, death resets, and map-switch resets. Fully compatible with custom interface files (Functions.txt and Bridges.txt), and extensible with rewards and visual effects.

---

## ?? 功能 Features

- ? 连杀统计 Killstreak tracking
- ? 击杀者提示 Killer notifications
- ? 全服广播 Global announcements
- ? 死亡清除 Death reset
- ? 地图切换清除 Map switch reset
- ? 可扩展奖励、称号、特效 Extensible rewards, titles, effects

---

## ??? 使用方法 Usage

### 注册桥接点 Register bridge functions

```lua
BridgeFunctionAttach("OnCheckUserKiller", "TemplateScript_OnCheckUserKiller")
BridgeFunctionAttach("TemplateScript_OnUserDie")
BridgeFunctionAttach("TemplateScript_OnUserMove")

引入主脚本 Include main script
将 killstreak.lua 放入服务端脚本目录，并在初始化时加载。

Place killstreak.lua in your server's script directory and load it during initialization.

你可以在 config.lua 中自定义时间窗口与提示文本：

Customize streak timeout and messages in config.lua:
return {
    STREAK_TIMEOUT = 30,
    messages = {
        [2] = "双杀！",
        [3] = "三连决胜！",
        [4] = "超神！",
        [5] = "无人能挡！"
    }
}



killstreak-system/
├── killstreak.lua             # 主脚本 Main script
├── config.lua                 # 配置文件 Config
├── README.md                  # 项目说明文档 Documentation
├── LICENSE                    # 开源许可证 License
├── .gitignore                 # 忽略文件 Git ignore rules
├── docs/                      # 接口文档 Interfaces
└── assets/                    # 截图或图标 Screenshots


![连杀提示截图](assets/screenshot-killstreak.png)

本项目采用 MIT License，可自由使用、修改、分发。

This project is licensed under the MIT License. Free to use, modify, and distribute.


---

由楚楚北鼻开发，专注于模块化、可扩展、易集成的游戏服务端脚本系统。欢迎反馈建议与改进！

Created by ChuChuBaby, focused on modular, extensible, and easy-to-integrate server scripting. Feedback and contributions welcome!
