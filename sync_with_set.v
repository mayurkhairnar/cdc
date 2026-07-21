module flop_2_sync (
  input wire data, 
  input wire clk, 
  input wire rst_n,
  output reg sync2);
//Added sync2 as an output so the synchronized signal can be used outside the module

  reg sync1;

  always @(posedge clk or negedge rst_n)
    begin if (!rst_n) begin
      sync1 <= 1'b1;
      sync2 <= 1'b1;
    end
      else begin
        sync1 <= data;
      sync2 <= sync1;
    end
    end
  
endmodule
