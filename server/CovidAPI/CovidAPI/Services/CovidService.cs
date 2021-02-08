namespace CovidAPI.Services
{
    using CovidAPI.Data;
    using Newtonsoft.Json.Linq;
    using System;
    using System.Net;
    using System.Threading.Tasks;

    public class CovidService : ICovidService
    {
        private const string url = "https://api.apify.com/v2/key-value-stores/np4eYah8M5uQtj0Su/records/LATEST?disableRedirect=true";

        public CovidInfo info { get; set; }

        public async Task<int> GetActiveCases()
        {
            await UpdateData();
            return this.info.ActiveCases;
        }

        public async Task<int> GetDeaths()
        {
            await UpdateData();
            return this.info.Deaths;
        }

        public async Task<int> GetHospitalised()
        {
            await UpdateData();
            return this.info.Hospitalised;
        }

        public async Task<int> GetInfected()
        {
            await UpdateData();
            return this.info.Infected;
        }

        public async Task<int> GetRecovered()
        {
            await UpdateData();
            return this.info.Recovered;
        }

        public async Task<int> GetTested()
        {
            await UpdateData();
            return this.info.Tested;
        }

        private async Task UpdateData()
        {
            bool newApp = false;
            if (info == null)
            {
                info = new CovidInfo();
                newApp = true;
            }

            if (newApp || DateTime.Now.Minute % 5 == 0)
            {
                using (WebClient wc = new WebClient())
                {
                    var json = await wc.DownloadStringTaskAsync(url);

                    JObject o = JObject.Parse(json);
                    this.info.Tested = o.SelectToken("tested").Value<int>();
                    this.info.Infected = o.SelectToken("infected").Value<int>();
                    this.info.ActiveCases = o.SelectToken("activeCases").Value<int>();
                    this.info.Hospitalised = o.SelectToken("hospitalised").Value<int>();
                    this.info.Recovered = o.SelectToken("recovered").Value<int>();
                    this.info.Deaths = o.SelectToken("deceased").Value<int>();
                }
            }
        }

    }
}
