# RobotFramework

Hello! It's my robotframework task for program DQE Intermediate Level.

To run this framework on your machine, you need:
1. Install Python. While installing you'd better add it to PATH. (https://www.tutorialspoint.com/how-to-install-python-in-windows)
2. Install Robot Framework with pip in your cmd: pip install robotframework (https://robotframework.org/?tab=1#getting-started)
3. Install some libraries, which are used in this project: robotframework==5.0.1; robotframework-databaselibrary==1.2.4; pymssql==2.2.5
4. You should create user in MSSMS, create 'TRN' database and change it in TestsForTRN.robot file:
Open MSSMS go to 'Security' and create new user like in following screenshots:

  ![image](https://user-images.githubusercontent.com/104168878/231379337-75fccd2a-ed5e-4016-a64a-5566edb01bca.png)
  ![image](https://user-images.githubusercontent.com/104168878/231379925-07fa35ce-5182-4f7a-8db0-0794743d6201.png)
  ![image](https://user-images.githubusercontent.com/104168878/231380023-e561a3f0-ee37-4f89-b93d-4880e6548a2e.png)
  
In TestsForTRN.robot file you have to change DBHost variable to your local SQL Server:

  ![image](https://user-images.githubusercontent.com/104168878/231380749-0723b614-dfe0-4249-812b-d67ace459fb6.png)
  
On this step I found some possible issues that you can also have:
Change authentication mode with SQL (https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/change-server-authentication-mode?view=sql-server-ver16):

  ![image](https://user-images.githubusercontent.com/104168878/231382099-71b71872-114f-4e68-a1f9-e1160ec6ba0a.png)
  
In SQL Server Configuration Manager go to SQL Server Network Configuration-> Protocols -> TCP/IP and do some changes:

  ![image](https://user-images.githubusercontent.com/104168878/231383108-70d3171f-86e7-4578-91bc-e2ee4868581b.png)
  ![image](https://user-images.githubusercontent.com/104168878/231383627-f98f989d-bc25-47d9-b444-23e229439bfa.png)
  
Also check if your SQL Server browser is working. If not try follow this manual https://learn.microsoft.com/en-us/dynamics-nav/how-to--start-sql-browser-service

  ![image](https://user-images.githubusercontent.com/104168878/231384172-86600106-3d08-4b94-919f-99be3efc8f4e.png)
  
5. Run test with command: 
  robot TestsForTRN.robot (if you added python and roboframewok to PATH)
  python -m robot TestsForTRN.robot (if you don't added python and roboframewok to PATH)
  python path/to/robot/ (if you want run it from specified path)
  
  All tests should pass and log, output, report files created:

  ![image](https://user-images.githubusercontent.com/104168878/231386052-00a125b0-d2ba-44f9-9dd3-2cc297f91c41.png)
  ![image](https://user-images.githubusercontent.com/104168878/231386539-fefe1e3d-cfdc-47d5-96d8-8b5eb877b812.png)

That's it! Thank you for your attention!

   
