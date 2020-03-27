import Square from './square'

class Grid extends React.Component {
  render() {
    return (
      <div className="py-5">
        <div className="flex flex-wrap mb-4">
          <Square name="Semiya upma"/>
          <Square name="Green chutney"/>
          <Square name="Dosa batter"/>
        </div>
      </div>
    );
  }
}

export default Grid;
