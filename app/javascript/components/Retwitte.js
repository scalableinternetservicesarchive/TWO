import React from 'react';
import PropTypes from "prop-types";
const axios = require('axios');
import Modal from "react-modal";
import ReactModal from "react-modal";
import ReactDOM from "react-dom";
import Vote from "./Vote";

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

class Retwitte extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      showModal: false
    };

    this.handleOpenModal = this.handleOpenModal.bind(this);
    this.noCloseModal = this.noCloseModal.bind(this);
    this.yesCloseModal = this.yesCloseModal.bind(this);
  }

  handleOpenModal () {
    this.setState({ showModal: true });
  }

  yesCloseModal () {
    this.setState({ showModal: false });
    axios.post('/retwitte', {
      username: this.props.username,
      original_id: this.props.postid
    });
  }

  noCloseModal () {
    this.setState({ showModal: false });
  }

  render () {
    if(this.props.username === "Global") return (<></>);
    else return (
      <div class="d-flex flex-even">
        <button onClick={this.handleOpenModal} class="flex-even btn btn-info btn-sm mx-2">Retwitte</button>
        <ReactModal
          ariaHideApp={false}
          style={customStyles}
          isOpen={this.state.showModal}
        >
          Do you really want to retwitte this post?
          <button onClick={this.yesCloseModal}>Yes</button>
          <button onClick={this.noCloseModal}>No</button>
        </ReactModal>
      </div>
    );
  }
}

Vote.propTypes = {
  username: PropTypes.string,
  postid: PropTypes.number,
};

export default Retwitte