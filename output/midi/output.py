import pretty_midi
from collections import defaultdict

# 讀取 MIDI
midi = pretty_midi.PrettyMIDI("melody_simplified_keep3.mid")
input_instrument = midi.instruments[0]

# 分組音符（每個時間 bin 0.02 秒）
time_bins = defaultdict(list)
for note in input_instrument.notes:
    key = round(note.start, 2)
    time_bins[key].append(note)

# 每個時間 bin 保留最多 2 個音（按音量排序）
filtered_notes = []
for notes in time_bins.values():
    notes_sorted = sorted(notes, key=lambda n: n.velocity, reverse=True)
    filtered_notes.extend(notes_sorted[:3])  # 只保留前兩名

# 建立簡化 MIDI
output_midi = pretty_midi.PrettyMIDI()
melody_instrument = pretty_midi.Instrument(program=0)
melody_instrument.notes = filtered_notes
output_midi.instruments.append(melody_instrument)
output_midi.write("melody_simplified_keep33.mid")
