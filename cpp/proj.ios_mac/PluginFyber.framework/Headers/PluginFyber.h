/****************************************************************************

 Copyright (c) 2014-2015 Chukong Technologies

 ****************************************************************************/
#ifndef __PLUGIN_FYBER_H__
#define __PLUGIN_FYBER_H__

#include <string>
#include <map>

namespace sdkbox
{
    class FyberListener
    {
    public:
        //
        // Virtual Currency Connection Delegate
        //

        virtual void onVirtualCurrencyConnectorFailed(int error,
                                                      const std::string& errorCode,
                                                      const std::string& errorMsg) = 0;
        virtual void onVirtualCurrencyConnectorSuccess(double deltaOfCoins,
                                                       const std::string& currencyId,
                                                       const std::string& currencyName,
                                                       const std::string& transactionId) = 0;
        
        //
        // Interstitial
        //

        virtual void onCanShowInterstitial(bool canShowInterstitial) = 0;
        virtual void onInterstitialDidShow() = 0;
        virtual void onInterstitialDismiss(const std::string& reason) = 0;
        virtual void onInterstitialFailed() = 0;
        
        //
        // Brand Engage Client
        //
        
        virtual void onBrandEngageClientReceiveOffers(bool areOffersAvailable) = 0;
        virtual void onBrandEngageClientChangeStatus(int status, const std::string& msg) = 0;

        //
        // Offer Wall
        //
        
        virtual void onOfferWallFinish(int status) = 0;
    };

    class PluginFyber
    {
    public:
        /*!
         * initialize the plugin instance.
         */
        static void init();

        /**
         * Set listener to listen for fyber events
         */
        static void setListener(FyberListener* listener);

        /**
         * Get the listener
         */
        static FyberListener* getListener();

        /**
         * Remove the listener, and can't listen to events anymore
         */
        static void removeListener();

        /**
         * Presents the SponsorPay Mobile OfferWall as a child view controller of your own view controller.
         */
        static void showOfferWall(const std::string& placementId = "");
        
        /**
         * Queries the server for BrandEngage offers availability.
         */
        static void requestOffers(const std::string& placementId = "");
        /**
         * Starts running an available engagement.
         */
        static void showOffers();

        /**
         * Check if interstitial ads are available
         */
        static void requestInterstitial();
        /**
         * Shows an interstitial ad. Check first that one is ready to be shown with requestInterstitial.
         */
        static void showInterstitial();
        
        /**
         * Fetches the amount of a given currency earned since the last time this method was
         * invoked for the current user ID / app ID combination.
         */
        static void requestDeltaOfCoins(const std::string& currencyId = "");
    };
}

#endif
