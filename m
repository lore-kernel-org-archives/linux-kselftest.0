From: cyphar@cyphar.com (Aleksa Sarai)
Date: Sun, 30 Sep 2018 01:45:51 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <1EE20CA2-4C8B-4A80-B613-0277D92B376D@amacapital.net>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <1EE20CA2-4C8B-4A80-B613-0277D92B376D@amacapital.net>
Message-ID: <20180929154551.jsi6dt3xjxdxoqeh@ryuk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180929154551.Wt4UwGOMJLyRRfAH0AhfEEioy_ctoDg-p3Y44Iea0d4@z>

On 2018-09-29, Andy Lutomirski <luto@amacapital.net> wrote:
> > The most obvious change is that AT_NO_JUMPS has been split as dicussed
> > in the original thread, along with a further split of AT_NO_PROCLINKS
> > which means that each individual property of AT_NO_JUMPS is now a
> > separate flag:
> > 
> >  * Path-based escapes from the starting-point using "/" or ".." are
> >    blocked by AT_BENEATH.
> 
> Seems useful.
> 
> >  * Mountpoint crossings are blocked by AT_XDEV.
> 
> Seems useful.
> 
> >  * /proc/$pid/fd/$fd resolution is blocked by AT_NO_PROCLINKS (more
> >    correctly it actually blocks any user of nd_jump_link() because it
> >    allows out-of-VFS path resolution manipulation).
> > 
> 
> So how do I disable following symlinks? ISTM the most natural way
> would be to have AT_NO_SYMLINKS, and to have that flag disable proc
> links.

So, this patchset has both AT_NO_SYMLINKS and AT_NO_PROCLINKS.

* AT_NO_SYMLINKS blocks *all* symlinks (which is something Linus requested
  in the original thread[2] -- apparently this is something that would
  be useful to git even if wouldn't violate AT_BENEATH). This implies
  AT_NO_PROCLINKS.

* AT_NO_PROCLINKS only blocks procfs-style "symlinks" (filesystem
  "symlinks" that call nd_jump_link() themselves -- currently only
  procfs and nsfs).

The reason why we need AT_NO_PROCLINKS is that "proclinks"[*] allow for
breaking-out of nd->root without a trivial way of detecting it (since
the filesystem can manipulate nd->path almost arbitrarily outside of the
control of VFS). Al Viro's original patchset[1] also blocked these but
it was all included within AT_NO_JUMPS.

Requiring you to block *all* symlinks in order to block "proclinks"
seems to be a bit overkill to me (especially if consider that
AT_THIS_ROOT|AT_NO_PROCLINKS is definitely a usecase most container
runtimes would be _very_ interested in -- while AT_NO_SYMLINKS will
cause issues with most distribution images).

[*]: Sorry for the awful naming, I'm not sure what the correct name is
	 (I've called them "super symlinks" in the past) -- if you have a
	 better name please let me know!

[1]: https://lwn.net/Articles/721443/
[2]: https://marc.info/?l=linux-kernel&m=149394765324531&w=2

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180930/bbcee013/attachment.sig>
