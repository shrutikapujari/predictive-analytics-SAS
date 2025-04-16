*a)*;
data hotel;
infile 'Hotel.dat';
input RoomNumber NoofGuests CheckInMonth day year CheckOutMonth Date COMYear WirelessInternet $ NoofDaysUsed RoomType $52-68 RoomRate;
run;
proc print data = hotel;
run;
data hotel_2;
set hotel;
CheckInDate = input(catx("/",CheckInMonth,day,year),mmddyy10.);
CheckOutDate = input(catx("/",CheckOutMonth,Date,COMYear),mmddyy10.);
format CheckOutDate mmddyy10.;
format CheckInDate mmddyy10.;
proc print data = hotel_2;
run;
*b)*;
data hotel_3;
set hotel_2;
NoOfDaysStayed = intck('day',CheckInDate,CheckOutDate);
TotalRoomRate = RoomRate*NoOfDaysStayed;
if WirelessInternet='NO'
then InternetService = 0;
else if WirelessInternet='YES'
then InternetService = 7.95+(4.95*NoofDaysUsed);
if NoofGuests = 1
then PersonRate = 0;
else if NoofGuests > 1
then PersonRate = 15 * (NoofGuests - 1);
SubTotal = TotalRoomRate+InternetService+PersonRate*NoOfDaysStayed;
proc print data=hotel_3;
run;
data hotel_4;
set hotel_3;
/* Variable for SalesTax */
SalesTax = SubTotal * 0.025;
/* Variable Showing GrandTotal */ 
GrandTotal = SalesTax + SubTotal;
/* Rounding it off to 2 decimal places */
GrandTotal = round(GrandTotal, 0.01);
proc print data = hotel_4;
run;
/*Verifying Data for RoomNumber 211*/
proc print data = hotel_4;
where RoomNumber = 211;
run;
/* Grand Total for Room Number 211 is 1332.5 */



