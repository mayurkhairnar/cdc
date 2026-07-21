module flop_2_sync
  input data, clk, rst_n;

  reg sync1, sync2;

  always @(posedge clk or negedge rst_n)
    begin if (!rst_n)
      sync1 <= 1'b0;
      sync2 <= 1'b0;
      else 
        sync1 <= data;
      sync2 <= sync1;
    end

  
  
endmodule
