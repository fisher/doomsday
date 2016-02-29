      program doomsday
      integer d,m,y
      integer c,w
      integer a

c     demonstration of doomsday algo for determining day of week
c     http://www.timeanddate.com/date/doomsday-weekday.html

      write (*,*) "Enter date (dd/mm/yyyy):"
      read (*,'(I2,X,I2,X,I4)') d,m,y

      write (*,10) "You gave me day ", d, ", month ", m, ", year ", y
 10   format (A,I2,A,I2,A,I4)

      if (y .LT. 1600) then
         write (*,*) "...but the year ", y, " is lesser than 1600"
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

      c = y / 100

      write (*,*) "This is century", c +1

*     I'll do it in my spare time

      end
