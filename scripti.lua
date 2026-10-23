getgenv().RTOR_Lang = getgenv().RTOR_Lang or "EN"

local Lang = {
    EN = {
        Title = "mishka script| FTAP",
        Footer = "EN / RU | Edit by mishka",
        TabScripts = "Scripts",
        TabSettings = "Settings",
        G_Free = "Free Scripts 1-15 (may work poorly)",
        G_16 = "Other Scripts 16-32",
        G_33 = "Scripts 33-52",
        G_53 = "Scripts 53-70",
        G_71 = "Scripts 71-90",
        G_91 = "Scripts 91-104",
        G_105 = "Scripts 105-118",
        Language = "Language",
        LangBtn = "🌐 Switch to Russian",
        Keybind = "Menu Keybind",
        Unload = "🗑️ Unload Menu",
        Loading = "Loading",
        Loaded = "Loaded",
        SyntaxErr = "Syntax error",
        DeadLink = "Dead link/Blocked",
        Cred = "Edit by mishka",
        Ver = "Version: 118 scripts in one tab",
        Hint = "Press RightShift to toggle menu.",
    },
    RU = {
        Title = "RTOR v17.0 | FTAP",
        Footer = "RU / EN | От KAZBEK",
        TabScripts = "Скрипты",
        TabSettings = "Настройки",
        G_Free = "Бесплатные скрипты 1-15 (могут плохо работать)",
        G_16 = "Остальные скрипты 16-32",
        G_33 = "Скрипты 33-52",
        G_53 = "Скрипты 53-70",
        G_71 = "Скрипты 71-90",
        G_91 = "Скрипты 91-104",
        G_105 = "Скрипты 105-118",
        Language = "Язык",
        LangBtn = "🌐 Переключить на английский",
        Keybind = "Клавиша меню",
        Unload = "🗑️ Выгрузить меню",
        Loading = "Загрузка",
        Loaded = "Загружено",
        SyntaxErr = "Ошибка синтаксиса",
        DeadLink = "Ссылка мертва/Заблокирована",
        Cred = "От KAZBEK",
        Ver = "Версия: 118 скриптов в одной вкладке",
        Hint = "Нажми RightShift чтобы открыть меню.",
    }
}

