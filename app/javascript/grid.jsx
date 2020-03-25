import Square from './square'
import placeholder from 'placeholder.png'

class Grid extends React.Component {
  render() {
    return (
      <div className="text-center container">
        <div className="flex flex-wrap mb-4">
          <div className="sm:w-full xl:w-1/3 mb-4">
            <img src={placeholder}/>
          </div>
          <div className="sm:w-full xl:w-1/3 mb-4">
            <img src={placeholder}/>
          </div>
          <div className="sm:w-full xl:w-1/3 mb-4">
            <img src={placeholder}/>
          </div>
        </div>
      </div>
    );
  }
}

export default Grid;
