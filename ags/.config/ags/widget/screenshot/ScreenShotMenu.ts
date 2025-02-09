import PopupWindow from "widget/PopupWindow"
import options from "options"
import { sh } from "lib/utils"
import screenshot from "service/screenshot"

export default () => PopupWindow({
    name: "screenshotmenu",
    child: Widget.Box({
        vertical: true,
        children: [
            Widget.Button({
                on_clicked: () => {
                    App.closeWindow("screenshotmenu")
                    screenshot.screenshot("output")
                },
                label: "Screen"
            }),
            Widget.Button({
                on_clicked: () => {
                    App.closeWindow("screenshotmenu")
                    screenshot.screenshot("window")
                },
                label: "Window"
            }),
            Widget.Button({
                on_clicked: () => {
                    App.closeWindow("screenshotmenu")
                    screenshot.screenshot("region")
                },
                label: "Region"
            }),
        ]
    })
})
