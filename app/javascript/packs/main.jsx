import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Grid from '../grid'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Grid />,
    document.body.appendChild(document.createElement('div')),
  )
})
