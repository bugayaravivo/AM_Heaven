// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});


// 新しい initMap 関数
let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const { Marker } = await google.maps.importLibrary("marker");

  // ビューから緯度と経度を取得
  const mapElement = document.getElementById("map");
  const lat = parseFloat(mapElement.getAttribute("data-lat"));
  const lng = parseFloat(mapElement.getAttribute("data-lng"));

  // 緯度と経度を使ってマップの中心を設定
  map = new Map(mapElement, {
    center: { lat: lat, lng: lng },
    zoom: 15,
    mapTypeControl: false
  });

  // マーカーを地図に追加
  new Marker({
    position: { lat: lat, lng: lng },
    map: map,
  });
}

initMap();
