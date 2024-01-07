if command -v play > /dev/null; then
echo -e "\n${GREEN}Music playback started in the background.${NC}"
play ./data/1704523429064_track.mp3 &
else
echo -e "\n${GREEN}Music playback is not available. Skipping...${NC}"
fi
