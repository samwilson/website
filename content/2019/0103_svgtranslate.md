---
title: SVG Translate
date: 2019-01-03 18:53:00 +0000
timezone: America/Los_Angeles
location: San Francisco
tags:
  - SVG Translate
  - programming
  - Webpack
  - CSS
  - Symfony
  - Encore
---
I'm getting this error when compiling [SVG Translate's](https://github.com/wikimedia/svgtranslate) assets with Webpack:

```
error  in ./assets/app.less

Module build failed (from ./node_modules/mini-css-extract-plugin/dist/loader.js):
ModuleBuildError: Module build failed (from ./node_modules/css-loader/dist/cjs.js):
ValidationError: CSS Loader Invalid Options

options should NOT have additional properties
```

It's come about due to trying to upgrade to [https://www.npmjs.com/package/css-loader css-loader] version 2.1.

If I comment out all the assets in <code>webpack.config.js</code>, the error goes away, and comes back when I only include <code>assets/app.less</code> (I didn't try to narrow it down to any other files; one example should be enough).

It sounds like the options for css-loader have changed. If I dump the config for that module, I get this:

```
console.log(module.exports.module.rules[1].use);
```

```
[
  './svgtranslate/node_modules/mini-css-extract-plugin/dist/loader.js',
  {
    loader: 'css-loader',
    options: { minimize: true, sourceMap: false, importLoaders: 0 }
  }
]
```

It seems that `minimize` and <code>sourceMap</code> are not [valid options](https://github.com/webpack-contrib/css-loader#options);
the first [was removed](https://github.com/webpack-contrib/css-loader/blob/master/CHANGELOG.md#100-2018-07-06)
in version 1.0.0 (which I guess SVG Translate wasn't using), and I'm not sure about the second.
I'm not sure where they're coming from, I guess some Encore config somewhere; certainly it's not in SVG Translate's config.

What if I just delete them?

```
delete module.exports.module.rules[1].use[1].options.minimize;
delete module.exports.module.rules[1].use[1].options.sourceMap;
```

Nope, no good; same error. Oh, of course: because that's being done *after* the loader is being used.
What if the css-loader is configured manually, earlier?

```
.configureCssLoader(function ( options ) {
    delete options.minimize;
    delete options.sourceMap;
    return options;
} )
```

Yup! That works. Does it work when all the other asset files are uncommented? No:

```
error  in ./node_modules/oojs-ui/dist/oojs-ui-wikimediaui.css

Module build failed (from ./node_modules/mini-css-extract-plugin/dist/loader.js):
ModuleParseError: Module parse failed: Maximum call stack size exceeded
You may need an appropriate loader to handle this file type.
RangeError: Maximum call stack size exceeded
```

If we switch to an already minified version of <code>node_modules/oojs-ui/dist/oojs-ui-wikimediaui.css</code>? Yes!!

So maybe things are okay now? This feels like a reasonably ugly fix, but if it works then I'm happy for now.

The result is here: https://github.com/wikimedia/svgtranslate/pull/45
