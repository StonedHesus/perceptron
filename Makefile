BUILD_DIR := ./_build

.PHONY: all clean native byte

all: perceptron.byte perceptron.native

byte:
	@[ -d $(BUILD_DIR) ] && [ -f $(BUILD_DIR)/perceptron.byte ] && ocamlrun $(BUILD_DIR)/perceptron.byte || echo "Error: the .byte bytecode file does not exist within the _build directory!\nFix: run its build command to generate it!"

native:
	@[ -d $(BUILD_DIR) ] && [ -f $(BUILD_DIR)/perceptron.native ] && $(BUILD_DIR)/perceptron.native || echo "Error: the .native executable file does not exist within the _build directory!\nFix: run its build command to generate it!"

clean:
	@rm -rf $(BUILD_DIR) 
	@rm src/*.o src/*.cm*

perceptron.byte:
	@[ ! -d $(BUILD_DIR) ] && mkdir $(BUILD_DIR) || echo ''
	@ocamlc -I ./src -o perceptron.byte src/main.ml
	@mv perceptron.byte $(BUILD_DIR)

perceptron.native: 
	@[ ! -d $(BUILD_DIR) ] && mkdir $(BUILD_DIR) || echo ''
	@ocamlopt -I ./src -o perceptron.native src/main.ml
	@mv perceptron.native $(BUILD_DIR)
