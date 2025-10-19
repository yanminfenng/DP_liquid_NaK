#!/bin/bash
source activate dpmd

# 清除并准备模型文件
echo "🔄 正在准备模型文件..."
rm -rf frozen_model.pb &>/dev/null
cp /home/fym/work/dp/dp_new/dpgen_after_simplify_run/iter.000003_40W/00.train/001/graph.001.pb ./frozen_model.pb
echo "✅ 模型文件准备完成：frozen_model.pb"

# 数据集列表
datasets=(
  "sys.Na128K0"
)

echo "📁 共 ${#datasets[@]} 个数据集待测试"
echo "======================================"

# 主测试循环
for dataset in "${datasets[@]}"; do
  # 创建结果目录
  result_dir="./results/${dataset}"
  mkdir -p "$result_dir" &>/dev/null
  echo "🆕 已创建结果目录：$result_dir"
  
  # 显示进度信息
  current_task=$(($(printf '%s\n' "${datasets[@]}" | grep -n "$dataset" | cut -d: -f1)))
  echo "🚀 【任务 $current_task/${#datasets[@]}】开始测试数据集：$dataset"
  
  # 执行测试（带超时保护，最多运行3小时）
  timeout 3h dp test -m frozen_model.pb -s "./$dataset" -d dptest.txt \
    > "$result_dir/log.out" 2>&1
  
  # 检查执行状态
  if [ $? -eq 0 ]; then
    status="✅"
    message="测试成功完成"
  else
    status="❌"
    message="测试异常终止"
  fi
  
  # 移动结果文件
  mv test* "$result_dir" &>/dev/null
  mv dptest* "$result_dir" &>/dev/null
  
  echo "$status 【任务 $current_task/${#datasets[@]}】$dataset 测试状态：$message"
  echo "📝 结果保存在：$result_dir"
  echo "--------------------------------------"
done

echo "======================================"
echo "🎉 所有测试任务完成！结果汇总目录：./results"

