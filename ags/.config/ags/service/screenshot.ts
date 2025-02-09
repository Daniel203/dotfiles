import GLib from "gi://GLib"
import icons from "lib/icons"
import { dependencies, sh, bash } from "lib/utils"

const now = () => GLib.DateTime.new_now_local().format("%Y-%m-%d_%H-%M-%S")

class ScreenShot extends Service {
    static {
        Service.register(this, {}, { })
    }

    #screenshots = Utils.HOME + "/Pictures/Screenshots"
    #file = ""

    async screenshot(target = "output") {
        if (!dependencies("hyprshot"))
            return

        const file = `${now()}.png`
        const full_path = `${this.#screenshots}/${file}`;
        Utils.ensureDirectory(this.#screenshots)

        await sh(`hyprshot -m ${target} -o ${this.#screenshots} -f ${file} -s`);

        Utils.notify({
            image: full_path,
            summary: "Screenshot",
            body: file,
            actions: {
                "Show in Files": () => {
                    if (dependencies("nautilus"))
                        sh(`nautilus ${this.#screenshots}`)
                    else
                        sh(`xdg-open ${this.#screenshots}`)
                },
                "View": () => {
                    if (dependencies("nautilus"))
                        sh(`xdg-open ${full_path}`)
                    else
                        sh(`xdg-open ${full_path}`)
                },
                "Edit": () => {
                    if (dependencies("swappy"))
                        sh(`swappy -f ${full_path}`)
                },
            },
        })
    }
}

export default new ScreenShot

