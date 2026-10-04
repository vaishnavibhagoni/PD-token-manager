module token_generator (
    input        clk,
    input        reset,
    input        generate_token,
    output reg [7:0] token_number
);

always @(posedge clk) begin
    if (reset) begin
        token_number <= 8'd1;
    end
    else if (generate_token) begin
        if (token_number == 8'd255)
            token_number <= 8'd1;
        else
            token_number <= token_number + 8'd1;
    end
end

endmodule

