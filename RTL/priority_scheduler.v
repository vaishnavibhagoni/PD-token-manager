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

    reg normal_dequeue_reg;
    reg priority_dequeue_reg;

    assign normal_dequeue   = normal_dequeue_reg;
    assign priority_dequeue = priority_dequeue_reg;

    assign priority_active =
        !priority_empty && (normal_empty || (priority_count < 2'd3));

    always @(posedge clk) begin

        if (reset) begin
            priority_count <= 2'd0;
            normal_dequeue_reg <= 1'b0;
            priority_dequeue_reg <= 1'b0;
        end

        else begin

            normal_dequeue_reg <= 1'b0;
            priority_dequeue_reg <= 1'b0;

            if (serve_next) begin

                if (!priority_empty &&
                    (normal_empty || priority_count < 2'd3)) begin

                    priority_dequeue_reg <= 1'b1;

                    if (!normal_empty)
                        priority_count <= priority_count + 2'd1;
                end

                else if (!normal_empty) begin

                    normal_dequeue_reg <= 1'b1;
                    priority_count <= 2'd0;
                end
            end
        end
    end

endmodule
