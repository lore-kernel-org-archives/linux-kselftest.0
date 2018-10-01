From: cyphar at cyphar.com (Aleksa Sarai)
Date: Tue, 2 Oct 2018 02:04:31 +1000
Subject: [PATCH 1/3] namei: implement O_BENEATH-style AT_* flags
In-Reply-To: <20181001130038.s5ztphs3pl2zt3ut@brauner.io>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929103453.12025-2-cyphar@cyphar.com>
 <CAG48ez17EQuJQAZUg5hDFXhkjnnVFh39=aD+j0FBdsoTONSGEA@mail.gmail.com>
 <20181001130038.s5ztphs3pl2zt3ut@brauner.io>
Message-ID: <20181001160431.emb6b2hf32b754cl@ryuk>

On 2018-10-01, Christian Brauner <christian at brauner.io> wrote:
> On Mon, Oct 01, 2018 at 02:28:03PM +0200, Jann Horn wrote:
> > On Sat, Sep 29, 2018 at 4:28 PM Aleksa Sarai <cyphar at cyphar.com> wrote:
> > > * AT_BENEATH: Disallow ".." or absolute paths (either in the path or
> > >   found during symlink resolution) to escape the starting point of name
> > >   resolution, though ".." is permitted in cases like "foo/../bar".
> > >   Relative symlinks are still allowed (as long as they don't escape the
> > >   starting point).
> > 
> > As I said on the other thread, I would strongly prefer an API that
> > behaves along the lines of David Drysdale's old patch
> > https://lore.kernel.org/lkml/1439458366-8223-2-git-send-email-drysdale at google.com/
> > : Forbid any use of "..". This would also be more straightforward to
> > implement safely. If that doesn't work for you, I would like it if you
> > could at least make that an option. I would like it if this API could
> > mitigate straightforward directory traversal bugs such as
> > https://bugs.chromium.org/p/project-zero/issues/detail?id=1583, where
> > a confused deputy attempts to access a path like
> > "/mnt/media_rw/../../data" while intending to access a directory under
> > "/mnt/media_rw".
> 
> Oh, the semantics for this changed in this patchset, hah. I was still on
> vacation so didn't get to look at it before it was sent out. From prior
> discussion I remember that the original intention actual was what you
> argue for. And the patchset should be as tight as possible. Having
> special cases where ".." is allowed just sounds like an invitation for
> userspace to get it wrong.
> Aleksa, did you have a specific use-case in mind that made you change
> this or was it already present in an earlier iteration of the patchset
> by someone else?

Al's original patchset allowed "..". A quick survey of my machine shows
that there are 100k symlinks that contain ".." (~37% of all symlinks on
my machine). This indicates to me that you would be restricting a large
amount of reasonable resolutions because of this restriction.

I posted a proposed way to protect against ".." shenanigans. If it's
turns out this is not possible, I'm okay with disallowing ".." (assuming
Al is also okay with that).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181002/3234394a/attachment.sig>
