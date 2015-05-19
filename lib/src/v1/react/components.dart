import 'package:react/react.dart';
import '../adapter/model.dart';

/**
 * Starting renderer for a tree.
 *
 * At the moment all it does is wrap the recursive node renderer in a top level ul.
 */
class _RootRenderer extends Component {

  Tree _context = new Tree();

  Object get node => props['node'];

  _RootRenderer() {
    _context.onDispatch(() {
      // We draw the tree based when the tree changes. Ta da
      redraw();
    });
    print('_NodeRenderer#constructor');
  }

  render() {
    return ul({}, _NodeRenderer({'node': node,
                                 'context': _context}));
  }
}

var TreeRenderer = registerComponent(() => new _RootRenderer());


/**
 * Recursive Node Renderer
 */
class __NodeRenderer extends Component {
  Tree get context => props['context'];

  Object get node => props['node'];
  List<Object> get children => node['children'];
  bool get hasChildren => children != null ? node['children'].length > 0 : false;

  /**
   * Recursively render the tree based on ViewModel state.
   */
  render() {
    if (hasChildren) {
      return li({}, renderContainerNode(context, node));
    } else {
      return li({'onClick': onNodeTapClick}, 'Node ${node['label']} - selected ${context.selected == node}');
    }
  }

  onNodeTapClick(event) {
    print('onNodeTapClick');
    context.selected = node;
  }

}

/**
 *
 */
List renderContainerNode(Tree context, Map node) {
  var children = [];
  if (node.containsKey('label')) {
    children.add(span({}, 'Node: ${node['label']}'));
  }
  children.add(
      ul({},
        node['children'].map((childNode) {
          return _NodeRenderer({'node': childNode,
                                'context': context}, null);
        })));
  return div({},children);
}

var _NodeRenderer = registerComponent(() => new __NodeRenderer());
