      program leapyear
      integer y, leap

c     leap year algo

      write (*,*) "Enter year numb"
      read (*, '(I4)') y

      leap = 0
      if (mod(y,4) .EQ. 0) then
         if (mod(y, 100) .NE. 0) then
            leap = 1
         endif
      elseif (mod(y, 400) .EQ. 0) then
         leap = 1
      endif

      write (*,*) "Year ", y, " is a leap: ", leap
      stop
      end
