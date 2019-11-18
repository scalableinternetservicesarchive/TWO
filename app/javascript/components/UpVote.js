import React from 'react';
import PropTypes from "prop-types";

class Vote extends React.Component {
  render() {
    let type = this.props.up ? 'up' : 'down';
    let icon_path = '../images/static/' + type + '.png';
    let icon = request(icon_path);

    return (
      <a>
        <img src={icon} alt={type+"vote"} />
      </a>
    )
  }
}

Vote.propTypes = {
  // username: PropTypes.string,
  postid: PropTypes.number,
  up: PropTypes.bool  // true -> upvote, false -> downvote
};