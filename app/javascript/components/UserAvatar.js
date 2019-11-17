import React from 'react';
import PropTypes from "prop-types";

class UserAvatar extends React.Component {
  render() {
    return (
      <>
      <img src={require(`../images/avatars/${this.props.username}.png`)}
           height={18} width={18} alt={"avatar"} />{this.props.username}
      </>
    )
  }
}

UserAvatar.propTypes = {
    username: PropTypes.string
};

export default UserAvatar
