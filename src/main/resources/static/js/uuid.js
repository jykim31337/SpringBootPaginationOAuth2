console.log('uuid.js import');

/*
                  Desktop   Android
           broofa: 1617ms   12869ms
               e1:  636ms    5778ms
               e2:  606ms    4754ms
               e3:  364ms    3003ms
               e4:  329ms    2015ms
               e5:  147ms    1156ms
               e6:  146ms    1035ms
               e7:  105ms     726ms
             guid:  962ms   10762ms
generateQuickGuid:  292ms    2961ms
  - Note: 500k iterations, results will vary by browser/CPU.
*/
function uuid1() {
	var u='',i=0;
	while(i++<36) {
		var c='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'[i-1],r=Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
		u+=(c=='-'||c=='4')?c:v.toString(16)
	}
	return u;
}


function uuid2() {
	var u='',m='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',i=0,rb=Math.random()*0xffffffff|0;
	while(i++<36) {
		var c=m[i-1],r=rb&0xf,v=c=='x'?r:(r&0x3|0x8);
		u+=(c=='-'||c=='4')?c:v.toString(16);rb=i%8==0?Math.random()*0xffffffff|0:rb>>4
	}
	return u
}


function uuid3() {
	var l='0123456789abcdef';
	var m='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx';
	var u='',i=0,rb=Math.random()*0xffffffff|0;
	while(i++<36) {
		var c=m[i-1],r=rb&0xf,v=c=='x'?r:(r&0x3|0x8);
		u+=(c=='-'||c=='4')?c:l[v];rb=i%8==0?Math.random()*0xffffffff|0:rb>>4
	}
	return u
}


function uuid4() {
	var h=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
	var k=['x','x','x','x','x','x','x','x','-','x','x','x','x','-','4','x','x','x','-','y','x','x','x','-','x','x','x','x','x','x','x','x','x','x','x','x'];
	var u='',i=0,rb=Math.random()*0xffffffff|0;
	while(i++<36) {
		var c=k[i-1],r=rb&0xf,v=c=='x'?r:(r&0x3|0x8);
		u+=(c=='-'||c=='4')?c:h[v];rb=i%8==0?Math.random()*0xffffffff|0:rb>>4
	}
	return u
}


var lut = []; 
for (var i=0; i<256; i++) { lut[i] = (i<16?'0':'')+(i).toString(16); }
function uuid5() {
	var k=['x','x','x','x','-','x','x','-','4','x','-','y','x','-','x','x','x','x','x','x'];
	var u='',i=0,rb=Math.random()*0xffffffff|0;
	while(i++<20) {
		var c=k[i-1],r=rb&0xff,v=c=='x'?r:(c=='y'?(r&0x3f|0x80):(r&0xf|0x40));
		u+=(c=='-')?c:lut[v];rb=i%4==0?Math.random()*0xffffffff|0:rb>>8
	}
	return u
}


var lut = []; 
for (var i=0; i<256; i++) { lut[i] = (i<16?'0':'')+(i).toString(16); }
function uuid6() {
	var k=['x','x','-','x','-','4','-','y','-','x','x','x'];
	var u='',i=0,rb=Math.random()*0xffffffff|0;
	while(i++<12) {
		var c=k[i-1],r=rb&0xffff,v=c=='x'?r:(c=='y'?(r&0x3fff|0x8000):(r&0xfff|0x4000));
		u+=(c=='-')?c:(lut[v>>8]+lut[v&0xff]);rb=i&1?rb>>16:Math.random()*0xffffffff|0
	}
	return u
}


var lut = []; 
for (var i=0; i<256; i++) { lut[i] = (i<16?'0':'')+(i).toString(16); }
function uuid7() {
	var d0 = Math.random()*0xffffffff|0;
	var d1 = Math.random()*0xffffffff|0;
	var d2 = Math.random()*0xffffffff|0;
	var d3 = Math.random()*0xffffffff|0;
	return lut[d0&0xff]+lut[d0>>8&0xff]+lut[d0>>16&0xff]+lut[d0>>24&0xff]+'-'+
		lut[d1&0xff]+lut[d1>>8&0xff]+'-'+lut[d1>>16&0x0f|0x40]+lut[d1>>24&0xff]+'-'+
		lut[d2&0x3f|0x80]+lut[d2>>8&0xff]+'-'+lut[d2>>16&0xff]+lut[d2>>24&0xff]+
		lut[d3&0xff]+lut[d3>>8&0xff]+lut[d3>>16&0xff]+lut[d3>>24&0xff];
}

function uuid_simple() {
	return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
		return v.toString(16);
	});
}
	
function uuid_explain() {
	
	var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(replaceChar) {
		
		var rand = Math.random();
		
		var r = rand * 16 | 0;
		var v;
		if(replaceChar == 'x') {
			v = r;
		} else {
			v = (r & 0x3 | 0x8);
		}
		
		var result = v.toString(16);
		
		return result;
	});
	
	return uuid; 
}