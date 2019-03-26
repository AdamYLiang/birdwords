import React, { Component } from "react";
import { connect } from 'react-redux';
import { fetchUsers } from '../../actions/user_actions';
import UserShow from './user_show';

class UserIndex extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedChirper: null,
    }
  };

  componentDidMount() {
    // debugger
    this.props.fetchUsers();
  }

  selectChirper(id) {
    return () => {
      this.setState({ selectedChirper: id })
    }
  }

  render() {
    // debugger
    const users = this.props.users.map(user => {
      return (
        <li key={user.id} className="user-index-item" onClick={this.selectChirper(user.id)}>
          <p>{user.name}</p>
        </li>
      );
    });

    const { selectedChirper } = this.state;
    return (
      <main className="user-index">
        <div>
          <h3>Meet the chirpers!</h3>
          <ul className="user-list">
            {users}
          </ul>
        </div>
        {selectedChirper ?
          <UserShow
            chirperId={selectedChirper}
            closeShow={() => this.setState({ selectedChirper: null })}
          /> : null}
      </main>
    );
  }
}

const mapStateToProps = state => {
  // debugger
  const users = Object.values(state.entities.users);
  return {
    users
  };
};

const mapDispatchToProps = dispatch => {
  // debugger
  return {
    fetchUsers: () => dispatch(fetchUsers())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserIndex); 