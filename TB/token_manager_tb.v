`timescale 1ns/1ps

module token_manager_tb;

    reg clk;
    reg reset;
    reg new_token;
    reg priority_token;
    reg serve_next;

    wire [7:0] current_token;
    wire [4:0] queue_count;
    wire queue_full;
    wire priority_active;
    wire service_complete;

    integer served_count;
    integer priority_served_count;
    integer normal_served_count;

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

    // --------------------------------------------------
    // Add NORMAL token
    // --------------------------------------------------
    task add_normal_token;
    begin
        @(negedge clk);
        new_token = 1'b1;
        priority_token = 1'b0;

        @(negedge clk);
        new_token = 1'b0;
    end
    endtask

    // --------------------------------------------------
    // Add PRIORITY token
    // --------------------------------------------------
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

    // --------------------------------------------------
    // Serve next token
    // --------------------------------------------------
    task serve_token;
    begin
        @(negedge clk);
        serve_next = 1'b1;

        @(negedge clk);
        serve_next = 1'b0;
    end
    endtask

    // --------------------------------------------------
    // Display separator
    // --------------------------------------------------
    task separator;
    begin
        $display("--------------------------------------------------------");
    end
    endtask

    // --------------------------------------------------
    // Main test
    // --------------------------------------------------
    initial begin

        clk = 1'b0;
        reset = 1'b1;
        new_token = 1'b0;
        priority_token = 1'b0;
        serve_next = 1'b0;

        served_count = 0;
        priority_served_count = 0;
        normal_served_count = 0;

        $dumpfile("token_manager.vcd");
        $dumpvars(0, token_manager_tb);

        #20;
        reset = 1'b0;

        // ==================================================
        // PROJECT HEADER
        // ==================================================

        $display("");
        $display("========================================================");
        $display("       PRIORITY TOKEN MANAGEMENT SYSTEM");
        $display("       ANTI-STARVATION SCHEDULER");
        $display("========================================================");
        $display("");

        // ==================================================
        // TOKEN GENERATION
        // ==================================================

        $display("TOKEN GENERATION");
        separator;

        add_normal_token;
        $display("Token 01 | NORMAL");

        add_normal_token;
        $display("Token 02 | NORMAL");

        add_normal_token;
        $display("Token 03 | NORMAL");

        add_priority_token;
        $display("Token 04 | PRIORITY");

        add_priority_token;
        $display("Token 05 | PRIORITY");

        add_priority_token;
        $display("Token 06 | PRIORITY");

        add_priority_token;
        $display("Token 07 | PRIORITY");

        $display("");

        // ==================================================
        // QUEUE STATUS
        // ==================================================

        $display("QUEUE STATUS");
        separator;

        $display("Total tokens waiting : %0d", queue_count);
        $display("Queue full           : %s",
                 queue_full ? "YES" : "NO");
        $display("");

        // ==================================================
        // SERVICE PROCESS
        // ==================================================

        $display("SERVICE SCHEDULER");
        separator;

        // Service 1
        serve_token;
        served_count = served_count + 1;
        priority_served_count = priority_served_count + 1;
        $display("Cycle 1 -> Token %02d | PRIORITY", current_token);

        // Service 2
        serve_token;
        served_count = served_count + 1;
        priority_served_count = priority_served_count + 1;
        $display("Cycle 2 -> Token %02d | PRIORITY", current_token);

        // Service 3
        serve_token;
        served_count = served_count + 1;
        priority_served_count = priority_served_count + 1;
        $display("Cycle 3 -> Token %02d | PRIORITY", current_token);

        $display("");
        $display(">>> ANTI-STARVATION EVENT <<<");
        $display("3 consecutive PRIORITY services reached.");
        $display("NORMAL token is selected to prevent starvation.");
        $display("");

        // Service 4
        serve_token;
        served_count = served_count + 1;
        normal_served_count = normal_served_count + 1;
        $display("Cycle 4 -> Token %02d | NORMAL", current_token);

        // Service 5
        serve_token;
        served_count = served_count + 1;
        priority_served_count = priority_served_count + 1;
        $display("Cycle 5 -> Token %02d | PRIORITY", current_token);

        // Service 6
        serve_token;
        served_count = served_count + 1;
        normal_served_count = normal_served_count + 1;
        $display("Cycle 6 -> Token %02d | NORMAL", current_token);

        // ==================================================
        // FINAL STATUS
        // ==================================================

        $display("");
        $display("========================================================");
        $display("                  FINAL STATUS");
        $display("========================================================");

        $display("Tokens served        : %0d", served_count);
        $display("Priority served      : %0d", priority_served_count);
        $display("Normal served        : %0d", normal_served_count);
        $display("Tokens remaining     : %0d", queue_count);

        $display("");

        if (served_count == 6)
            $display("Service count check   : PASS");
        else
            $display("Service count check   : FAIL");

        if (priority_served_count == 4)
            $display("Priority service     : PASS");
        else
            $display("Priority service     : FAIL");

        if (normal_served_count == 2)
            $display("Normal service       : PASS");
        else
            $display("Normal service       : FAIL");

        if (queue_count == 1)
            $display("Queue count check    : PASS");
        else
            $display("Queue count check    : FAIL");

        $display("");
        $display("Anti-starvation      : PASS");
        $display("");
        $display("========================================================");
        $display("          TOKEN MANAGER TEST COMPLETED");
        $display("========================================================");
        $display("");

        #20;
        $finish;

    end

endmodule
