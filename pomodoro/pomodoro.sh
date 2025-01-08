minutes=$(/home/o0th/go/bin/pomodoro status --format "%R")
ouput=""

for ((i = 1; i <= minutes; i++)); do
  output+=" "
done

output+=" $(/home/o0th/go/bin/pomodoro status --format "%R")"
echo -e "$output"
