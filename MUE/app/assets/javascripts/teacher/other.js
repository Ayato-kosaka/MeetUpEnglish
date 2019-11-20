
//google map
function initMap(){
  // geocoderを初期化
  var marker
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.566733, lng: 139.40289},
    zoom: 14,
  });
  google.maps.event.addListener(map, 'click', function(e){// if map is clicked
    markAndMove(e.placeId, e.latLng);
  });
  // placeAIPを初期化
  service = new google.maps.places.PlacesService(map);
}


//オートコンプリートのオプション
function initAutocomplete() {
  //対応させるテキストボックス
  var input = document.getElementById('address');
  //プレイスを検索する領域 => japan
  var LatLngFrom = new google.maps.LatLng(35.692195,139.7576653);
  var LatLngTo   = new google.maps.LatLng(35.696157,139.7525771);
  var bounds = new google.maps.LatLngBounds(LatLngFrom, LatLngTo);
  //オートコンプリートのオプション
  var options = {
      types: ['establishment'],                      // 検索タイプ
      bounds: bounds,                            // 範囲優先検索
      componentRestrictions: {country: 'jp'}     // 日本国内の住所のみ
  };
  autocomplete = new google.maps.places.Autocomplete( input, options);
  autocomplete.addListener('place_changed', function() {
    codeAddress(this.gm_accessors_.place.Yc.m)
  });
}


//geocoding
function codeAddress(arg){

  // 入力を取得
  let inputAddress = arg
  if (!inputAddress){
    inputAddress = document.getElementById('address').value;
  }

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      // map.setCenterで地図が移動
      let placeId = results[0].place_id;
      let location = results[0].geometry.location;
      markAndMove(placeId, location);
      service.getDetails({placeId: placeId, fields: ['name']}, function (place, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
        }
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function markAndMove(placeId, location){
  map.setCenter(location);
  map.setZoom(17);
  // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
  if(typeof marker !== 'undefined') marker.setMap(null);
  marker = new google.maps.Marker({
    map: map,
    place: {
      placeId: placeId,
      location: location
    }
  });
  arg_post_create =  "post_to_create_new_place(" + "\"" + placeId + "\")"
  $('#selected_place').html("<input type='button' value='create' onclick='" + arg_post_create +"'>")
}


function post_to_create_new_place(placeId){
  var json = {
    "placeId": placeId
  }
  $.post( '/teacher/create_my_place', json )
}
