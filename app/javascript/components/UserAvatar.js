import React from 'react';
import PropTypes from "prop-types";

class UserAvatar extends React.Component {
  render() {
    let ava;
    try {
      ava = require('../images/avatars/'+this.props.username+'.png');
    }
    catch (e) {
      console.log(`avatar file not found for ${this.props.username}`);
      if (e.code !== 'MODULE_NOT_FOUND') {
        throw e;
      }
      ava = require(`../images/avatars/__default.png`);
    }

    return (
      <a href={`/from/${this.props.username}`}>
        <img src={ava}
             height={18} width={18} alt={"avatar"} />
             {this.props.username}
      </a>
    )
  }
}

UserAvatar.propTypes = {
  username: PropTypes.string
};

export default UserAvatar
