/*
* Clear Default Text: functions for clearing and replacing default text in
* <input> elements.
*
* by Ross Shannon, http://www.yourhtmlsource.com/
* Migrated to prototype 1.7.0 by @fjguzman
*/

document.observe("dom:loaded", function() {
    function clearDefaultText(e) {
        if (this.getValue() == this.defaultText)
            this.value="";
    }

    function replaceDefaultText(e) {
        if (this.getValue() == '' && this.defaultText)
            this.value = this.defaultText
    }

    $$("input[type='text']").each(function(input, index) {
        if(!input.hasClassName('cleardefault'))
          return;

        input.observe('focus', clearDefaultText).observe('blur', replaceDefaultText);

        /* Save the current value */
        if (input.getValue() != '')
            input.defaultText = input.getValue()
    });
});