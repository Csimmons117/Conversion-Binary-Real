              
      
        .text
        .globl fractional2bin
        .globl value_of_max

        .include "macros/syscalls.s"
        .include "macros/stack.s"

        



fractional2bin:     nop                                   #public static int fractional2bin(int fractional, int max_bits){
                                
                                                          #                int t0; // fractional 
                                                          #                int t1; // max_bits
              
                                                          #                int t2; //  int number;
                                                          #                int t3; //  int result;
                                                          #                int t4; //  int max;
                                                          #                int t5; //  int loops;
                                                          #                int t6; //  int i;
                                                          #                int t7; // 23
                    #Demarshal args                       #                                                          
                    move $t0,$a0
                    move $t2, $a0                         #                t0 = fractional;
                    move $t1,$a1                          #                t1 = max_bits;
                    
                                                          # 
                                                          #
                                                          #


                    li $t5,0                              #                t5 = 0;                                   //  loops = 0;
                    li $t3,0                              #                t3 = 0;                                   //  result = 0;
                    #li $t7,23                             #                t7 =23;                                   // value for "for loop"
                                                          #                  

                    li $t8 , 2


                    #Demarshal args
                    move $a0,$t0
                    # Save T registers
                    push_t_registers()
                    # Save special purpose registers
                    push($gp, $sp, $fp, $ra)
                  
                                                          #                
                    #calling method                                                                      #                
                    jal value_of_max                      #                t4 = value_of_max(t0);                   //    max = value_of_max(fractional); //10 ** stringlength(fractional);

                    # Restore special purpose registers  
                    pop($gp, $sp, $fp, $ra)
                    # Restore T registers
                    pop_t_registers()
                    # Demarshal return value
                    move $t4 , $v0
                                                          #               
                    
                    
                  


                                    
                    #move $t2, $t4                         #                t2 = t0;// t4?                                  //    number = fractional; 

                    li $t6,0                              #                t6 = 0;
                                                          #                
initfor:            nop             
loopfor:            bge $t6,$t1,donefor                   #                for (;t6 < t7 ;){                         //      for (i=0;i < 23;i++){
                                                          #
bodyfor:              nop             
                                                          #
initif:               nop             
                      beq $t2, $zero,doneif               #                  if (t2 != 0){                           //        if (number != 0){
                       
                        bge $t5,$t1,doneif5               #                    if(t5 < t1){                          //          if(loops < max_bits) {
consif:                   nop
                                                              
                          addi $t5, $t5, 1                #                      t5 = t5 + 1;                        //          loops++;


                                                          #                                                          //  
                          mult $t2, $t8                   #                      t2 = t2 * 2;                        //          number = number * 2; ****create macro****
                          mflo $t2                        #                                                          //  


                          blt $t2,$t4,altif               #                      if (t2 >= t4){                      //          if ( number >= max ) {
                                                          #                                                          //  
                            li $t3 , 1                    #                        t3 = 1;                           //            result= 1;
                            print_d($t3)                  #                        mips.print_d(t3);                 //            mips.print_d(result);
                                                          #                                                          //          
                                                          #                                                          //          
                                                          #                                                          //  
                                                          #                                                          //           
                                                          #                                                          //  
                            sub $t2, $t2, $t4             #                        t2 = t2 -t4;                      //            number = number - max;
                            b doneif6                              #                                                          //  
                                                          #                      }else{                              //          } else {
altif:                        nop                                           
                                                          #                                                          //  
                            li $t3, 0                     #                        t3 = 0;                           //            result= 0;
                            print_d($t3)                  #                        mips.print_d(t3);                 //            mips.print_d(result);
                                                          #                                                          //            
                                                          #                                                          //          
                                                          #                                                          //  
                                                          #                                                          //  
                                                          #                                                          //          
                                                          #                                                          //  
                            b doneif                      #                      } //end of else and if              //             }// end of if & else
doneif6:                  nop                             #                                                          //            
                                                          #                                                          //  
                                                          #                                                          //  
                          b doneif5
doneif5:              nop                                 #                      } // end of if statement            //          }// end of if statement 
                      b doneif
                                                          #                    }// end of if statement               //        }// end of if statement
doneif:               nop            
                                                          #
                      addi $t6, $t6, 1                    #                    t6 = t6 + 1 ;                         //      i++
                                                          #                    continue loopfor;      
                      b loopfor                           #                  } //end of for loop                     //      }// for loop
donefor:            nop                    
                                                          #                                                          //  
                    move $v0, $t3                         #                return t3;                                //        return result;
                    jr $ra                                #                } // end of method                        //     }// end of method 
                                                          #
                                                          #

                                                          #
value_of_max:       nop                                   #public static int value_of_max(int number) {
                                                          #int t0;
                                                          #int t1;                                   // int max;
                                                          #int t2;                                   // i   
                                                          #
                                                          #int t4;                                   // 8                                     
                                                          #
                    move $t0,$a0                          #t0 = number; 
                    li $t1 ,10                            #t1 = 10;                                  // max = 10;
                    li $t2 ,0                             #t2 = 0;
                    li $t3 ,10                            #
                    li $t4, 8                             #t4 = 8;
                                                          #
initfor2:           nop                                   #;         
loopfor2:           blt $t0,$t1,doneloopfor2              #for(;t0 >= t1;){                          // for (int i=0;  number >= max ;i++) {
                                          
bodyfor2:             nop                                 #  ;
                                          
initif2:                                                  #  ;
                      bgt $t2,$t4,doneif2                 #  if(t2 > t4){
consif2:                nop                               #    ;       
                                                          #    break;                                 //    if( i > 8)//    break;
                                          
                        b doneif2                         #  }
doneif2:              nop                                 #  ;                                       //    max = max * 10;

                      mult $t1, $t3                       #  t1 = t1 *10;
                      mflo $t1                            #  

                      addi $t2, $t2, 1                    #  t2 = t2 +1;
                                                          #  continue loopfor2;    
                      b loopfor2                          #  } 
doneloopfor2:       nop                                   #   ;                                                          // }
                    move $v0 , $t1                        #return t1;                                // return max;
                    jr $ra                                #}