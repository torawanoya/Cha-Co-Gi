Player=game:GetService("Players").LocalPlayer
Character=Player.Character
PlayerGui=Player.PlayerGui
Backpack=Player.Backpack
Torso=Character.Torso
Head=Character.Head
Humanoid=Character.Humanoid
m=Instance.new('Model',Character)
LeftArm=Character["Left Arm"]
LeftLeg=Character["Left Leg"]
RightArm=Character["Right Arm"]
RightLeg=Character["Right Leg"]
LS=Torso["Left Shoulder"]
LH=Torso["Left Hip"]
RS=Torso["Right Shoulder"]
RH=Torso["Right Hip"]
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false
attackdebounce = false
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=1
pathtrans=.7
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
player=nil
cloak=false
lightcolor='Bright blue'

local Color1=Torso.BrickColor

local fengui=it("GuiMain")
fengui.Parent=Player.PlayerGui
fengui.Name="WeaponGUI"
local fenframe=it("Frame")
fenframe.Parent=fengui
fenframe.BackgroundColor3=Color3.new(255,255,255)
fenframe.BackgroundTransparency=1
fenframe.BorderColor3=Color3.new(17,17,17)
fenframe.Size=UDim2.new(0.0500000007, 0, 0.100000001, 0)
fenframe.Position=UDim2.new(0.4,0,0.1,0)
local fenbarmana1=it("TextLabel")
fenbarmana1.Parent=fenframe
fenbarmana1.Text=" "
fenbarmana1.BackgroundTransparency=0
fenbarmana1.BackgroundColor3=Color3.new(0,0,0)
fenbarmana1.SizeConstraint="RelativeXY"
fenbarmana1.TextXAlignment="Center"
fenbarmana1.TextYAlignment="Center"
fenbarmana1.Position=UDim2.new(0,0,0,0)
fenbarmana1.Size=UDim2.new(4,0,0.2,0)
local fenbarmana2=it("TextLabel")
fenbarmana2.Parent=fenframe
fenbarmana2.Text=" "
fenbarmana2.BackgroundTransparency=0
fenbarmana2.BackgroundColor3=Torso.Color
fenbarmana2.SizeConstraint="RelativeXY"
fenbarmana2.TextXAlignment="Center"
fenbarmana2.TextYAlignment="Center"
fenbarmana2.Position=UDim2.new(0,0,0,0)
fenbarmana2.Size=UDim2.new(4*mana/100,0,0.2,0)
local fenbarmana3=it("TextLabel")
fenbarmana3.Parent=fenframe
fenbarmana3.Text=" "
fenbarmana3.BackgroundTransparency=0
fenbarmana3.BackgroundColor3=Color3.new(Col1,Col2,Col3)
fenbarmana3.SizeConstraint="RelativeXY"
fenbarmana3.TextXAlignment="Center"
fenbarmana3.TextYAlignment="Center"
fenbarmana3.Position=UDim2.new(0,0,0,0)
fenbarmana3.Size=UDim2.new(0,0,0.2,0)
local fenbarmana4=it("TextLabel")
fenbarmana4.Parent=fenframe
fenbarmana4.Text="Energy("..mana..")"
fenbarmana4.BackgroundTransparency=1
fenbarmana4.BackgroundColor3=Color3.new(0,0,0)
fenbarmana4.SizeConstraint="RelativeXY"
fenbarmana4.TextXAlignment="Center"
fenbarmana4.TextYAlignment="Center"
fenbarmana4.Position=UDim2.new(0,0,-0.3,0)
fenbarmana4.Size=UDim2.new(4,0,0.2,0)
fenbarmana4.FontSize="Size9"
fenbarmana4.TextStrokeTransparency=0
fenbarmana4.TextColor=BrickColor.new("White")

mouse=Player:GetMouse()

RSH, LSH=nil, nil

RW, LW=Instance.new("Weld"), Instance.new("Weld")
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
TorsoColor=Torso.BrickColor
player=Player
ch=Character
RSH=ch.Torso["Right Shoulder"]
LSH=ch.Torso["Left Shoulder"]

RSH.Parent=nil
LSH.Parent=nil

RW.Name="Right Shoulder"
RW.Part0=ch.Torso
RW.C0=cf(1.5, 0.5, 0)
RW.C1=cf(0, 0.5, 0)
RW.Part1=ch["Right Arm"]
RW.Parent=ch.Torso

LW.Name="Left Shoulder"
LW.Part0=ch.Torso
LW.C0=cf(-1.5, 0.5, 0)
LW.C1=cf(0, 0.5, 0)
LW.Part1=ch["Left Arm"]
LW.Parent=ch.Torso

local Color1=Torso.BrickColor

local bodvel=Instance.new("BodyVelocity")
local bg=Instance.new("BodyGyro")

function swait(num)
	if num==0 or num==nil then
		game:service'RunService'.Stepped:wait(0)
	else
		for i=0,num do
			game:service'RunService'.Stepped:wait(0)
		end
	end
end

so = function(id,par,vol,pit)
	coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound",par or workspace)
		sou.Volume=vol
		sou.Pitch=pit or 1
		sou.SoundId=id
		swait()
		sou:play()
		game:GetService("Debris"):AddItem(sou,6)
	end))
end

function clerp(a,b,t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t))
end

function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then
		local s = math.sqrt(1 + trace)
		local recip = 0.5/s
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00-m11-m22+1)
			local recip = 0.5/s
			return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip
		elseif i == 1 then
			local s = math.sqrt(m11-m22-m00+1)
			local recip = 0.5/s
			return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip
		elseif i == 2 then
			local s = math.sqrt(m22-m00-m11+1)
			local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w*xs, w*ys, w*zs
	local xx = x*xs
	local xy = x*ys
	local xz = x*zs
	local yy = y*ys
	local yz = y*zs
	local zz = z*zs
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = math.acos(cosTheta)
			local invSinTheta = 1/math.sin(theta)
			startInterp = math.sin((1-t)*theta)*invSinTheta
			finishInterp = math.sin(t*theta)*invSinTheta
		else
			startInterp = 1-t
			finishInterp = t
		end
	else
		if (1+cosTheta) > 0.0001 then
			local theta = math.acos(-cosTheta)
			local invSinTheta = 1/math.sin(theta)
			startInterp = math.sin((t-1)*theta)*invSinTheta
			finishInterp = math.sin(t*theta)*invSinTheta
		else
			startInterp = t-1
			finishInterp = t
		end
	end
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp
end

