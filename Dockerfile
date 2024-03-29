FROM ubuntu

RUN apt-get update -y
RUN apt-get install apt-utils -y
RUN apt-get install curl -y
RUN apt-get install language-pack-en -y
RUN apt-get install vim -y
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt-get install zsh -y
RUN chsh -s /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
RUN sed -i 's/robbyrussell/powerlevel9k\/powerlevel9k/' ~/.zshrc
RUN wget  -P ~/.local/share/fonts "https://github.com/crizy182/Docker-ubuntu-18.04-imagefiles/raw/master/fonts/HackBoldNerdFontPlatziLogoAdded.ttf"
RUN echo 'export TERM="xterm-256color"' | cat - ~/.zshrc > temp && mv temp ~/.zshrc
RUN echo "POWERLEVEL9K_MODE=\"nerdfont-complete\"\nPOWERLEVEL9K_PROMPT_ON_NEWLINE=true"
RUN echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=\"▶ \""
RUN echo "POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=\"\"" >> ~/.zshrc
RUN echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_pĺatzi_icon dir vcs)" >> ~/.zshrc
RUN echo "POWERLEVEL9K_CUSTOM_PĹATZI_ICON=\"echo ﵇ Platzi\"" >> ~/.zshrc
RUN echo "POWERLEVEL9K_CUSTOM_PĹATZI_ICON_BACKGROUND=015" >> ~/.zshrc
RUN echo "POWERLEVEL9K_CUSTOM_PĹATZI_ICON_FOREGROUND=002" >> ~/.zshrc

# RUN git clone git@github.com:pablotrinidad/cride-platzi.git