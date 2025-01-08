minutes=$(/home/o0th/go/bin/pomodoro status --format "%R")
output=""

for ((i = 1; i <= minutes; i++)); do
  output+=" "
done

if ((minutes == 0)); then
  output+=""
else
  output+=""
fi

echo -e " $output "
