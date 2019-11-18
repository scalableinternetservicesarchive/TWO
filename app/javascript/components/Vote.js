import React from 'react';
import PropTypes from "prop-types";
import UserAvatar from "./UserAvatar";
const axios = require('axios');

class Vote extends React.Component {
  constructor (props) {
    super(props);
    let uc = 'white';
    let dc = 'white';
    if(this.props.status === 'up') uc = 'green';
    if(this.props.status === 'down') dc = 'red';
    this.state = {
      status: props.status,
      upcolor: uc,
      downcolor: dc,
      upnum: this.props.up,
      downnum: this.props.down
    };
  }

  static neu_state = {
    status: 'neutral',
    upcolor: 'white',
    downcolor: 'white'
  };

  static up_state = {
    status: 'up',
    upcolor: 'green',
    downcolor: 'white'
  };

  static down_state = {
    status: 'down',
    upcolor: 'white',
    downcolor: 'red'
  };

  axios_post = (op) => {
    axios.post(this.base_url,
      {
        username: this.props.username,
        whatever_chat_id: this.props.postid,
        operation: op
      });
  };

  base_url = '/vote/';

  clickUp = () => {
    if(this.state.status === 'up') {
      this.setState(() => Vote.neu_state);
      this.axios_post('neutral');
    }
    else {
      this.setState(() => Vote.up_state);
      this.axios_post('up');
    }
    console.log(this.state);
  };

  clickDown = () => {
    if(this.state.status === 'down') {
      this.setState(Vote.neu_state);
      this.axios_post('neutral');
    }
    else {
      this.setState(Vote.down_state);
      this.axios_post('down');
    }
  };

  render() {
    const type = this.props.up ? 'up' : 'down';
    let icon = require('../images/static/'+ type + '.png');

    return (
      <div>
        <div
          style={{background: this.state.upcolor}}
          onClick={this.clickUp}>
            <img src={require('../images/static/up.png')} alt={"upvote"}
                 height={25} width={25} />
            {this.props.up}
        </div>
      <div
        style={{background: this.state.downcolor}}
        onClick={this.clickDown}>
        <img src={require('../images/static/down.png')}
                   alt={'downvote'} height={25} width={25} />
          {this.props.down} </div>
      </div>
    )
  }
}

Vote.propTypes = {
  username: PropTypes.string,
  postid: PropTypes.number,
  up: PropTypes.number,
  down: PropTypes.number,
  status: PropTypes.string
};

export default Vote
