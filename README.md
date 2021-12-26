# Delphi-Pascal-MVC-basic-Level-2
## My Second Project using Delphi-Pascal Code / with Just pure Code only

Hello.. In this second small project I use advanced object-oriented programming techniques using Delphi's Pascal (Object Pascal). 
I hope this study can help someone to using Delphi's ObjectPascal, just as JAVA, PHP or Python are used, that is emphasis on pure code. 
Remembering that in Delphi it is more common to create or start a project thinking about the visual part of the user interaction and only then think about or adjust the details of the code. Thanks!

## Controller Folder: "br.com.project.controller"
Standard Delphi Data Module classes used in an adapted way in which all aspects of the "TDataSource" component were created and used in pure code. So I don't use Delphi pascal in the traditional way. This Class is responsible for business rules or validations before effective access to the database.

## Dao Folder: "br.com.project.dao"
Delphi Data Module standard classes used in an adapted way, in which all aspects of the "TFDQuery" component have been created and used in pure code. So I don't use Delphi Pascal in the traditional way. This class is responsible for accessing the database through the use of SQL. It is also designed to collect error exceptions during its use.

## Dao Connection Folder: "br.com.project.dao.conn"
Standard Delphi Data Module classes used in an adapted way, in which all aspects of the "TFDConnection" component were created and used in pure code. So I don't use Delphi Pascal in the traditional way. This class is responsible for connecting the entire application to the database or databases used. Here I left accesses to FireBird and Interbase configured.

## Model Folder: "br.com.project.model"
Pure code classes of type "TObject" created to represent an entity called: CLIENT. This class has attributes that characterize a real world object and also represents the respective table in the database. This class is used by other classes such as "TClienteController" or "TClienteDao" whenever necessary, for example, to form / manipulate the object and its attributes in memory for different purposes and/or before saving the data in the database.

## Util Folder: "br.com.project.util"
Standard Delphi Data Module classes used in an adapted way, in which all aspects of the "TDataModule" component have been created and used in pure code. So I don't use Delphi Pascal in the traditional way. This class is responsible for storing useful and generic methods for the entire application. It is also the only one besides the root "Form" that is created when using the program. All other classes are created and destroyed as you see them at runtime.
