module CounterWithPowerOptimization (
    input wire clk,
    input wire rst,
    input wire enable_clk,  // Clock gating control
    input wire power_enable, // Power gating control
    output reg [3:0] count
);

reg clk_gated;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
        clk_gated <= 1'b1; //  reset
    end
    else if (power_enable) begin
        // Enable clock gating based on enable_clk
        if (enable_clk) begin
            if (count == 4'b1001)
                count <= 4'b0000;
            else
                count <= count + 1;
        end
        // enabling the Buffered Clock
        clk_gated <= enable_clk;
    end
    else begin
        // Power gating: turn off clock when power is disabled
        clk_gated <= 1'b0;
    end
end

// Instantiate Buffer Gate Clock Enable
BUFGCE #( ) u1 (
    .I(clk),            // Clock input
    .CE(clk_gated),     // Clock enable input (gated)
    .O()                // Buffered clock output (not used at all)
);

endmodule
