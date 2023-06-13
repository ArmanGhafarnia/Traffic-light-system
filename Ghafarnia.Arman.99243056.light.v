module light
(
output reg [2:0] light_A,output reg [2:0] light_B,input clk,input rst   //voroodi va khorooji ha
);

reg[5:0] state;    // vaziat cheragh ha

localparam s0=6'b001100,s1=6'b001010,s2=6'b001001,s3=6'b100001,s4=6'b010001,s5=6'b001001;  //state ha va nam hayeshan

reg[3:0] number;  //mohasebe gar zaman(timer)

localparam delay6= 4'd6,delay1= 4'd1;   //2 model taakhir zamani

always @(posedge clk or posedge rst or negedge clk  )              // ta zamani ke dar jaryan bashand
        if(rst==1) begin       //baraye bargardandan barname be halat paye

           number <= 0;
           state <= s0;
           
        end else 
            case(state)
                s0: if(number < delay6) begin        // be s1 nareside bashad
                      number <= number+1;            // timer be jelo beravad
                      state<=s0;                     // state sabet mimanad
                    end else if(number >= delay6) begin // be s1 miresad
                      number<=1;                        // timer refresh mishavad
                      state<=s1;                        //state taghir mikonad
                    end

                s1: if(number < delay1) begin
                      number <= number+1;
                      state<=s1;
                    end else if(number >= delay1) begin
                      number<=1;
                      state<=s2;
                    end
                 
                s2: if(number < delay1) begin
                      number <= number+1;
                      state<=s2;
                    end else if(number >= delay1) begin
                      number<=1;
                      state<=s3;
                    end

                s3: if(number < delay6) begin
                      number <= number + 1;
                      state<=s3;
                    end else if(number >= delay6) begin
                      number<=1;
                      state<=s4;
                    end

                s4: if(number < delay1) begin
                      number <= number+1;
                      state<=s4;
                    end else if(number >= delay1) begin
                      number<=1;
                      state<=s5;
                    end  

                s5: if(number < delay1) begin
                      number <= number+1;
                      state<=s5;
                    end else if(number >= delay1) begin
                      number<=1;
                      state<=s0;
                    end  

                default state <= s0;

               endcase

               always @(*)         // hamishe ejra shavad

               begin
  
      case(state)
                    s0: begin 
                      light_B <= 3'b100;            //dar har vaziat  cheragh ha che rangi darand
                      light_A <= 3'b001;
                        end 
                    s1: begin 
                      light_B <= 3'b010;
                      light_A <= 6'b001;
                        end
                    s2: begin 
                      light_B <= 3'b001;
                      light_A <= 6'b001;
                        end
                    s3: begin 
                      light_B <= 3'b001;
                      light_A <= 6'b100;
                        end
                    s4: begin 
                      light_B <= 3'b001;
                      light_A <= 6'b010; 
                        end
                    s5: begin
                      light_B <= 3'b001;
                      light_A <= 6'b001; 
                        end
                default begin 
                        light_B <= 3'b001;
                        light_A <= 6'b001; 
                        
                        end

      endcase
               end
endmodule