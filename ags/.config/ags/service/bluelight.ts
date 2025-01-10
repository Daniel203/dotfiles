import { dependencies, sh } from "lib/utils"
import options from "options"

if (!dependencies("hyprsunset"))
    App.quit()

class BlueLight extends Service {
    static {
        Service.register( this, { }, {
            "enabled": ["boolean"],
        })
    }


    get enabled() {
        return options.bluelight.getValue();
    }

    // the setter has to be in snake_case too
    set enabled(enabled) {
        const command = enabled ? "hyprsunset -t 5000" : "killall -q hyprsunset"

        sh(command)
        console.log(options.bluelight.value)
        options.bluelight.value = enabled;
        console.log(options.bluelight.value)

        this.changed("enabled")
    }

    constructor() {
        super()

        sh("killall -q hyprsunset")

        this.enabled = options.bluelight.getValue();
        this.changed("enabled")
    }
}

export default new BlueLight
