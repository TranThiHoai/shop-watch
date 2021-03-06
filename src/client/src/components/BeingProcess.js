import React, { Component } from 'react';
import { Link, Redirect } from 'react-router-dom';
import Cookies from 'universal-cookie';
import axios from 'axios';

const cookies = new Cookies();

class BeingProcess extends Component
{
    state =
    {
        fullname: '',
        address: '',
        phone: '',
        devMeth: '',
        devPrice: '',
        paymentMeth: '',
        grandTotal: '',
        orderDate: '',
        orderID: '',
        listBP: []
    }

    componentWillMount = () =>
    {
        var userID = cookies.get('sessionID');
        var orderID = this.props.location.state.orderID;

        if (userID !== undefined)
        {
            axios.post('http://localhost:3001/BeingProcess',
            {
                orderID: orderID
            })
            .then((response) =>
            {
                console.log(response.data)
                var results = response.data
                var length = results.length

                if (length !== 0)
                {
                    var GT = 0;
                    for (var i in results) GT = GT + results[i].subtotal

                    var date = results[0].orderDate;
                    var indexT = date.indexOf('T')
                    var orderDate = date.slice(0, indexT)

                    this.setState({
                        listBP: results,
                        fullname: results[0].ship_name,
                        address: results[0].ship_add,
                        phone: results[0].ship_phone,
                        paymentMeth: results[0].bank,
                        devMeth: results[0].dev_meth,
                        devPrice: results[0].dev_price,
                        grandTotal: results[0].dev_price + GT,
                        orderDate: orderDate,
                        orderID: 'INV_' + results[0].orderID
                    })
                }
            })
        }
    }
    // to pull being process item

    render()
    {
        if (cookies.get('sessionID') === undefined) return <Redirect to='/Login'/>
        // to check if the users already login or not

        const BPList = this.state.listBP.map((item, index) =>
        {
            var checkoutID = item.id // idcheckout
            var prodName = item.prod_name;
            var prodPrice = item.prod_price;
            var prodQty = item.quantity;
            var subtotal = item.subtotal;

            return <tr key={index} nilai={checkoutID}>
                    <td>{prodName}</td>
                    <td className="text-center"><strong>{prodPrice}</strong></td>
                    <td>
                        <input type="number" className="form-control text-center" id="number1" value={prodQty} disabled/>
                    </td>
                    <td className="text-right"><strong>{subtotal}</strong></td>
                </tr>
        })
        // for mapping the BP list

        return (
            <div id="homeback">
                <div className="container padbot padtop">
                    <div className="row">
                        <div className="col-md-12">
                            <div className="panel panel-default">
                                <div className="panel-heading">
                                    <h3><strong>Order Summary - Being Process Item</strong></h3>
                                </div>
                                <div className="panel-body">
                                    <div className="table-responsive">
                                        <table className="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th className="text-center">Price (IDR)</th>
                                                    <th className="text-center">Quantity</th>
                                                    <th className="text-right">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {BPList}
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td><b>Shipped to</b></td>
                                                    <td><input type="text" className="form-control text-left" id="" value={this.state.fullname} placeholder="Full Name" disabled/></td>
                                                    <td><input type="text" className="form-control text-left" id="" value={this.state.address} placeholder="Address" disabled/></td>
                                                    <td><input type="number" className="form-control text-left" id="" value={this.state.phone} placeholder="Phone Number" disabled/></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Delivery Method</b></td>
                                                    <td></td>
                                                    <td className="text-right">
                                                        {this.state.devMeth}
                                                    </td>
                                                    <td className="text-right"><b>{this.state.devPrice}</b></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Payment Method</b></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td className="text-right">
                                                        {this.state.paymentMeth}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>Date Order</b></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td className="text-right"><b>{this.state.orderDate}</b></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Order ID</b></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td className="text-right"><b>{this.state.orderID}</b></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Expiry Date</b></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td className="text-right"><b>Belom Diganti</b></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <h3>Total</h3>
                                                    </td>
                                                    <td className="text-right">
                                                        <h3>{this.state.grandTotal}</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <Link to="/Paymenthis">
                                                            <button className="btn btn-primary"><span className="fa fa-arrow-left">&nbsp;&nbsp;</span>to Payment History</button>    
                                                        </Link>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}
export default BeingProcess;