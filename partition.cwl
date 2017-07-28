#!/usr/bin/env cwl-runner
cwlVersion: 'cwl:draft-3'
class: CommandLineTool
requirements:
   - class: InlineJavascriptRequirement
id: "partition"
label: "Partition inputs"
inputs:
  - id: Genome
    type: File
    description: |
      Input genome file (.fasta)
    inputBinding:
      position: 2
      prefix: --genome
  - id: Gene Predictions
    type: File
    description: |
      Input gene prediction file (.gff3)
    inputBinding:
      position: 3
      prefix: --gene_predictions
  - id: Protein Alignments
    label: "Protein Alignments"
    type: ['null', 'File']
    description: |
      Input protein alignments (.gff3)
    inputBinding:
      position: 4
      prefix: --protein_alignments
  - id: Transcript Alignments
    label: "Transcript Alignments"
    type: ['null', 'File']
    description: |
      Input transcript alignments (.gff3)
    inputBinding:
      position: 5
      prefix: --transcript_alignments
  - id: Script
    type: File
    description: |
      Filename of script to partition inputs
    inputBinding:
      position: 1
  - id: Segment size
    type: int
    description: |
      Segment size for partitions, should be set to less than 1 Mb
    inputBinding:
      position: 6
      prefix: --segmentSize
  - id: Overlap size
    type: int
    description: |
      Overlap size for partitions
    inputBinding:
      position: 7
      prefix: --overlapSize
  - id: Summary_filename
    type: string
    description: |
      This file is used by subsequent tools to identify all the partitioned inputs.
    inputBinding:
      position: 8
      prefix: --partition_listing
outputs:
  - id: Output partitions file
    type: File
    outputBinding:
      glob: $(inputs.Summary_filename)
baseCommand: perl
description: |
   This tool takes in required inputs to partition them properly. The required inputs are the genome, the gene predictions, the segment size, the overlap size, and the name of the output file to be created.
