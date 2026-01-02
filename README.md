# Improving Plan Flexibility By Reasoning About Action Orderings and Instantiations

To achieve its goals, an agent typically has a plan. However, in realworld domains, the environment can be dynamic, partially observable or contain other agents, and actions can fail or have unexpected side effects.
Thus, this thesis introduces, theoretically analyses and empirically evaluates novel techniques for representing and generating flexible plans that allow the agent to modify its behaviour in response to unexpected events.

While most approaches to plan flexibility are concerned with flexible action orderings, often found by relaxing a classical plan into an optimally flexible partial-order plan (POP), the focus here is the flexibility that arises from allowing the agent to reason about the domain objects used by a plan, that is, the actions’ parameters. 
This thesis shows that plans that allow for both domain objects and action orderings to be selected at execution time, and relaxation processes that optimise both domain object use and ordering, provide more execution-time flexibility than those that consider action orderings alone.

To reason about domain objects at optimisation time, the notions of reinstantiated deordering and reinstantiated reordering are introduced, relaxations of a plan under which both ordering constraints and action parameters can be changed. 
An empirical evaluation shows that these processes can find optimised POPs that are more flexible than is possible when the parameters remain unchanged.

To allow domain objects to be selected at execution time, the notion of a partial plan is introduced, a generalised plan comprising schematised actions and a constraint formula that specifies the allowable combinations of action orderings and parameters. 
A parameterised complexity analysis shows that finding a classical plan that satisfies these constraints is NP-hard, but polynomial for constraint formulae of bounded treewidth. 
An empirical evaluation shows that MkTR, a novel plan relaxation algorithm, can find partial plans of quadratic “complexity” that are significantly more flexible than POPs found by order optimisation techniques.

Symmetry breaking techniques are introduced to ameliorate the combinatorial explosion that results from optimising both action orderings and parameters. 
It is shown that a plan can have an exponential number of equally flexible alternatives with symmetrical causal structures. 
As causal structure symmetries are of a form that occurs in many CSP benchmark problems, but is too general for existing symmetry breaking approaches, MultiLex is introduced, a novel and compact symmetry breaking constraint that removes all but a constant factor of generalised symmetries.
