namespace CovidAPI.Services
{
    using System.Threading.Tasks;

    public interface ICovidService
    {
        public Task<int> GetDeaths();

        public Task<int> GetTested();

        public Task<int> GetInfected();

        public Task<int> GetActiveCases();

        public Task<int> GetHospitalised();

        public Task<int> GetRecovered();
    }
}
