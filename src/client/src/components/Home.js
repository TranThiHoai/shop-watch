import React, { Component } from 'react';
import { Link, Redirect } from 'react-router-dom';
import axios from 'axios';
import Cookies from 'universal-cookie';

const cookies = new Cookies();

class Home extends Component
{
    state = 
    {
        mostordered: [],
        carouselSatu: [],
        carouselDua: [],
        redirectCart: false,
        redirectLogin: false
    }

    componentDidMount = () =>
    {
        axios.get('http://localhost:3001/Homeproduct')
        .then((response) => 
        {
            // console.log(response.data);
            this.setState({
                mostordered: response.data
            })
        })

        axios.get('http://localhost:3001/Carouselhome')
        .then((response) => 
        {
            // console.log(response.data);
            var hasil = response.data
            var carouselSatu = []
            var carouselDua = []
            for (var i=0; i<hasil.length; i++)
            {
                if (i < 3)
                {
                    carouselSatu.push(hasil[i])
                }
                else
                {
                    carouselDua.push(hasil[i])
                }
            }

            this.setState({
                carouselSatu: carouselSatu,
                carouselDua: carouselDua
            })
        })
    }
    // To send request product and category list to server and display the response

    order = (prodid, prodname, prodprice) =>
    {
        var prod_id = prodid;
        var prod_name = prodname;
        var prod_price = prodprice;
        var prodqty = 1;
        var userID = cookies.get('sessionID');

        if (userID !== undefined)
        {
            axios.post('http://localhost:3001/Order', 
            {
                UserID: userID,
                prodQty: prodqty,
                prodID: prod_id,
                prodName: prod_name,
                prodPrice: prod_price
            })
            .then((response) => 
            {
                // console.log(response.data)
                var storestat = response.data;
                if (storestat === 1)
                {
                    this.setState({
                        redirectCart: true
                    })
                }
                // to redirect to cart
            })
        }
        else
        {
            this.setState({
                redirectLogin: true
            })
        }
    }
    // order from carousel

