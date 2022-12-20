CXX := g++
CXXFLAGS := -g -Wall --std=c++11 -DDEBUG
GTESTINCL := -I /usr/include/gtest/  
GTESTLIBS := -lgtest -lgtest_main  -lpthread
VALGRIND := valgrind --tool=memcheck --leak-check=yes

all: wordle-driver 

# generic rule for .cpp files
dict-eng.o : dict-eng.cpp dict-eng.h 
	$(CXX) $(CXXFLAGS) -c $< -o $@ 
wordle.o : wordle.cpp wordle.h dict-eng.h
	$(CXX) $(CXXFLAGS) -c $< -o $@ 
wordle-driver : wordle-driver.cpp wordle.o dict-eng.o
	$(CXX) $(CXXFLAGS) $(DEFS)  $^ -o $@ 
clean:
	rm -f *.o wordle-driver *~

.PHONY: clean 
