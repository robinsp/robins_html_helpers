if ( Object.isUndefined(RobinsHtmlHelpers) ) { 
	var RobinsHtmlHelpers = { } 
}

RobinsHtmlHelpers.FormFieldHint = Class.create ({
	initialize: function(element, hint, hintClass) {
		this.element = $(element);	
		this.hintText = hint;
		this.hintClass = hintClass;
		this.hintState = false;
		this.showHintWhenBlank();
		this.initEventHandlers();
	},
	initEventHandlers: function() {
		this.onFocusHandler = this.onFocus.bind(this);
		this.element.observe("focus", this.onFocusHandler);
		
		this.onBlurHandler = this.onBlur.bind(this);
		this.element.observe("blur", this.onBlurHandler);
		
		this.onSubmitHandler = this.onSubmit.bind(this);
		this.element.up('form').observe("submit", this.onSubmitHandler);
	},
	showHintWhenBlank: function() {
		if ($F(this.element).empty() ) {
			this.element.value = this.hintText;
		}
		
		this.hintState = ( $F(this.element) == this.hintText );
		
		if (this.hintState) {
			this.element.addClassName(this.hintClass);
		}
		else {
			this.element.removeClassName(this.hintClass);
		}
	},
	onFocus: function() {
		this.element.removeClassName(this.hintClass);
		if( this.hintState )
			this.element.select();
	},
	onBlur: function() {
		this.showHintWhenBlank();
	},
	onSubmit: function() {
		if(this.hintState) 
			this.element.value = null;
	}
});
