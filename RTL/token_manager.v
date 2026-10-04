module token_manager (
    input        clk,
    input        reset,
    input        new_token,
    input        priority_token,
    input        serve_next,

    output [7:0] current_token,
    output [4:0] queue_count,
    output       queue_full,
    output       priority_active,
    output       service_complete
);

    wire [7:0] generated_token;

    wire [7:0] normal_token;
    wire [7:0] priority_token_data;

    wire [3:0] normal_count;
    wire [3:0] priority_count;

    wire normal_full;
    wire normal_empty;

    wire priority_full;
    wire priority_empty;

    wire normal_dequeue;
    wire priority_dequeue;

    reg [7:0] current_token_reg;
    reg       service_complete_reg;

    /*
     * Token Generator
     */
    token_generator token_gen (
        .clk(clk),
        .reset(reset),
        .generate_token(new_token),
        .token_number(generated_token)
    );

    /*
     * Normal Token Queue
     */
    normal_queue normal_q (
        .clk(clk),
        .reset(reset),
        .enqueue(new_token && !priority_token),
        .dequeue(normal_dequeue),
        .data_in(generated_token),
        .data_out(normal_token),
        .count(normal_count),
        .full(normal_full),
        .empty(normal_empty)
    );

    /*
     * Priority Token Queue
     */
    priority_queue priority_q (
        .clk(clk),
        .reset(reset),
        .enqueue(new_token && priority_token),
        .dequeue(priority_dequeue),
        .data_in(generated_token),
        .data_out(priority_token_data),
        .count(priority_count),
        .full(priority_full),
        .empty(priority_empty)
    );

    /*
     * Priority Scheduler
     */
    priority_scheduler scheduler (
        .clk(clk),
        .reset(reset),
        .normal_empty(normal_empty),
        .priority_empty(priority_empty),
        .serve_next(serve_next),
        .normal_dequeue(normal_dequeue),
        .priority_dequeue(priority_dequeue),
        .priority_active(priority_active)
    );

    /*
     * Current token being served
     */
    always @(posedge clk) begin
        if (reset) begin
            current_token_reg <= 8'd0;
            service_complete_reg <= 1'b0;
        end
        else begin
            service_complete_reg <= 1'b0;

            if (serve_next) begin

                if (priority_dequeue) begin
                    current_token_reg <= priority_token_data;
                    service_complete_reg <= 1'b1;
                end

                else if (normal_dequeue) begin
                    current_token_reg <= normal_token;
                    service_complete_reg <= 1'b1;
                end
            end
        end
    end

    assign current_token = current_token_reg;

    assign queue_count =
        normal_count + priority_count;

    assign queue_full =
        normal_full || priority_full;

    assign service_complete =
        service_complete_reg;

endmodule
