module normal_queue (
    input        clk,
    input        reset,
    input        enqueue,
    input        dequeue,
    input  [7:0] data_in,

    output [7:0] data_out,
    output [3:0] count,
    output       full,
    output       empty
);

    reg [7:0] memory [0:7];
    reg [2:0] write_ptr;
    reg [2:0] read_ptr;
    reg [3:0] count_reg;

    assign data_out = memory[read_ptr];
    assign count    = count_reg;
    assign full     = (count_reg == 4'd8);
    assign empty    = (count_reg == 4'd0);

    always @(posedge clk) begin
        if (reset) begin
            write_ptr <= 3'd0;
            read_ptr  <= 3'd0;
            count_reg <= 4'd0;
        end
        else begin

            if (enqueue && !full) begin
                memory[write_ptr] <= data_in;
                write_ptr <= write_ptr + 3'd1;
            end

            if (dequeue && !empty) begin
                read_ptr <= read_ptr + 3'd1;
            end

            case ({enqueue && !full, dequeue && !empty})
                2'b10: count_reg <= count_reg + 4'd1;
                2'b01: count_reg <= count_reg - 4'd1;
                default: count_reg <= count_reg;
            endcase
        end
    end

endmodule
