import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Hello, Stimulus!", this.element);
        

        (async function() {
            let crimeCounts = {};
            let nav = document.querySelector('nav');
            nav.style.display = "none";
            console.log(nav)
            let final_data;
            fetch("/crime_counts")
            .then(res => res.json())
            .then(data => {
               console.log(data)

               new Chart(
                document.getElementById('acquisitions'),
                {
                    type: 'bar',
                    data: {
                    labels: data.map(row => row.year),
                    datasets: [
                        {
                        label: 'Types of crimes',
                        data: data.map(row => row.count)
                        }
                    ]
                    }
                }
            );
            });


            // const data = [
            //     { year: "Assault", count: 10 },
            //     { year: "Theft", count: 20 },
            
            // ];

            // const data = [
            //     { year: 2010, count: 10 },
            //     { year: 2011, count: 20 },
            //     { year: 2012, count: 15 },
            //     { year: 2013, count: 25 },
            //     { year: 2014, count: 22 },
            //     { year: 2015, count: 30 },
            //     { year: 2016, count: 28 },
            // ];
          
          
            
          })();
    }
}