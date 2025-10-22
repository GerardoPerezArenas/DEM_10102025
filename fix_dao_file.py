#!/usr/bin/env python3
"""
Script to fix the corrupted MeLanbide11DAO.java file.
The file has two code streams merged on the same lines, separated by excessive whitespace.
"""

import re

def fix_dao_file(input_path, output_path):
    """
    Reads the corrupted file and separates the two code streams.
    
    Strategy:
    - Lines with content on both left and right (with large gap) are split
    - The pattern seems to be that after ~80 characters of whitespace, there's a second code stream
    """
    
    with open(input_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    left_stream = []
    right_stream = []
    
    for line in lines:
        # Check if this line has content on both sides with large whitespace gap
        # Pattern: some code, then many spaces (4+ consecutive spaces), then more code
        match = re.match(r'^(.+?)(\s{4,})(\S.*)$', line.rstrip())
        
        if match:
            left_part = match.group(1).rstrip()
            right_part = match.group(3).rstrip()
            
            # Add to respective streams
            left_stream.append(left_part + '\n')
            right_stream.append(right_part + '\n')
        else:
            # Line only has content on one side
            stripped = line.rstrip()
            if stripped:
                left_stream.append(line)
            else:
                left_stream.append('\n')
    
    # Write the fixed file - combine both streams
    with open(output_path, 'w', encoding='utf-8') as f:
        # Write left stream first
        for line in left_stream:
            f.write(line)
        
        # Add a separator comment
        f.write('\n// --- Second code stream (moved from inline) ---\n\n')
        
        # Write right stream
        for line in right_stream:
            if line.strip():  # Only write non-empty lines
                f.write(line)
    
    print(f"Fixed file written to: {output_path}")
    print(f"Left stream lines: {len(left_stream)}")
    print(f"Right stream lines: {len([l for l in right_stream if l.strip()])}")

if __name__ == '__main__':
    input_file = 'src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/dao/MeLanbide11DAO.java'
    output_file = 'src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/dao/MeLanbide11DAO.java.fixed'
    
    fix_dao_file(input_file, output_file)
    
    print("\nReview the fixed file, then run:")
    print(f"  mv {output_file} {input_file}")
