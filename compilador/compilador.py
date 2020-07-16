#!/usr/bin/env python
# coding: utf-8

import sys

filename = sys.argv[1].strip()

labels = {}


def normalize_whitespace(string):
    return " ".join(string.strip().lower().split())

def parse_instruction(data, counter):

    print(data)
    
    if (data[0] == "lw" or data[0] == "sw" or data[0] == "xori" ):
        return parse_i_instruction(data[0], data[1], data[2], data[3])

    elif (data[0][0] == "_"):
        labels[data[0][1:]] = instruction_counter
        return
    
    elif (data[0] == "j"):
        opcode = "000010"
        addr = labels.get(data[1])
        addr = '{:026b}'.format(int(addr))

        return opcode + addr

    elif (data[0] == "bne"):
        opcode = "000101"
        addr = labels.get(data[3])
        addr = '{:016b}'.format(int(addr))

        return opcode + convert_register(data[1]) +  convert_register(data[2]) + addr

    elif (data[0] == "add"):
        opcode = "000000"
        func = "001000"
        rd = convert_register(data[1])
        rs = convert_register(data[2])
        rt = convert_register(data[3])

        return opcode + rd + rs + rt + func



def convert_register(register):
    registers = {
        "r0": "00000",
        "r1": "00001",
        "r2": "00010",
        "r3": "00011",
        "r4": "00100"
    }

    return registers.get(register)


def parse_i_instruction(func, rs, rt, imm):
    opcodes = {
        "lw": "100011",
        "sw": "101011",
        "xori": "000101"
    }

    opcode = opcodes.get(func)

    rs = convert_register(rs)
    rt = convert_register(rt)

    imm = '{:016b}'.format(int(imm))

    return opcode + rs + rt + imm

    

with open('out.txt', 'w+') as out_file:
    with open(filename, 'r') as input_file:
        print("Procesando " + filename)

        line = normalize_whitespace(input_file.readline())

        instruction_counter = 0
        while line:
            data = line.split(" ")
            code = parse_instruction(data, instruction_counter)
            print(code)
            if code:
                out_file.write(code + "\n")


            
            line = normalize_whitespace(input_file.readline())
            if code:
                instruction_counter += 1
