# Google Sheet
https://docs.google.com/spreadsheets/d/1YnXmOzDQ9pM9H3S1C0mhhm8Pv3uXedruE-_VNLvlNlY/edit?gid=386120609#gid=386120609

# Work Process
### MatLab
- set fix-step size -> 0.0002
### Sinwave
- Run : 30 sec
- Block Parameter 
    - Amplitude : 65535
    - Frequency : 
        - 0.5 * 2 * PI
        - 1.0 * 2 * PI
        - 1.5 * 2 * PI
        - 2.0 * 2 * PI
        - 2.5 * 2 * PI
  
### Step
- Run : 20 sec
- Block Parameter
    - Step Time : 10
    - Intitial Value : 0
    - Final Value : 
        - 20% * max_PWM
        - 40% * max_PWM
        - 60% * max_PWM
        - 80% * max_PWM
        - 100% * max_PWM
### Ramp
- Run : 20 sec
- Block Parameter
    - Start Time : 2 Sec
    - Slope
        - 5% * max_PWM
        - 10% * max_PWM
        - 15% * max_PWM
        - 20% * max_PWM
        - 25% * max_PWM