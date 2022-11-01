system "gum style --foreground 212 --border-foreground 212 --border double --align center --width 50 --margin '1 2' --padding '2 4' 'Welcome to 김밥!' 'What are we building today?'"
type = %x(gum choose "Build for Release" "Build for Debug" "Run Only" "Run Built Executable" "Clean Up")

case type

when .includes?("Release")
  system `gum spin --spinner line --title "Building C3 Project for Release..." -- c3c build -O3 --fast`
  `echo '{{ Bold "Release Build Finished! Enjoy!" }}' \
  | gum format -t template`

when .includes?("Debug")
  system `gum spin --spinner line --title "Building C3 Project for Debug..." -- c3c build --safe --debug-log`
  `echo '{{ Bold "Debug Build Finished! Enjoy!" }}' \
  | gum format -t template`

when .includes?("Run")
  system `gum spin --spinner line --title "Running C3 Project..." -- c3c run`
	`echo '{{ Bold "Come back soon, alright?" }}' \
    | gum format -t template`

when .includes?("Clean")
  system `gum spin --spinner line --title "Cleaning up!" -- find . -type f -executable -exec rm {} + 
	rm -r build`
  `echo '{{ Bold "다했다!" }}' \
  | gum format -t template`

when .includes?("Executable")
  system `gum spin --spinner line --title "Searching..." -- find . -type f -executable -exec '{}' ';'`
  `echo '{{ Bold "Did it taste good?" }}' \
  | gum format -t template`

end