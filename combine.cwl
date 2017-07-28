#!/usr/bin/env cwl-runner
cwlVersion: 'cwl:draft-3'
class: CommandLineTool
id: "Combine"
label: "Combine partitions"
inputs:
  - id: Script to run
    type: File
    description: |
      Filename of script to recombine partitions
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
      Filename of output file
    inputBinding:
      position: 3
      prefix: --output_file_name
outputs:
  - id: Output file
    type: File
    streamable: true
    outputBinding:
      glob: evm.out
stdout: evm.out
baseCommand: perl
description: |
   This tool recombines the partitions. The data sets corresponding to single contigs partitioned into overlapping segments must be joined into single outputs, and redundant or discrepant predictions in the overlapping regions of segments must be resolved.
