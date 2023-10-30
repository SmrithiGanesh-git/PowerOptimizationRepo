module counterNoOptimization(
    input clk,
    input rst,
    output wire [3:0] count
    );
    reg [3:0]count;
    always@(posedge clk)
    begin
    if(rst)
    count<=4'b000;
    else
    count<=count+1;
    end
    
endmodule
