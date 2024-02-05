public static int fractional2bin(int fractional, int max_bits){
int number;
int result;
int max;
int loops;
int i;


loops = 0;
result = 0;



  max = value_of_max(fractional); //10 ** stringlength(fractional);

  number = fractional;

    for (i=0;i < 23;i++){

      if (number != 0){
        if(loops < max_bits) {

        loops++;

        number = number * 2; 

        if ( number >= max ) {

          result= 1;
          mips.print_d(result);
        // result += 1;
        

          //1 0 1

          number = number - max;

        } else {


          result= 0;
          mips.print_d(result);
          //result += 0;
        


        

           }// end of if & else
          // dont need a stack 


        }// end of if statement 
      }// end of if statement
     
    }// for loop

      return result;
   }// end of method 




public static int value_of_max(int number) {

         int max;
      
         max = 10;
         for (int i=0;  number >= max ;i++) {
         
            if( i > 8) break;
            max = max * 10;
         }
         return max;
         
}