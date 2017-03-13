/**
 * @author jmccarthy
 */
  var ImageArr1 = new Array("farmers-market-produce-2-edited1.jpg","field2.jpg","happy_farmer2.jpg","apple_unpicked2.jpg");
  
  function RotateImages(whichHolder,Start)
  {
  	var a = "ImageArr1";
  	var b = document.getElementById('Rotating1');
  	if(Start>=4)
  		Start=0;
  	b.src = "../assets/" + ImageArr1[Start];
  	window.setTimeout("RotateImages("+whichHolder+","+(Start+1)+")",3000);
  }