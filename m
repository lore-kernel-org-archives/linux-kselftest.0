From: cyphar@cyphar.com (Aleksa Sarai)
Date: Tue, 2 Oct 2018 02:15:35 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <1f1d699b1c8d472495a5b07199c31a6e@AcuMS.aculab.com>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <1f1d699b1c8d472495a5b07199c31a6e@AcuMS.aculab.com>
Message-ID: <20181001161535.3zslyuk6vmnpioy6@ryuk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181001161535.LI5tSWWckTHSK95ONumToLzdkCC-7XHslrV9huv1gFo@z>

On 2018-10-01, David Laight <David.Laight@ACULAB.COM> wrote:
> > The need for some sort of control over VFS's path resolution (to avoid
> > malicious paths resulting in inadvertent breakouts) has been a very
> > long-standing desire of many userspace applications. This patchset is a
> > revival of Al Viro's old AT_NO_JUMPS[1] patchset with a few additions.
> > 
> > The most obvious change is that AT_NO_JUMPS has been split as dicussed
> > in the original thread, along with a further split of AT_NO_PROCLINKS
> > which means that each individual property of AT_NO_JUMPS is now a
> > separate flag:
> > 
> >   * Path-based escapes from the starting-point using "/" or ".." are
> >     blocked by AT_BENEATH.
> 
> You may need to allow absolute paths that refer to items inside
> the controlled area.
> (Even if done by a textual replacement based on the expected name
> of the base directory.)

This is sort of what AT_THIS_ROOT does. I didn't want to include it for
AT_BENEATH because it would be just as contentious as AT_THIS_ROOT
currently is. :P

> >   * Mountpoint crossings are blocked by AT_XDEV.
> 
> You might want a mountpoint flag that allows crossing into the mounted
> filesystem (you may need to get out in order to do pwd()).

Like a mount flag? I'm not sure how I feel about that. The intention is
to allow for a process to have control over how path lookups are
handled, and tying it to a mount flag means that it's no longer entirely
up to the process.

> >   * /proc/$pid/fd/$fd resolution is blocked by AT_NO_PROCLINKS (more
> > 	correctly it actually blocks any user of nd_jump_link() because it
> > 	allows out-of-VFS path resolution manipulation).
> 
> Or 'fix' the /proc/$pid/fd/$fd code to open the actual vnode rather than
> being a symlink (although this might still let you get a directory vnode).
> FWIW this is what NetBSD does - you can link the open file back into
> the filesystem!

Isn't this how it works currently? The /proc/$pid/fd/$fd "symlinks" are
actually references to the underlying file (they can even escape a
pivot_root()) -- you can re-open them or do any number of other dodgy
things through /proc with them (we definitely abuse this in container
runtimes -- and I'm sure plenty of other people do as well).

> > AT_NO_JUMPS is now effectively (AT_BENEATH|AT_XDEV|AT_NO_PROCLINKS). At
> > Linus' suggestion in the original thread, I've also implemented
> > AT_NO_SYMLINKS which just denies _all_ symlink resolution (including
> > "proclink" resolution).
> 
> What about allowing 'trivial' symlinks?

The use-case of AT_NO_SYMLINKS that Linus pitched[1] is that git wants
to have a unique name for every object and so allowing trivial symlinks
is a no-go. I assume "trivial" here means "no-'..' components"?

> > Currently I've only enabled these for openat(2) and the stat(2) family.
> > I would hope we could enable it for basically every *at(2) syscall --
> > but many of them appear to not have a @flags argument and thus we'll
> > need to add several new syscalls to do this. I'm more than happy to send
> > those patches, but I'd prefer to know that this preliminary work is
> > acceptable before doing a bunch of copy-paste to add new sets of *at(2)
> > syscalls.
> 
> If you make the flags a property of the directory vnode (perhaps as
> well as any syscall flags), and make it inherited by vnode lookup then
> it can be used to stop library functions (or entire binaries) using
> blocked paths.
> You'd then only need to add an fcntl() call to set the flags (but never
> clear them) to get the restriction applied to every lookup.

This seems like it might be useful, but it could always be done as a
follow-up patch by just setting LOOKUP_BLAH if the dirfd has the flag
set. I'm also a little bit concerned that (because fd flags are set on
the 'struct file') if you start sharing fds then you can no longer use
the lookup scoping for security (a racing process could remove the
flags while the management process resolves through it).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181002/6cd9c4e0/attachment.sig>
