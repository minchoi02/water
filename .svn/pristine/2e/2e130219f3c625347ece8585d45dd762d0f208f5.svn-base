/**
 * Convert a single file-input element into a 'multiple' input list
 * Usage:
 *
 *   1. Create a file input element (no name)
 *      eg. <input type="file" id="first_file_element">
 *
 *   2. Create a DIV for the output to be written to
 *      eg. <div id="files_list"></div>
 *
 *   3. Instantiate a MultiSelector object, passing in the DIV and an (optional) maximum number of files
 *      eg. var multi_selector = new MultiSelector( document.getElementById( 'files_list' ), 3 );
 *
 *   4. Add the first element
 *      eg. multi_selector.addElement( document.getElementById( 'first_file_element' ) );
 */


function MultiSelector( list_target, max ){

	// File Extension Setter
	var fileTypes = '.zip, .egg, .jpg, .gif, .pdf, .hwp, .doc, .docx, .ppt, .pptx, .xls , .xlsx, .dwg'.replace(/ /g, "").split(",");

	// Where to write the list
	this.list_target = list_target;
	// How many elements?
	this.count = 0;
	// How many elements?
	this.id = 0;
	// Is there a maximum?
	if( max ){
		this.max = max;
	} else {
		this.max = -1;
	};

	/**
	 * Add a new file input element
	 */
	this.addElement = function( element ){

		// Make sure it's a file input element
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			// Element name -- what number am I?
			element.name = 'file_' + this.id++;

			// Add reference to this object
			element.multi_selector = this;

			// What to do when a file is selected
			element.onchange = function(){

				// File Extension Check
				var fileExt = getExtensionOfFilename(this.value);

				if(this.value.indexOf(',') >= 0){
				   alert("파일명에는 쉼표를 사용할수 없습니다.")
				   return;
				}

				if(fileTypes.indexOf(fileExt) < 0) {
				    alert('지원되지 않는 형식의 파일입니다.');
				    return;
				}

				// New file input
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';

				// Add new element
				this.parentNode.insertBefore( new_element, this );

				// Apply 'update' to element
				this.multi_selector.addElement( new_element );

				// Update list
				this.multi_selector.addListRow( this );

				// Hide this: we can't use display:none because Safari doesn't like it
				this.style.position = 'absolute';
				this.style.left = '-1000px';
				this.style.top = '-1000px';
				this.style.display = 'none';
				this.style.visibility = 'hidden';
				this.style.width = '0';
				this.style.height = '0';
				this.style.overflow = 'hidden';

				new_element.onkeypress = function(){
					return false;
				};

			};
			// If we've reached maximum number, disable input element
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			// Most recent element
			this.current_element = element;

		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};

	/**
	 * Add a new row to the list of files
	 */
	this.addListRow = function( element ){

		// Row div
		var new_row = document.createElement( 'div' );

		// Delete button
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'image';
		new_row_button.value = 'Delete';
		new_row_button.src = '/images/btn/bu5_close.gif';
		new_row_button.style= 'margin-left:4px';

		// References
		new_row.element = element;

		// Delete function
		new_row_button.onclick= function(){

			// Remove element from form
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Remove this row from the list
			this.parentNode.parentNode.removeChild( this.parentNode );

			// Decrement counter
			this.parentNode.element.multi_selector.count--;

			// Re-enable input element (if it's disabled)
			this.parentNode.element.multi_selector.current_element.disabled = false;

			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
//		new_row.innerHTML = element.value;
		new_row.innerHTML = element.value.split('/').pop().split('\\').pop();

		// Add button
		new_row.appendChild( new_row_button );

		// Add it to the list
		this.list_target.appendChild( new_row );
	};

	/**
	 * File extension name extract to filename
	 */
	function getExtensionOfFilename(filename) {
	    var _fileLen = filename.length;
	    var _lastDot = filename.lastIndexOf('.');
	    var _fileExt = filename.substring(_lastDot, _fileLen).toLowerCase();

	    return _fileExt;
	}


	/**
	 * Add a new file input element
	 */
	this.addElementWithSelect2 = function( element, select, select2 ){

		// Make sure it's a file input element
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			// Element name -- what number am I?
			element.name = 'file_' + this.id++;

			// Add reference to this object
			element.multi_selector = this;

			// What to do when a file is selected
			element.onchange = function(){

				var cateVal = select.options[select.options.selectedIndex].value;
				var textVal = select.options[select.options.selectedIndex].text;

				var cateVal2 = select2.options[select2.options.selectedIndex].value;
				var textVal2 = select2.options[select2.options.selectedIndex].text;

				// File Extension Check
				var fileExt = getExtensionOfFilename(this.value);
				if(fileTypes.indexOf(fileExt) < 0) {
					alert('지원되지 않는 형식의 파일입니다.');
					return;
				}

				// New file input
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';

				// Add new element
				this.parentNode.insertBefore( new_element, this );

				// Apply 'update' to element
				this.multi_selector.addElementWithSelect2( new_element, select, select2);

				// Update list
				this.multi_selector.addListRowWithSelect2( this , textVal, textVal2 );

				// Hide this: we can't use display:none because Safari doesn't like it
				this.style.position = 'absolute';
				this.style.left = '-1000px';
				this.style.top = '-1000px';
				this.style.display = 'none';
				this.style.visibility = 'hidden';
				this.style.width = '0';
				this.style.height = '0';
				this.style.overflow = 'hidden';

				this.name = this.name + "/" +  cateVal+ "/" +  cateVal2;

				new_element.onkeypress = function(){
					return false;
				};

			};
			// If we've reached maximum number, disable input element
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			// Most recent element
			this.current_element = element;

		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};
	/**
	 * Add a new file input element
	 */
	this.addElementWithSelect = function( element, select ){

		// Make sure it's a file input element
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			// Element name -- what number am I?
			element.name = 'file_' + this.id++;

			// Add reference to this object
			element.multi_selector = this;

			// What to do when a file is selected
			element.onchange = function(){

				var cateVal = select.options[select.options.selectedIndex].value;
				var textVal = select.options[select.options.selectedIndex].text;

				// File Extension Check
				var fileExt = getExtensionOfFilename(this.value);
				if(fileTypes.indexOf(fileExt) < 0) {
					alert('지원되지 않는 형식의 파일입니다.');
					return;
				}

				// New file input
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';

				// Add new element
				this.parentNode.insertBefore( new_element, this );

				// Apply 'update' to element
				this.multi_selector.addElementWithSelect( new_element, select );

				// Update list
				this.multi_selector.addListRowWithSelect( this , textVal );

				// Hide this: we can't use display:none because Safari doesn't like it
				this.style.position = 'absolute';
				this.style.left = '-1000px';
				this.style.top = '-1000px';
				this.style.display = 'none';
				this.style.visibility = 'hidden';
				this.style.width = '0';
				this.style.height = '0';
				this.style.overflow = 'hidden';

				this.name = this.name + "/" +  cateVal;

				new_element.onkeypress = function(){
					return false;
				};

			};
			// If we've reached maximum number, disable input element
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			// Most recent element
			this.current_element = element;

		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};

	/**
	 * Add a new row to the list of files
	 */
	this.addListRowWithSelect2 = function( element, textVal,textVal2 ){

		// Row div
		var new_row = document.createElement( 'div' );

		// Delete button
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'image';
		new_row_button.value = 'Delete';
		new_row_button.src = '/images/btn/bu5_close.gif';
		new_row_button.style= 'margin-left:4px';

		// References
		new_row.element = element;

		// Delete function
		new_row_button.onclick= function(){

			// Remove element from form
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Remove this row from the list
			this.parentNode.parentNode.removeChild( this.parentNode );

			// Decrement counter
			this.parentNode.element.multi_selector.count--;

			// Re-enable input element (if it's disabled)
			this.parentNode.element.multi_selector.current_element.disabled = false;

			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
//		new_row.innerHTML = element.value;
		new_row.innerHTML = "[" + textVal + "] [" + textVal2 + "] " + element.value.split('/').pop().split('\\').pop();

		// Add button
		new_row.appendChild( new_row_button );

		// Add it to the list
		this.list_target.appendChild( new_row );
	};
	/**
	 * Add a new row to the list of files
	 */
	this.addListRowWithSelect = function( element, textVal ){

		// Row div
		var new_row = document.createElement( 'div' );

		// Delete button
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'image';
		new_row_button.value = 'Delete';
		new_row_button.src = '/images/btn/bu5_close.gif';
		new_row_button.style= 'margin-left:4px';

		// References
		new_row.element = element;

		// Delete function
		new_row_button.onclick= function(){

			// Remove element from form
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Remove this row from the list
			this.parentNode.parentNode.removeChild( this.parentNode );

			// Decrement counter
			this.parentNode.element.multi_selector.count--;

			// Re-enable input element (if it's disabled)
			this.parentNode.element.multi_selector.current_element.disabled = false;

			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
//		new_row.innerHTML = element.value;
		new_row.innerHTML = "[" + textVal + "] " + element.value.split('/').pop().split('\\').pop();

		// Add button
		new_row.appendChild( new_row_button );

		// Add it to the list
		this.list_target.appendChild( new_row );
	};
};