import Square from "./square"

const axios = require("axios")

class Grid extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      error: null,
      isLoaded: false,
      recipes: [],
    }
  }

  componentDidMount() {
    axios.get("/api/v1/recipes")
      .then((response) => {
        this.setState({
          isLoaded: true,
          recipes: response.data
        });
      })
      .catch((error) => {
        this.setState({
          isLoaded: true,
          error: error
        });
      })
  }

  render() {
    const { error, isLoaded, recipes } = this.state

    if (error) {
      return (
        <div className="py-5">
          Error: { error.message }
        </div>
      );
    } else if (!isLoaded) {
      return (
        <div className="py-5">
          Loading..
        </div>
      );
    } else {
      return (
        <div className="py-5">
          <div className="flex flex-wrap mb-4">
            {
              recipes.map(recipe => (
                <Square name={recipe.name}/>
              ))
            }
          </div>
        </div>
      );
    }
  }
}

export default Grid;
