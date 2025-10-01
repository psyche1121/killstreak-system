# ?? Killstreak System ��ɱϵͳ | Killstreak System

һ���������� Lua ��ɱͳ��ģ�飬��������Ϸ����ˡ�֧�ֻ�ɱ����ʾ��ȫ�����桢�����������ͼ�л����õȹ��ܣ������Զ���ӿ��ļ���Functions.txt �� Bridges.txt��������չ������������Чչʾ��

A lightweight Lua-based killstreak tracking system for game servers. Supports killer notifications, global announcements, death resets, and map-switch resets. Fully compatible with custom interface files (Functions.txt and Bridges.txt), and extensible with rewards and visual effects.

---

## ?? ���� Features

- ? ��ɱͳ�� Killstreak tracking
- ? ��ɱ����ʾ Killer notifications
- ? ȫ���㲥 Global announcements
- ? ������� Death reset
- ? ��ͼ�л���� Map switch reset
- ? ����չ�������ƺš���Ч Extensible rewards, titles, effects

---

## ??? ʹ�÷��� Usage

### ע���Žӵ� Register bridge functions

```lua
BridgeFunctionAttach("OnCheckUserKiller", "TemplateScript_OnCheckUserKiller")
BridgeFunctionAttach("TemplateScript_OnUserDie")
BridgeFunctionAttach("TemplateScript_OnUserMove")

�������ű� Include main script
�� killstreak.lua �������˽ű�Ŀ¼�����ڳ�ʼ��ʱ���ء�

Place killstreak.lua in your server's script directory and load it during initialization.

������� config.lua ���Զ���ʱ�䴰������ʾ�ı���

Customize streak timeout and messages in config.lua:
return {
    STREAK_TIMEOUT = 30,
    messages = {
        [2] = "˫ɱ��",
        [3] = "������ʤ��",
        [4] = "����",
        [5] = "�����ܵ���"
    }
}



killstreak-system/
������ killstreak.lua             # ���ű� Main script
������ config.lua                 # �����ļ� Config
������ README.md                  # ��Ŀ˵���ĵ� Documentation
������ LICENSE                    # ��Դ���֤ License
������ .gitignore                 # �����ļ� Git ignore rules
������ docs/                      # �ӿ��ĵ� Interfaces
������ assets/                    # ��ͼ��ͼ�� Screenshots


![��ɱ��ʾ��ͼ](assets/screenshot-killstreak.png)

����Ŀ���� MIT License��������ʹ�á��޸ġ��ַ���

This project is licensed under the MIT License. Free to use, modify, and distribute.


---

�ɳ������ǿ�����רע��ģ�黯������չ���׼��ɵ���Ϸ����˽ű�ϵͳ����ӭ����������Ľ���

Created by ChuChuBaby, focused on modular, extensible, and easy-to-integrate server scripting. Feedback and contributions welcome!
