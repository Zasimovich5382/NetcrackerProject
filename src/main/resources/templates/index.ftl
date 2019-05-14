<#import "parts/common.ftl" as c>
<@c.page "/static/css/player.css">
<div id="app">

    <div class="container">
        <div class='row'>

            <template v-for='song in songs'>
                <div class="col-4 col-md-3 col-lg-2 song" >

                    <div class='wrapper'>


                        <div class="overlay-play text-center" v-if="isPlaying && (currentSong.id === song.id )" @click='pause'>
                            <i class="icon ion-ios-pause"></i>
                        </div>

                        <div class="overlay-play text-center" @click='play(song)'v-else>

                            <i class="icon ion-ios-play"></i>


                        </div>

                        <img :src="song.cover_art_url" alt="" class='img-fluid rounded'>
                    </div>



                    <p class='song-title mt-2'>{{song.title}}</p>
                    <p class='song-artiste' >{{song.artist}}</p>

                </div>

            </template>

        </div>

    </div>

    <div class="music-player">

        <!-- the playlist -->
        <div class="container">
            <transition name="height">
                <div class="playlist" :class="showPlaylist?'show':'hide'" v-if="showPlaylist">
                    <div class="wrap">
                        <div class="song-wrap" v-for="song in playlist.songs" @click="play(song)">
                            <div class="song-details" style="display: flex; align-content: space-between">
                                <div>
                  <span class="play">

                                        <i class="icon ion-ios-pause"
                                           v-if="isPlaying && (currentSong.id === song.id )"></i>
                                        <i class="icon ion-ios-play" v-else></i>
                                    </span> {{song.title}}
                                </div>
                                <div>
                  <span>
                                        <img class="music-bars-gif" src="https://res.cloudinary.com/dmf10fesn/image/upload/v1548886976/audio/assets/animated-sound-bars.gif"
                                             v-if="isPlaying && (currentSong.id === song.id )"/>
                                    </span> {{song.artist}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
        <!-- end of playlist -->

        <!-- the audio player code starts here -->
        <div class="player" id="player">

            <div class="container">

                <div class="player-contents-wrap">

                    <div class="album-art">
                        <img :src="currentSong.cover_art_url" class="img" />
                    </div>

                    <div class="main-controls ">
                        <div class="controls">

                            <div class="skip-backward">
                                <i class="icon ion-ios-skip-backward" @click="skip('backward')"></i>
                            </div>

                            <div class="play">
                                <i class="icon ion-ios-play" v-if="!isPlaying" @click="playCurrentSong"></i>
                                <i class="icon ion-ios-pause" v-else @click="pause"></i>
                            </div>

                            <div class="skip-forward">
                                <i class="icon ion-ios-skip-forward" @click="skip('forward')"></i>
                            </div>

                        </div>

                        <div class="seek">
                            <div class="title-and-time">

                                <div class="title">
                                    {{currentSong.title}}: {{currentSong.artist}}
                                </div>

                                <div class="time">
                                    {{currentPlayedTime}} / {{duration}}
                                </div>
                            </div>

                            <div class="progress-container">
                                <div class="progress" id="progress-wrap">

                                    <div class="progress-handle" :style="{left:progressPercentageValue}"></div>

                                    <div class="transparent-seeker-layer" @click="seek"></div>

                                    <div class="bar" :style="{width:progressPercentageValue}">

                                    </div>
                                </div>

                            </div>

                            <div class="extra-controls">

                                <div class="playlist-icon" @click="toggleShowPlaylist">
                                    <i class="icon ion-md-list"></i>
                                </div>

                                <div class="repeat">
                                    <div class="repeat-info" v-if="onRepeat">
                                        {{loop.value}}
                                    </div>
                                    <i class="icon ion-ios-repeat" @click="repeat"></i>
                                </div>

                                <div class="shuffle-icon">

                                    <i class="icon ion-ios-shuffle" @click="shuffleToggle"></i>
                                </div>



                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- the audio player code ends here -->

    </div>

    <audio :loop="innerLoop" ref="audiofile" :src="defaultSong" preload style="display: none" controls></audio>
</div>

<script src="../static/js/vue/player.js"></script>
</@c.page>