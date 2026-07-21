//Why can't we synchronise clocks through data flops?

always @(posedge clk_b or negedge rst_n)
  begin 
    clk_a_sync1 <= clk_a;   //BAD
    clk_a_sync2 <= clk_a_sync1;

  end

// Why fails - clock toggles every cycle - keeps transitioning. it will always violate setup/hold time at some point.
// Data is aligned/stable with clock's edge, so its different than clock
// if clock a is faster, many toggles will be missed. timing of output edges will also vary. 
//STA cannot characterize it. Cant drive flops

//if you use this clock for driving flops , then its terrible..

always @(posedge clk_a_sync2) 
  dout <= din;

//as you will capture wrong edges of the flops -- > downstream logic will go metastable too


Fix :

a. MUXING -

module gfclkmux (
  input wire clka,
  input wire clkb,
  input wire rst_n,
  input wire sel,
  output wire clk_out
);

  reg selasync, selbsync;

  always @(negedge clk_a or negedge rst_n)
    begin if (!rst_n)
      selasync <= 1'b1; //default : select clk_a
      else 
        selasync <= ~sel & ~ selbsync;
    end

  always @(negedge clk_b or negedge rst_n)
    begin if (!rst_n)
      selbsync <= 1'b0; 
      else 
        selbsync <= sel & ~ selasync;
    end

  assign clk_out = (clk_a & selasync) | (clk_b & selbsync);
endmodule

    








    
    
