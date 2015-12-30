
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    dump("sdkbox-fyber init")

    -- fyber init
    local coinsLabel
    local coins = 0
    local fyber = sdkbox.PluginFyber
    fyber:init()
    fyber:setListener(function(args)
            dump(args, "sdkbox-fyber callback")

            local eventname = args.name
            if eventname == "onOfferWallFinish" then
            elseif eventname == "onVirtualCurrencyConnectorFailed" then
            elseif eventname == "onVirtualCurrencyConnectorSuccess" then
                coins = coins + args.coins
                coinsLabel:setString(coins .. " " + args.currencyname)
            elseif eventname == "onCanShowInterstitial" then
                if args.available then
                    fyber:showInterstitial()
                end
            elseif eventname == "onInterstitialDidShow" then
            elseif eventname == "onInterstitialDismiss" then
            elseif eventname == "onInterstitialFailed" then
            elseif eventname == "onBrandEngageClientReceiveOffers" then
                if args.available then
                    fyber:showOffers()
                end
            elseif eventname == "onBrandEngageClientChangeStatus" then
            elseif eventname == "onOfferWallFinish" then
                --todo
            end
        end)

    -- ui

    cc.MenuItemFont:setFontName("Arial")
    cc.Menu:create(
                   cc.MenuItemFont:create("requestInterstitial"):onClicked(function()
                        print("sdkbox-fyber requestInterstitial")
                        fyber:requestInterstitial()
                    end),
                   cc.MenuItemFont:create("showOfferWall"):onClicked(function()
                        print("sdkbox-fyber showOfferWall");
                        fyber:showOfferWall();
                    end),
                   cc.MenuItemFont:create("request offers"):onClicked(function()
                        print("[Fyber] request offers");
                        fyber:requestOffers("rmb");
                    end),
                   cc.MenuItemFont:create("requestDeltaOfCoins"):onClicked(function()
                        print("[Fyber] requestDeltaOfCoins");
                        fyber:requestDeltaOfCoins("rmb");end)
                   )
        :move(display.cx, display.cy)
        :addTo(self)
        :alignItemsVerticallyWithPadding(20)
    coinsLabel = cc.Label:createWithSystemFont(coins .. " coins", "Arial", 64)
    coinsLabel:setPosition(display.cx, 100)
    coinsLabel:addTo(self)
end

return MainScene
