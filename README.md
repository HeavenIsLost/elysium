Elysium OpenTibia Server [![Build Status](https://travis-ci.org/HeavenIsLost/elysium.svg?branch=master)](https://travis-ci.org/HeavenIsLost/elysium)
===============

This is an attempt to build free and open-source MMORPG server with the aim to reproduce Tibia 7.7 behavior and content.
Heavily based on https://github.com/otland/forgottenserver/

### Getting Started

* [Compiling](https://github.com/otland/forgottenserver/wiki/Compiling)

* Download our compiled(windows) otclient fork here: http://www.mediafire.com/file/1koxi85r159zrd0/otclient_elysium.7z
* Download our compiled(windows) rme fork here: http://www.mediafire.com/file/8mi07wcnccpv2vv/rme_elysium.7z

Compile this project.
import schema.sql and then starter_schema.sql to a new mysql database.
Configure the database details in config.lua.

Run tfs executable you compiled and login with otclient(default admin account pass: test/test).
Done!

* Our custom Remere's Map Editor repository: Rhttps://github.com/HeavenIsLost/ElysiumRME
* Our custom OTclient repository: https://github.com/HeavenIsLost/ElysiumOtclient

### Support

If you need help, please visit the [support forum on OTLand](https://otland.net/forums/support.16/). Our issue tracker is not a support forum, and using it as one will result in your issue being closed. If you were unable to get assistance in the support forum, you should consider [becoming a premium user on OTLand](https://otland.net/account/upgrades) which grants you access to the premium support forum and supports OTLand financially.

### Issues

We use the [issue tracker on GitHub](https://github.com/HeavenIsLost/elysium/issues). Keep in mind that everyone who is watching the repository gets notified by e-mail when there is activity, so be thoughtful and avoid writing comments that aren't meaningful for an issue (e.g. "+1"). If you'd like for an issue to be fixed faster, you should either fix it yourself and submit a pull request, or place a bounty on the issue.
