const detaultAvatar = require('@/assets/image/detault-avatar.jpg')

// 根级别的 state
const state = {
    socketStatus: false,
    website_name: process.env.VUE_APP_WEBSITE_NAME,
    copyright: `©2022 - 2022 ${process.env.VUE_APP_WEBSITE_NAME} 在线聊天 <a href="https://beian.miit.gov.cn/" style="color: #777272;font-weight: 400;" target="_blank">沪ICP备2022011396号-1</a>`,

    // 头像加载失败后的默认头像
    detaultAvatar: "this.src='" + detaultAvatar + "'",
}

export default state