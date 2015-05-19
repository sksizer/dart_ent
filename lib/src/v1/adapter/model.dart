// Datastructures to represent

enum NodeStates {ROOT, CONTAINER, LEAF}

// Specifies the View Model For a Node.
/**
 * This is intended to provide a base ViewModel to drive the behavior and appearance of a Tree Node.
 *
 * It can be extended by consumers via the injection of their own data model in a context object and allowing an
 * injected renderer to change or override behavior as consumer dictated.
 */
class Node {
  /**
   * The kind of node.
   */
  NodeStates kind;

  /**
   * Is the node expanded
   */
  bool expanded;

  /**
   * Is user 'hovering' over this node.
   */
  bool hovered;

  /**
   * Is user 'hovering' over child of this node.
   */
  bool childHovered;

  /**
   * is this node in a 'selected' mode
   */
  bool selected;

  /**
   * does this node have a child that is in a 'selected' mode
   */
  bool childSelected;

  /**
   * The outside world data that this view model node is bound to.
   */
  Object datum;

  /**
   * The context (the tree this node exists within.
   */
  Tree context;
}

///**
// * Vaguely fluxy locator for mutation APIs. All operations occur here and work against the data model (the tree).
// */
//class TreeActions {
//  Tree context;
//
//  setSelected(item) {
//    context._selected = item;
//  }
//
//  TreeActions(this.context);
//}

/**
 * The absolute simplest data model to start with.
 */
class Tree {
  List<Function> _listeners = [];

  Object _selected;
  Object get selected => _selected;
  Object set selected(value) {
    _selected = value;
    _dispatch();
  }

  onDispatch(Function listener) {
    _listeners.add(listener);
  }

  _dispatch() {
    _listeners.forEach((listener) {
      listener();
    });
  }
}