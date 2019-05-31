import React, { Component } from 'react';
// import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import {Button, Form, Row} from 'react-bootstrap';



class Formulaire extends Component {
  constructor(props) {
    super(props);
    this.state = {
      comments: [],
      films: []
    };
    this.handleSubmit = this.handleSubmit.bind(this)
    //this.fetchData = this.fetchData.bind(this)
  }


  componentDidMount(){
    this.fetchData();
    this.fetchMovies();
  }

  // fetchData(){
  //   let that = this;
  //   fetch('/films')
  //     .then(res => res.json())
  //     .then(films =>
  //      that.setState({films: films})
  //     );
  //   //.catch(error => console.log('erreurs me voilàà', error))
  // }




  fetchData(){
    let that = this;
    fetch('/comments')
      .then(res => res.json())
      .then(comments =>
       that.setState({comments: comments})
      );
    //.catch(error => console.log('erreurs me voilàà', error))
  }

  fetchMovies(){
    let that = this;
    fetch('/films')
      .then(res => res.json())
      .then(movies =>
       that.setState({films: movies})
      );
    //.catch(error => console.log('erreurs me voilàà', error))
  }


  handleSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const data = new FormData(form);

    for (let name of data.keys()) {
      const input = form.elements[name];

    }

    if (!event.target.checkValidity()) {
      this.setState({ displayErrors: true });
      return;
    }
    this.setState({ displayErrors: false });
    
    fetch('/comments', {
      method: 'POST',
      body: data,
    });
  }



  render(){
    const { displayErrors } = this.state;

    // console.log(this.state.films)
    // const {isLoading, Films} = this.state;
    // const {isLoading, contacts} = this.state;
    return (
      <div className="container formulaire">
        <Form action="/comments" onSubmit={this.handleSubmit}
        noValidate
        className={displayErrors ? 'displayErrors' : ''}>
          
          <Form.Group controlId="exampleForm.ControlSelect1">
            <Form.Label>Title du film</Form.Label>
            {this.state.films.map((film, i)=>

            <Form.Control className="movie_name" as="select" key={i}>
              <option>{film.movie_name}</option>
            </Form.Control>)}
          </Form.Group>
            
          <Form.Group controlId="formGroupUsername">
            <Form.Label>Votre Nom</Form.Label>
            <Form.Control type="text" className="customer_name" placeholder="Entrez votre petit nom" />
          </Form.Group>
          <Form.Group controlId="formGroupCommentaire">
            <Form.Label>Commentaire</Form.Label>
            <Form.Control type="text" className="movie_comment_description" placeholder="The shaade" />
          </Form.Group>

          <Button variant="primary" type="submit">
            Submit
          </Button>
        </Form>
        </div>
      );
    }
  }
  

export default Formulaire;
 