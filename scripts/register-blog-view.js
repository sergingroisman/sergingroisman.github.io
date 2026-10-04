'use strict';

const fs = require('fs');
const path = require('path');

hexo.extend.filter.register('before_generate', function registerBlogView() {
  if (this.theme.config.lazyload) {
    this.theme.config.lazyload.native = true;
  }

  const templatePath = path.join(this.base_dir, 'layout', 'blog.ejs');
  const template = fs.readFileSync(templatePath, 'utf8');
  this.theme.setView('blog.ejs', template);
});
