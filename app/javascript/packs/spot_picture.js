document.addEventListener("DOMContentLoaded", function() {
  const spotPicture = document.querySelector('.spot_picture');

  if (spotPicture) {
    // 画像のロード完了を待つ
    spotPicture.addEventListener('load', function() {
      if (spotPicture.naturalHeight > spotPicture.naturalWidth) {
        spotPicture.style.objectFit = 'contain';
      } else {
        spotPicture.style.objectFit = 'cover';
      }
    });

    // すでに画像が読み込まれている場合
    if (spotPicture.complete) {
      spotPicture.dispatchEvent(new Event('load'));
    }
  }
});