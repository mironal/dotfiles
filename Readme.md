# Git

1.8以降を使いましょう.

gitのバージョンが1.7.xの場合は.gitconfigの
[push]
     default=simple
をコメントアウト(#)する.
じゃないとエラーが出て悲しくなる.

# Vim

## ﾌﾟﾗｷﾞﾝインスコ

vimを起動して
    :NeoBundleInstall

NeoBundleでhttpsプロトコルを使う方法(gitのプロトコルが通らない時とかに使える)
.vimrc.bundleの適当な所にイカを記載

```vim
let g:neobundle_default_git_protocol='https'
```

## taglist.vim(Defaultで対応して下され〜)

taglist.vimをscalaでも使えるようにする.

### taglist.vimを編集

~/.vim/bundle/taglist.vim/plugin/taglist.vimの適当な所にイカを追加.

```vim
let s:tlist_def_scala_settings = 'scala;t:trait;c:class;T:type;' .
\ 'm:method;C:constant;l:local;p:package;o:object'
```

### ctagsをインスコ

mac標準のctagsだとダメなのでbrew isntall ctagsして, 標準のctagsはctags.bkとかにリネームしておく.
標準のctagsはwhich ctagsで探す.

### scalaのタグ定義ファイルを追加.
dotfilesの中にある.ctagsファイルをホームディレクトリにシンボリックリンクすべし！(相対パスじゃなくて、絶対パスで指定すること!!)


# tmux

CentOSでtmuxをインストールするときはソースコードからビルドすると
依存関係の解決がダルいのでRPMfoegeでやったほうが楽.

でも、古いやつだとオプションが一部の設定が使えなかったりするので、そういう時は頑張る.


# zsh-completions

zsh-completionsはサブモジュールとして登録してあるので、cloneした後にリポジトリのルートディレクトリで
```sh
git submodule init
git submodule update
```
する.
