import React, { Component } from 'react';
import logo from './logo.svg';
import Filter from './components/Filter';
import PuppyContainer from './components/PuppyContainer';
import PuppyDetails from './components/PuppyDetails';
import './App.css';

const dataURL = `http://localhost:3000/pups`

class App extends Component {
  constructor(props){
    super(props)
    this.state = {
      dogData : [],
      foundDog: null,
      searchBox: ""
    }
  }
  componentDidMount(){
    fetch(dataURL)
      .then(response => response.json())
      .then(dogdata => {
        this.setState({dogData: dogdata})
      })
  }
  handleClick = (id) => {
    const foundDog = this.state.dogData.find(dog => dog.id === id)
    console.log("Id is",id)
    console.log(foundDog);
    this.setState({foundDog: foundDog}, () => console.log("After setState",this.state.foundDog))
  }
  handleSearch = (event) => {
    console.log(event.target.value);
    this.setState({searchBox: event.target.value}, () => console.log(this.state))
  }
  handleDisplay = () => {
    const toRender = this.state.dogData.filter(dogObj => dogObj.name.toLowerCase().includes(this.state.searchBox))
    return toRender
  }


  render() {
    console.log('App State - ', this.state);
    return (
      <div>
        <h1 id="header">Puppy DB</h1>
        <Filter handleSearch={this.handleSearch} />
        <div id="app-container">
          <PuppyContainer
            dogData={this.handleDisplay()}
            handleClick={this.handleClick}
          />
          <PuppyDetails clickedDog={this.state.foundDog}/>
        </div>
      </div>
    );
  }
}

export default App;
