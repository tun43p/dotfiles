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

  if (term === "ghostty") return "com.mitchellh.ghostty";

  return "com.apple.Terminal";
};

const getAudio = (name: string): string => {
  return `${Bun.env.HOME}/.config/opencode/assets/audio/${name}.aiff`;
};

export const NotificationsPlugin: Plugin = async ({ $ }) => {
  const activateApp = getActivateApp();

  const notify = async (message: string, sound: string) => {
    await $`terminal-notifier -title OpenCode -message ${message} -activate ${activateApp}; afplay ${getAudio(sound)} `.nothrow();
  };

  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await notify("Travail terminé.", "done");
      }

      if (event.type === "session.error") {
        await notify("Une erreur est survenue.", "error");
      }
    },

    "permission.asked": async () => {
      await notify("Permission requise.", "ping");
    },
  };
};
