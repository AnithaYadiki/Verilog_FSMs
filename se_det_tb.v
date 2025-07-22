module seq_det_tb();
   reg din,clock,reset;
   wire dout;
   
   parameter CYCLE =10;
   
   seq_det DUT (.seq_in(din),.clock(clock),.reset(reset),.det_o(dout));
   
always
    begin
	  #(CYCLE/2);
	  clock =1'b0;
	  #(CYCLE/2);
	  clock=~clock;
	end
task initialize ();
     begin
	    din=0;
	 end
endtask
task delay(input integer i);
     begin
	    #i;
	 end
endtask
task RESET();
     begin 
	    delay(5);
		 reset=1'b1;
		 delay(5);
		 reset=1'b0;
	  end
endtask
task stimulus(input data);
    begin
	  @(negedge clock);
	   din=data;
	end
endtask

initial 
$monitor("Reset =%b, state=%b ,Din=%b ,Dout=%b",reset,DUT.state,din,dout);

always@(DUT.state or dout)
    begin
	  if(DUT.state ==2'b11 &dout==1)
	   $display("correct output at state %b",DUT.state);
	end
	
initial
    begin
	   initialize;
	   RESET;
	   stimulus(0);
	   stimulus(1);
	   stimulus(0);
	   stimulus(1);
	   stimulus(0);
	   stimulus(1);
	   stimulus(1);
	   RESET;
	   stimulus(1);
	   stimulus(0);
	   stimulus(1);
	   stimulus(1);
	   $finish;
	end
endmodule