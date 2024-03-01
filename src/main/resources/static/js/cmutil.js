/**
 * 
 */

console.log('cmutil.js import');

var lut = []; 
for (var i=0; i<256; i++) { lut[i] = (i<16?'0':'')+(i).toString(16); }
function uuid() {
	var d0 = Math.random()*0xffffffff|0;
	var d1 = Math.random()*0xffffffff|0;
	var d2 = Math.random()*0xffffffff|0;
	var d3 = Math.random()*0xffffffff|0;
	return lut[d0&0xff]+lut[d0>>8&0xff]+lut[d0>>16&0xff]+lut[d0>>24&0xff]+'-'+
		lut[d1&0xff]+lut[d1>>8&0xff]+'-'+lut[d1>>16&0x0f|0x40]+lut[d1>>24&0xff]+'-'+
		lut[d2&0x3f|0x80]+lut[d2>>8&0xff]+'-'+lut[d2>>16&0xff]+lut[d2>>24&0xff]+
		lut[d3&0xff]+lut[d3>>8&0xff]+lut[d3>>16&0xff]+lut[d3>>24&0xff];
}

function isNull(str) {
	if(str == null || str == undefined) {
		return true;
	} else {
		return false;
	}
}

function isBlank(str) {
	if(isNull(str)) {
		return true;
	}

	if(str.trim().length == 0) {
		return true;
	}
	
	return false;
}

function isValid(ctl) {
	
	if(ctl == null || ctl == undefined) {
		return false;
	}
	
	var str = ctl.val();
	
	if(str.trim().length == 0){
		ctl.focus(); 
		return false;
	}
	
	return true;
}
