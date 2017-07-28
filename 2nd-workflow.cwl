#!/usr/bin/env cwl-runner
cwlVersion: cwl:draft-3
class: Workflow
inputs:
  - id: g
    type: File
  - id: gp
    type: File
  - id: pa
    type: File
  - id: ta
    type: File
  - id: w
    type: File
  - id: ss
    type: int
  - id: os
    type: int
  - id: sf
    type: string
  - id: of
    type: string
  - id: p
    type: File
  - id: wr
    type: File
  - id: ex
    type: File
  - id: re
    type: File
  - id: co
    type: File
outputs: []
steps:
  - id: part
    run: partition.cwl
    inputs:
       - {id: p, source: "#p"}
       - {id: g, source: "#g"}
       - {id: gp, source: "#gp"}
       - {id: pa, source: "#pa"}
       - {id: ta, source: "#ta"}
       - {id: ss, source: "#ss"}
       - {id: os, source: "#os"}
       - {id: sf, source: "#sf"}
    outputs:
       - {id: partitions_list}
  - id: generate
    run: generate_commands.cwl
    inputs:
       - {id: wr, source: "#wr"}
       - {id: g, source: "#g"}
       - {id: w, source: "#w"}
       - {id: gp, source: "#gp"}
       - {id: pa, source: "#pa"}
       - {id: ta, source: "#ta"}
       - {id: input, source: "#part/partitions_list"}
       - {id: of, source: "#of"}
    outputs:
       - {id: commands_list}
  - id: execute
    run: execute.cwl
    inputs:
       - {id: ex, source: "#ex"}
       - {id: input, source: "#generate/commands_list"}
    outputs:
       - {id: output_file}
  - id: recombine
    run: combine.cwl
    inputs:
       - {id: re, source: "#re"}
       - {id: input, source: "#part/partitions_list"}
       - {id: of, source: "#of"}
    outputs:
       - {id: output1}
       - {id: output2}
  - id: convert
    run: convert.cwl
    inputs:
      - {id: co, source: "#co"}
      - {id: input, source: "#part/partitions_list"}
      - {id: of, source: "#of"}
      - {id: g, source: "#g"}
    outputs:
      - {id: output1.1}
      - {id: output2.1}