function rayCast(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

Damagefunc=function(hit,minim,maxim,knockback,Type,Property,Delay,KnockbackType,decreaseblock)
	do return end
	if hit.Parent==nil then
		return
	end
	h=hit.Parent:FindFirstChild("Humanoid")
	for _,v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h=v
		end
	end
	if hit.Parent.Parent:FindFirstChild("Torso")~=nil then
		h=hit.Parent.Parent:FindFirstChild("Humanoid")
	end
	if hit.Parent.className=="Hat" then
		hit=hit.Parent.Parent:findFirstChild("Head")
	end
	if h~=nil and hit.Parent.Name~=Character.Name and hit.Parent:FindFirstChild("Torso")~=nil then
		if hit.Parent:findFirstChild("DebounceHit")~=nil then if hit.Parent.DebounceHit.Value==true then return end end

		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=game:service("Players").LocalPlayer
		c.Parent=h
		game:GetService("Debris"):AddItem(c,.5)
		Damage=math.random(minim,maxim)

		blocked=false
		block=hit.Parent:findFirstChild("Block")
		if block~=nil then
			print(block.className)
			if block.className=="NumberValue" then
				if block.Value>0 then
					blocked=true
					if decreaseblock==nil then
						block.Value=block.Value-1
					end
				end
			end
			if block.className=="IntValue" then
				if block.Value>0 then
					blocked=true
					if decreaseblock~=nil then
						block.Value=block.Value-1
					end
				end
			end
		end
		if blocked==false then

			h.Health=h.Health-Damage
			showDamage(hit.Parent,Damage,.5,TorsoColor)
		else
			h.Health=h.Health-(Damage/2)
			showDamage(hit.Parent,Damage/2,.5,BrickColor.new("Bright blue"))
		end
		if Type=="Knockdown" then
			hum=hit.Parent.Humanoid
			hum.PlatformStand=true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand=false
			end),hum)
			local angle=(hit.Position-(Property.Position+Vector3.new(0,0,0))).unit

			local bodvol=Instance.new("BodyVelocity")
			bodvol.velocity=angle*knockback
			bodvol.P=5000
			bodvol.maxForce=Vector3.new(8e+003, 8e+003, 8e+003)
			bodvol.Parent=hit
			rl=Instance.new("BodyAngularVelocity")
			rl.P=3000
			rl.maxTorque=Vector3.new(500000,500000,500000)*50000000000000
			rl.angularvelocity=Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))
			rl.Parent=hit
			game:GetService("Debris"):AddItem(bodvol,.5)
			game:GetService("Debris"):AddItem(rl,.5)
		elseif Type=="Normal" then
			vp=Instance.new("BodyVelocity")
			vp.P=500
			vp.maxForce=Vector3.new(math.huge,0,math.huge)

			if KnockbackType==1 then
				vp.velocity=Property.CFrame.lookVector*knockback+Property.Velocity/1.05
			elseif KnockbackType==2 then
				vp.velocity=Property.CFrame.lookVector*knockback
			end
			if knockback>0 then
				vp.Parent=hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp,.5)
		elseif Type=="Up" then
			local bodyVelocity=Instance.new("BodyVelocity")
			bodyVelocity.velocity=vt(0,10,0)
			bodyVelocity.P=1000
			bodyVelocity.maxForce=Vector3.new(1e+009, 1e+009, 1e+009)
			bodyVelocity.Parent=hit
			game:GetService("Debris"):AddItem(bodyVelocity,1)
			rl=Instance.new("BodyAngularVelocity")
			rl.P=3000
			rl.maxTorque=Vector3.new(500000,500000,500000)*50000000000000
			rl.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))
			rl.Parent=hit
			game:GetService("Debris"):AddItem(rl,.5)
		elseif Type=="Snare" then
			bp=Instance.new("BodyPosition")
			bp.P=2000
			bp.D=100
			bp.maxForce=Vector3.new(math.huge,math.huge,math.huge)
			bp.position=hit.Parent.Torso.Position
			bp.Parent=hit.Parent.Torso
			game:GetService("Debris"):AddItem(bp,1)
		elseif Type=="Target" then
			if Targetting==false then
				ZTarget=hit.Parent.Torso
				coroutine.resume(coroutine.create(function(Part)
					so("http://www.roblox.com/asset/?id=15666462",Part,1,1.5)
					swait(5)
					so("http://www.roblox.com/asset/?id=15666462",Part,1,1.5)
				end),ZTarget)
				TargHum=ZTarget.Parent:findFirstChild("Humanoid")
				targetgui=Instance.new("BillboardGui")
				targetgui.Parent=ZTarget
				targetgui.Size=UDim2.new(10,100,10,100)
				targ=Instance.new("ImageLabel")
				targ.Parent=targetgui
				targ.BackgroundTransparency=1
				targ.Image="rbxassetid://4834067"
				targ.Size=UDim2.new(1,0,1,0)
				cam.CameraType="Scriptable"
				cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
				dir=Vector3.new(cam.CoordinateFrame.lookVector.x,0,cam.CoordinateFrame.lookVector.z)
				workspace.CurrentCamera.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
				Targetting=true
				RocketTarget=ZTarget
				for i=1,Property do

					if Humanoid.Health>0 and Character.Parent~=nil and TargHum.Health>0 and TargHum.Parent~=nil and Targetting==true then
						swait()
					end

					cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)
					dir=Vector3.new(cam.CoordinateFrame.lookVector.x,0,cam.CoordinateFrame.lookVector.z)
					cam.CoordinateFrame=CFrame.new(Head.CFrame.p,ZTarget.Position)*cf(0,5,10)*euler(-0.3,0,0)
				end
				Targetting=false
				RocketTarget=nil
				targetgui.Parent=nil
				cam.CameraType="Custom"
			end
		end
		debounce=Instance.new("BoolValue")
		debounce.Name="DebounceHit"
		debounce.Parent=hit.Parent
		debounce.Value=true
		game:GetService("Debris"):AddItem(debounce,Delay)
		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=Player
		c.Parent=h
		game:GetService("Debris"):AddItem(c,.5)
		CRIT=false
		hitDeb=true
		AttackPos=6
	end
