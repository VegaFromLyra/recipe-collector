function Square(props) {
  return (
    <div className="w-full h-64 xl:w-1/3 mb-4 border-2 rounded-lg bg-red-300">
      <div className="p-3">
        <p className="text-white font-bold text-5xl xl:text-xl">{props.name}</p>
      </div>
    </div>
  );
}

export default Square;
