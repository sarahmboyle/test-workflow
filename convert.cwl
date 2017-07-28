#!/usr/bin/env cwl-runner
cwlVersion: 'cwl:draft-3'
class: CommandLineTool
id: "Convert"
label: "Convert to GFF3	Format"
inputs: 
  - id: Script to run
    type: File
    description: |
      Filename of script to convert raw output files to gff3 format.
    inputBinding: 
      position: 1
  - id: Partitions list
    type: File
    description: |
      Filename of partitions list
    inputBinding: 
      position: 2
      prefix: --partitions
  - id: Output file name
    type: string
    description: |
      Name of original output file
    inputBinding: 
      position: 3
      prefix: --output
  - id: Genome
    type: File
    description: |
      Name of genome file
    inputBinding: 
      position: 4
      prefix: --genome
outputs:
   - id: Final output file
     label: "evm.out.gff3"
     type: File
     description: |
        TODO
     outputBinding:
        glob: evm.out.gff3
stdout: evm.out.gff3
baseCommand: perl    
description: |
  The raw output provided by EVM describes the consensus gene structures in a tab-delimited format, listing each exon with the set of evidences that fully support each exon structure. This output is found as the evm.out (--output_file_name value above) in each contig directory. The raw outputs can be converted to the standard GFF3 format with this tool.After running the above script, an evm.out.gff3 file will exist in each of the contig directories. You can combine them into a single output file with a separate tool.
