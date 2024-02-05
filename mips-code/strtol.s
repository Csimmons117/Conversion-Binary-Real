             
                .text                                                
                .globl glyph2int             
                .globl strtol            
                .data            
                                                                      
                .text            
                .include "macros/syscalls.s"             
                .include "macros/stack.s"            
                             
                             
glyph2int:      nop                                      #public static int glyph2int( char c, int radix){
                             
                                                         #char t0;                    // char c
                                                         #int t1;                     // radix
                                                         #
                                                         #int t2;                     // int numValue;
                                                         #int t3;                     // int result;
                                                         #                            //
                                                         #int t4;                     // ascii values in decimal
                                                         #int t5;                     // ascii values in decimal
                                                         #
                move $t0, $a0                            #t0 = c; 
                move $t1, $a1                            #t1 = radix;
                li $t2, -1                               #t2 = -1;                    // numValue = -1;
                li $t3, -1                               #t3 = -1;                    // result = -1;
                                                         #
                li $t4,48                                #t4 = 48;                    // '0'
                li $t5,57                                #t5 = 57;                    // '9'
initif1:        nop                                      #;                
                blt $t0,$t4,doneif1                      #if (t0 >= t4){              //    if (c >= '0'){
                                                         #
                  bgt $t0,$t5,doneif1                    #   if (t0<= t5){            //        if (c <='9'){ 
consif1:            nop                                  #    ;                
                    sub $t2, $t0, $t4                    #    t2 = t0 - t4;           //        numValue = c - '0';
                    b doneif1                            #    }                       //      } 
                  b doneif1                              #}                           //    } // char = 0 - 9 without "and" statement 
doneif1:        nop                                      #;                           //
                                                         #
                li $t4,65                                #t4 = 65; // 'A' 
                li $t5,70                                #t5 = 70; // 'F'               
initif2:        nop                                      #;                
                blt $t0,$t4,doneif2                      #if (t0 >= t4){              //    if (c >= 'A'){
                                                         #
                  bgt $t0,$t5,doneif2                    #  if (t0 <= t5){            //        if (c <= 'F'){ 
consif2:            nop                                  #    ;                
                    sub $t2, $t0, $t4                    #    t2 = t0 - t4;           //          numValue = c - 'A' + 10;
                    addi $t2, $t2, 10                    #    t2 = t2 + 10;
                    b doneif2                                     #  }                         //        }
                  b doneif2                              #}                           //    }// char = A - F without "and" statement
doneif2:        nop                                      #;                                            
                li $t4, 97                               #t4 = 97;
                li $t5, 102                              #t5 = 102;
initif3:        nop                                      #;                                           
                blt $t0,$t4,doneif3                      #if ( t0 >= t4 ){            //    if(c >= 'a'){
                                                         #
                  bgt $t0,$t5,doneif3                    #  if (t0 <= t5){            //        if(c <= 'f'){ 
consif3:            nop                                  #    ;                
                    sub $t2, $t0, $t4                    #    t2 = t0 - t4;           //          numValue = c -'a' + 10;
                    addi $t2, $t2, 10                    #    t2 = t2 + 10;
                    b doneif3                            #  }                         //        } 
                  b doneif3                              #}                           //    }// char = a - f without "and" statement 
doneif3:        nop                                      #;                                    
                                                         #
                                                         #
initif4:        nop                                      #;                                            
                blt $t2,$t1,doneif4                      #if (t2 >= t1){              //  if (numValue >= radix ){
consif4:          nop                                    #  ;                
                  move $v0, $t3                          #  return -1;                //      return -1;
                  b doneif5                              #}                           //  }
doneif4:        nop                                      #;                           //
                                         
initif5:        nop                                      #;                           //
                bgt $t2,$t1,doneif5                      #if (t2 <= t1){              //  if (numValue <= radix ){
consif5:          nop                                    #  ;                
                  move $t3,$t2
                                                         #  t3 = t2;
                  move $v0,$t3                           #                            //      result = numValue;
                  b doneif5                              #}
doneif5:        nop                                      #;                           //  }
                jr $ra                                   #return t3;                  //    return result;
                                                         #}// end of method           //  }
                             
             
             
strtol:         nop                                      #public static int strtol( char[] buffer, int radix){
                                                         #
                                                         #                char[] t0;                  //buffer        
                                                         #                int t1;                     //radix
                move $t0,$a0                             #                t0 = buffer;
                move $t1,$a1                             #                t1 = radix;
                                                         #                
                                                         #                int t3;                     //int i;
                                                         #                int t4;                     //int result;
                                                         #                int t5;                     //int value;
                                                         #                char t6;                    //char curr_buffer;
                                                         #                char t7;                    //char Null; 
                                                         #                char t8;                    //char glyph;
                                                         #                                            //
                                                         #                
                                                         #                
                                                         #                                            // 
                li $t4,0                                 #                t4 = 0;                     //result = 0;
                li $t7,'\0'                              #                t7 = '\0';                  //Null = '\0'; //'\n'????????????
                li $t3,0                                 #                t3 = 0;                     //i=0;
                li $t2, -1                                         #                
                                                         #                
                lb $t6, 0($t0)                            #                t6 = buffer[t3];            //curr_buffer= buffer[i]; // before the loop
                                                         #                                            // 
init:           nop                                           
loopwhile:      beq $t6, $t7, donewhile                  #while(t6 != t7){                            //  while(curr_buffer != Null){ 
                                                          
bodywhile:        nop                                    #  ;                                         //
                  move $t8, $t6                          #  //t8 = t6;                                //    glyph = buffer[i]; // Dont need this line because 96 does the same thing
                                                         #                                            //

                  #Demarshal args
                  move $a0,$t8
                  move $a1,$t1 
                  # Save T registers
                  push_t_registers()
                  # Save special purpose registers       #
                  push($gp, $sp, $fp, $ra)
                                                      
                  #calling method                        #  t5 = (glyph2int(t6,t1));                  //    value = (glyph2int(glyph, radix)); // running the glyph2int to get glyph for equation

                  jal glyph2int                    
                  # Restore special purpose registers 
                  pop($gp, $sp, $fp, $ra)
                  # Restore T registers
                  pop_t_registers()
                  # Demarshal return value
                  move $t5 , $v0                   

init6:            nop                                     #  ;                                         //    
              
                  bne $t5, $t2, altif6                    #  if(t5 == -1){                 
consif6:            nop                                   #  ;                 
                                                          #  break;                                    //    if (value == -1){break;}// break the loop
                    b donewhile                           #  }                                          
                                                          #                                            //
                                                          #  else{                                     //      else{
altif6:             nop                                   #  ;                                         //       
                                                          #                      
                    mult $t4, $t1                         #    t4 = t4 * t1;                           //       result = result *radix +value;} // v = v * base +glyph
                    mflo $t4
                    add $t4, $t4, $t5                     #    t4 = t4 + t5;                           //    
                    b doneif6                             #  }                   
doneif6:          nop                                     #  ;                 
                                          
                  addi $t0, $t0, 1                        #t3 = t3 + 1;                //    i++;
                  lb $t6, 0($t0)                          #t6 = buffer[t3];            //    curr_buffer= buffer[i]; // after the loop
                  b loopwhile                             #}                           //  }// end of while loop
donewhile:      nop                                       #;                           //  
                move $v0, $t4                             #return t4;                  //  return result;
                jr $ra                                    #}                           //}                                      