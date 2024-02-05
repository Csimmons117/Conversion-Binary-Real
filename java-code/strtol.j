public static int glyph2int( char c, int radix){
   int numValue;
   int result;

result = -1;
numValue = -1;
    if (c >= '0'){
        if (c <='9'){ 
        numValue = c - '0';
      } 
    } // char = 0 - 9 without "and" statement 


    if (c >= 'A'){
        if (c <= 'F'){ 
          numValue = c - 'A' + 10;
        }
    }// char = A - F without "and" statement


    if(c >= 'a'){
        if(c <= 'f'){ 
          numValue = c -'a' + 10;
        } 
    }// char = a - f without "and" statement 



  if (numValue >= radix ){
      return -1;
  }


  if (numValue <= radix ){
      result = numValue;
  }
    return result;
  }



public static int strtol( char[] buffer, int radix){
  int i;
  int result;
  int value;
  char curr_buffer;
  char Null; 
  char glyph;


  result = 0;
  Null = '\0';
  i=0;
  curr_buffer= buffer[i]; // before the loop
   
    

    while(curr_buffer != Null){

      glyph = buffer[i];

      value = (glyph2int(glyph, radix)); // running the glyph2int to get glyph for equation

      if (value == -1){break;}// break the loop

        else{result = result *radix +value;} // v = v * base +glyph
      

      i++;
      curr_buffer= buffer[i]; // after the loop

    }// end of while loop
    return result;
    
}                         
