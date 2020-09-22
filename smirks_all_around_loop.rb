live_loop :beat do
  use_synth :fm
  sleep 2
  loop do
    28.times do
      sample :drum_bass_hard, amp: 0.8
      sleep 0.25
      play :e2, release: 0.2
      sample :elec_cymbal, rate: 12, amp: 0.6
      sleep 0.25
    end
    sleep 4
  end
end

with_fx :reverb, room: 1 do
  live_loop :prog, sync: :upright do
    use_synth :tri
    use_synth_defaults release: 1.5
    play (ring, chord(:c3, :M7), chord(:a3, :m7), chord(:d3, :m7), chord(:g3, :dom7)).tick, sustain: 1.25, amp: 0.8
    sleep 2
  end
end

live_loop :hit, sync: :upright do
  sleep 0.5
  # sample clap
  sample :sn_dub, amp: 1, cutoff: 110
  sleep 0.5
end

live_loop :upright do
  with_fx :lpf, cutoff: 60 do
    use_synth :chipbass
    use_synth_defaults release: 0.3, amp: 1.3
    play_pattern_timed chord(:c1, :M7), 0.5
    play_pattern_timed chord(:a1, :m7), 0.5
    play_pattern_timed chord(:d1, :m7), 0.5
    play_pattern_timed chord(:g1, :dom7), 0.5
    
  end
end
