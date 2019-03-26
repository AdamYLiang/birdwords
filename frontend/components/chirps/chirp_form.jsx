import React from 'react';

class ChirpForm extends React.Component {
  constructor(props) {
    super(props);
    const { body } = props;
    //local component state, not to be confused with global state!
    this.state = {
      body,
    };
    // debugger
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    return (e) => {
      this.setState({ [field]: e.target.value }); //keys in javascript are strings
    };
  }

  //event handlers always have access to the event
  handleSubmit(e) {
    // debugger
    e.preventDefault();
    const { chirpAction } = this.props;

    const chirp = this.state;
    // chirp.id = Math.floor(Math.random() * 10000);
    chirpAction(chirp);
    this.setState({ body: '' });
  }

  render() {
    // debugger
    const { body } = this.state;
    const { inputLabel } = this.props;
    //Controlled components have all of their inputs via the state 
    //Uncontrolled components have inputs changed via the DOM, not recommended
    return (
      <form onSubmit={this.handleSubmit} className="chirp-form">
        <label htmlFor="chirp-body">{inputLabel}:
          <input 
            id="chirp-body"
            type="text"
            onChange={this.handleChange('body')}
            value={body}
          />
        </label>
        <br/>
        <input type="submit" className="chirp-button" value="Chirp it up!" />
      </form>
    );
  }
}

export default ChirpForm;
