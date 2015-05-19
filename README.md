##  Strategy

- Allow injectable renderers for containers and nodes - this makes it makes it visually and functionally extensible.
- Transparently wrap the provided consumer tree with a view model data structure. This allows multiple independent views 
of the same data to be implemented.
- Implement a 'synchronous' or fully loaded tree first, and then determine best way to implement a lazily loaded tree
 renderer as there are a couple possible API paths for this.
- Isolate as much 'model', utilities, and functionality from actual UI rendering so that it can be easily used among 
multiple UI frameworks
