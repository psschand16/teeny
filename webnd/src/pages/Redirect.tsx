import React, { useState, useEffect } from 'react'
import { useParams } from "react-router-dom";

import axios from 'axios';

const Redirect = () => {

    const [loading, setloading] = useState(1)

    const baseUri = process.env.REACT_APP_URL_BASEURI
    const axiosConfig = {
        // withCredentials: true,
        headers: {
        "Access-Control-Allow-Origin": true,
        Accept: "application/json",
        "Content-Type": "application/json",
        }
      };
    // const baseUri = "http://teenyurl.ml"
    console.log("-------------------redirect-------------------------")
    console.log(useParams()['url'])
    const  url  = useParams()['url']
    console.log("-------------------url-------------------------")
    // console.log(url['url'])
    

    const fetchUrl = async () => {
        
        await axios.get(baseUri + "/api/v1/urls/" + url + "/",axiosConfig)
            .then((res: any) => {
                console.log(res.data.source)
                console.log(res)
                // window.location.href = res.data.source;
                // window.open(res.data.source, "_blank");
                // window.location.assign(res.data.source)
                window.location.replace(res.data.source)
                setloading(0)
            })
    }

    useEffect(() => {
        fetchUrl()
    }, [])

    return (
        <div className="text-center mt-100">
            {loading === 1 && <i className="fas fa-spinner"></i>}
        </div>
    )
}

export default Redirect
