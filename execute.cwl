#!/usr/bin/env cwl-runner
cwlVersion: 'cwl:draft-3'
class: CommandLineTool
id: "execute"
label: "Execute commands"
inputs:
  - id: Script to run
    type: File
    description: |
      Filename of script to execute all EVM commands.
    inputBinding:
      position: 1
  - id: Commands list
    type: File
    description: |
      Commands list file
    inputBinding:
      position: 2
outputs:
   - id: Output file
     label: "evm.out"
     type: File
     description: |
       Output file
     outputBinding:
        glob: evm.out
stdout: evm.out
baseCommand: perl
description: |
   Tool for running all the commands to create the evm.out file.
