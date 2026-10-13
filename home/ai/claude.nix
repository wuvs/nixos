{inputs, ...}: {
  programs.claude-code = {
    enable = true;
    settings = {
      includeCoAuthoredBy = false;
      awaySummaryEnabled = false;
      theme = "custom:noctalia";
      feedbackSurveyRate = 0;
      env = {
        CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1";
        CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
      };
    };
    skills.rust-skills = "${inputs.rust-skills}";
  };
}