end

showDamage=function(Char,Dealt,du,Color)
	m=Instance.new("Model")
	m.Name=tostring(Dealt)
	h=Instance.new("Humanoid")
	h.Health=0
	h.MaxHealth=0
	h.Parent=m
	c=Instance.new("Part")
	c.Transparency=0
	c.BrickColor=TorsoColor
	c.Name="Head"
	c.TopSurface=0
	c.BottomSurface=0
	c.formFactor="Plate"
	c.Size=Vector3.new(1,.4,1)
	ms=Instance.new("CylinderMesh")
	ms.Scale=Vector3.new(.8,.8,.8)
	so("http://www.roblox.com/asset/?id=199149269",c,1,1)
	if CRIT==true then
		ms.Scale=Vector3.new(1,1.25,1)
	end
	ms.Parent=c
	c.Reflectance=0
	Instance.new("BodyGyro").Parent=c
	c.Parent=m
	if Char:findFirstChild("Head")~=nil then
		c.CFrame=CFrame.new(Char["Head"].CFrame.p+Vector3.new(0,1.5,0))
	elseif Char.Parent:findFirstChild("Head")~=nil then
		c.CFrame=CFrame.new(Char.Parent["Head"].CFrame.p+Vector3.new(0,1.5,0))
	end
	f=Instance.new("BodyPosition")
	f.P=2000
	f.D=100
	f.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	f.position=c.Position+Vector3.new(0,3,0)
	f.Parent=c
	game:GetService("Debris"):AddItem(m,.5+du)
	c.CanCollide=false
	m.Parent=workspace
	c.CanCollide=false
end

Player=game:GetService('Players').LocalPlayer
Character=Player.Character
Mouse=Player:GetMouse()
m=Instance.new('Model',Character)

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end

it=Instance.new

function nooutline(part)
	part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
end

function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
	local fp=it("Part")
	fp.formFactor=formfactor
	fp.Parent=parent
	fp.Reflectance=reflectance
	fp.Transparency=transparency
	fp.CanCollide=false
	fp.Locked=true
	fp.BrickColor=BrickColor.new(tostring(brickcolor))
	fp.Name=name
	fp.Size=size
	fp.Position=Character.Torso.Position
	nooutline(fp)
	fp.Material=material
	fp:BreakJoints()
	return fp
end

function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh=it(Mesh)
	mesh.Parent=part
	if Mesh=="SpecialMesh" then
		mesh.MeshType=meshtype
		mesh.MeshId=meshid
	end
	mesh.Offset=offset
	mesh.Scale=scale
	return mesh
end

function weld(parent,part0,part1,c0,c1)
	local weld=it("Weld")
	weld.Parent=parent
	weld.Part0=part0
	weld.Part1=part1
	weld.C0=c0
	weld.C1=c1
	return weld
end

local function findAccessoryByName(exactName, matchWord)
	local acc = Character:FindFirstChild(exactName)
	if not acc then
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("Accessory") and string.find(v.Name:lower(), matchWord) then
				acc = v
				break
			end
		end
	end
	return acc
end

local modelzorz=Instance.new("Model")
modelzorz.Parent=Character
modelzorz.Name="Claw1"

local ClawLAccessory=findAccessoryByName("Accessory (Claw[L])","claw[l]")
Handle=ClawLAccessory and ClawLAccessory:FindFirstChild("Handle")
if Handle then
	Handle.Anchored=false
	Handle.CanCollide=false
	Handle.Massless=true
	Handleweld=weld(m,Character["Torso"],Handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-6.74455023, 0.843135834, 3.31332064, 0.866820872, 0.000393055088, -0.498619556, 0.129048944, -0.966104209, 0.223582461, -0.481630623, -0.258152217, -0.837489963))
end
Gear=Handle

local modelzorz2=Instance.new("Model")
modelzorz2.Parent=Character
modelzorz2.Name="Claw2"

local modelzorz3=Instance.new("Model")
modelzorz3.Parent=Character
modelzorz3.Name="Eye"

local ClawRAccessory=findAccessoryByName("Accessory (Claw[R])","claw[r]")
local WheelAccessory=findAccessoryByName("Accessory (doomwheel.005Accessory)","doomwheel")

Handle2=ClawRAccessory and ClawRAccessory:FindFirstChild("Handle")
handle=WheelAccessory and WheelAccessory:FindFirstChild("Handle")

if Handle2 then
	Handle2.Anchored=false
	Handle2.CanCollide=false
	Handle2.Massless=true
	Handle2weld=weld(m,Character["Torso"],Handle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(6.65693045, 1.66835713, 2.9684639, 0.866025746, 0.129405379, 0.482963592, -3.67555799e-006, -0.965926409, 0.258817136, 0.499999553, -0.224144042, -0.836516559))
end
Gear2=Handle2

if handle then
	handle.Anchored=false
	handle.CanCollide=false
	handle.Massless=true
	handleweld=weld(m,Character["Torso"],handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.22326851, -3.5562191, -0.038143158, 0, 0, 1, 0, 1, 0, -1, 0, 0))
end
local moosick = it("Sound",Character)
moosick.SoundId = "rbxassetid://142653441"

moosick.Looped = true
moosick.Pitch = 1
moosick.Volume = 0
moosick:Play()

