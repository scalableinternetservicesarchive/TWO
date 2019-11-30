import React from 'react';
import PropTypes from "prop-types";
const axios = require('axios');

class Vote extends React.Component {
  constructor (props) {
    super(props);
    let uc = 'white';
    let dc = 'white';
    if(this.props.status === 'up') uc = '#98FB98';
    if(this.props.status === 'down') dc = '#FFA07A';
    this.state = {
      status: props.status,
      upcolor: uc,
      downcolor: dc,
      up: this.props.up,
      down: this.props.down
    };
  }

  static neu_state = {
    status: 'neutral',
    upcolor: 'white',
    downcolor: 'white'
  };

  static up_state = {
    status: 'up',
    upcolor: '#98FB98',
    downcolor: 'white'
  };

  static down_state = {
    status: 'down',
    upcolor: 'white',
    downcolor: '#FFA07A'
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
      this.setState( {up: this.state.up - 1} );
      this.axios_post('neutral');
    }
    else {
      if(this.state.status === 'down') {
        this.setState({down: this.state.down - 1});
      }
      this.setState(() => Vote.up_state);
      this.setState( {up: this.state.up + 1} );
      this.axios_post('up');
    }
    console.log(this.state);
  };

  clickDown = () => {
    if(this.state.status === 'down') {
      this.setState(Vote.neu_state);
      this.setState( {down: this.state.down - 1} );
      this.axios_post('neutral');
    }
    else {
      if(this.state.status === 'up') {
        this.setState({up: this.state.up - 1});
      }
      this.setState(Vote.down_state);
      this.setState( {down: this.state.down + 1} );
      this.axios_post('down');
    }
  };

  render() {
    const type = this.props.up ? 'up' : 'down';
    let icon = require('../images/static/'+ type + '.png');
    if(this.props.username === "Global") {
      this.clickUp = () => {};
      this.clickDown = () => {};
    }

    return (
      <div class="d-flex">
        <div style={{background: this.state.upcolor}} onClick={this.clickUp} class="mr-3 mb-2">
          <img src={require('../images/static/up.png')} alt={"upvote"} height={25} width={25} />
          {this.state.up}
        </div>
        <div style={{background: this.state.downcolor}} onClick={this.clickDown} class="mr-3 mb-2">
          <img src={require('../images/static/down.png')} alt={'downvote'} height={25} width={25} />
          {this.state.down} 
        </div>
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
