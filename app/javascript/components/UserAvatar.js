import React from 'react';
import PropTypes from "prop-types";

class UserAvatar extends React.Component {
  render() {
    return (
      <a href={`/from/${this.props.username}`}>
        <img src={require(`../images/avatars/${this.props.username}.png`)}
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
