import Square from './square'

class Grid extends React.Component {
  render() {
    return (
      <div className="text-center">
        <div className="flex flex-wrap mb-4">
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 1</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 2</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 3</div>
        </div>
        <div className="flex flex-wrap mb-4">
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 4</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 5</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 6</div>
        </div>
        <div className="flex flex-wrap mb-4">
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 7</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 8</div>
          <div className="sm:w-full xl:w-1/3 mb-4 bg-gray-500">Recipe 9</div>
        </div>
      </div>
    );
  }
}

export default Grid;
