import PanelButton from "../PanelButton"
import screenrecord from "service/screenrecord"
import icons from "lib/icons"

const { action } = options.bar.screenshot

export default () => PanelButton({
    window: "screenshotmenu",
    cursor: "pointer",
    on_clicked: action.bind(),
    child: Widget.Icon("applets-screenshooter-symbolic"),
})
