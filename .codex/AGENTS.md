# Global Working Agreements

- Make the smallest coherent change that satisfies the request; avoid unrelated features, cleanup, and refactors.
- Preserve unrelated user changes. Remove only unused code or artifacts introduced by the current change.
- Do not preserve superseded approaches in final artifacts: code, tests, comments, and documentation should express only the current positive contract and durable requirements; do not add checks or prose whose sole purpose is to prove a rejected implementation is absent, unless that absence is itself an enduring externally observable requirement.
- Ask before external writes, destructive or difficult-to-recover actions, deployment or publication, purchases, material scope expansion, or adding or replacing a production dependency or toolchain.
- Run the smallest relevant checks provided by the repository. Report their results, any blocker, and anything not verified.
