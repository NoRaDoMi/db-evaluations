dofile("./lua/oltp_common.lua")

function prepare_statements()
    --- prepare_point_selects()
    if not sysbench.opt.skip_trx then
       prepare_begin()
       prepare_commit()
    end
    if sysbench.opt.range_selects then
       prepare_simple_ranges()
    --    prepare_sum_ranges()
    --    prepare_order_ranges()
    --    prepare_distinct_ranges()
    end
end

function event()
    if not sysbench.opt.skip_trx then
        begin()
    end

    --- execute_point_selects()

    if sysbench.opt.range_selects then
        execute_simple_ranges()
        -- execute_sum_ranges()
        -- execute_order_ranges()
        -- execute_distinct_ranges()
    end

    if not sysbench.opt.skip_trx then
        commit()
    end
end