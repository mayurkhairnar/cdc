reg sync1, sync2;

always @(posedge clk or negedge rst)
  begin if (!rst_n) begin
    sync1 <= 1'b0;
    sync2 <= 1'b0;

    else begin
      sync1 <= data ;
      sync2 <= sync1 | sync2 ;   // bad coding - fb in the sync stage 
    end
  end
