
SWEP.PrintName 				= "#HL2_SMG1"
SWEP.Base 					= "weapon_lambda_base"

SWEP.Primary.ClipSize		= 45
SWEP.Primary.DefaultClip	= 45
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "SMG1"
SWEP.Primary.Delay 		    = 0.075 // 13.3hz
SWEP.Primary.AccuracyPenalty = 0.02

SWEP.AutoReload             = true
SWEP.ViewModel 				= "models/weapons/c_smg1.mdl"
SWEP.WorldModel 			= "models/weapons/w_smg1.mdl"
SWEP.HoldType 				= "smg"
SWEP.Weight 				= 3

SWEP.MaximumAccuracyPenaltyTime = 1.5

SWEP.NPCData =
{
	MinBurst = 2,
	MaxBurst = 5,
	FireRate = 0.075,
	MinRest = 0,
	MaxRest = 0,
}

SWEP.Sounds =
{
	["EMPTY"] = "Weapon_SMG1.Empty",
	["SINGLE"] = "Weapon_SMG1.Single",
	["SINGLE_NPC"] = "Weapon_SMG1.NPC_Single",
	["DOUBLE"] = "",
	["BURST"] = "Weapon_SMG1.Burst",
	["RELOAD"] = "Weapon_SMG1.Reload",
	["RELOAD_NPC"] = "Weapon_SMG1.NPC_Reload",
	["MELEE_MISS"] = "",
	["MELEE_HIT"] = "",
	["MELEE_HIT_WORLD"] = "",
	["SPECIAL1"] = "Weapon_SMG1.Special1",
	["SPECIAL2"] = "Weapon_SMG1.Special2",
	["SPECIAL3"] = "",
}

function SWEP:DryFire()

	self:WeaponSound("EMPTY")
	self:SetNextPrimaryFire(CurTime() + 0.3)
	self:SetNextIdleTime(CurTime() + 0.3)

end

function SWEP:AddViewKick()

	local owner = self:GetOwner()

	local ang = owner:GetViewPunchAngles()

	local x = util.SharedRandom("KickBack", -1.0, -0.3, 0)
	local y = util.SharedRandom("KickBack", -0.8, 0.8, 1)
	ang.x = x
	ang.y = y

	owner:ViewPunch(ang)

end