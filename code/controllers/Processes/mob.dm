/datum/controller/process/mob
	schedule_interval = 20 // every 2 seconds

/datum/controller/process/mob/setup()
	name = "mob"

/datum/controller/process/mob/started()
	..()
	if(!mob_list)
		mob_list = list()

/datum/controller/process/mob/doWork()
	if (mob_list)
		for(var/atom/m in mob_list)
			if(m)

				try
					m:Life()
				catch(var/exception/e)
					world.log << "ERROR### Mob loop caught an exception:[e]"
					continue
				scheck()
				continue
			mob_list -= m
