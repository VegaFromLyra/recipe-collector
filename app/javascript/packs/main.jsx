import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class Grid extends React.Component {
  render() {
    return (
      <div>
        <h1> Recipes are coming...</h1>
      </div>
    );
  }
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Grid />,
    document.body.appendChild(document.createElement('div')),
  )
})
