reg sync1, sync2;

always @(posedge clk or negedge rst_n)
  begin if (!rst_n)
    sync1 <= 1'b0;
  end else begin 
    sync1 <= data;
  end

always @(posedge clk or negedge rst_m)
  begin if (!rst_n)
    sync2 <= 1'b0;
  end else begin 
    sync2 <= data;
  end

// different resets on sync will make reset to capture metable value
