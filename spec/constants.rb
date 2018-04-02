STOREFRONTS_TO_TEST = 5
STOREFRONTS = %w[ai ag ar am au at az bh bb by be bz bm
                 bo bw br vg bg kh ca cv ky cl cn co cr
                 cy cz dk dm do ec eg sv ee fj fi fr gm
                 de gh gr gd gt gw hn hk hu in id ie il
                 it jp jo kz ke kr kg la lv lb lt lu mo
                 my mt mu mx fm md mn np nl nz ni ne ng
                 no om pa pg py pe ph pl pt ro ru sa sg
                 sk si za es lk kn sz se ch tw tj th tt
                 tr tm ae ug ua gb us uz ve vn zw].freeze

SEARCH_TERM = 'Maiden'.freeze
ARTIST_ID = 546381
ALBUM_ID = 1147164122
PLAYLIST_ID = 'pl.f21725bd35114c5fba17978b8793e5fd'.freeze
APPLE_CURATOR_ID = 976439543
CURATOR_ID = 1107687517
MUSIC_VIDEO_ID = 1143672970
SONG_ID = 1147165824
STATION_ID = 'ra.985499642'.freeze
ACTIVITY_ID = 976439514
GENRE_ID = 5

CHART_TYPES = %w[albums songs music-videos].freeze

TYPES_PER_MEDIA = {
  apple_music: %w[album song music-video artist],
  audiobooks: %w[audiobook],
  books: %w[ebook audiobook],
  connect: %w[connect curator],
  ios_apps: %w[software ipadsoftware],
  itunes_music: %w[album song music-video artist],
  macos_apps: %w[desktopsoftware],
  movies: %w[movie],
  podcasts: %w[podcastepisode podcast],
  tv_shows: %w[tvepisode tvseason],
  tvos_apps: %w[tvsoftware]
}.freeze
