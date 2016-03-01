      program doomsday
      integer d,m,y
      integer c,w
      integer a,r

c     demonstration of doomsday algo for determining day of week
c     http://www.timeanddate.com/date/doomsday-weekday.html


c     yeah, it's obfuscating

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

c     should check the day based on current month and leap/noleap year

      if (d .GT. 31) then
         write (*,*) "...but the day ", d, " is greater than 31"
         stop
      endif

c     century -1
      c = mod(y/100, 4)

c     an anchor day for that century
      if (c .EQ. 0) then
         a = 2
      elseif (c .EQ. 1) then
         a = 0
      elseif (c .EQ. 2) then
         a = 5
      elseif (c .EQ. 3) then
         a = 3
      endif

      write (*,*) "Anchor day is ", a

c     last two digits of the year
      c = y - y /100 *100

      write (*,*) "Last two digits is ", c

c     how many times does the number 12 fit into the 2 last digits
      w = c / 12

      write (*,*) "How many times does the number 12 fit? ", w

c     remainder of integer division
      r = mod(c, 12)

      write (*,*) "Remainder? ", mod(c, 12)

c     sum division, remainder, division of remainder by 4, anchor
      w = w + r + r/4 + a

      write (*,*) "The sum is ", w

      w = mod(w, 7)

      write (*,*) "Doomsday for the year is ", w

*     I don't get it. Why does it work?

      end
