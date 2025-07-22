module vending_machine_tb();
    reg [1:0]d;
	reg clk,rst;
	wire x1;
	wire x2;
vending_machine DUT (d,clk,rst,x1,x2);

initial
   begin
      clk =1'b0;
	  forever #10 clk =~clk;
	end
	
task reset ;
     begin
	    rst =1'b1;
		#15;
		rst =1'b0;
	end
endtask
task in(input [1:0]k);
  begin
    @(negedge clk)
	  d =k;
   end
 endtask
 initial 
   begin
          reset;
		  in(2'b11);
		  in(2'b10);
		  in(2'b11);
		  in(2'b11);
		  in(2'b10);
		  in(2'b11);
		  in(2'b01);
		  $finish;
	end
initial
    begin
	$monitor ("d=%b,x1=%b,x2=%b",d,x1,x2);
	#1000 $stop;
	end
endmodule