anim = Character:findFirstChild("Animate")
if anim then
	anim:Destroy()
end

local particleemitter = Instance.new("ParticleEmitter", Handle)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 5.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))

local particleemitter = Instance.new("ParticleEmitter", Handle2)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 5.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))

local particleemitter = Instance.new("ParticleEmitter", handle)
particleemitter.VelocitySpread = 180
particleemitter.Lifetime = NumberRange.new(0.1)
particleemitter.Speed = NumberRange.new(2)
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 7.563)})
particleemitter.RotSpeed = NumberRange.new(-45, 45)
particleemitter.Rate = 100
particleemitter.Rotation = NumberRange.new(-45, 45)
particleemitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.701, 0), NumberSequenceKeypoint.new(1, 1)})
particleemitter.LightEmission = 0.8
particleemitter.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))

local light = Instance.new("PointLight", Character.Torso)
light.Color = Color3.new(255,255,255)
light.Brightness = 5
light.Range = 15

particleemitter.Enabled = true

local Footsteps = it("Sound",Character.Torso)
Footsteps.SoundId = "rbxassetid://142665235"
Footsteps.Looped = true
Footsteps.Pitch = 0.8
Footsteps.Volume = 0.3

local Footsteps2 = it("Sound",Character.Torso)
Footsteps2.SoundId = "rbxassetid://142665235"
Footsteps2.Looped = true
Footsteps2.Pitch = 1
Footsteps2.Volume = 0.4

local cam = game.Workspace.CurrentCamera

for i,v in pairs(Head:children()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end

mouse.Button1Down:connect(function()
	if attack==false and attacktype==1 then
		attacktype=2
		attackone()
	elseif attack==false and attacktype==2 then
		attacktype=3
		attacktwo()
	elseif attack==false and attacktype==3 then
		attacktype=4
		attackthree()
	elseif attack==false and attacktype==4 then
		attacktype=1
		attackfour()
	end
end)

mouse.KeyDown:connect(function(k)
	k=k:lower()
	if k=='e' then
		if attack==false and mana>=20 then
			Push()
		end
	elseif k=='g' then
		if attack==false and mana>=50 then
			Twirl()
		end
	elseif k=='v' then
		if attack==false and mana>=25 then
			MagicJump()
		end
	elseif k=='q' then
		if attack==false then
			idle=1000
		end
	elseif k=='h' then
		if attack==false then
			mana=100
		end
	elseif k=='y' then
		if attack==false and mana>=100 then
			Shred()
		end
	elseif k=='f' then
		if attack==false and mana>=40 then
			Spin()
		end
	elseif k=='r' then
		if attack==false and mana>=20 then
			Clap()
		end
	elseif k=='t' then
		if attack==false then
			Hai()
		end
	elseif k=='0' then
		if attack==false then
			Humanoid.WalkSpeed=(56)
		end
	elseif k=='j' then
		if attack==false then
			Humanoid.Health = 100
			print("Congrats, you commited suicide.")
		end
	end
end)

TrailDeb = false

function equipanim()
	attack=true
	Humanoid.WalkSpeed = 0
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	so("http://www.roblox.com/asset/?id=200632370",Torso,1,0.5)
	for i=0,1,0.005 do
		swait()
		moosick.Volume = 0+1*i
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,100-100*i)*euler(0,0,0+90*i),.2)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0.1,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		LW.C0=clerp(LW.C0,cf(-1,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(40)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-40)),.2)
	end
	for i=0,1,0.005 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,2.5)*euler(0,0,0+90*i),.2)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0.1,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.05)
		LW.C0=clerp(LW.C0,cf(-1,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(40)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-40)),.2)
	end
	so("http://www.roblox.com/asset/?id=150829983",Character,1,0.9)
	so("http://www.roblox.com/asset/?id=150829983",Character,1,0.9)
	for i=0,1,0.005 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,5+1*i)*angles(math.rad(-15),math.rad(0),math.rad(0)),0.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-25),math.rad(0),math.rad(0)),0.1)
		handleweld.C0=clerp(handleweld.C0,cf(0,0+1*i,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.1)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0-1*i,0,0)*angles(math.rad(90),math.rad(15),math.rad(0)),0.1)
		Handleweld.C0=clerp(Handleweld.C0,cf(0+1*i,0,0)*angles(math.rad(90),math.rad(-15),math.rad(0)),0.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-30),math.rad(0),math.rad(-30)),0.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-30),math.rad(0),math.rad(30)),0.1)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-30),math.rad(0),math.rad(-30)),0.1)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-30),math.rad(0),math.rad(30)),0.1)
	end
	for i=0,1,0.04 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1)*angles(math.rad(40),math.rad(0),math.rad(-40)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(40)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(70),math.rad(0),math.rad(-45)),.3)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		LH.C0=clerp(LH.C0,cf(-1,0.5,0)*euler(0,-1.57,0)*angles(math.rad(-10),math.rad(30),math.rad(-40)),.3)
	end

	attack=false
	Humanoid.WalkSpeed = 12
	if TrailDeb == true then
		TrailDeb = false
	end
end

function attackone()
	attack=true
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-5),math.rad(0),math.rad(-10)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(10)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(-3,1,2)*angles(math.rad(90),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*euler(.5,1.8,1.5),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,.9)
	so("http://www.roblox.com/asset/?id=159972643",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(20)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(-4,1,-8)*angles(math.rad(-85),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,-0.5)*euler(80,1.8,1.5),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
	end

	attack=false
	con1:disconnect()
	if TrailDeb == true then
		TrailDeb = false
	end
end

function attacktwo()
	attack=true
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,1,-5)*angles(math.rad(0),math.rad(0),math.rad(20)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-30,0,-20),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-2),math.rad(-25),math.rad(15)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle2,1,.8)
	so("http://www.roblox.com/asset/?id=159972627",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(20)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(10,1,-5)*angles(math.rad(0),math.rad(-80),math.rad(20)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-2),math.rad(-25),math.rad(15)),.3)
	end

	attack=false
	con1:disconnect()
	if TrailDeb == true then
		TrailDeb = false
	end
