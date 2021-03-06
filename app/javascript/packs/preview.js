if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', ()=>{
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob)=>{
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width', 100);
      blobImage.setAttribute('height', 100);
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', (e)=>{
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      // const imageContent = document.querySelectorAll('img');
      // if (imageContent){
      //   imageContent.remove();
      // }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}