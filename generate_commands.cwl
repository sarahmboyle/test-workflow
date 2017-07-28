#!/usr/bin/env cwl-runner
cwlVersion: 'cwl:draft-3'
class: CommandLineTool
id: "generate"
label: "Generate Commands"
inputs:
  - id: Genome
    label: "Genome"
    type: File
    description: |
      Genome sequence in fasta format
    inputBinding:
      position: 2
      prefix: -G
  - id: Weights
    label: "Weights"
    type: File
    description: |
      Weights for evidence types file
    inputBinding:
      position: 3
      prefix: -w
  - id: Gene Predictions
    label: "Gene Predictions"
    type: File
    description: |
      Gene predictions gff3 file
    inputBinding:
      position: 4
      prefix: --gene_predictions
  - id: Protein Alignments
    label: "Protein Alignments"
    type: File
    description: |
      Protein alignments gff3 file
    inputBinding:
      position: 5
      prefix: -p
  - id: Transcript Alignments
    label: "Transcript Alignments"
    type: File
    description: |
      Est alignments gff3 file
    inputBinding:
      position: 6
      prefix: -e
  - id: Script
    type: File
    description: |
      Filename of script to convert files
    inputBinding:
      position: 1
  - id: Partitions list
    type: File
    description: |
      Filename of partitions list
    inputBinding:
      position: 7
      prefix: --partitions
  - id: Output File name
    label: "Output File name"
    type: ['null', 'string']
    description: |
      Name of output file to be written to in the directory containing the inputs
    inputBinding: 
      position: 8
      prefix: --output_file_name
outputs:
  - id: Output file
    type: File
    streamable: true
    outputBinding:
      glob: commands.list
stdout: commands.list
baseCommand: perl
description: |
   This tool takes in input files to generate commands for running them with EVM. The only required input is the partitions file but it is recommended that you input the genome, gene predictions, etc.
