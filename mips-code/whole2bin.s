                  .text
                  .globl whole2bin
                 
                  .include "macros/syscalls.s"
                  .include "macros/stack.s"                                





whole2bin:        nop                             #public static int whole2bin(int whole){
                                                  #                  
                                                  #                    int t0;
                                                  #                    t0 = whole;
                                                  #                  
                                                  #                    int t1;                              // int number;
                                                  #                    int t2;                              // int result; 
                                                  #                    int t3;                              // int amount;
                                                  #                    int t4;                              // int print;
                                                  #                    int t5;                              // int i;
                #Demarshel args                   #                  
                move $t0 ,$a0                     #                  
                                                  #                                                  // 
                li $t2,0                          #                    t2 = 0;                       //  result =0;
                li $t3,0                          #                    t3 = 0;                       //  amount=0;
                li $t4,0                          #                    t4 = 0;                       //  print = 0;
                li $t7,0                          #  t5 = t1 %2                                                // 
                li $t6,2                          #   2


                move $t1, $t0                     #                    t1 = t0;                      //  number = whole;
                                                  #                                                  // 
initwhile:      nop                               #;                  
                                                  #                              // 
loopwhile:      beq $t1, $zero, donewhile         #while(t1 != 0){               //   while (number != 0) {
                                                  #                              // 
bodywhile:        nop                             #;                  
                  rem $t7,$t1,$t6                 #                              // 
                  push($t7)                       #mips.push( t1 % 2);           //    mips.push ( number % 2 );
                  div $t1 $t6                     #t1 = t1 / 2;                  //    number = number / 2;
                  mflo $t1
                  
                  addi $t3, $t3, 1                #t3 = t3 + 1;                  //    amount++;
                                                  #                              //    
                                                  #                              // 
                  b loopwhile                     #
                                                  #}                             //   }// end of while
donewhile:      nop                               #;                             // 
                li $t5,0                          #t5 = 0;                       //   i=0;
                li $t8, 1 
initwhile2:     nop                               #;                  
loopwhile2:     bge $t5,$t3,donewhile2            #while(t5 < t3){               //   while( i < amount){ // binary and entered number 
                                                  #                              // 
bodywhile2:       nop                             #  ;                  
                  sllv $t2, $t2, $t8              #  t2 <<= 1;                   //    result<<=1 ;
                  pop($t7)                        #  t4 = mips.pop();            //     print=mips.pop();
                                                  #                              //     
                                                  #
                  print_d($t7)                    #  mips.print_d(t4);           //     mips.print_d(print);
                  sub $t3, $t3, $t8               #  t3 = t3 - 1;                //     amount --;
                  b loopwhile2                    #
                                                  #}                             //   }
donewhile2:     nop                               #;                             // 
                move $v0, $t2                     #return t2;                    //   return result;
                jr $ra                            #                              //                                    
                                                  #}// end of method
                  
                  
                   