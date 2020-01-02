import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Footer extends Component
{
    render()
    {
        return (
            <div>
                <footer>
                    <div className="footerHeader col-xs-12 col-md-12"></div>
                    <div className="container">
                        <div className="col-md-6 col-xs-12">
                            <h3>Our Location </h3>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.6963246239893!2d105.84314655058299!3d21.004806685942793!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac763059a37b%3A0x79a9a13ecadac354!2zxJBIIELDgUNIIEtIT0EgSE4!5e0!3m2!1svi!2s!4v1577024191291!5m2!1svi!2s" style={{width:500,height:'auto',border:0}}></iframe>
                        </div>
                        <div className="col-md-6 col-xs-12 text-right fontsizeku">
                            <h3>Contact Us</h3>
                            <ul>
                                <li>+84 377.601.559&nbsp; <span className="fab fa-whatsapp fontsizeku"></span></li>
                                <li>hoaibkHust@gmail.com &nbsp; <span className="fa fa-envelope fontsizeku"></span></li>
                                <li>@hoaiHust &nbsp; <span className="fab fa-line fontsizeku"></span></li>
                            </ul>
                            <ul className="sm">
                                <li><Link to="https://www.instagram.com" target="_blank" id="nodecor"><i className="fab fa-instagram fontsizeku"></i></Link></li>
                                <li><Link to="https://www.youtube.com/" target="_blank" id="nodecor"><i className="fab fa-youtube fontsizeku"></i></Link></li>
                            </ul>
                        </div>
                        <span className="col-md-12 col-xs-12 text-center fontsizeku padding10" id="Lobster">&copy; <span id="Fountain">Hoai HUST 2019</span></span>
                    </div>
                </footer>
            </div>
        );
    }
}
export default Footer;