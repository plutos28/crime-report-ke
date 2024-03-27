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


    
          
          
            
          })();
    }
}