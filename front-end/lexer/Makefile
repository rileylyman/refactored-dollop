LEXSOURCE=jailex.l
CC=gcc
CCFLAGS=-lfl -ly -I.
OUTPUT_NAME=lexer
TARGET_FOLDER=target

default: 
	mkdir -p $(TARGET_FOLDER)
	flex -o $(TARGET_FOLDER)/lex.yy.c $(LEXSOURCE)
	$(CC) $(CCFLAGS) -o $(TARGET_FOLDER)/$(OUTPUT_NAME) $(TARGET_FOLDER)/lex.yy.c

clean:
	$(RM) -rf $(TARGET_FOLDER)
