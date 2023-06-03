import axios from 'axios'

export function image2Base64(img) {
    var canvas = document.createElement("canvas");
    canvas.width = img.width;
    canvas.height = img.height;
    var ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0, img.width, img.height);
    var dataURL = canvas.toDataURL("image/png");
    return dataURL;
}

/**
 * 下载图片
 *
 * @param {Object} url
 */
export function DownloadImg(url) {
    let imageUrl = '';
    axios.get(url, { 
        responseType: 'blob',
        headers: {
            'Cache-Control': 'max-age=3600' // 设置缓存过期时间为1小时
        }
    }).then(response => {
        // 缓存图片
        imageUrl = URL.createObjectURL(response.data)
        // 将 imageUrl 存储到 Vue.js 组件的 data 属性中，供页面中的 <img> 标签使用
        //this.image = imageUrl
    })

    return imageUrl;
}