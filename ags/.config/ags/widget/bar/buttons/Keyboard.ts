import PanelButton from "../PanelButton"

const hyprland = await Service.import("hyprland");

function getmap() {
    const lang = Utils.exec(
        `bash -c "hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap'"`
    );

    if (lang.includes("Dvorak")) {
        return "DV"
    }

    return "US"
}

export default() => PanelButton({
    window: "keyboard",
    cursor: "pointer",
    child: Widget.Label({
        label: Utils.watch(getmap(), hyprland, "keyboard-layout", () => getmap()),
    }),
    on_clicked: () => {
        Utils.execAsync(`bash -c "hyprctl switchxkblayout all next"`);
    },
});

