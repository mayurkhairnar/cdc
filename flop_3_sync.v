reg sync1. sync2, sync3;

always @(posedge clk_b or negedge rst_n)
  begin if (!rst_n)
    begin 
      sync1 <= 1'b0;
      sync2 <= 1'b0;
      sync3 <= 1'b0;
  end else begin
      sync1 <= data;
      sync2 <= sync1;
      sync3 <= sync2;
  end
  end
