#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quad_generation.h"

/*
 * Function to generate quad code and print it
 * a: Result operand
 * b: Operand 1
 * op: Operation
 * c: Operand 2
 */
void quad_code_gen(char* a, char* b, char* op, char* c) {
    printf("| %-10s | %-10s | %-10s | %-10s |\n", op, b, c, a);
}

/*
 * Function to generate a new temporary variable
 * Returns a string representing the new temporary variable
 */
char* new_temp() {
    char* tempNew = (char*)malloc(sizeof(char) * 4); // Allocate memory for the temporary variable name
    sprintf(tempNew, "t%d", temp_no); // Generate the temporary variable name (e.g., t1, t2, t3, ...)
    temp_no++; // Increment the temporary variable counter
    return tempNew;
}

/*
 * Function to generate a new label
 * Returns a string representing the new label
 */
char* new_label() {
    char* label = (char*)malloc(sizeof(char) * 4); // Allocate memory for the label name
    sprintf(label, "L%d", label_no); // Generate the label name (e.g., L1, L2, L3, ...)
    label_no++; // Increment the label counter
    return label;
}