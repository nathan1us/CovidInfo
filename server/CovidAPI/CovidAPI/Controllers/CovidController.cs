namespace CovidAPI.Controllers
{
    using CovidAPI.Data;
    using CovidAPI.Services;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("[controller]")]
    [ApiController]
    public class CovidController : ControllerBase
    {
        public CovidController(ICovidService covidService)
        {
            CovidService = covidService;
        }

        public ICovidService CovidService { get; }


        [HttpGet("deaths")]
        public async Task<int> Deaths()
        {
            return await this.CovidService.GetDeaths();
        }

        [HttpGet("infected")]
        public async Task<int> Infected()
        {
            return await this.CovidService.GetInfected();
        }

        [HttpGet("recovered")]
        public async Task<int> Recovered()
        {
            return await this.CovidService.GetRecovered();
        }

        [HttpGet("tested")]
        public async Task<int> Tested()
        {
            return await this.CovidService.GetTested();
        }

        [HttpGet("hospitalised")]
        public async Task<int> Hospitalised()
        {
            return await this.CovidService.GetHospitalised();
        }

        [HttpGet("activeCases")]
        public async Task<int> ActiveCases()
        {
            return await this.CovidService.GetActiveCases();
        }

        [HttpGet]
        public async Task<CovidInfo> Covid()
        {
            return await this.CovidService.GetAllInfo();
        }
    }
}
