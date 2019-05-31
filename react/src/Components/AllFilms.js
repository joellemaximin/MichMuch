import React, { Component } from 'react';
// import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import {Button, Card} from 'react-bootstrap';
// import Caards from './Caards';
import Footer from './Footer';
import Header from './Header';
import  { History } from 'react-router-dom';
// import Movies from '../Data/Movies.json';



class AllFilms extends Component {
  constructor(props) {
    super(props);
    this.state = {
      films: [],
      datacome: [],
      error: null,
    };
    this.handleClick = this.handleClick.bind(this)
    //this.fetchData = this.fetchData.bind(this)
  }


  componentDidMount(){
    this.fetchData();
    //this.fetchDataCome();
  }

  fetchData(){
    let that = this;
    fetch('/films')
      .then(res => res.json())
      .then(films =>
       that.setState({films: films})
      );
    //.catch(error => console.log('erreurs me voilàà', error))
  }

  // fetchDataCome(){
  //   fetch('./Data/MoviesComing.json')
  //   .then((response) => response.json())
  //   .then((results)=>{
  //     console.log(results)
  //     this.setState({
  //       datacome:results
  //     })
  //   })
  //   .catch(error => console.log('erreurs me voilàà', error))
  // }

  handleClick(e){
    e.preventDefault()
    this.props.history.push('/movies');
  }




  render(){
    console.log(this.state.films)
    // const {isLoading, Films} = this.state;
    // const {isLoading, contacts} = this.state;
    return (
        <div className="wrapper">
          <Header/>
          <div className="container">
            <h4>Cette semaine</h4>

            <div className="movie-description row col-lg-12">
              {this.state.films.map((film, i)=>
              <Card  col="col-sm" key={i} style={{ width: '18rem' }}>
                <Card.Img variant="top" src={film.movie_image}/>
                <Card.Body>
                  <Card.Title>{film.movie_name}</Card.Title>
                    <ul className="small-description">
                      <li id="time">
                        {film.hours}<small>min</small>
                      </li>
                      <li id="movie-rate">
                        {film.movie_rating}
                      </li>
        
                    </ul>
                  <Card.Text>
                    {film.movie_synopsis}
                  </Card.Text>
                  <Button className="pink">Click Me :)</Button>
                </Card.Body>
              </Card>
              )}
          
            </div>

              

            <h4>Films à ne pas rater: NEXT WEEK</h4>
            
            <div className="movie-description row col-lg-12">
            {this.state.films.map((film, i)=>
            <Card  col="col-sm" key={i} style={{ width: '18rem' }}>
              <Card.Img variant="top" src={film.movie_image}/>
              <Card.Body>
                <Card.Title>{film.movie_name}</Card.Title>
                  <ul className="small-description">
                    <li id="time">
                      {film.hours}<small>min</small>
                    </li>
                    <li id="movie-rate">
                      {film.movie_rating}
                    </li>
      
                  </ul>
                <Card.Text>
                  {film.movie_synopsis}
                </Card.Text>
                <Button className="pink">Click Me :)</Button>
              </Card.Body>
            </Card>
            )}
            </div>
         
          </div>
          <Footer/>
        </div>
      );
    }
  }
  

export default AllFilms;
