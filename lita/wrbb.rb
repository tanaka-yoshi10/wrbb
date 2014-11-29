@APTemp = 0x49
Serial.begin(0, 9600)
Serial.begin(1, 9600)

sw = 0

I2c.sdascl(17,16)
delay(300)

loop do
  while(Serial.available(0) > 0) do
    c = Serial.read(0).chr
    case c
    when "q"
      Sys.fileload()
    when "t"
      l = I2c.request(@APTemp, 2)
      #Serial.println(0, l.to_s)

      s1 = I2c.lread()
      #Serial.println(0, s1.inspect)
      s2 = I2c.lread()
      #Serial.println(0, s2.inspect)
      temp_h, temp_l = s1, s2
      temp = ((temp_h << 4) + (temp_l >> 4)) * 0.0625

      t = temp.round(1).to_s
      Serial.println(0, t)
      Serial.println(1, t)
    when "l"
      Serial.println(0, sw.to_s)
    when "1"
      sw = 1
    when "0"
      sw = 0
    end
  end

  led(sw)

  delay(500)
end

Sys.fileload()
