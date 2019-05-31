import React, { Component } from 'react';
import './films.css';

// import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import {Card, Button } from 'react-bootstrap';
import Caarousel from './Caarousel';
import Seances from './Seances';
import Footer from './Footer';
import Header from './Header';
import Comments from './Comments';
import Rating from './Rating';




class Films extends Component {
  constructor(props) {
    super(props);

    this.state = {
      films: []
    };
  }

  
  componentDidMount(){
    this.fetchData();
    //this.fetchDataCome();
  }

  fetchData(){
    fetch('/films')
      .then(res => res.json())
      .then(allfilms =>
       this.setState({films: allfilms })
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


  render(){
    // console.log(this.state.film)

    return (
      <div className="film-wrapper">
        <Header/>
        <Caarousel/>
          <div className="main container">

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

              <div id="place-restants" className="text-center">
                <span> 
                  <br/> 
                  <Rating/>
                </span>
              </div>
              
            </div>
          
          </div>
        <Seances/>
        <Comments/>
        <Footer/>
      </div>
      )
    }

}
  
export default Films;
