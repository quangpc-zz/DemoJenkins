require 'calabash-cucumber/ibase'

class FirstScreen < Calabash::IBase
	def trait
		"view marked:'First'"
	end
	def click_button
		touch("button marked:'TaskButton'")
		sleep(STEP_PAUSE)
	end
end