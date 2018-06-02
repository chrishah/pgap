cwlVersion: v1.0 
label: "famReport"
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: ncbi/gpdev:latest
    
requirements:
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.proteins)
        writable: False
    
baseCommand: famReport
inputs:
  blast_hits:
    type: File?
    inputBinding:
      prefix: -blast-hits
  blastdb:
    type: string
    inputBinding:
      prefix: -blastdb
  entries:
    type: File?
    inputBinding:
      prefix: -entries
  expose_conflicts:
    type: boolean?
    inputBinding:
      prefix: -expose-conflicts
  fam2:
    type: File?
    inputBinding:
      prefix: -fam2
  fam:
    type: File
    inputBinding:
      prefix: -fam
  hmm_hits:
    type: File
    inputBinding:
      prefix: -hmm-hits
  lds2:
    type: File
    inputBinding:
      prefix: -lds2
  proteins:
    type: File
  out_xml:
    type: string?
    default: hmm-assignments.xml
    inputBinding:
      prefix: -out-xml
    
outputs:
    assignments:
        type: File
        outputBinding:
            glob: $(inputs.out_xml)
        
