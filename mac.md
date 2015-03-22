#Key binding
Seil - https://pqrs.org/osx/karabiner/seil.html
Karabiner - https://pqrs.org/osx/karabiner/
How to map hyper to Casp Lock - http://leancrew.com/all-this/2012/11/shift-control-option-command-on-caps-lock/
<?xml version="1.0"?>
<root>
<item>
    <name>Remap Caps Lock to Hyper</name>
    <appendix>OS X doesn't have a Hyper. This maps Left Control to Control + Shift + Option + Command.</appendix>

    <identifier>caps_lock_to_hyper</identifier>

    <autogen>
        --KeyToKey--
        KeyCode::F19,

        KeyCode::COMMAND_L,
        ModifierFlag::OPTION_L | ModifierFlag::CONTROL_L
    </autogen>
</item>
</root>
