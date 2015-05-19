import 'package:react/react.dart';
import 'package:dart_ent/src/v1/react/components.dart';
import './model.dart';

class __TodoComponent extends Component {
  Map get todo => props['todo'];

  render() {
    return h1({}, 'I am a todo!');
  }
}

var _TodoComponent = registerComponent(() => new __TodoComponent());


class _ExampleApp extends Component {
  render() {
    return div({}, [
      TreeRenderer({'node': todos}, null),
      _TodoComponent({}, null)
    ]);
  }
}

var ExampleApp = registerComponent(() => new _ExampleApp());