From: cyphar at cyphar.com (Aleksa Sarai)
Date: Mon, 1 Oct 2018 19:46:40 +1000
Subject: [PATCH 2/3] namei: implement AT_THIS_ROOT chroot-like path
 resolution
In-Reply-To: <F0E08B90-F10B-4897-913D-CA18E99A987D@amacapital.net>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929131534.24472-1-cyphar@cyphar.com>
 <CAG48ez30WJhbsro2HOc_DR7V91M+hNFzBP5ogRMZaxbAORvqzg@mail.gmail.com>
 <F0E08B90-F10B-4897-913D-CA18E99A987D@amacapital.net>
Message-ID: <20181001090809.6t7ydq7gk2bwbout@ryuk>

On 2018-09-29, Andy Lutomirski <luto at amacapital.net> wrote:
> >> On Sat, Sep 29, 2018 at 4:29 PM Aleksa Sarai <cyphar at cyphar.com> wrote:
> >> The primary motivation for the need for this flag is container runtimes
> >> which have to interact with malicious root filesystems in the host
> >> namespaces. One of the first requirements for a container runtime to be
> >> secure against a malicious rootfs is that they correctly scope symlinks
> >> (that is, they should be scoped as though they are chroot(2)ed into the
> >> container's rootfs) and ".."-style paths. The already-existing AT_XDEV
> >> and AT_NO_PROCLINKS help defend against other potential attacks in a
> >> malicious rootfs scenario.
> > 
> > So, I really like the concept for patch 1 of this series (but haven't
> > read the code yet); but I dislike this patch because of its footgun
> > potential.
> > 
> 
> The code could do it differently: do the path walk and then, before
> accepting the result, walk back up and make sure the result is under
> the starting point.
> 
> This is *not* a full solution, though, since a walk above the root gas
> side effects on timing, various caches, and possibly network traffic,
> so it’s open to Spectre-like attacks in which a malicious container
> could use a runtime-initiated AT_THIS_ROOT to infer the existence of
> directories outside the container.

I think that one way to solve this problem might be to have more strict
checks on nd->root in follow_dotdot(). The problem here (as far as I can
tell) is that ".." could end up skipping past the root because of a
rename, however walking *down* into a path shouldn't be a problem (even
absolute symlinks shouldn't be a problem because they will nd_jump_root
and will land back in the root).

However, I'm not entirely sure what happens to nd->root if it gets
renamed -- can you still safely do checks against it (we'd need to do
some sort of is_descendant() check on the current path before we handle
".." in follow_dotdot).

That way, we wouldn't shouldn't have the spectre-like attack problem
(since the attack would be halted at the ".." stage -- before the path
walk can proceed into host paths). Would this be sufficient or is there
a more serious issue I'm missing?

> But what’s the container usecase?  Any sane container is based on
> pivot_root or similar, so the runtime can just do the walk in the
> container context. IOW I’m a bit confused as to the exact intended use
> of the whole series. Can you elaborate?

I went into this in my response to Jann.

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181001/239a09a8/attachment.sig>
