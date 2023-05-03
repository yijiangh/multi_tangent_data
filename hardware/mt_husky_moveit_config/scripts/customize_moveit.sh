#!/usr/bin/env bash
if [ $# == 1 ]
then
  echo "Creating Directory <" $PWD"/"$1 ">"
  mkdir "$1"
  cd "$1"

  echo "Copying Single UR Moveit Config"
  cp -r $(catkin_find mt_husky_moveit_config)/. .
  echo "Updating Package"
  grep -rli 'mt_husky_moveit_config' * | xargs -i@ sed -i 's/mt_husky_moveit_config/'$1'/g' @
  echo "Done"

else
  echo "USAGE: customize_moveit.sh [new_moveit_package_name]"
fi