end

function attackthree()
	attack=true
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Up",RootPart,.2,1) end)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(3,7,-1)*angles(math.rad(20),math.rad(0),math.rad(-120)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,-0.5)*euler(0.5,-1.3,-0.1),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,1)
	so("http://www.roblox.com/asset/?id=159882477",Torso,1,1)
	for i=0,1,0.05 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(2,4,-3)*angles(math.rad(120),math.rad(0),math.rad(-120)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,-0.5)*euler(2,-1.3,0.1),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(2),math.rad(25),math.rad(-15)),.3)
	end

	attack=false
	con1:disconnect()
	if TrailDeb == true then
		TrailDeb = false
	end
end

function attackfour()
	attack=true
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1)*angles(math.rad(40),math.rad(0),math.rad(-40)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(1.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-1.5,3,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(40)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(70),math.rad(0),math.rad(-45)),.3)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),.3)
		LH.C0=clerp(LH.C0,cf(-1,0.5,0)*euler(0,-1.57,0)*angles(math.rad(-10),math.rad(30),math.rad(-40)),.3)
	end
	if anim then
		anim.Disabled=true
	end
	so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.7)
	so("http://www.roblox.com/asset/?id=159882584",Torso,1,1)
	for i=0,1,0.04 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*50
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(-5),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(3,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-3,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.2,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0,1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(0,-1.57,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
	end

	attack=false
	con1:disconnect()
	con2:disconnect()
	if anim then
		anim.Disabled=false
	end
	if TrailDeb == true then
		TrailDeb = false
	end
end

function BlastEffect(brickcolor, cframe, x1, y1, z1, x2, y2, z2)
	local prt = part(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", vt(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=20329976", vt(0, 0, 0), vt(x1, y1, z1))
	coroutine.resume(coroutine.create(function()
		for i = 0, 1, 0.05 do
			wait()
			prt.Transparency = i
			msh.Scale = msh.Scale + vt(x2, y2, z2)
		end
		prt.Parent = nil
	end))
end

function MagicCircle(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = part(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", vt(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "Sphere", "", vt(0, 0, 0), vt(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 2)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		for i = 0, 1, delay do
			swait()
			Part.CFrame = Part.CFrame
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
		end
		Part.Parent = nil
	end), prt, msh)
end

function MagicJump()
	if Anim == "Idle" or Anim == "Walk" or Anim == "Run" then
		attack=true
		mana=mana-25

		Humanoid.Jump = true
		Torso.Velocity = vt(0, 150, 0)
		Humanoid.WalkSpeed = 64
		so("http://www.roblox.com/asset/?id=199145497",Torso,1,0.8)
		so("http://www.roblox.com/asset/?id=199145497",Torso,1,0.8)
		for i=0,1,0.05 do
			swait()
			Neck.C0=clerp(Neck.C0,necko*euler(0.5,0,0),.3)
			Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*euler(0+8*i,0,0),.3)
			LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
			RW.C0=clerp(RW.C0,cf(1,0.5,-1)*euler(-30,0,-20),.3)
			RH.C0=clerp(RH.C0,cf(1,0,-1)*euler(-0.5,1.57,0)*euler(0,0,0),.2)
			LH.C0=clerp(LH.C0,cf(-1,0,-1)*euler(-0.5,-1.57,0)*euler(0,0,0),.2)
			handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.2)
			Handleweld.C0=clerp(Handleweld.C0,cf(0,-5,0)*angles(math.rad(60),math.rad(60),math.rad(0)),.2)
			Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-5,0)*angles(math.rad(60),math.rad(-60),math.rad(0)),.2)
		end
		for i=0,1,0.02 do
			swait()
			Neck.C0=clerp(Neck.C0,necko*euler(0.3,0,0),.3)
			Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*euler(0,0,0),.3)
			RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(0.1,0,1),.3)
			RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
			LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(0.1,0,-1),.3)
			LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
			RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0.6,1.57,0)*euler(0,0,0),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(-0.8,-1.57,0)*euler(0,0,0),.2)
			handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
			Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
			Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
		end
		Humanoid.WalkSpeed = 0
		swait(8)
		so("http://www.roblox.com/asset/?id=199145477",Torso,1,1)
		so("http://www.roblox.com/asset/?id=199145477",Torso,1,1)
		local hit,pos=rayCast(Torso.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,100,Character)
		if hit~=nil then
			swait(2)
			local ref=part(3,workspace,"SmoothPlastic",0,1,BrickColor.new("Really black"),"Effect",vt())
			ref.Anchored=true
			ref.CFrame=cf(pos)
			game:GetService("Debris"):AddItem(ref,3)
			for i=1,10 do
				local Col=BrickColor.new("Really black")
				local groundpart=part(3,Character,"SmoothPlastic",0,0,Col,"Ground",vt(math.random(50,200)/100,math.random(50,200)/100,math.random(50,200)/100))
				groundpart.Anchored=true
				groundpart.CanCollide=false
				groundpart.CFrame=cf(pos)*cf(math.random(-500,500)/100,0,math.random(-500,500)/100)*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
				local Col2=TorsoColor
				local groundpart2=part(3,Character,"SmoothPlastic",0,0,Col2,"Ground",vt(math.random(50,200)/100,math.random(50,200)/100,math.random(50,200)/100))
				groundpart2.Anchored=true
				groundpart2.CanCollide=false
				groundpart2.CFrame=cf(pos)*cf(math.random(-500,500)/100,0,math.random(-500,500)/100)*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
				game:GetService("Debris"):AddItem(groundpart,5)
				game:GetService("Debris"):AddItem(groundpart2,5)
			end
			BlastEffect(TorsoColor,cf(pos),1,1,1,1.4,1.4,1.4)
			BlastEffect(BrickColor.new("Really black"),cf(pos),.9,.9,.9,1.2,1.2,1.2)
			MagicCircle(BrickColor.new("Really black"),cf(pos),5,5,5,5,5,5,0.05)
			MagicCircle(TorsoColor,cf(pos),6,6,6,6,6,6,0.05)
			for i=0,1,0.06 do
				swait()
				Neck.C0=clerp(Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.3)
				Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.5)*angles(math.rad(50),math.rad(0),math.rad(0)),.3)
				RW.C0=clerp(RW.C0,cf(1, 0.3, -.7)*angles(math.rad(50),math.rad(0),math.rad(-30)),.3)
				LW.C0=clerp(LW.C0,cf(-1, 0.3, -.7)*angles(math.rad(50),math.rad(0),math.rad(30)),.3)
				RH.C0=clerp(RH.C0,cf(1, -.5, -.5)*angles(math.rad(50),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
				LH.C0=clerp(LH.C0,cf(-1, -1, -.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.3)
				handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
				Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
				Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
			end
		end
		swait(20)
		Humanoid.WalkSpeed = 12

		attack=false
	end
end

function Spin()
	attack=true
	mana=mana-40
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	Footsteps:Stop()
	Footsteps2:Stop()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	so("http://www.roblox.com/asset/?id=159882497",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	if anim then
		anim.Disabled=true
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1.2)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,1)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*100
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(90),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1.2)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,1)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*100
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(90),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1.2)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,1)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*100
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(90),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end

	Humanoid.WalkSpeed=12
	attack=false
	con1:disconnect()
	con2:disconnect()
	if anim then
		anim.Disabled=false
	end
	if TrailDeb == true then
		TrailDeb = false
	end
