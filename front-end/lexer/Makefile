LEXSOURCE=jailex.l
PARSESOURCE=jaiparse.y
CC=gcc
CCFLAGS=-lfl -ly -I.
OUTPUT_NAME=lexer
TARGET_FOLDER=target

default: 
	mkdir -p $(TARGET_FOLDER)
	bison -d -o $(TARGET_FOLDER)/jaiparse.tab.c $(PARSESOURCE) 
	flex -o $(TARGET_FOLDER)/lex.yy.c $(LEXSOURCE)
	$(CC) $(CCFLAGS) -o $(TARGET_FOLDER)/$(OUTPUT_NAME) $(TARGET_FOLDER)/lex.yy.c $(TARGET_FOLDER)/jaiparse.tab.c

clean:
	$(RM) -rf $(TARGET_FOLDER)
