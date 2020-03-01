Global( "wtMainPanel", nil )
Global( "wtBtn", nil )

local position = 0
function Hands( params )
	local res = {}
	local questions = questionLib.GetQuestions()
	if questions[0] then
		local question = questionLib.GetInfo( questions[0] )
		local WSname = question.clientData  
		local name = WSname[0].text
		if position == 1 then
			local friendId = social.GetFriend( name )
			if friendId then
				res["choice"] = 1
				questionLib.SendData( questions[0], res )
			else
				res["choice"] = 0
				questionLib.SendData( questions[0], res )
			end
		elseif position == 0 then
			res["choice"] = 1
			questionLib.SendData( questions[0], res )
		elseif position == 2 then
		end
	end
end

function ChangeAccept( params )
	position = position + 1
	if position == 1 then
		ChatLog('#ed890e','Режим для друзей')
	elseif position == 2 then
		ChatLog('#ed890e','Режим неактивности')
	elseif position > 2 then
		position = 0
		ChatLog('#ed890e','Режим для всех')
	end
end

function Init()
	common.RegisterEventHandler( Hands, "EVENT_QUESTION_ADDED" )
	common.RegisterReactionHandler( ChangeAccept, "execute" )

	wtMainPanel = mainForm:GetChildChecked( "MainPanel", false )
	wtBtn = wtMainPanel:GetChildChecked("Execute", false)
	DnD:Init( wtMainPanel, wtBtn, true)

end
Init()
