import re

def convert_to_gfortran(fixed_form_code):
    # Replace IMPLICIT NONE with explicit declaration
    fixed_form_code = re.sub(r'IMPLICIT\s+NONE', 'IMPLICIT NONE', fixed_form_code)
    
    # Replace PARAMETER statements with CONSTANT in gfortran
    fixed_form_code = re.sub(r'PARAMETER\s*\(([^)]*)\)', r'INTEGER, PARAMETER :: \1', fixed_form_code)
    
    # Replace ENDDO with END DO and ENDIF with END IF in gfortran
    fixed_form_code = fixed_form_code.replace('ENDDO', 'END DO')
    fixed_form_code = fixed_form_code.replace('ENDIF', 'END IF')
    
    # Replace continuation ampersands with newlines for free form
    fixed_form_code = re.sub(r'&', '', fixed_form_code)
    
    return fixed_form_code

def main():
    input_file = 'sim100.f'
    output_file = 'converted_code.f'
    
    with open(input_file, 'r') as file:
        fixed_form_code = file.read()
    
    converted_code = convert_to_gfortran(fixed_form_code)
    
    with open(output_file, 'w') as file:
        file.write(converted_code)

if __name__ == "__main__":
    main()
