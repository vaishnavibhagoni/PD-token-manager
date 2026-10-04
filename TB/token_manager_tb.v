`timescale 1ns/1ps

module token_manager_tb;

    reg clk;
    reg reset;
    reg new_token;
    reg priority_token;
    reg serve_next;

    wire [7:0] current_token;
    wire [4:0] queue_count;
    wire       queue_full;
    wire       priority_active;
    wire       service_complete;

    token_manager dut (
        .clk(clk),
        .reset(reset),
        .new_token(new_token),
        .priority_token(priority_token),
        .serve_next(serve_next),
        .current_token(current_token),
        .queue_count(queue_count),
        .queue_full(queue_full),
        .priority_active(priority_active),
        .service_complete(service_complete)
    );

    always #5 clk = ~clk;

    task add_normal_token;
    begin
        @(negedge clk);
        new_token = 1'b1;
        priority_token = 1'b0;

        @(negedge clk);
        new_token = 1'b0;
    end
    endtask

    task add_priority_token;
    begin
        @(negedge clk);
        new_token = 1'b1;
        priority_token = 1'b1;

        @(negedge clk);
        new_token = 1'b0;
        priority_token = 1'b0;
    end
    endtask

    task serve_token;
    begin
        @(negedge clk);
        serve_next = 1'b1;

        @(negedge clk);
        serve_next = 1'b0;
    end
    endtask

    initial begin

        clk = 1'b0;
        reset = 1'b1;
        new_token = 1'b0;
        priority_token = 1'b0;
        serve_next = 1'b0;

        $dumpfile("token_manager.vcd");
        $dumpvars(0, token_manager_tb);

        #20;
        reset = 1'b0;

        $display("========================================");
        $display(" TOKEN MANAGER TEST STARTED");
        $display("========================================");

        // Add normal tokens N1, N2, N3
        add_normal_token;
        add_normal_token;
        add_normal_token;

        // Add priority tokens P4, P5, P6, P7
        add_priority_token;
        add_priority_token;
        add_priority_token;
        add_priority_token;

        $display("Tokens added.");
        $display("Queue count = %0d", queue_count);

        // Serve several tokens
        serve_token;
        $display("Served token = %0d", current_token);

        serve_token;
        $display("Served token = %0d", current_token);

        serve_token;
        $display("Served token = %0d", current_token);

        serve_token;
        $display("Served token = %0d", current_token);

        serve_token;
        $display("Served token = %0d", current_token);

        serve_token;
        $display("Served token = %0d", current_token);

        $display("========================================");
        $display(" FINAL QUEUE COUNT = %0d", queue_count);
        $display("========================================");

        #20;

        $finish;
    end

endmodule
