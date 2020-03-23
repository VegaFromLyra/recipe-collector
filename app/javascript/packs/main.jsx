import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Grid from '../grid'
import '../styles/main.css'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Grid />,
    document.body.appendChild(document.createElement('div')),
  )
})
