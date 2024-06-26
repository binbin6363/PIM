import { post, get, upload } from '@/utils/request'

// 上传头像裁剪图片服务接口
export const ServeUploadAvatar = data => {
  return post('/api/v1/upload/avatar', data)
}

// 查询大文件拆分信息服务接口
export const ServeFindFileSplitInfo = (data = {}) => {
  return post('/api/v1/upload/multipart/initiate', data)
}

// 文件拆分上传服务接口
export const ServeFileSubareaUpload = (data = {}, options = {}) => {
  return upload('/api/v1/upload/multipart', data, options)
}

// 获取图片base64
export const DownImgBase64 = data => {
  return get('/api/v1/download/img', data)
}
