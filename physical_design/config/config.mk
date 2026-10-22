export DESIGN_NAME = token_manager
export PLATFORM = sky130hd

export VERILOG_FILES = \
    /work/PD-token-manager/token_generator.v \
    /work/PD-token-manager/normal_queue.v \
    /work/PD-token-manager/priority_queue.v \
    /work/PD-token-manager/priority_scheduler.v \
    /work/PD-token-manager/token_manager.v

export SDC_FILE = /work/designs/sky130hd/token_manager/constraint.sdc
export CORE_UTILIZATION = 30
export TNS_END_PERCENT = 100
