{...}: {
  programs.firefox.enable = true;
  programs.chromium = {
    enable = true;

    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "https://www.google.com/search?q={searchTerms}";
    defaultSearchProviderSuggestURL = "https://www.google.com/complete/search?output=chrome&q={searchTerms}";

    extraOpts = {
      "DefaultSearchProviderName" = "Google";
      "DefaultSearchProviderKeyword" = "google.com";
      "RestoreOnStartup" = 5;
      "NewTabPageLocation" = "about:blank";
    };
  };
}
