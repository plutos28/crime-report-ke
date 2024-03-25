import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Hello, Stimulus!", this.element);

        (async function() {
            let crimeCounts = {};

            fetch("/reports/map_data")
            .then(res => res.json())
            .then(data => {
                data.forEach(report => {
                    crimeCounts[report.type_of_crime] = (crimeCounts[report.type_of_crime] || 0) + 1
                });
            });

            console.log(crimeCounts)

            const data = [
                { year: 2010, count: 10 },
                { year: 2011, count: 20 },
                { year: 2012, count: 15 },
                { year: 2013, count: 25 },
                { year: 2014, count: 22 },
                { year: 2015, count: 30 },
                { year: 2016, count: 28 },
            ];
          
            new Chart(
                document.getElementById('acquisitions'),
                {
                    type: 'bar',
                    data: {
                    labels: data.map(row => row.year),
                    datasets: [
                        {
                        label: 'Acquisitions by year',
                        data: data.map(row => row.count)
                        }
                    ]
                    }
                }
            );
          })();
    }
}