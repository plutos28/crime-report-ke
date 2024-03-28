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
            fetch("/reports/crime_counts_by_date")
            .then(res => res.json())
            .then(data => {
               console.log(data)

               new Chart(
                document.getElementById('second_chart'),
                {
                    type: 'bar',
                    data: {
                    labels: data.map(row => row.date),
                    datasets: [
                        {
                        label: 'Crimes By Dates',
                        data: data.map(row => row.count),
                        borderColor: '#FF6384',
                        backgroundColor: '#FFB1C1',
                        }
                    ]
                    }
                }
            );
            });

          })();
    }
}