end

function Twirl()
	mana=mana-50
	attack=true
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	Footsteps:Stop()
	Footsteps2:Stop()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	so("http://www.roblox.com/asset/?id=159882598",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	if anim then
		anim.Disabled=true
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",LeftArm,1,1)
	so("http://www.roblox.com/asset/?id=231917758",RightArm,1,0.8)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,10)*angles(math.rad(90),math.rad(0),math.rad(0+360*i)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end

	Humanoid.WalkSpeed=12
	attack=false
	con1:disconnect()
	con2:disconnect()
	if anim then
		anim.Disabled=false
	end
	if TrailDeb == true then
		TrailDeb = false
	end
end

function Shred()
	attack=true
	mana=mana-100
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	Footsteps:Stop()
	Footsteps2:Stop()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,30,40,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,30,40,math.random(20,40),"Normal",RootPart,.2,1) end)
	so("http://www.roblox.com/asset/?id=159882578",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	if anim then
		anim.Disabled=true
	end
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*20
		so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2)
		so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(0+40*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*40
		so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2)
		so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(41+80*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*60
		so("http://www.roblox.com/asset/?id=231917758",LeftArm,0.2,1.2)
		so("http://www.roblox.com/asset/?id=231917758",RightArm,0.2,1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(82+120*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	so("http://www.roblox.com/asset/?id=159882625",Torso,1,1)
	so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
	so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
	so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
	so("http://www.roblox.com/asset/?id=231917758",Torso,1,0.1)
	for i=0,1,0.05 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*80
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(124+160*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end
	for i=0,1,0.005 do
		swait()
		Torso.Velocity=RootPart.CFrame.lookVector*100
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(168+4200*i)),.5)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,0,0)*angles(math.rad(0),math.rad(180),math.rad(180)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
	end

	Humanoid.WalkSpeed=12
	attack=false
	con1:disconnect()
	con2:disconnect()
	if anim then
		anim.Disabled=false
	end
	if TrailDeb == true then
		TrailDeb = false
	end
end

function Push()
	attack=true
	mana=mana-20
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,10,20,math.random(20,40),"Normal",RootPart,.2,1) end)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(-5,0,-10)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(5,0,-10)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(-20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(20)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle2,1,.8)
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,1)
	so("http://www.roblox.com/asset/?id=159882481",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(-4,0,-20)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(4,0,-20)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)
		RW.C0=clerp(RW.C0,cf(1,0.5,-1)*angles(math.rad(90),math.rad(0),math.rad(-20)),.3)
		LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*angles(math.rad(90),math.rad(0),math.rad(20)),.3)
	end

	attack=false
	con1:disconnect()
	con2:disconnect()
	if TrailDeb == true then
		TrailDeb = false
	end
end

function Clap()
	attack=true
	mana=mana-20
	if TrailDeb == false then
		TrailDeb = true
	end

	coroutine.wrap(function()
		local Old = Handle2.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle2.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	coroutine.wrap(function()
		local Old = Handle.CFrame.p
		while wait()do
			if not TrailDeb then break end
			local New = Handle.CFrame.p
			local Mag =(Old -New).magnitude
			local Dis =(Old +New)/2
			local Trail = Instance.new("Part",Character)
			Trail.Material = "Neon"
			Trail.Anchored = true
			Trail.CanCollide = false
			Trail.BrickColor = TorsoColor
			Trail.Size = Vector3.new(0.2,Mag,0.2)
			Trail.TopSurface = 0
			Trail.BottomSurface = 0
			Trail.formFactor = "Custom"
			Trail.CFrame = CFrame.new(Dis,New)* CFrame.Angles(math.pi/2,0,0)
			local ms = Instance.new("BlockMesh",Trail)
			ms.Scale = Vector3.new(1,1,1)
			local TM = Instance.new("CylinderMesh",Trail)
			TM.Scale = Vector3.new(1,1,1)
			Old = New
			coroutine.wrap(function()
				for i = 1,0,-0.1 do
					wait()
					TM.Scale = TM.Scale * Vector3.new(i,1,i)
				end
				Trail:remove()
			end)()
			coroutine.wrap(function()
				for i = 1,10 do
					wait()
					Trail.Transparency = Trail.Transparency +0.1
				end end)()end end)()
	con1=Gear2.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	con2=Gear.Touched:connect(function(hit) Damagefunc(hit,20,30,math.random(20,40),"Normal",RootPart,.2,1) end)
	so("http://www.roblox.com/asset/?id=159882584",Torso,1,0.9)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(-5,1,-5)*angles(math.rad(0),math.rad(-40),math.rad(20)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(5,1,-5)*angles(math.rad(0),math.rad(40),math.rad(-20)),.2)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-30,0,-20),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(-30,0,20),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle2,1,.8)
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,1)
	for i=0,1,0.08 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(4,1,-5)*angles(math.rad(0),math.rad(-43),math.rad(20)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(-4,1,-5)*angles(math.rad(0),math.rad(43),math.rad(-20)),.2)
		LW.C0=clerp(LW.C0,cf(-1,0.5,-1)*euler(-30,0,20),.3)
		RW.C0=clerp(RW.C0,cf(1,0.5,-1)*euler(-30,0,-20),.3)
	end

	attack=false
	con1:disconnect()
	con2:disconnect()
	if TrailDeb == true then
		TrailDeb = false
	end
