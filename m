From: luto at amacapital.net (Andy Lutomirski)
Date: Sat, 29 Sep 2018 09:34:24 -0700
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20180929154551.jsi6dt3xjxdxoqeh@ryuk>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <1EE20CA2-4C8B-4A80-B613-0277D92B376D@amacapital.net>
 <20180929154551.jsi6dt3xjxdxoqeh@ryuk>
Message-ID: <9D01A225-05BE-4B4A-873A-94168D17F687@amacapital.net>



> On Sep 29, 2018, at 8:45 AM, Aleksa Sarai <cyphar at cyphar.com> wrote:
> 
> On 2018-09-29, Andy Lutomirski <luto at amacapital.net> wrote:
>>> The most obvious change is that AT_NO_JUMPS has been split as dicussed
>>> in the original thread, along with a further split of AT_NO_PROCLINKS
>>> which means that each individual property of AT_NO_JUMPS is now a
>>> separate flag:
>>> 
>>> * Path-based escapes from the starting-point using "/" or ".." are
>>>   blocked by AT_BENEATH.
>> 
>> Seems useful.
>> 
>>> * Mountpoint crossings are blocked by AT_XDEV.
>> 
>> Seems useful.
>> 
>>> * /proc/$pid/fd/$fd resolution is blocked by AT_NO_PROCLINKS (more
>>>   correctly it actually blocks any user of nd_jump_link() because it
>>>   allows out-of-VFS path resolution manipulation).
>>> 
>> 
>> So how do I disable following symlinks? ISTM the most natural way
>> would be to have AT_NO_SYMLINKS, and to have that flag disable proc
>> links.
> 
> So, this patchset has both AT_NO_SYMLINKS and AT_NO_PROCLINKS.

And AT_THIS_ROOT, which is neat. Want to update your cover letter to include all of this?  Or at I just reading the wrong thing?

> 
> * AT_NO_SYMLINKS blocks *all* symlinks (which is something Linus requested
>  in the original thread[2] -- apparently this is something that would
>  be useful to git even if wouldn't violate AT_BENEATH). This implies
>  AT_NO_PROCLINKS.
> 
> * AT_NO_PROCLINKS only blocks procfs-style "symlinks" (filesystem
>  "symlinks" that call nd_jump_link() themselves -- currently only
>  procfs and nsfs).
> 

Hmm. I’m not sure that blocking nsfs links is always what the container runtime wants, but the overall concept sounds quite useful.  Maybe call it AT_NO_TELEPORT?  Or AT_NO_MAGIC_LINKS?

Also, as a perhaps-silly suggestion: if you end up adding a new syscall, I can see a use for a mode that does the path walk but, rather than failing on a disallowed link, stops early and indicates where it stopped. Then web servers, samba, etc can more efficiently implement custom behavior when links are encountered.  And it may also be useful to have a variant of AT_THIS_ROOT where trying to escape is an error instead of having it just get stuck at the root.
