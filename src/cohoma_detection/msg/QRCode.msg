string raw_value #QR Code raw value
geographic_msgs/GeoPoint position #Trap position when detected
string nature     #Information about the trap signifacation in the real context
uint16 id         #Identificator of the trap
uint8 ngz_radius  #No Go Zone Radius around the trap
bool dsb_status   #The trap can be disabled or not
string dsb_code   #Code to transmit to disable the trap
bool contact_dsb  #The trap should be disabled by contact or not
string dsb_vector #Type of drone that can disable the trap
string other      #Diverse complementary (miscellaneous) informations