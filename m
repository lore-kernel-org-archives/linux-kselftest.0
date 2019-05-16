From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 17 May 2019 00:53:41 +1000
Subject: [PATCH 1/2] pid: add pidfd_open()
In-Reply-To: <20190516130813.i66ujfzftbgpqhnh@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <CAKOZuesPF+ftwqsNDMBy1LpwJgWTNuQm9-E=C90sSTBYEEsDww@mail.gmail.com>
 <20190516130813.i66ujfzftbgpqhnh@brauner.io>
Message-ID: <20190516145341.xx7bpyakezvpqujj@yavin>

On 2019-05-16, Christian Brauner <christian at brauner.io> wrote:
> On Wed, May 15, 2019 at 10:45:06AM -0700, Daniel Colascione wrote:
> > On Wed, May 15, 2019 at 3:04 AM Christian Brauner <christian at brauner.io> wrote:
> > > +       if (pid <= 0)
> > > +               return -EINVAL;
> > 
> > WDYT of defining pid == 0 to mean "open myself"?
> 
> I'm torn. It be a nice shortcut of course but pid being 0 is usually an
> indicator for child processes. So unless the getpid() before
> pidfd_open() is an issue I'd say let's leave it as is. If you really
> want the shortcut might -1 be better?

I'd suggest not using negative numbers, and instead reserving them for
PIDTYPE_TGID if we ever want to have that in the future. IMHO, doing

  pfd = pidfd_open(getpid(), 0);

is not the end of the world.


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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190517/67e00609/attachment.sig>
