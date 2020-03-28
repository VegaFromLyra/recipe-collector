import Square from "./square"

const axios = require("axios")

class Grid extends React.Component {
  componentDidMount() {
    axios.get("/api/v1/recipes?page=1&limit=3")
      .then(function(response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      })
  }

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
