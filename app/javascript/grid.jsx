import Square from './square'

class Grid extends React.Component {
  render() {
    return (
      <div className="py-5">
        <div className="flex flex-wrap mb-4">
          <div className="w-full h-64 xl:w-1/3 mb-4 border-2 rounded-lg bg-red-300">
            <div className="p-3">
              <p className="text-white font-bold text-6xl xl:text-xl">Semiya upma </p>
            </div>
          </div>
          <div className="w-full h-64 xl:w-1/3 mb-4 border-2 rounded-lg bg-red-300">
            <div className="p-3">
              <p className="text-white font-bold text-6xl xl:text-xl">Alu paratha </p>
            </div>
          </div>
          <div className="w-full h-64 xl:w-1/3 mb-4 border-2 rounded-lg bg-red-300">
            <div className="p-3">
              <p className="text-white font-bold text-6xl xl:text-xl">Dosa batter </p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Grid;
