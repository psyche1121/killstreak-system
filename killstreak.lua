BridgeFunctionAttach('OnCheckUserKiller','TemplateScript_OnCheckUserKiller')
BridgeFunctionAttach("TemplateScript_OnUserDie")
BridgeFunctionAttach("TemplateScript_OnUserMove")

-- 连杀数据结构：记录每个玩家的连杀次数和最后一次击杀时间
local killStreaks = {}

-- 连杀时间窗口（秒），比如 30 秒内击杀才算连杀
local STREAK_TIMEOUT = 30

-- 击杀事件触发点
function TemplateScript_OnCheckUserKiller(aIndex, bIndex)
    local currentTime = os.time()

    -- 初始化杀人者数据
    if killStreaks[aIndex] == nil then
        killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
    end

    -- 判断是否在时间窗口内继续连杀
    if currentTime - killStreaks[aIndex].lastKillTime <= STREAK_TIMEOUT then
        killStreaks[aIndex].count = killStreaks[aIndex].count + 1
    else
        killStreaks[aIndex].count = 1 -- 重置连杀
    end

    -- 更新最后击杀时间
    killStreaks[aIndex].lastKillTime = currentTime

    -- 重置被杀者的连杀记录
    killStreaks[bIndex] = { count = 0, lastKillTime = 0 }

	-- 连杀提示（全服广播）
local name = GetObjectName(aIndex)
local name1 = GetObjectName(bIndex)
	if killStreaks[aIndex].count == 2 then
		NoticeGlobalSend(0, name .. "   完美击杀了-->>> " .. name1 .. " -->>>双杀！")
	elseif killStreaks[aIndex].count == 3 then
		NoticeGlobalSend(0, name .. "   完美击杀了-->>> " .. name1 .. " -->>>三杀！")
	elseif killStreaks[aIndex].count == 4 then
		NoticeGlobalSend(0, name .. "   完美击杀了-->>> " .. name1 .. " -->>>超神！牛逼")
elseif killStreaks[aIndex].count >= 5 then
    NoticeGlobalSend(0, name .. " 无人能挡！连杀 " .. killStreaks[aIndex].count .. " 人！")
end


    return 1 -- 始终标记为 PK
end

-- 死亡事件：清除连杀记录
function TemplateScript_OnUserDie(aIndex, bIndex)
    killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
end

-- 地图切换事件：清除连杀记录
function TemplateScript_OnUserMove(aIndex, MapIndex)
    killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
end
