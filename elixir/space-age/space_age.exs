defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earthYear = 31557600
    orbitalPeriod = %{  :mercury => 0.2408467 * earthYear,
                        :venus => 0.61519726 * earthYear,
                        :earth => earthYear,
                        :mars =>1.8808158 * earthYear,
                        :jupiter => 11.862615 * earthYear,
                        :saturn => 29.447498 * earthYear,
                        :uranus => 84.016846 * earthYear,
                        :neptune => 164.79132 * earthYear}

    seconds / orbitalPeriod[planet]
  end
end
