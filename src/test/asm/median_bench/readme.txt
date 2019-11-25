1) Generate gen_signal.txt and verif_signal.txt by running gen_signal.m
2) Convert gen_signal.txt by running ../asciitotxt.py gen_signal.txt median_bench_data.txt
3) Load median_bench_data.txt by running ../tcl/write_median_bench_data.tcl alongside instruction memory
4) Run processor
5) Run ../tcl/verify_median_bench.tcl to generate median_bench_output.txt
6) Run ../txt2ascii.py median_bench_output_hex.txt median_bench_output.txt 
7) Plot by running median_bench_plot_results.m