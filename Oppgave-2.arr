include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer 
    sanitize komponent using string-sanitizer
end
#Fikset tabellen med bruk av sanitize funksjonen

#New sanitized tabell
kWh-wealthy-consumer-data

#Funksjon for å gjøre string til tall i kolonnen "energi"
fun energi-to-number(str :: String) -> Number:
  doc: "if str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Ny tabell med tall
transformed-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

transformed-table

#funksjon for å beregne energiforbruket for bilbruk
fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(15, 5, 6) is 18
end

distance-travelled-per-day = 15
distance-per-unit-of-fuel = 5
energy-per-unit-of-fuel = 6


#Beregne det totale energiforbruket for en typisk innbygger i et industriland. Her med funksjonen sum sammen med funskjonen car-energi-per-day.
total-energi-car = sum(transformed-table, "energi") + car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel)

total-energi-car

#Graf med data fra tabellen "transformed-table"
bar-chart(transformed-table, "komponent", "energi")

# Ny funksjon for å få den korrekte energiforbruket for bil i visualiseringen av data fra tabell
fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(15, 5, 6)
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Ny tabell med energiforbruk for bil
transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

transformed-table-with-car

#Ny visualisering med den korrekte energiforbuket for bil
bar-chart(transformed-table-with-car, "komponent", "energi")
