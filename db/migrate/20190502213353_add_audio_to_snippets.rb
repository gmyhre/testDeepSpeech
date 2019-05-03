class AddAudioToSnippets < ActiveRecord::Migration[5.2]
  def change
    add_column :snippets, :audio, :string
  end
end
