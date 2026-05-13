import type { Plugin } from "@opencode-ai/plugin";

const getActivateApp = (): string => {
  if (
    Bun.env.VSCODE_PID ||
    Bun.env.VSCODE_INJECTION ||
    Bun.env.TERM_PROGRAM === "vscode"
  ) {
    return "com.microsoft.VSCode";
  }
  const term = Bun.env.TERM_PROGRAM ?? "";
  if (term === "iTerm.app") return "com.googlecode.iterm2";
  if (term === "ghostty") return "com.mitchellh.ghostty";
  return "com.apple.Terminal";
};

export const NotificationsPlugin: Plugin = async ({ $ }) => {
  const activateApp = getActivateApp();

  const notify = async (message: string, sound: string) => {
    await $`terminal-notifier -title OpenCode -message ${message} -sound ${sound} -activate ${activateApp}`.nothrow();
  };

  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await notify("Attend ta reponse.", "Glass");
      }

      if (event.type === "session.error") {
        await notify("Une erreur est survenue.", "Basso");
      }
    },

    "permission.asked": async () => {
      await notify("Permission requise.", "Ping");
    },
  };
};
