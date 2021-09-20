--Seleccionar la data a  utilizar

--SELECT *
--FROM CovidDeaths
--ORDER BY 3,4

--SELECT location, date, total_cases, new_cases, total_deaths, population
--FROM CovidDeaths
--ORDER BY 1,2

-- Casos totales vs muertes totales 

--SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS 'DeathPercentage'
--FROM CovidDeaths
--WHERE location LIKE '%states'
--ORDER BY 1,2

-- Casos totales vs poblaci�n
-- Cantidad de la poblaci�n que contrajo COVID-19
--SELECT location, date, total_cases, population, (total_cases/population)*100 AS 'InfectiousRate'
--FROM CovidDeaths
--WHERE location LIKE '%chile'
--ORDER BY 1,2

-- Pa�ses con mayor tasa de infecci�n en comparaci�n con poblaci�n
--SELECT location, MAX(total_cases) AS 'HighestInfectionCount', population, MAX((total_cases/population))*100 AS 'InfectiousRate'
--FROM CovidDeaths
--GROUP BY location, population
--ORDER BY InfectiousRate DESC

 --Pa�ses con mayor tasa de fallecidos por poblaci�n, se divide por 10 por el tipo de dato nvarchar
--SELECT location, MAX(cast(total_deaths/10 as int)) AS 'TotalDeathsCount', population, MAX((total_deaths/population))*100 AS 'DeathRate'
--FROM CovidDeaths
--GROUP BY location, population
--ORDER BY DeathRate DESC

--SELECT location, MAX(floor(total_deaths/10)) AS 'TotalDeathsCount'
--FROM CovidDeaths
--WHERE continent is not null
--GROUP BY location
--ORDER BY TotalDeathsCount DESC

--Agrupaci�n de datos por continente
--SELECT location, MAX(floor(total_deaths/10)) AS 'TotalDeathsCount'
--FROM CovidDeaths
--WHERE continent is null
--GROUP BY location

--Agrupaci�n de datos por d�a
--SELECT date, SUM(floor(new_cases/10)) AS 'TotalCases', SUM(floor(total_deaths/10)) AS 'DeathsCount'
--FROM CovidDeaths
--WHERE continent is not null
--GROUP BY date
--ORDER BY 1,2

--Uni�n de tablas CovidDeaths y CovidVaccinations
--SELECT *
--FROM CovidDeaths AS CD
--INNER JOIN CovidVaccinations AS CV
--ON CD.date = CV.date
--AND CD.location = CV.location


---- Suma de vacunas por d�a en cada pa�s
--SELECT CD.continent, CD.location, CD.date, population, CV.new_vaccinations, CV.total_vaccinations
--FROM CovidDeaths AS CD
--INNER JOIN CovidVaccinations AS CV
--ON CD.date = CV.date
--AND CD.location = CV.location
--WHERE CD.continent is not null
--ORDER BY 2,3

-- Tasa de vacunaci�n por persona con CTE (cantidad de vacunas por persona)

--WITH PopvsVac(continent, location, date, population, new_vaccinations, total_vaccinations)
--AS
--(
--SELECT CD.continent, CD.location, CD.date, population, CV.new_vaccinations, CV.total_vaccinations
--FROM CovidDeaths AS CD
--INNER JOIN CovidVaccinations AS CV
--ON CD.date = CV.date
--AND CD.location = CV.location
--WHERE CD.continent is not null
--)


--SELECT *, (total_vaccinations/(population/10)*100) AS 'VaccinationRate' 
--FROM PopvsVac


-- Temp table
--CREATE TABLE #DosesPerPerson
--(
--continent nvarchar(255),
--location nvarchar(255), 
--date datetime,
--population numeric,
--new_vaccinations nvarchar(255),
--total_vaccinations nvarchar(255)
--)

--INSERT INTO #DosesPerPerson
--SELECT CD.continent, CD.location, CD.date, population, CV.new_vaccinations, CV.total_vaccinations
--FROM CovidDeaths AS CD
--INNER JOIN CovidVaccinations AS CV
--ON CD.date = CV.date
--AND CD.location = CV.location
--WHERE CD.continent is not null

--SELECT *, (total_vaccinations/(population/10)*100) AS 'VaccinationRate' 
--FROM #DosesPerPerson


-- Vista

--CREATE VIEW DosesPerPerson AS
--SELECT CD.continent, CD.location, CD.date, population, CV.new_vaccinations, CV.total_vaccinations
--FROM CovidDeaths AS CD
--INNER JOIN CovidVaccinations AS CV
--ON CD.date = CV.date
--AND CD.location = CV.location
--WHERE CD.continent is not null