end

function Hai()
	attack=true
	Humanoid.WalkSpeed=0
	so("http://www.roblox.com/asset/?id=159882567",Torso,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,5,3)*angles(math.rad(20),math.rad(-20),math.rad(20)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(0),math.rad(0)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(170),math.rad(0),math.rad(0)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,.8)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(3,8,0)*angles(math.rad(0),math.rad(-20),math.rad(-30)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(170),math.rad(0),math.rad(50)),.5)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,5,3)*angles(math.rad(20),math.rad(-20),math.rad(20)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(0),math.rad(0)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(170),math.rad(0),math.rad(0)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16)),.3)

	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,.8)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(3,8,0)*angles(math.rad(0),math.rad(-20),math.rad(-30)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0.5,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(170),math.rad(0),math.rad(50)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16)),.3)
	end
	so("http://www.roblox.com/asset/?id=231917758",Handle,1,1)
	for i=0,1,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*euler(0,0,0),.2)
		handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
		Handleweld.C0=clerp(Handleweld.C0,cf(0,5,3)*angles(math.rad(20),math.rad(-20),math.rad(20)),.2)
		Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(0),math.rad(0)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(170),math.rad(0),math.rad(0)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16)),.3)
	end

	Humanoid.WalkSpeed=12
	attack=false
end

equipanim()

local sine = 0
local change = 1
local val = 0

