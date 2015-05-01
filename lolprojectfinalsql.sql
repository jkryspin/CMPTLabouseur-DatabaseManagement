--initial creates
create table itemBaseProperties(healthUp int,
                                attackSpeedUp decimal,
                                manaPoolUp int,
                                bonusAttackDamage int,
                                bonusAbilityPower int,
                                item text primary key);

create table currGameItems(displayName text,
                           item text,
			   primary key (displayName, item)
                           );

create table currentGame(displayName text,
                         Champion text,
                         currGameID int,
                         currKills int,
                         currDeaths int,
                         currAssists int,
                         currLevel int,
                         currTeam int,
                         primary key(currGameID, displayName));
                         
create table championBaseProperties(Champion text primary key,
                                    abilityPower int,
                                    attackDamage int,
                                    Health int,
                                    attackSpeed decimal,
                                    manaPool int);

create table Player(PiD varchar(10) primary key,
                    Level int,
                    Rank text,
                    displayName text,                                    
                    statusMessage text,
                    currGameID int); 
create table proPlayer(PiD varchar(10) primary key,
                       teamName text,
                       Role text);  

create table proTeam(teamName text primary key,
                     ladderPosition int,
                     teamTag varchar(4),
                     playerName1 text,
                     playerName2 text,
                     playerName3 text,
                     playerName4 text,
                     playerName5 text);

create table matchScheduler(homeTeam text primary key,
                            slotTime int,
                            awayTeam text);

create table matchHistory(PiD varchar(10) primary key,
                          gameID int);

create table gameStatistics(gameId int primary key,
                            displayName text,
                            Kills int,
                            Deaths int,
                            Assists int,
                            victoryBoolean boolean);
--items available and their properties
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('B.F. Sword',0,0,0,50,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Pickaxe',0,0,0,25,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Longsword',0,0,0,10,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Sapphire Crystal',0,0,200,0,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Ruby Crystal',150,0,0,0,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Recurve Bow',0,1.3,0,0,0);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Needlessly Large Rod',0,0,0,0,80);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Blasting Wand',0,0,0,0,40);
insert into itemBaseProperties(item, healthUp, attackSpeedUp, manaPoolUp, bonusAttackDamage, bonusAbilityPower) values ('Amplifiying Tome',0,0,0,0,20);
select * from itemBaseProperties

--items in current game per player
insert into currGameItems(displayName, item) values ('Jibbey','B.F. Sword');
insert into currGameItems(displayName, item) values ('Jibbey','Pickaxe');
insert into currGameItems(displayName, item) values ('SoberSoda','Ruby Crystal');
insert into currGameItems(displayName, item) values ('SnatchyChicken','Pickaxe');
insert into currGameItems(displayName, item) values ('Rushpack','Needlessly Large Rod');
insert into currGameItems(displayName, item) values ('C Note','Recurve Bow');
insert into currGameItems(displayName, item) values ('Bjergson','Longsword');
insert into currGameItems(displayName, item) values ('Bjergson','Pickaxe');
insert into currGameItems(displayName, item) values ('Dyrus','Pickaxe');
insert into currGameItems(displayName, item) values ('Santorin','Amplifiying Tome');
insert into currGameItems(displayName, item) values ('Wildturtle','B.F. Sword');
insert into currGameItems(displayName, item) values ('Lustboy','Blasting Wand');
select * from currGameItems

--ongoing match data
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Jibbey','Vi',0,4,0,2,11,1);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('SoberSoda','Shyvana',0,2,1,2,10,1);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('SnatchyChicken','Jinx',0,1,1,2,11,1);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Rushpack','Zed',0,2,1,2,10,1);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('C Note','Aatrox',0,4,1,2,12,1);

insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Bjergson','Akali',0,1,6,2,10,2);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Dyrus','Singed',0,1,1,2,10,2);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Santorin','Gragas',0,1,1,2,10,2);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Wildturtle','Tristana',0,1,1,2,10,2);
insert into currentGame(displayName, Champion, currGameID, currKills, currDeaths, currAssists, currLevel, currteam) values ('Lustboy','Lulu',0,0,4,2,10,2);
select * from currentGame
select sum(currDeaths)
from currentGame
where currTeam = 2 and currGameID = 0  


--champion base statistics
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Vi',0,50,700,1.2,700);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Shyvana',0,70,700,1.1,0);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Jinx',0,50,500,1.4,500);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Zed',0,90,500,1.0,0);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Aatrox',10,50,700,1.4,0);

insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Akali',10,20,700,1.2,700);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Singed',0,50,700,1.2,770);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Gragas',0,0,800,1.2,700);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Tristana',0,50,700,1.5,700);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Lulu',0,10,400,1.3,700);

