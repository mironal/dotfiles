vimを初回起動時に
:NeoBundleInstall

gitのバージョンが1.7.*の場合は.gitconfigの[push]、default=simple
をコメントアウト(#)する.
じゃないとエラーが出て悲しくなる.

NeoBundleでhttpsプロトコルを使う方法(gitのプロトコルが通らない時とかに使える)
.vimrc.bundleの適当な所にイカを記載
let g:neobundle_default_git_protocol='https'

CentOSでtmuxをインストールするときはソースコードからビルドすると
依存関係の解決がダルいのでRPMfoegeでやったほうが楽.

