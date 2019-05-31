import React from 'react';
import './header.css';
// import Button from 'react-bootstrap/Button';
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';
import Form from 'react-bootstrap/Form';
import FormControl from 'react-bootstrap/FormControl';
import Button from 'react-bootstrap/Button';
import SearchBar from './SearchBar';

import {Link} from 'react-router-dom';
import { Component } from 'react';


class Header extends Component {
  constructor(props) {
    super(props);

    this.state = {
      data: [],
      search: '',
      error: null,
      searchText: ''

    };
  }

  componentDidMount(){
    this.fetchData();
  }

  fetchData(){
    fetch('/search')
    .then((response) => response.json())
    .then((title)=>{
      this.setState({
        data:title
      })
    })
    .catch(error => console.log('erreurs me voilàà', error))
  }

  onSearchChange = e => {
    this.setState({
        searchText: e.target.value
    });
  }

  handleSubmit = e => {
      e.preventDefault();
      this.props.onSearch(this.query.value);
      e.currentTarget.reset();
  }

  
  search () {
    // let regex = new RegExp('/[A-Za-z]{1,}/');
    document.getElementById('searchfilm').innerHTML = "";
    this.state.data.forEach(element => {
      console.log(element.movie_name);
      
      if(element.movie_name == this.state.search){
        document.getElementById("searchfilm").insertAdjacentHTML
        ('afterbegin', '<div class="row acdivfilm clearfix"><div class="col-8 title-form"><h3>'+element.movie_name+'</h3></div></div>');}
    });
  }

  render () {
    return(

    <div>
      <Navbar expand="lg">
      <Navbar.Brand href="#home" className="brandname clearfix"><p id="brand1"><span>Tchi</span>Tcha</p><p id="brand2"><span>Cinema</span> JeanMichMuche</p></Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto">
            <Link to="/" className="activebar">Accueil</Link>
            <Link to="/all-films">Films</Link>
            <Link to="/contact">Contacts</Link>
          </Nav>
          <SearchBar/>
          <Form inline>
            {/* <Button variant="outline-success">Search</Button> */}
            {/* <FormControl type="text" placeholder="Search" className="mr-sm-2" /> */}
            {/* <FormControl className="search-form mr-sm-2" onSubmit={this.handleSubmit}
              type="search"
              onChange={this.onSearchChange}
              name="search"              
              // onChange={this.update.bind(this)} value={this.state.search}
              ref={(input) => this.query = input}
              placeholder="Search..." />
              <Button className="search-button" type="submit" id="submit">Go!</Button> */}
            />
          </Form>
        </Navbar.Collapse>
      </Navbar>
      <div id="searchfilm"></div>
    </div>
    );
  }
};


export default Header;
