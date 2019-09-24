//[Data Table Javascript]

//Project:	Crypto Admin - Responsive Admin Template
//Primary use:   Used only for the Data Table

$(function () {
    "use strict";

    
	/*
     * Custom Table functionality such as section toggling or checkable rows
     *
     * Codebase.helper('table-tools');
     *
     */

    // Table sections functionality
    var uiHelperTableToolsSections = function(){
        // For each table
        jQuery('.js-table-sections:not(.js-table-sections-enabled)').each(function(){
            var table = jQuery(this);

            // Add .js-table-sections-enabled class to tag it as activated
            table.addClass('js-table-sections-enabled');

            // When a row is clicked in tbody.js-table-sections-header
            jQuery('.js-table-sections-header > tr', table).on('click.cb.helpers', function(e) {
                if (e.target.type !== 'checkbox'
                        && e.target.type !== 'button'
                        && e.target.tagName.toLowerCase() !== 'a'
                        && !jQuery(e.target).parent('label').length) {
                    var row    = jQuery(this);
                    var tbody  = row.parent('tbody');

                    if ( ! tbody.hasClass('show')) {
                        jQuery('tbody', table).removeClass('show table-active');
                    }

                    tbody.toggleClass('show table-active');
                }
            });
        });
    };

	
/*
     */

    return {
        helper: function(helper) {
            switch (helper) {
                case 'table-tools':
                    uiHelperTableToolsSections();
                    uiHelperTableToolsCheckable();
                    break;
                default:
                    return false;
            }
        },
        helpers: function(helpers) {
            if (helpers instanceof Array) {
                for (var index in helpers) {
                    Codebase.helper(helpers[index]);
                }
            } else {
                Codebase.helper(helpers);
            }
        }
    };
});// End of use strict