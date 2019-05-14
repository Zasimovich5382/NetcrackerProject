<#import "parts/common.ftl" as c>
<@c.page "/static/css/user.css">
    <#include "parts/security.ftl">
 <link rel="stylesheet" href="/static/css/player.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main>
    <div class="blocktop" style="background-image: url(/img/${user.getBackground()})">
        <a><button type="button" onclick="show('block')" class="btn btn-primary" style="background-color: crimson; margin-left: 90%; border-color: #171717; margin-top: 2em;">Edit Page</button></a>
        <img id="avatarArtict" width="300px" height="300px" src="/img/${user.getAvatar()}" style = "border-radius: 50%; position: relative; z-index: 5; bottom: 30px; left: 100px"/>
        <div class="p1" id="nicknamelibrary" style="position: relative; left: 400px; bottom: 200px ">${nickname}</div>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 5em; margin-top: 3em;">
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Songs</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white" onclick="showAddSong('block')">Add</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white" onclick="show('block')">Edit</button>
            </div>
        </div>
    </div>

    <div id="mainform">
        <form id="postForm" enctype="multipart/form-data" method="POST">
            <div>
                <img src="/static/images/closemenu.png" style="width: 35px;height: 35px; float: right; padding: 10px 10px" onclick="show('none')">
            </div>
            <label for="changeBackground">
                <img src="/images/add_file.png" width="200px" height="200px" id="backgroundImg" style="z-index: 5;position: relative;">
            </label>
            <label for="changeAvatar">
                <img src="/img/${user.getAvatar()}" width="100px" height="100px" id="avatarImg" style="border-radius: 5%; z-index: 10; left: 50px;">
            </label>
            <div >

                <input type="hidden" value="${user.id}" name="userId">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <input type="file" name="avatar" onchange="readURL(this,'avatarImg');" class="form-control" id="changeAvatar"  style="margin-left: 2.5em; width: 82%; display: none">
                <input type="file" name="background"  class="form-control" id="changeBackground"  style="margin-left: 2.5em; width: 82%; display: none">
                <button type="button" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; " id="buttonForEdit">Save</button>
            </div>
        </form>
    </div>

    <div id="gray" onclick="show('none');showAddSong('none')"></div>
<#-------------------------------------------------------------форма для редактирования информации о юзере-->
    <div id="app">

        <div class="container">
            <div class='row'>

                <template v-for='song in songs'>
                    <div class="col-3 col-md-3 song" >

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
</main>
<script src="/static/js/artist.js"></script>
</@c.page>