module priority_scheduler (
    input        clk,
    input        reset,

    input        normal_empty,
    input        priority_empty,

    input        serve_next,

    output       normal_dequeue,
    output       priority_dequeue,
    output       priority_active
);

    reg [1:0] priority_count;

    /*
     * Priority can be selected when:
     * 1. There are priority tokens and no normal tokens, OR
     * 2. There are priority tokens and fewer than 3 priority
     *    tokens have been served consecutively.
     */
    assign priority_active =
        !priority_empty &&
        (normal_empty || (priority_count < 2'd3));

    /*
     * Dequeue signals are combinational.
     * This allows token_manager to see the correct decision
     * during the same clock cycle as serve_next.
     */
    assign priority_dequeue =
        serve_next && priority_active;

    assign normal_dequeue =
        serve_next &&
        !priority_active &&
        !normal_empty;

    /*
     * Anti-starvation counter
     */
    always @(posedge clk) begin
        if (reset) begin
            priority_count <= 2'd0;
        end
        else if (serve_next) begin

            if (priority_dequeue) begin
                if (!normal_empty)
                    priority_count <= priority_count + 2'd1;
                else
                    priority_count <= priority_count;
            end

            else if (normal_dequeue) begin
                priority_count <= 2'd0;
            end
        end
    end

endmodule
