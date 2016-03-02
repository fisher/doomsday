      program doomsday
      integer d, m, y
      integer w, leap
      integer a(0:3)
      data a /2, 0, 5, 3/

c     demonstration of doomsday algo for determining day of week
c     http://www.timeanddate.com/date/doomsday-weekday.html

      write (*,*) "Enter date (dd/mm/yyyy):"
      read (*,'(I2,X,I2,X,I4)') d,m,y

      write (*,10) "You gave me day ", d, ", month ", m, ", year ", y
 10   format (A,I2,A,I2,A,I4)

      if (y .LT. 1) then
         write (*,*) "...but the year should be positive integer."
         stop
      endif

      if (m .LT. 1) then
         write (*,*) "...but the month is lesser than 1 (January)"
         stop
      elseif (m .GT. 12) then
         write (*,*) "...but the month is greater than 12 (December)"
         stop
      endif

      if (d .LT. 1) then
         write (*,*) "...but the day ", d, " is lesser than 1."
         stop
      endif

c     is the year a leap year?

      leap = 0
      if (mod(y, 4) .EQ. 0) then
         if (mod(y, 100) .NE. 0) then
            leap = 1
         endif
      elseif (mod(y, 400) .EQ. 0) then
         leap = 1
      endif

c     check the day based on current month and leap/noleap year

c     first is the most common case
      if (d .GT. 31) then
         write (*,*) "...but the day ", d, " is greater than 31"
         stop
      endif

c     february exception from the rule
      if (m .EQ. 2) then
         if (d .GT. 28 + leap) then
            write (*,20)
     &           "...but in february of that year we have only",
     &           28 + leap, " days"
 20         format (A, I3, A)
            stop
         endif
      endif

c     if greater than 30 and the month is one of 4 with 30 days
      if (d .GT. 30) then
         if (m .EQ. 4) then
            write (*,*) "...but april has only 30 days"
            stop
         elseif (m .EQ. 6) then
            write (*,*) "...but the june has only 30 days"
            stop
         elseif (m .EQ. 9) then
            write (*,*) "...but the september has only 30 days"
            stop
         elseif (m .EQ. 11) then
            write (*,*) "...but the november has only 30 days"
            stop
         endif
      endif

c     now we have correct date in integers d/m/y

c     last two digits of the year
      w = mod(y, 100)

c     sum division, remainder, division of remainder by 4, and anchor
      w = w/12 + mod(w,12) + mod(w,12)/4 + a(mod(y/100, 4))

c     modulo 7 to get the day number
      w = mod(w, 7)

c     it's a kind of magic!
      write (*,'(A, I2)') "Doomsday for the year is", w

*     I don't get it. Why does it work?

      end
