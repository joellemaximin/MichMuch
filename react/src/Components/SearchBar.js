import React from 'react';
import './header.css';
// import Button from 'react-bootstrap/Button';

import Button from 'react-bootstrap/Button';

import {Redirect} from 'react-router-dom';
import { Component } from 'react';




class SearchBar extends Component {
    constructor(props) {
      super(props);
      this.state = {
        results: [],
        term: '',
      };
  
      this.submit = this.submit.bind(this);
      this.changeTerm = this.changeTerm.bind(this);
    }
  
    changeTerm(event) {
      this.setState({term: event.target.value});
    }
  
    submit(event) {
      let url = '/search' + encodeURI(this.state.term) + '&json=1';
      fetch.get(url)
        .then(response => {
          let data = {
            results: response.data,
          };
          this.setState(data);
        })
        .catch(error => console.log(error));
    }
  
    render() {
        return (
          <div>
            <form onSubmit={this.submit}>
              <input onChange={this.changeTerm}/>
              <Button type="submit" bsStyle="primary">Find</Button>
            </form>
            {this.state.results.length > 0 &&
              <Redirect to={{
                pathname: '/films',
                state: { results: this.state.results }
              }}/>
            }
          </div>
        );
      }
    }
    
    export default SearchBar;