local mananum=0
local function mainLoop()
while true do
	swait()
	sine = sine + change
	local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude
	local velderp=RootPart.Velocity.y
	hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
	if equipped==true or equipped==false then
		if Anim=="Idle" and attack==false then
			idle=idle+1
		else
			idle=0
		end
		if idle>=1000 then
			if attack==false then

			end
		end
		if RootPart.Velocity.y > 1 and hitfloor==nil then
			Anim="Jump"
			if attack==false then
				Footsteps:Stop()
				Footsteps2:Stop()
				Neck.C0=clerp(Neck.C0,necko*euler(-0.2,0,0),.3)
				Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0),.3)
				RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(-.25,0,0.5),.3)
				RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
				LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(-.25,0,-0.5),.3)
				LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
				RH.C0=clerp(RH.C0,cf(1,0,-.75)*euler(-0.5,1.57,0)*euler(0,0,0),.2)
				LH.C0=clerp(LH.C0,cf(-1,-1,-.3)*euler(-0.5,-1.57,0)*euler(0,0,0),.2)
				handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(0)),.2)
				Handleweld.C0=clerp(Handleweld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(20),math.rad(0)),.2)
				Handle2weld.C0=clerp(Handle2weld.C0,cf(0,0,0)*angles(math.rad(20),math.rad(-20),math.rad(0)),.2)
			end
		elseif RootPart.Velocity.y < -1 and hitfloor==nil then
			Anim="Fall"
			if attack==false then
				Footsteps:Stop()
				Footsteps2:Stop()
				Neck.C0=clerp(Neck.C0,necko*euler(0.3,0,0),.3)
				Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*euler(0,0,0),.3)
				RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*euler(0.1,0,1),.3)
				RW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
				LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*euler(0.1,0,-1),.3)
				LW.C1=clerp(LW.C1,cf(0,0.5,0)*euler(0,0,0),.3)
				RH.C0=clerp(RH.C0,cf(1,-1,0)*euler(0.6,1.57,0)*euler(0,0,0),.2)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*euler(-0.8,-1.57,0)*euler(0,0,0),.2)
				handleweld.C0=clerp(handleweld.C0,cf(0,0,-1)*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
				Handleweld.C0=clerp(Handleweld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(-10),math.rad(0)),.2)
				Handle2weld.C0=clerp(Handle2weld.C0,cf(0,-1,0)*angles(math.rad(-20),math.rad(10),math.rad(0)),.2)
			end
		elseif torvel<1 and hitfloor~=nil then
			Anim="Idle"
			change=0.5
			if idle>=1000 then
				if attack==false then
					Footsteps:Stop()
					Footsteps2:Stop()
					Humanoid.WalkSpeed=12
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,6-0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(0),math.rad(50)),.1)
					Neck.C0=clerp(Neck.C0,necko*angles(math.rad(5+2*math.cos(sine/5.5)),math.rad(-5-2*math.cos(sine/5.5)),math.rad(-50)),.1)
					Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.1)
					RW.C0=clerp(RW.C0,cf(0.8,0.3,-0.5)*angles(math.rad(70),math.rad(0),math.rad(-85)),.5)
					LW.C0=clerp(LW.C0,cf(-0.6,0.5,-0.7)*angles(math.rad(70),math.rad(0),math.rad(85)),.5)
					RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
					handleweld.C0=clerp(handleweld.C0,cf(3.2,-1,-2)*angles(math.rad(90),math.rad(0),math.rad(60)),.3)
					Handleweld.C0=clerp(Handleweld.C0,cf(-2,-1.5+1*math.cos(sine/50),6)*angles(math.rad(60),math.rad(-25),math.rad(-90)),.4)
					Handle2weld.C0=clerp(Handle2weld.C0,cf(5,1.5-0.5*math.cos(sine/50),-5)*angles(math.rad(-110),math.rad(25),math.rad(60)),.3)
				end
			else
				if attack==false then
					Footsteps:Stop()
					Footsteps2:Stop()
					Humanoid.WalkSpeed=12
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(6),math.rad(0),math.rad(0)),.3)
					Neck.C0=clerp(Neck.C0,necko*angles(math.rad(3+3*math.cos(sine/36)),math.rad(0),math.rad(0)),.3)
					Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(16-6*math.cos(sine/28))),.3)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10),math.rad(0),math.rad(-16+6*math.cos(sine/28))),.3)
					RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(16)),.3)
					LH.C0=clerp(LH.C0,cf(-1,-1.1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(24)),.3)
					handleweld.C0=clerp(handleweld.C0,cf(0-1*math.cos(sine/40),0-0.5*math.cos(sine/20),0)*angles(math.rad(-5+5*math.cos(sine/20)),math.rad(0),math.rad(0)),.2)
					Handleweld.C0=clerp(Handleweld.C0,cf(0-1*math.cos(sine/30),0,0-1*math.cos(sine/30))*angles(math.rad(0+8*math.cos(sine/30)),math.rad(0),math.rad(0-8*math.cos(sine/30))),.2)
					Handle2weld.C0=clerp(Handle2weld.C0,cf(0+1*math.cos(sine/36),0,0+1*math.cos(sine/36))*angles(math.rad(0-12*math.cos(sine/36)),math.rad(0),math.rad(0-12*math.cos(sine/36))),.2)
				end
			end
		elseif torvel>2 and torvel<22 and hitfloor~=nil then
			Anim="Walk"
			if attack==false then
				change=0.8

				Footsteps:Play()
				Footsteps2:Stop()
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+0.1*math.cos(sine/2.5))*angles(math.rad(10+1*math.cos(sine/2.5)),math.rad(0),math.rad(1-5*math.cos(sine/5))),.3)
				Neck.C0=clerp(Neck.C0,necko*euler(0+0.075*math.cos(sine/2.5),0,0)*angles(math.rad(0),math.rad(0),math.rad(1+5*math.cos(sine/5))),.3)
				Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
				RW.C0=clerp(RW.C0,cf(1.4+0.25*math.cos(sine/5),0.5+0.25*math.cos(sine/5),-0.2+0.5*math.cos(sine/5))*angles(math.rad(20-60*math.cos(sine/5)),math.rad(0),math.rad(-4+30*math.cos(sine/5))),.3)
				LW.C0=clerp(LW.C0,cf(-1.4+0.25*math.cos(sine/5),0.5-0.25*math.cos(sine/5),-0.2-0.5*math.cos(sine/5))*angles(math.rad(20+60*math.cos(sine/5)),math.rad(0),math.rad(4+30*math.cos(sine/5))),.3)
				RH.C0=clerp(RH.C0,cf(1,-1-0.1*math.cos(sine/5),0-0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0+50*math.cos(sine/5))),.3)
				LH.C0=clerp(LH.C0,cf(-1,-1+0.1*math.cos(sine/5),0+0.25*math.cos(sine/5))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0+50*math.cos(sine/5))),.3)
				handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
				Handleweld.C0=clerp(Handleweld.C0,cf(0-.5*math.cos(sine/30),0,0-.5*math.cos(sine/30))*angles(math.rad(0+1*math.cos(sine/30)),math.rad(-30),math.rad(0-1*math.cos(sine/30))),.2)
				Handle2weld.C0=clerp(Handle2weld.C0,cf(0+.5*math.cos(sine/36),0,0+.5*math.cos(sine/36))*angles(math.rad(0-3*math.cos(sine/36)),math.rad(30),math.rad(0-3*math.cos(sine/36))),.2)
			end
		elseif torvel>=22 and hitfloor~=nil then
			Anim="Run"
			change=1
			if attack==false then
				Footsteps:Stop()
				Footsteps2:Play()
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+0.1*math.cos(sine/2.5))*angles(math.rad(20+1*math.cos(sine/2.5)),math.rad(0),math.rad(0)),.3)
				Neck.C0=clerp(Neck.C0,necko*euler(-0.2+0.075*math.cos(sine/2.5),0,0),.3)
				Neck.C1=clerp(Neck.C1,necko2*euler(0,0,0),.3)
				RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(24)),.3)
				LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-40),math.rad(0),math.rad(-24)),.3)
				RH.C0=clerp(RH.C0,cf(1,-1-0.1*math.cos(sine/5),0-0.5*math.cos(sine/5))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0+70*math.cos(sine/5))),.3)
				LH.C0=clerp(LH.C0,cf(-1,-1+0.1*math.cos(sine/5),0+0.5*math.cos(sine/5))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(0+70*math.cos(sine/5))),.3)
				handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.2)
				Handleweld.C0=clerp(Handleweld.C0,cf(0-.5*math.cos(sine/30),0,0-.5*math.cos(sine/30))*angles(math.rad(0+1*math.cos(sine/30)),math.rad(-60),math.rad(0-1*math.cos(sine/30))),.2)
				Handle2weld.C0=clerp(Handle2weld.C0,cf(0+.5*math.cos(sine/36),0,0+.5*math.cos(sine/36))*angles(math.rad(0-3*math.cos(sine/36)),math.rad(60),math.rad(0-3*math.cos(sine/36))),.2)
			end
		end
	end
	fenbarmana2:TweenSize(UDim2.new(4*mana/100,0,0.2,0),nil,1,0.4,true)
	fenbarmana4.Text="[Energy]                    <{[  "..mana.."  ]}>                    [Energy]"
	if mana>=100 then
		mana=100
	else
		if mananum<=8 then
			mananum=mananum+1
		else
			mananum=0
			mana=mana+1
		end
	end
end
end