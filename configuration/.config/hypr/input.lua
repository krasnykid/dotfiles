-- https://wiki.hypr.land/0.57.0/configuring/core/config-options/#input

hl.config({
    input = {
        kb_layout = "pl",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        sensitivity = 0,
        follow_mouse = 1,

        natural_scroll = true,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
})

-- https://wiki.hypr.land/0.57.0/configuring/core/binds/gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
