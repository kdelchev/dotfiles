if has("autocmd")
  autocmd FileType go set ts=4 sw=4 sts=4 expandtab
  au BufWritePost *.go !gofmt -w %
endif
