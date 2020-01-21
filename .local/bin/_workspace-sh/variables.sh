#!/usr/bin/env bash

MainScreenName="eDP1"

SubScreenName0100="DP1"
SubScreenName0101="DP1-1"
SubScreenName0102="DP1-2"
SubScreenName0103="DP1-3"
SubScreenName0200="DP2"
SubScreenName0201="DP2-1"
SubScreenName0202="DP2-2"
SubScreenName0203="DP2-3"

SubScreenOffArgument=(                  \
  "--output ${SubScreenName0100} --off" \
  "--output ${SubScreenName0101} --off" \
  "--output ${SubScreenName0102} --off" \
  "--output ${SubScreenName0103} --off" \
  "--output ${SubScreenName0200} --off" \
  "--output ${SubScreenName0201} --off" \
  "--output ${SubScreenName0202} --off" \
  "--output ${SubScreenName0203} --off" \
)
