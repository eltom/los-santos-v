RegisterNetEvent('lsv:assetRecoveryFinished')
AddEventHandler('lsv:assetRecoveryFinished', function(vehicleHealthRatio)
	local player = source
	if not PlayerData.IsExists(player) then
		return
	end

	local cash = Settings.assetRecovery.rewards.cash.min + math.floor(vehicleHealthRatio * (Settings.assetRecovery.rewards.cash.max - Settings.assetRecovery.rewards.cash.min))
	local exp = Settings.assetRecovery.rewards.exp.min + math.floor(vehicleHealthRatio * (Settings.assetRecovery.rewards.exp.max - Settings.assetRecovery.rewards.exp.min))

	PlayerData.UpdateCash(player, cash)
	PlayerData.UpdateExperience(player, exp)

	TriggerClientEvent('lsv:assetRecoveryFinished', player, true, '')
end)
