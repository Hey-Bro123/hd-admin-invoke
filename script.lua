local cmd = ...

local replicated = game:GetService("ReplicatedStorage")

if replicated:FindFirstChild("HDAdminClient") then
	local remote = replicated.HDAdminClient.Signals.RequestCommand
	return remote:InvokeServer(cmd)

elseif replicated:FindFirstChild("HDAdminHDClient") then
	local remote = replicated.HDAdminHDClient.Signals.RequestCommandSilent
	return remote:InvokeServer(cmd)

elseif replicated:FindFirstChild("HD Admin") then
	local remote = replicated["HD Admin"].Core.MainModule.Value.Remotes.SendMessage

	return remote:InvokeServer(cmd,"ClientCommandBar")
end
