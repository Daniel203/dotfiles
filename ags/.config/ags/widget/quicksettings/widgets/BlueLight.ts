import { SimpleToggleButton } from "../ToggleButton"
import icons from "lib/icons"
import bluelight from "service/bluelight"


const icon = () => bluelight.enabled
    ? icons.bluelight.enabled
    : icons.bluelight.disabled

const label = () => bluelight.enabled ? "Enabled" : "Disabled"

export const BlueLightToggle = () => SimpleToggleButton({
    icon: Utils.watch(icon(), bluelight, icon),
    label: Utils.watch(label(), bluelight, label),
    toggle: () => bluelight.enabled = !bluelight.enabled,
    connection: [bluelight, () => bluelight?.enabled || false],
})
