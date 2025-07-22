module  vending_machine(input [1:0]d_in,input clk,rst,output reg x1,x2);
    
	parameter s0=2'b00,
	          s1=2'b01,
			  s2=2'b10;
			  
	reg [1:0]p_s,n_s;
	
always@(posedge clk or posedge rst)
    begin
	   if(rst)
	     p_s <=s0;
	   else
	     n_s <= n_s;
	end
	
	
always@(p_s,d_in)
    begin
	   n_s =s0;
	case (p_s)
	    s0 : if (d_in ==2'b10)
		      n_s =s1;
			 else if (d_in == 2'b11)
			 n_s =s2;
			  else
			  n_s =s0;
			  
		 s1 : if (d_in ==2'b10)
		      n_s =s2;
			 else if (d_in == 2'b11)
			 n_s =s0;
			  else
			  n_s =s1;
		 s0 : if (d_in ==2'b10)
		      n_s =s0;
			 else if (d_in == 2'b11)
			 n_s =s2;
			  else
			  n_s =s2;
		default : n_s =s0;
	endcase
   end
always@(posedge clk or posedge rst)
    begin
	    if(rst)
		   begin
		    x1 <= 1'b0;
			x2 <= 1'b1;
		   end
		else
		   begin 
		     case(p_s)
			    s0 : if(d_in == 2'b11)
				    begin
					   x1 <= 1'b0;
					   x2 <= 1'b0;
					end
					else if (d_in ==2'b10)
					begin
					x1 <= 1'b0;
					x2 <= 1'b0;
					end  
				s1 : if(d_in == 2'b10)
				    begin
					   x1 <= 1'b0;
					   x2 <= 1'b0;
					end
					else if (d_in ==2'b11)
					begin
					x1 <= 1'b1;
					x2 <= 1'b0;
					end  
				s0 : if(d_in == 2'b10)
				    begin
					   x1 <= 1'b1;
					   x2 <= 1'b0;
					end
					else if (d_in ==2'b11)
					begin
					x1 <= 1'b1;
					x2 <= 1'b1;
					end 
            default :
                      begin
                        x1 <= 1'b0;
                        x2 <= 1'b0;
                      end
        endcase
    end
   end
endmodule   
		 