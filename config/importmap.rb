# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "jquery", to: "jquery.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "notify", to: "notify.js", preload: true