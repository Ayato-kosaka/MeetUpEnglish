



/*
mapを関数の外で定義(codeAddressでも使うため)
geocoderを用意
*/

let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.566733, lng: 139.40289},
    zoom: 14,
  });
  google.maps.event.addListener(map, 'click', function(e){// if map is clicked
    alert(!!e.placeId);
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
window.onload = initAutocomplete;


//geocoding
function codeAddress(arg){

  // 入力を取得
  let inputAddress = arg
  // console.log("addess is "+ arg)
  // console.log("name1 is "+ arg.split(',').pop())//.popは元の配列を壊す->array[array.length - 1]
  // console.log("name2 is "+ arg.split(',')[0])
  if (!inputAddress){
    inputAddress = document.getElementById('address').value;
  }

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      // map.setCenterで地図が移動
      let placeId = results[0].place_id;
      let location = results[0].geometry.location;
      map.setCenter(location);
      map.setZoom(17);
      // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
      var marker = new google.maps.Marker({
        map: map,
        place: {
          placeId: placeId,
          location: location
        }
      });
      service.getDetails({placeId: placeId, fields: ['name', 'website']}, function (place, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
          arg_post_create = "'" + placeId + "','" + location.lat() + "','" + location.lng() + "','" + place.name + "'"
          $('#selected_place').append("<div><p>" + place.name + "</p>" + "<p>" + results[0].formatted_address
            + "</p></div><input type='button' value='Create' onclick=\"post_teacher_createPlace_other(" + arg_post_create + ")\">")
        }
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function post_teacher_createPlace_other (placeId, lat, lng, english_place_name) {
  str =  'placeId=' + placeId + '&lat=' + lat + '&lng=' + lng + '&english_place_name=' + english_place_name
  $.post( '/teacher/create_my_place', str )
}
