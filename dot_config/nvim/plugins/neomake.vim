if system('acpi -a') =~ 'on-line' " If power adapter online (laptop plugged in)
  call neomake#configure#automake('nrwi', 500)
else
  call neomake#configure#automake('rw')
endif