    render()
    {
        if (this.state.redirectCart) return <Redirect to='/Cart'/>
        // if user success add to cart, then move to cart page
        if (this.state.redirectLogin) return <Redirect to='/Login'/>
        // if user not login yet, when user hit add to cart, they will
        // redirect to login

        const mostorder = this.state.mostordered.map((item, index) => 
        {
            let prodid = item.prod_id;
            let prodname = item.prod_name;
            let prodimage = item.prod_img;
            return <div key={index} className="col-md-4">
            <div className="card ada mb-3">
                <div className="card-header">
                    <Link to={{pathname: '/Productdetail/' + prodid, state: {prodid: prodid}}} id="nodecor"><h3 id="Oleo">{prodname}</h3></Link>
                </div>
                <div className="card-body">
                    <img className="" id="stylegambar" src={'http://localhost:3001/images/' + prodimage} alt="asd"/>
                </div>
            </div>
        </div>
        })
        // mapping new arrival

        const carouselFirst = this.state.carouselSatu.map((item, index) => 
        {
            let prodid = item.id;
            let prodname = item.prod_name;
            let prodimage = item.prod_img;
            let prodprice = item.prod_price;
            return <div className="col-sm-4 col-xs-12" key={index}>
                <div className="thumb-wrapper">
                    <div className="img-box">
                    <Link to={{pathname: '/Productdetail/' + prodid, state: {prodid: prodid}}} id="nodecor">
                            <img src={'http://localhost:3001/images/' + prodimage} className="img-responsive img-fluid" alt=""/>
                    </Link>
                    </div>
                    <div className="thumb-content">
                    <Link to={{pathname: '/Productdetail/' + prodid, state: {prodid: prodid}}} id="nodecor">
                        <h4>{prodname}</h4>
                        <p className="item-price">
                            <span>IDR{prodprice}</span>
                        </p>
                    </Link>
                    <button type="button" className="btn btn-primary" onClick={() => this.order(prodid, prodname, prodprice)}>Add to Cart</button>
                    </div>						
                </div>
            </div>
        })
        // carousel 1 new arrival

        const carouselSecond = this.state.carouselDua.map((item, index) => 
        {
            let prodid = item.id;
            let prodname = item.prod_name;
            let prodimage = item.prod_img;
            let prodprice = item.prod_price;
            return <div className="col-sm-4 col-xs-12" key={index}>
                <div className="thumb-wrapper">
                    <div className="img-box">
                    <Link to={{pathname: '/Productdetail/' + prodid, state: {prodid: prodid}}} id="nodecor">
                            <img src={'http://localhost:3001/images/' + prodimage} className="img-responsive img-fluid" alt=""/>
                    </Link>
                    </div>
                    <div className="thumb-content">
                    <Link to={{pathname: '/Productdetail/' + prodid, state: {prodid: prodid}}} id="nodecor">
                        <h4>{prodname}</h4>
                        <p className="item-price">
                            <span>IDR{prodprice}</span>
                        </p>
                    </Link>
                    <button type="button" className="btn btn-primary">Add to Cart</button>
                    </div>						
                </div>
            </div>
        })
        // carousel 2 new arrival

        return (
            <div id="homeback">
                <div className="jumbotron backjumbo paddingku col-md-12">
                    <div className="kotakku">
                        <div className="container-fluid">
                        <center style={{marginTop:470}}>
                            <div className="lead">
                                <a className="btn btn-primary btn-lg" href="#newestproduct">Grab Our Latest Product!</a>&nbsp;
                                <a className="btn btn-success btn-lg" href="#mostordered">Our Most Order Product!</a><br/><br/>
                                <center>
                                    <a className="btn btn-warning btn-lg" href="#custtest">Best Reviews</a>
                                </center>
                            </div>
                        </center>
                        </div>
                    </div>
                </div>

                <div className="container">
                    <div className="row">
                        <div className="col-md-12 garisnya">
                            <h2 id="mostordered"><b>Most</b> Order</h2>
                            <div className="row">
                                {mostorder}
                            </div>
                        </div>
                    </div>
                </div>

                <section id="testimonial">
                    <div className="container" id="custtest">
                        <div className="row text-center garisnya">
                            <h2 id="Pacifico" ><b>Best </b><span>Reviews</span></h2>
                        </div>
                        <div className="row">
                            <div className="testimonial-part">  
                                <div className="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                                    <div className="comment-box">
                                        <p style={{textAlign:'justify'}}> I am the most handsome player in the world, with very elegant and expensive fashion, I am very satisfied with the quality of your store, it is beautiful, very durable, reasonable price and It appeals to me - <span class="customer">David Beckham</span>
                                        </p>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                                    <img className="img-circle" src="bootstrap-3.3.7-dist/css/img/beck-kham.jfif" style={{width:150,height:150}} alt=""/>
                                </div>
                            </div>  
                        </div> 
                            
                        <div className="row">
                            <div className="testimonial-part">
                                <div className="col-lg-3 col-md-3 col-sm-4 col-xs-12 text-right">
                                    <img className="img-circle" src="bootstrap-3.3.7-dist/css/img/messi.jpg" style={{width:150,height:150}} alt=""/>
                                </div>
                                <div className="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                                    <div className="comment-box2">
                                        <p style={{textAlign:'justify'}}>
I am one of the richest players in the world, with very elegant and expensive fashion, I am very satisfied with the quality of your store, it is beautiful, very durable, reasonable price and it attracted me. - <span class="customer">Lionel Messi</span>
                                        </p>
                                    </div>
                                </div>
                            </div>				
                        </div>
                        <div className="row">
                            <div className="testimonial-part">
                                <div className="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                                    <div className="comment-box">
                                        <p style={{textAlign:'justify'}}>I am one of the most famous players in the world, and with very elegant and expensive fashion, I am very satisfied with the quality of your store, it is beautiful, very durable, reasonably priced and It appeals to me. -<span class="customer"> Neymar Jr</span>
                                        </p>
                                    </div>
                                </div>
                                <div className="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                                    <img className="img-circle" src="bootstrap-3.3.7-dist/css/img/neymar.jpg" style={{width:150,height:150}} alt=""/>
                                </div>
                            </div>
                        </div>   
                    </div>    
                </section>
                
                <div className="container" id="newestproduct">
                    <div className="row">
                        <div className="col-md-12 garisnya">
                            <h2>Latest <b>Products</b></h2>
                            <div id="myCarousel" className="carousel slide" data-ride="carousel" data-interval="0">
                                <ol className="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" className="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>   
                                <div className="carousel-inner">
                                    <div className="item carousel-item active">
                                        <div className="row">
                                            {carouselFirst}
                                        </div>
                                    </div>

                                    <div className="item carousel-item">
                                        <div className="row">
                                            {carouselSecond}
                                        </div>
                                    </div>
                                </div>
                        
                                <a className="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                                    <i className="fa fa-angle-left"></i>
                                </a>
                                <a className="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                                    <i className="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <button id="myBtn"><i className="fa fa-caret-up"></i></button>
            </div>
        );
    }
}
export default Home;