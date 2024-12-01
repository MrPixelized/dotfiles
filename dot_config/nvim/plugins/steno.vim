"nnoremap <silent> <Enter> :autocmd InsertLeave * ++once call system("plover_send_command suspend") <Enter>:!plover_send_command resume<Enter>a
