import os
from pdf2docx import Converter

# Obtener la lista de archivos PDF en el directorio actual
pdf_files = [f for f in os.listdir('.') if f.endswith('.pdf')]

for pdf_file in pdf_files:
    docx_file = pdf_file.replace('.pdf', '.docx')
    cv = Converter(pdf_file)
    cv.convert(docx_file, start=0, end=None)
    cv.close()
