From: luto at amacapital.net (Andy Lutomirski)
Date: Sat, 29 Sep 2018 07:25:57 -0700
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20180929103453.12025-1-cyphar@cyphar.com>
References: <20180929103453.12025-1-cyphar@cyphar.com>
Message-ID: <1EE20CA2-4C8B-4A80-B613-0277D92B376D@amacapital.net>



> On Sep 29, 2018, at 3:34 AM, Aleksa Sarai <cyphar at cyphar.com> wrote:
> 
> The need for some sort of control over VFS's path resolution (to avoid
> malicious paths resulting in inadvertent breakouts) has been a very
> long-standing desire of many userspace applications. This patchset is a
> revival of Al Viro's old AT_NO_JUMPS[1] patchset with a few additions.
> 
> The most obvious change is that AT_NO_JUMPS has been split as dicussed
> in the original thread, along with a further split of AT_NO_PROCLINKS
> which means that each individual property of AT_NO_JUMPS is now a
> separate flag:
> 
>  * Path-based escapes from the starting-point using "/" or ".." are
>    blocked by AT_BENEATH.

Seems useful.

>  * Mountpoint crossings are blocked by AT_XDEV.

Seems useful.

>  * /proc/$pid/fd/$fd resolution is blocked by AT_NO_PROCLINKS (more
>    correctly it actually blocks any user of nd_jump_link() because it
>    allows out-of-VFS path resolution manipulation).
> 

So how do I disable following symlinks? ISTM the most natural way would be to have AT_NO_SYMLINKS, and to have that flag disable proc links.