local function CreateMenu()
    local currentLang = getgenv().RTOR_Lang
    local L = Lang[currentLang] or Lang.EN

    local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
    local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
    local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

    local Options = Library.Options
    local Window = Library:CreateWindow({
        Title = L.Title,
        Footer = L.Footer,
        Icon = 12035542405,
        NotifySide = "Right",
        ShowCustomCursor = true
    })

    pcall(function()
        Library.Theme.AccentColor = Color3.fromRGB(150, 100, 255)
        Library.Theme.BackgroundColor = Color3.fromRGB(15, 15, 25)
    end)

    local T = {
        Scripts = Window:AddTab(L.TabScripts, "list"),
        Settings = Window:AddTab(L.TabSettings, "settings")
    }

    local function LoadScript(name, url)
        Library:Notify({Title = "⏳ " .. L.Loading, Description = name, Time = 2})
        task.spawn(function()
            local ok, code = pcall(function() return game:HttpGet(url) end)
            if ok and code then
                local fn = loadstring(code)
                if fn then
                    pcall(fn)
                    Library:Notify({Title = "✅ " .. L.Loaded, Description = name, Time = 2})
                else
                    Library:Notify({Title = "❌ " .. L.SyntaxErr, Description = name, Time = 3})
                end
            else
                Library:Notify({Title = "❌ " .. L.DeadLink, Description = name, Time = 3})
            end
        end)
    end

    -- ═══════════════════════════════════════════════════════════════
    -- ВКЛАДКА "СКРИПТЫ" — ВСЕ 118 В ОДНОЙ ВКЛАДКЕ
    -- ═══════════════════════════════════════════════════════════════

    -- ЛЕВАЯ КОЛОНКА — 1-15 (Free)
    local G1 = T.Scripts:AddLeftGroupbox(L.G_Free)
    G1:AddButton({Text = "1. Vortex", Func = function() LoadScript("Vortex", "https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Vortex-Hub-228539") end})
    G1:AddButton({Text = "2. Apex V2", Func = function() LoadScript("Apex V2", "https://paste.c-net.org/HorridPrivate") end})
    G1:AddButton({Text = "3. NeverLose", Func = function() LoadScript("NeverLose", "https://pastefy.app/ATPWcoEb/raw") end})
    G1:AddButton({Text = "4. Blitz", Func = function() LoadScript("Blitz", "https://pastefy.app/BHQ1xXjK/raw") end})
    G1:AddButton({Text = "5. XOCU 2", Func = function() LoadScript("XOCU 2", "https://raw.githubusercontent.com/dray29471-del/VIZERbest/refs/heads/main/VIZERbest.lua") end})
    G1:AddButton({Text = "6. Oblivion", Func = function() LoadScript("Oblivion", "https://gist.githubusercontent.com/safonovmaksima-commits/65ca3fad4743c91ebbf5fadf5bebe066/raw/ed95e5a9b06de9b134422c0531e3aa406cd9af7b/vhr222") end})
    G1:AddButton({Text = "7. Fake Resonance", Func = function() LoadScript("Fake Resonance", "https://pastefy.app/FNbok8Ua/raw") end})
    G1:AddButton({Text = "8. Unstable", Func = function() LoadScript("Unstable", "https://doitenroi.win/paste/rlKgQK/raw") end})
    G1:AddButton({Text = "9. Bloody v2", Func = function() LoadScript("Bloody v2", "https://raw.githubusercontent.com/celestialteam/youhateme/refs/heads/main/BloodyPremiumCrack.lua") end})
    G1:AddButton({Text = "10. Pluton", Func = function() LoadScript("Pluton", "https://doitenroi.win/paste/A1x9Ra/raw") end})
    G1:AddButton({Text = "11. Poop Hub Premium", Func = function() LoadScript("Poop Hub", "https://paste.c-net.org/VacatePicking") end})
    G1:AddButton({Text = "12. Lunar", Func = function() LoadScript("Lunar", "https://pastefy.app/bscLo4n8/raw") end})
    G1:AddButton({Text = "13. Unknown Hub", Func = function() LoadScript("Unknown Hub", "https://pastefy.app/LXAlE7iF/raw") end})
    G1:AddButton({Text = "14. Ragalic", Func = function() LoadScript("Ragalic", "https://pastefy.app/Chk68Dbv/raw") end})
    G1:AddButton({Text = "15. Rr9", Func = function() LoadScript("Rr9", "https://pastefy.app/aVlt6mOJ/raw") end})

    -- ПРАВАЯ КОЛОНКА — 16-32
    local G2 = T.Scripts:AddRightGroupbox(L.G_16)
    G2:AddButton({Text = "16. Allun", Func = function() LoadScript("Allun", "https://pastefy.app/OrWdkmOz/raw") end})
    G2:AddButton({Text = "17. Mobile Trigger Bot", Func = function() LoadScript("Mobile Trigger", "https://pastefy.app/srfwxEOM/raw") end})
    G2:AddButton({Text = "18. Fanatic FTAP", Func = function() LoadScript("Fanatic", "https://pastefy.app/oElOKErG/raw") end})
    G2:AddButton({Text = "19. Fatalytyz", Func = function() LoadScript("Fatalytyz", "https://pastefy.app/q8DLElpm/raw") end})
    G2:AddButton({Text = "20. Fosfor Visuals", Func = function() LoadScript("Fosfor", "https://pastefy.app/IOP2dXal/raw") end})
    G2:AddButton({Text = "21. Tokra", Func = function() LoadScript("Tokra", "https://pastefy.app/ccBEGiz7/raw") end})
    G2:AddButton({Text = "22. Ekonans", Func = function() LoadScript("Ekonans", "https://pastefy.app/F0nKbxWU/raw") end})
    G2:AddButton({Text = "23. TheWorst Free", Func = function() LoadScript("TheWorst", "https://raw.githubusercontent.com/m1kp0/ftap/refs/heads/main/TheWorstFreeLoader.lua") end})
    G2:AddButton({Text = "24. NNhub", Func = function() LoadScript("NNhub", "https://pastefy.app/72XjOBdT/raw") end})
    G2:AddButton({Text = "25. Eris", Func = function() LoadScript("Eris", "https://pastefy.app/PTcKa7zg/raw") end})
    G2:AddButton({Text = "26. Nile", Func = function() LoadScript("Nile", "https://pastefy.app/w0TpJ7bn/raw") end})
    G2:AddButton({Text = "27. NeoLose", Func = function() LoadScript("NeoLose", "https://pastefy.app/X3CmLQHP/raw") end})
    G2:AddButton({Text = "28. Silent Target Hub", Func = function() LoadScript("Silent Target", "https://pastefy.app/v9CUBtQQ/raw") end})
    G2:AddButton({Text = "29. Savitar", Func = function() LoadScript("Savitar", "https://paste.c-net.org/FleetDisgrace") end})
    G2:AddButton({Text = "30. Drun", Func = function() LoadScript("Drun", "https://paste.c-net.org/BeggingShady") end})
    G2:AddButton({Text = "31. Mercury", Func = function() LoadScript("Mercury", "https://paste.c-net.org/ResignDolly") end})
    G2:AddButton({Text = "32. The Revenge", Func = function() LoadScript("The Revenge", "https://paste.c-net.org/CornerKeepers") end})

    -- ЛЕВАЯ КОЛОНКА — 33-52
    local G3 = T.Scripts:AddLeftGroupbox(L.G_33)
    G3:AddButton({Text = "33. Pooophub DAVI", Func = function() LoadScript("Pooophub DAVI", "https://raw.githubusercontent.com/boniloyzin-cloud/Pooophub_DAVI/refs/heads/main/DAVIFLING%20THING%20AND%20PEOPLE") end})
    G3:AddButton({Text = "34. XERON V4", Func = function() LoadScript("XERON V4", "https://rawscripts.net/raw/Fling-Things-and-People-XERON-V4-FTAP-229758") end})
    G3:AddButton({Text = "35. Unknown Protected 1", Func = function() LoadScript("Unknown 1", "https://orrxl4-protector.com/api/raw?id=ujhfvgo5") end})
    G3:AddButton({Text = "36. Toy Mod", Func = function() LoadScript("Toy Mod", "https://raw.githubusercontent.com/muscat-yummy/script/refs/heads/main/toymod") end})
    G3:AddButton({Text = "37. k hub", Func = function() LoadScript("k hub", "https://pastefy.app/jSiQbsYf/raw") end})
    G3:AddButton({Text = "38. Paid Tsunami", Func = function() LoadScript("Paid Tsunami", "https://pastefy.app/HldxA8hX/raw") end})
    G3:AddButton({Text = "39. Beast Hub", Func = function() LoadScript("Beast Hub", "https://raw.githubusercontent.com/kingmagro2525-netizen/yajuhub/main/Qop.Xxc.lua") end})
    G3:AddButton({Text = "40. Strongest Animation", Func = function() LoadScript("Strongest", "https://pastefy.app/yufQmSto") end})
    G3:AddButton({Text = "41. Yusupii Objects", Func = function() LoadScript("Yusupii", "https://pastefy.app/7N4xV1vV/raw") end})
    G3:AddButton({Text = "42. XEN HUB", Func = function() LoadScript("XEN HUB", "https://raw.githubusercontent.com/chocolascript-glitch/XEN-HUB-PRIVATE-FREE/refs/heads/main/FREE-LEAKED") end})
    G3:AddButton({Text = "43. Colhg Hub", Func = function() LoadScript("Colhg Hub", "https://pastefy.app/ZUyNJfXz/raw") end})
    G3:AddButton({Text = "44. Unknown Protected 2", Func = function() LoadScript("Unknown 2", "https://orxl4-protector.com/api/raw?id=fr6o3pwv") end})
    G3:AddButton({Text = "45. Unknown Protected 3", Func = function() LoadScript("Unknown 3", "https://orxl4-protector.com/api/raw?id=xos71tz8") end})
    G3:AddButton({Text = "46. Fake Nile", Func = function() LoadScript("Fake Nile", "https://voidedx.vercel.app/api/raw?id=vx_7b2vi1kq") end})
    G3:AddButton({Text = "47. Piyap", Func = function() LoadScript("Piyap", "https://rawscripts.net/raw/Fling-Things-and-People-Piyap-224349") end})
    G3:AddButton({Text = "48. Missile Controller", Func = function() LoadScript("Missile", "https://rawscripts.net/raw/Fling-Things-and-People-Ftap-missile-controller-226731") end})
    G3:AddButton({Text = "49. XERON RRTS", Func = function() LoadScript("XERON RRTS", "https://raw.githubusercontent.com/qwerqwerg1u/RRTS/main/XERON") end})
    G3:AddButton({Text = "50. LuauForge Antiraw", Func = function() LoadScript("LuauForge", "https://luauforge-antiraw.netlify.app/raw/v06-b-kh-fGYTlfu9BaAYfeVMN2ujFag") end})
    G3:AddButton({Text = "51. Kazbek Loader", Func = function() LoadScript("Kazbek Loader", "https://paste.c-net.org/LoadingYuppie") end})
    G3:AddButton({Text = "52. Echo Crack", Func = function() LoadScript("Echo Crack", "https://gist.github.com/kashnguyen/8f6279f7231d58f59df3bd3bc6d13159/raw/7ad22146054319a198ec4b884f4dbf8af92b59f6/gistfile1.txt") end})

    -- ПРАВАЯ КОЛОНКА — 53-70
    local G4 = T.Scripts:AddRightGroupbox(L.G_53)
    G4:AddButton({Text = "53. Hui Hub", Func = function() LoadScript("Hui Hub", "https://pastefy.app/UhDb2KF3/raw") end})
    G4:AddButton({Text = "54. Velocy", Func = function() LoadScript("Velocy", "https://rawscripts.net/raw/Fling-Things-and-People-Velocy-220820") end})
    G4:AddButton({Text = "55. Vertex Hub", Func = function() LoadScript("Vertex", "https://raw.smokingscripts.org/vertex.lua") end})
    G4:AddButton({Text = "56. Xhub Protected", Func = function() LoadScript("Xhub", "https://orxl4-protector.com/api/raw?id=oh4zhgp9") end})
    G4:AddButton({Text = "57. Resonance v2.9", Func = function() LoadScript("Resonance v2.9", "https://scriptblox.com/raw/Fling-Things-and-People-Resonanse-V2.9-231838") end})
    G4:AddButton({Text = "58. F5 Hub", Func = function() LoadScript("F5 Hub", "https://luauforge-antiraw.netlify.app/raw/6ymgzbUKcgfBmXSKnTZ35LF") end})
    G4:AddButton({Text = "59. KT FTAP HUB", Func = function() LoadScript("KT FTAP", "https://gist.githubusercontent.com/giak11812-cyber/06f5de8d2d39e1b614c3eb193fb88f68/raw/1fdf95f6b857b4972dc008b67c7af8fb67fcb3c1/KT%2520FTAP%2520HUB") end})
    G4:AddButton({Text = "60. Neil 1V", Func = function() LoadScript("Neil", "https://ckrwtnhtbq-d5b6b.xemlo136.workers.dev/") end})
    G4:AddButton({Text = "61. Mystery Hub", Func = function() LoadScript("Mystery Hub", "https://pastefy.app/Hi8dv1vo/raw") end})
    G4:AddButton({Text = "62. PvP Script", Func = function() LoadScript("PvP Script", "https://pastefy.app/oqReowQ/raw") end})
    G4:AddButton({Text = "63. Custom Script", Func = function() LoadScript("Custom Script", "https://pastefy.app/R5fzf0qD/raw") end})
    G4:AddButton({Text = "64. Dat9th5 Hub", Func = function() LoadScript("Dat9th5", "https://raw.githubusercontent.com/nyyvira315-pixel/script-ftap/refs/heads/main/make%20by%20dat9th5") end})
    G4:AddButton({Text = "65. Xocu Pre", Func = function() LoadScript("Xocu Pre", "https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Xocu-Script-(open-source-without-stealer)-227938") end})
    G4:AddButton({Text = "66. Rampage", Func = function() LoadScript("Rampage", "https://rawscripts.net/raw/Fling-Things-and-People-Rampage-90888") end})
    G4:AddButton({Text = "67. Polar Hub", Func = function() LoadScript("Polar Hub", "https://pastefy.app/XvFHRJph/raw") end})
    G4:AddButton({Text = "68. Universal Thingy", Func = function() LoadScript("Universal Thingy", "https://rawscripts.net/raw/Universal-Script-Fling-things-and-people-thingy-206157") end})
    G4:AddButton({Text = "69. FPV Drone", Func = function() LoadScript("FPV Drone", "https://scriptblox.com/raw/Universal-Script-Fpv-drone-universal-ONLY-PC-AND-XBOX-178162") end})
    G4:AddButton({Text = "70. Oblivion 3", Func = function() LoadScript("Oblivion 3", "https://gist.githubusercontent.com/safonovmaksim445-blip/806b7d7b2336bff34d974831aaf108de/raw/d0ff15c189191b1af376378464604e960727dfa3/3") end})

    -- ЛЕВАЯ КОЛОНКА — 71-90
    local G5 = T.Scripts:AddLeftGroupbox(L.G_71)
    G5:AddButton({Text = "71. Joy Hub", Func = function() LoadScript("Joy Hub", "https://orrxl4-protector.com/api/raw?id=b0ur1cra") end})
    G5:AddButton({Text = "72. ActivateScript", Func = function() LoadScript("ActivateScript", "https://raw.githubusercontent.com/sladkoeshkaogg-svg/ActivateScript/main/Script.lua") end})
    G5:AddButton({Text = "73. Paper Client", Func = function() LoadScript("Paper Client", "https://raw.githubusercontent.com/LuluFTAP/Scripts/refs/heads/main/paper%20client.lua") end})
    G5:AddButton({Text = "74. Wallhop 1", Func = function() LoadScript("Wallhop 1", "https://sweet-resonance-7780.wallhophub.workers.dev/") end})
    G5:AddButton({Text = "75. Wallhop 2", Func = function() LoadScript("Wallhop 2", "https://wallhophub.zyugy766554.workers.dev/") end})
    G5:AddButton({Text = "76. Katsura", Func = function() LoadScript("Katsura", "https://raw.githubusercontent.com/yuriajinteng86-ux/roblox-lua-Script/main/katsura.lua") end})
    G5:AddButton({Text = "77. NEXUS-FREE", Func = function() LoadScript("NEXUS", "https://gate.sirius.menu/gateway?id=sid_2j8441zuhmge") end})
    G5:AddButton({Text = "78. madebychayoo077", Func = function() LoadScript("chayoo077", "https://gate.sirius.menu/gateway?id=sid_9m2cgubuj2d8") end})
    G5:AddButton({Text = "79. FTAP Admin Watch", Func = function() LoadScript("Admin Watch", "https://raw.githubusercontent.com/Bruhiscrazy/codespaces-blank/refs/heads/main/FTAPadminwatch.lua") end})
    G5:AddButton({Text = "80. RuHub FTAP", Func = function() LoadScript("RuHub", "https://gitlab.com/cooldawghaha/gitlabswitch/-/raw/main/RuHubFTAP.lua") end})
    G5:AddButton({Text = "81. Tatumaki", Func = function() LoadScript("Tatumaki", "https://raw.githubusercontent.com/toiletgot/cat-hub/refs/heads/main/tatumaki") end})
    G5:AddButton({Text = "82. Koba Hub", Func = function() LoadScript("Koba Hub", "https://pastefy.app/HvoOK6e7/raw") end})
    G5:AddButton({Text = "83. ShadowEdits", Func = function() LoadScript("ShadowEdits", "https://gist.githubusercontent.com/shadowedits0508-cmyk/a21207b03d248aca12465f89aec3b7d6/raw/ae5ec3d8703f70a584d2b407063e1c642fc2165e/gistfile1.txt") end})
    G5:AddButton({Text = "84. Drift Kick", Func = function() LoadScript("Drift Kick", "https://pastefy.app/hkNDgyDh") end})
    G5:AddButton({Text = "85. Logger Detect", Func = function() LoadScript("Logger Detect", "https://raw.githubusercontent.com/jgmzhtyr7s-cyber/myscripts/main/ロガー検知") end})
    G5:AddButton({Text = "86. Shiritori", Func = function() LoadScript("Shiritori", "https://pastefy.app/nX6WT1oF/raw") end})
    G5:AddButton({Text = "87. Custom Char", Func = function() LoadScript("Custom Char", "https://kento-supabase-raw-v9.onrender.com/raw/1791611465593648") end})
    G5:AddButton({Text = "88. Pooophub Premium", Func = function() LoadScript("Pooophub Premium", "https://pastefy.app/a1YpQEyN") end})
    G5:AddButton({Text = "89. Zako Cheat", Func = function() LoadScript("Zako Cheat", "https://pastefy.app/ZUA73s8u/raw") end})
    G5:AddButton({Text = "90. Tanpopo Kick", Func = function() LoadScript("Tanpopo Kick", "https://pastefy.app/L7SLLE4c/raw") end})

    -- ПРАВАЯ КОЛОНКА — 91-104
    local G6 = T.Scripts:AddRightGroupbox(L.G_91)
    G6:AddButton({Text = "91. Sota Addon", Func = function() LoadScript("Sota", "https://pastefy.app/EFZxtmNy") end})
    G6:AddButton({Text = "92. FTAP Script 1", Func = function() LoadScript("FTAP 1", "https://pastefy.app/I6uYlqvn/raw") end})
    G6:AddButton({Text = "93. FTAP Script 2", Func = function() LoadScript("FTAP 2", "https://pastefy.app/KSvFWGk0/raw") end})
    G6:AddButton({Text = "94. FTAP Script 3", Func = function() LoadScript("FTAP 3", "https://pastefy.app/ICdI9GEv/raw") end})
    G6:AddButton({Text = "95. FTAP Script 4", Func = function() LoadScript("FTAP 4", "https://pastefy.app/etIUM5XE/raw") end})
    G6:AddButton({Text = "96. Saturn", Func = function() LoadScript("Saturn", "https://pastefy.app/LY2xJSd1") end})
    G6:AddButton({Text = "97. OP Katsura", Func = function() LoadScript("OP Katsura", "https://pastefy.app/h197E8UK/raw") end})
    G6:AddButton({Text = "98. Pre-ro PvP", Func = function() LoadScript("Pre-ro PvP", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=72a6aadb-c719-4e27-a57a-42a985434fbe") end})
    G6:AddButton({Text = "99. 22s Illusion", Func = function() LoadScript("22s Illusion", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=2a87a775-0cf9-48fe-be35-f24bd6c0b68a") end})
    G6:AddButton({Text = "100. AP Gift Visual", Func = function() LoadScript("AP Gift", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=86fd0326-66f4-49fc-8637-f331f391f08f") end})
    G6:AddButton({Text = "101. Ego's Script", Func = function() LoadScript("Ego's", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=29248a43-5ac3-4632-baf8-55037221b7a5") end})
    G6:AddButton({Text = "102. 000hub Duel", Func = function() LoadScript("000hub", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=f42a49cd-221c-420b-af2a-4935073a4fb0") end})
    G6:AddButton({Text = "103. Chili Hub", Func = function() LoadScript("Chili", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=31c3452b-4e8b-4ff6-bb25-56481bc40064") end})
    G6:AddButton({Text = "104. Miranda Hub", Func = function() LoadScript("Miranda", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=76ac81a5-5e51-46f8-9892-9b65bfd0fc83") end})

    -- ЛЕВАЯ КОЛОНКА — 105-118
    local G7 = T.Scripts:AddLeftGroupbox(L.G_105)
    G7:AddButton({Text = "105. Anti Lag Ice", Func = function() LoadScript("Anti Lag Ice", "https://msuelcjkfclhrnwuywte.supabase.co/functions/v1/get-paste?id=3d043acc-9fe0-4c62-ac6b-6cf9b5a5d071") end})
    G7:AddButton({Text = "106. Hacker Hub", Func = function() LoadScript("Hacker Hub", "https://raw.githubusercontent.com/hackerhub0624/hacker-hub-script/main/hackerhub.lua") end})
    G7:AddButton({Text = "107. Dandelion", Func = function() LoadScript("Dandelion", "https://pastefy.app/Mlkc3Zfr") end})
    G7:AddButton({Text = "108. Floor Kick", Func = function() LoadScript("Floor Kick", "https://pastefy.app/QcD3ldM5/raw") end})
    G7:AddButton({Text = "109. Aloe Hub", Func = function() LoadScript("Aloe Hub", "https://pastefy.app/egExeYyX/raw") end})
    G7:AddButton({Text = "110. Resonance Fake", Func = function() LoadScript("Resonance Fake", "https://orxl4-protector.com/api/raw?id=w8246kko") end})
    G7:AddButton({Text = "111. Nile DAVI", Func = function() LoadScript("Nile DAVI", "https://orxl4-protector.com/api/raw?id=cdipzow5") end})
    G7:AddButton({Text = "112. Animated Ground Kick", Func = function() LoadScript("Animated Ground Kick", "https://pastefy.app/aV20xRIz") end})
    G7:AddButton({Text = "113. Free Script", Func = function() LoadScript("Free Script", "https://orxl4-protector.com/api/raw?id=qfehhov1") end})
    G7:AddButton({Text = "114. Soclo", Func = function() LoadScript("Soclo", "https://raw.githubusercontent.com/anuraganing1/anura/refs/heads/main/soclo.lua") end})
    G7:AddButton({Text = "115. Resonance Opensource", Func = function() LoadScript("Resonance OS", "https://raw.githubusercontent.com/sixjdnesmsjnajsn-cmd/resonanase/refs/heads/main/resonanaseopensource.lua") end})
    G7:AddButton({Text = "116. Mercury Crack", Func = function() LoadScript("Mercury Crack", "https://pastefy.app/PTcKa7zg/raw") end})
    G7:AddButton({Text = "117. Clemon RC", Func = function() LoadScript("Clemon RC", "https://raw.githubusercontent.com/clemonlang/clemon_roclothes/refs/heads/main/ClemonRC.lua") end})
    G7:AddButton({Text = "118. Neo-FATS", Func = function() LoadScript("Neo-FATS", "https://raw.githubusercontent.com/MITTO-m4x/Neo-FATS/refs/heads/main/Neo-FATS.lua") end})

    -- ═══════════════════════════════════════════════════════════════
    -- ВКЛАДКА "НАСТРОЙКИ"
    -- ═══════════════════════════════════════════════════════════════
    local S1 = T.Settings:AddLeftGroupbox(L.Language)
    S1:AddButton({
        Text = L.LangBtn,
        Func = function()
            getgenv().RTOR_Lang = (currentLang == "EN") and "RU" or "EN"
            Library:Unload()
            task.wait(0.3)
            CreateMenu()
        end
    })

    local S2 = T.Settings:AddRightGroupbox(L.Keybind)
    S2:AddLabel(L.Keybind):AddKeyPicker("MenuKeybind", {
        Default = "RightShift",
        NoUI = true,
        Text = L.Keybind
    })
    S2:AddButton({
        Text = L.Unload,
        Func = function() Library:Unload() end
    })

    local S3 = T.Settings:AddLeftGroupbox("Info")
    S3:AddLabel(L.Cred)
    S3:AddLabel(L.Ver)
    S3:AddLabel(L.Hint)

    Library.ToggleKeybind = Options.MenuKeybind

    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({"MenuKeybind"})
    ThemeManager:SetFolder("RTOR_v17")
    SaveManager:SetFolder("RTOR_v17/Configs")
    ThemeManager:ApplyToTab(T.Settings)
    SaveManager:BuildConfigSection(T.Settings)

    Library:Notify({
        Title = "misk script",
        Description = (currentLang == "EN") and "118 scripts loaded in one tab | Lang: EN" or "118 скриптов в одной вкладке | Язык: RU",
        Time = 4
    })
end

CreateMenu()
