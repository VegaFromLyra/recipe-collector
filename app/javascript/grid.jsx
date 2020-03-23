import Square from './square'

class Grid extends React.Component {
  renderSquare() {
    return (
      <Square />
    );
  }

  render() {
    return (
      <div className="grid">
        <div className="board-row">
          { this.renderSquare() }
          { this.renderSquare() }
          { this.renderSquare() }
        </div>
        <div className="board-row">
          { this.renderSquare() }
          { this.renderSquare() }
          { this.renderSquare() }
        </div>
        <div className="board-row">
          { this.renderSquare() }
          { this.renderSquare() }
          { this.renderSquare() }
        </div>
      </div>
    );
  }
}

export default Grid;