--other champions but are not currently in use in this snapshot
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Corki',0,50,700,1.2,700);
insert into championBaseProperties(Champion, abilityPower, attackDamage, Health, attackSpeed, manaPool) values ('Rengar',0,50,700,1.2,700);
select * from championBaseProperties

--player data
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (1,30,'Gold 2','Jibbey','Stuck in gold :(',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (2,30,'Silver 4','SoberSoda','Stuck in silver!',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (3,30,'Bronze 1','SnatchyChicken','Stuck in bronze my life sucks',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (4,30,'Diamond 5','Rushpack','Just got diamond!',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (5,30,'Gold 4','C Note','Looking for RBGs',0);

insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (6,30,'Challenger','Bjergson','Got a new cat',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (7,30,'Challenger','Dyrus','I hate teamates',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (8,30,'Challenger','Santorin','My chin is huge',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (9,30,'Challenger','Wildturtle','I go deep everyday',0);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (10,30,'Challenger','Lustboy','Support is so easy',0);

insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (11,30,'Silver 3','KillerDoomSky','I hate silver',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (12,30,'Gold 3','SoPretty','online',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (13,30,'Gold 4','SaltySailor','online',null);

insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (14,30,'Challenger','Balls','Got a new cat',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (15,30,'Challenger','Meteos','I hate teamates',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (16,30,'Challenger','Hai','My chin is huge',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (17,30,'Challenger','Sneaky','I go deep everyday',null);
insert into Player(PiD, Level, Rank, displayName, statusMessage, currGameID) values (18,30,'Challenger','Lemonation','Support is so easy',null);
select * from Player

--pro player data
insert into proPlayer(PiD, teamName, Role) values (6,'Team Solo Mid', 'Mid');
insert into proPlayer(PiD, teamName, Role) values (7,'Team Solo Mid', 'Top');
insert into proPlayer(PiD, teamName, Role) values (8,'Team Solo Mid', 'Jungle');
insert into proPlayer(PiD, teamName, Role) values (9,'Team Solo Mid', 'ADC');
insert into proPlayer(PiD, teamName, Role) values (10,'Team Solo Mid', 'Support');

insert into proPlayer(PiD, teamName, Role) values (14,'Cloud 9', 'Top');
insert into proPlayer(PiD, teamName, Role) values (15,'Cloud 9', 'Jungle');
insert into proPlayer(PiD, teamName, Role) values (16,'Cloud 9', 'Mid');
insert into proPlayer(PiD, teamName, Role) values (17,'Cloud 9', 'ADC');
insert into proPlayer(PiD, teamName, Role) values (18,'Cloud 9', 'Support');
select * from proPlayer

--pro team data
insert into proTeam(ladderPosition, teamName, teamTag, playerName1, playerName2, playerName3, playerName4, playerName5) values (1,'Team Solo Mid','TSM','Dyrus','Santorin','Bjergson','Wildturtle','Lustboy');
insert into proTeam(ladderPosition, teamName, teamTag, playerName1, playerName2, playerName3, playerName4, playerName5) values (2,'Cloud 9','C9','Balls','Meteos','Hai','Sneaky','Lemonation');
select * from proTeam

--match scheduler only two teams exists in this model but it allows for multiple
insert into matchScheduler(homeTeam, slotTime, awayTeam) values('Team Solo Mid',1,'Cloud 9');
select * from matchScheduler

--match history table currently only one person played a match which is illogical but adding enough sample data by hand would take ages
insert into matchHistory(PiD,gameID) values (1,1);
select * from matchHistory

--game statistics table with only one data set becuase only one person has played one game
insert into gameStatistics(gameID, displayName, Kills, Deaths, Assists, victoryBoolean) values(1,'Jibbey',10,0,2,True);
select * from gameStatistics

--Views
create view currentGameChampionStatistics
as
select *


--Views

create view PlayerAndChampion as
	select displayName, currentGame.Champion 
	from currentGame, championBaseProperties
	where currentGame.Champion = championBaseProperties.Champion
select * from PlayerAndChampion

create view PlayersInGame as
	select *
	from Player
	where currGameID is not null
select * from PlayersInGame

--Stored Procedure
create or replace function currChampion(text, REFCURSOR) returns refcursor as 
$$
declare displayNameVar text :=$1;
resultset REFCURSOR := $2;
begin
	open resultset for
	select displayName,Champion
	from currentGame
	where displayName = displayNameVar;
	return resultset;
end;
$$ language plpgsql;

select * from currChampion('Jibbey','results');
fetch all from results;

--Security
CREATE ROLE admin;
GRANT SELECT, INSERT, UPDATE
ON ALL TABLES IN SCHEMA PUBLIC
TO admin;

CREATE ROLE LCSadmin;
GRANT SELECT, INSERT, UPDATE
ON proTeam, matchScheduler
To LCSadmin;
