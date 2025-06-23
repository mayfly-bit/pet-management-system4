# 🚀 Chrome版本部署指南

这是宠物管理系统Chrome版本的详细部署说明。

## 📦 项目文件说明

此文件夹包含完整的Flutter Web构建输出，可直接部署到任何静态托管平台。

### 核心文件
- `index.html` - 主页面入口
- `main.dart.js` - Flutter应用核心代码 (3.7MB)
- `flutter_bootstrap.js` - Flutter启动脚本
- `vercel.json` - Vercel部署配置
- `manifest.json` - PWA配置

### 资源文件  
- `assets/` - 应用资源和字体
- `canvaskit/` - Canvas渲染引擎
- `icons/` - 应用图标
- `favicon.png` - 网站图标

## 🌐 Vercel部署 (推荐)

### 方法1: GitHub连接部署
1. **上传到GitHub**
   ```bash
   # 运行部署脚本
   deploy.bat
   
   # 或手动执行
   git init
   git add .
   git commit -m "宠物管理系统Chrome版本"
   git remote add origin YOUR_REPO_URL
   git push -u origin main
   ```

2. **连接Vercel**
   - 访问 [vercel.com](https://vercel.com)
   - 点击 "New Project"
   - 选择您的GitHub仓库
   - 配置设置：
     - Framework Preset: `Other`
     - Build Command: 留空
     - Output Directory: `.`
   - 点击 "Deploy"

### 方法2: 拖拽部署
1. 将整个 `pet_management_web` 文件夹压缩为ZIP
2. 访问 [vercel.com](https://vercel.com)
3. 直接拖拽ZIP文件到Vercel界面
4. 自动部署完成

## 🔧 其他平台部署

### Netlify
1. 拖拽文件夹到 [netlify.com](https://netlify.com)
2. 或连接GitHub仓库
3. 构建设置：
   - Build command: (留空)
   - Publish directory: `.`

### GitHub Pages
1. 上传文件到GitHub仓库
2. 在仓库设置中启用GitHub Pages
3. 选择源分支为 `main`
4. 选择文件夹为 `/` (root)

### Firebase Hosting
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
# 选择现有项目或创建新项目
# Public directory: .
# Single-page app: Yes
firebase deploy
```

## 📊 性能优化建议

### 缓存配置
vercel.json已配置了最优缓存策略：
- JavaScript文件：1年缓存
- 静态资源：长期缓存
- HTML文件：动态缓存

### CDN加速
- 建议启用CDN分发
- 开启Gzip压缩
- 启用Brotli压缩

### 监控配置
```javascript
// 添加到index.html的<head>中
<script>
  // Google Analytics
  gtag('config', 'GA_MEASUREMENT_ID');
  
  // Web Vitals监控
  import {getCLS, getFID, getFCP, getLCP, getTTFB} from 'web-vitals';
  getCLS(console.log);
  getFID(console.log);
  getFCP(console.log);
  getLCP(console.log);
  getTTFB(console.log);
</script>
```

## 🔧 故障排除

### 常见问题

1. **白屏问题**
   - 检查浏览器控制台错误
   - 确认所有JS文件正确加载
   - 清除浏览器缓存

2. **加载缓慢**
   - 启用CDN加速
   - 检查网络连接
   - 使用Chrome DevTools分析性能

3. **路由问题**
   - 确认vercel.json中的重写规则
   - 检查单页应用配置

### 调试步骤
```bash
# 本地测试
python -m http.server 8000
# 访问 http://localhost:8000

# 或使用Node.js
npx serve .
# 访问 http://localhost:3000
```

## 📱 PWA功能

应用支持PWA功能：
- 可安装到桌面
- 离线缓存
- 推送通知(可扩展)

### 安装到桌面
1. 在Chrome中访问应用
2. 点击地址栏的"安装"图标
3. 确认安装到桌面

## 🎯 自定义配置

### 修改应用信息
编辑 `manifest.json`：
```json
{
  "name": "您的应用名称",
  "short_name": "短名称",
  "theme_color": "#您的主题色"
}
```

### 修改页面标题
编辑 `index.html`：
```html
<title>您的应用标题</title>
```

## 📈 访问统计

部署后可通过以下方式监控：
- Vercel Analytics
- Google Analytics
- Cloudflare Analytics

## 🔗 有用链接

- [Vercel文档](https://vercel.com/docs)
- [Flutter Web文档](https://flutter.dev/web)
- [PWA指南](https://web.dev/progressive-web-apps/)

---

**🎉 部署完成后，您的宠物管理系统就可以在全球访问了！** 