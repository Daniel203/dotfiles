import "lib/session"
import "style/style"
import init from "lib/init"
import options from "options"
import Bar from "widget/bar/Bar"
import Launcher from "widget/launcher/Launcher"
import NotificationPopups from "widget/notifications/NotificationPopups"
import OSD from "widget/osd/OSD"
import Overview from "widget/overview/Overview"
import PowerMenu from "widget/powermenu/PowerMenu"
import ScreenCorners from "widget/bar/ScreenCorners"
import ScreenShotMenu from "widget/screenshot/ScreenShotMenu"
import SettingsDialog from "widget/settings/SettingsDialog"
import Verification from "widget/powermenu/Verification"
import { forMonitors } from "lib/utils"
import { setupQuickSettings } from "widget/quicksettings/QuickSettings"
import { setupDateMenu } from "widget/datemenu/DateMenu"
import Window from "widget/overview/Window"
const hyprland = await Service.import('hyprland')

const createWindows = () =>
    [
        ...forMonitors(Bar),
        ...forMonitors(NotificationPopups),
        ...forMonitors(ScreenCorners),
        ...forMonitors(OSD),
        Launcher(),
        Overview(),
        ScreenShotMenu(),
        PowerMenu(),
        SettingsDialog(),
        Verification(),
    ]
    .map(w => w.on("destroy", self => App.removeWindow(self)));

const recreateWindows = () => {
	for (const win of App.windows) {
		App.removeWindow(win);
	}
	App.config({ windows: createWindows() });
};

App.config({
    onConfigParsed: () => {
        setupQuickSettings()
        setupDateMenu()
        init()

        hyprland.connect("monitor-removed", () => {
            recreateWindows()
            setupQuickSettings()
            setupDateMenu()
            init()
        });
        hyprland.connect("monitor-added", () => {
            recreateWindows()
            setupQuickSettings()
            setupDateMenu()
            init()
        });
    },
    closeWindowDelay: {
        "launcher": options.transition.value,
        "overview": options.transition.value,
        "quicksettings": options.transition.value,
        "datemenu": options.transition.value,
    },
    windows: createWindows(),
})

