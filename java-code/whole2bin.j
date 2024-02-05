public static int whole2bin(int whole){

int number;
int result; 
int amount;
int print;
int i;

result =0;
amount=0;
print = 0;

number = whole;
  while (number != 0) {


   mips.push ( number % 2 );
   number = number / 2;
   amount++;
   

  }// end of while

  i=0; 
  while( i < amount){ // binary and entered number 

    result<<=1 ;
    print=mips.pop();
    //result += mips.pop();
    mips.print_d(print);
    amount --;
  }

  return result;




}// end of method


 