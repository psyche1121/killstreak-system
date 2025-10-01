BridgeFunctionAttach('OnCheckUserKiller','TemplateScript_OnCheckUserKiller')
BridgeFunctionAttach("TemplateScript_OnUserDie")
BridgeFunctionAttach("TemplateScript_OnUserMove")

-- ��ɱ���ݽṹ����¼ÿ����ҵ���ɱ���������һ�λ�ɱʱ��
local killStreaks = {}

-- ��ɱʱ�䴰�ڣ��룩������ 30 ���ڻ�ɱ������ɱ
local STREAK_TIMEOUT = 30

-- ��ɱ�¼�������
function TemplateScript_OnCheckUserKiller(aIndex, bIndex)
    local currentTime = os.time()

    -- ��ʼ��ɱ��������
    if killStreaks[aIndex] == nil then
        killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
    end

    -- �ж��Ƿ���ʱ�䴰���ڼ�����ɱ
    if currentTime - killStreaks[aIndex].lastKillTime <= STREAK_TIMEOUT then
        killStreaks[aIndex].count = killStreaks[aIndex].count + 1
    else
        killStreaks[aIndex].count = 1 -- ������ɱ
    end

    -- ��������ɱʱ��
    killStreaks[aIndex].lastKillTime = currentTime

    -- ���ñ�ɱ�ߵ���ɱ��¼
    killStreaks[bIndex] = { count = 0, lastKillTime = 0 }

	-- ��ɱ��ʾ��ȫ���㲥��
local name = GetObjectName(aIndex)
local name1 = GetObjectName(bIndex)
	if killStreaks[aIndex].count == 2 then
		NoticeGlobalSend(0, name .. "   ������ɱ��-->>> " .. name1 .. " -->>>˫ɱ��")
	elseif killStreaks[aIndex].count == 3 then
		NoticeGlobalSend(0, name .. "   ������ɱ��-->>> " .. name1 .. " -->>>��ɱ��")
	elseif killStreaks[aIndex].count == 4 then
		NoticeGlobalSend(0, name .. "   ������ɱ��-->>> " .. name1 .. " -->>>����ţ��")
elseif killStreaks[aIndex].count >= 5 then
    NoticeGlobalSend(0, name .. " �����ܵ�����ɱ " .. killStreaks[aIndex].count .. " �ˣ�")
end


    return 1 -- ʼ�ձ��Ϊ PK
end

-- �����¼��������ɱ��¼
function TemplateScript_OnUserDie(aIndex, bIndex)
    killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
end

-- ��ͼ�л��¼��������ɱ��¼
function TemplateScript_OnUserMove(aIndex, MapIndex)
    killStreaks[aIndex] = { count = 0, lastKillTime = 0 }
end
