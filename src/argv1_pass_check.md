# AGRV1 password check

```py
#!/usr/bin/env python3

import angr
import claripy


proj = angr.Project('./binary', load_options={"auto_load_libs": False})
argv1 = claripy.BVS("argv1", 0xE * 8)
initial_state = proj.factory.entry_state(args=["./binary", argv1])

#find_addr = 
#avoid_addr = 

sm = proj.factory.simulation_manager(initial_state)
sm.explore(find=find_addr,avoid=avoid_addr)
found = sm.found[0]
print(found.solver.eval(argv1, cast_to=bytes))
```