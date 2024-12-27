import { dependencies, sh } from "lib/utils"

if (!dependencies("hyprsunset"))
    App.quit()

class BlueLight extends Service {
    static {
        Service.register( this, { }, {
            "enabled": ["boolean"],
        })
    }

    #enabled = false

    get enabled() {
        return this.#enabled
    }

    // the setter has to be in snake_case too
    set enabled(enabled) {
        const command = enabled ? "hyprsunset -t 5000" : "killall -q hyprsunset"

        sh(command)

        this.#enabled = enabled
        this.changed("enabled")
    }

    constructor() {
        super()

        // Set default to false
        sh("killall -q hyprsunset")
        this.#enabled = false
        this.changed("enabled")
    }
}

export default new BlueLight
