@APTemp = 0x49
Serial.begin(0, 115200)

#Serial.println(0, "test")

I2c.sdascl(17,16)
delay(300)

10.times do
  l = I2c.request(@APTemp, 2)
  #Serial.println(0, l.to_s)

  s1 = I2c.lread()
  #Serial.println(0, s1.inspect)
  s2 = I2c.lread()
  #Serial.println(0, s2.inspect)
  temp_h, temp_l = s1, s2
  temp = ((temp_h << 4) + (temp_l >> 4)) * 0.0625

  Serial.println(0, temp.inspect)
  delay(1000)
end

Sys.fileload()
