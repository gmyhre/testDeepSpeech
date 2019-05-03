class Snippet < ApplicationRecord


	mount_uploader :audio, AudioUploader


	def speech_to_text
		#mycommand = "echo 'hello there rails'"
		path_to_rails = "/Users/gmyhre/el_nino/rails/deep_speech"
		path_to_audio = "/uploads/snippet/audio/1/Rhinitis.wav"
		path_to_deepspeech_models = "/Users/gmyhre/el_nino/speech_to_text/PreTrainedModels/models"
		path_to_test_audio = "/Users/gmyhre/el_nino/speech_to_text/TestAudioFiles/audio"

		outputgraphmodel = "output_graph.pbmm"


		#mycommand = "pwd"

		model_section = "deepspeech --model #{path_to_deepspeech_models}/#{outputgraphmodel}"
		alphabet_section =  " --alphabet #{path_to_deepspeech_models}/alphabet.txt"
		lm_section = " --lm #{path_to_deepspeech_models}/lm.binary "
		trie_section = " --trie #{path_to_deepspeech_models}/trie"		
		

		#input_audio_section = " --audio #{path_to_test_audio}/8455-210777-0068.wav"
		
		#uglier but works
		input_audio_section = " --audio #{path_to_rails}/public#{self.audio.url}"

		Rails.logger.info("\n")


		mycommand = model_section + alphabet_section + lm_section + trie_section + input_audio_section

		Rails.logger.info(mycommand)


		myoutput = `#{mycommand}`


		return myoutput
	end




	#deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio my_audio_file.wav


end
