From: andreyknvl at google.com (Andrey Konovalov)
Date: Tue, 26 Feb 2019 15:35:40 +0100
Subject: [PATCH v10 06/12] fs,
 arm64: untag user pointers in copy_mount_options
In-Reply-To: <a38275b0-f6cd-20e1-3c48-544846586a16@intel.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <a958e202cdbe6e1bac8a37b7f3d9881d1b22993d.1550839937.git.andreyknvl@google.com>
 <a38275b0-f6cd-20e1-3c48-544846586a16@intel.com>
Message-ID: <CAAeHK+wLm7zSUC8dJv3LgdyvpkBN8u_24ene6b91PgM570VWbQ@mail.gmail.com>

On Sat, Feb 23, 2019 at 12:03 AM Dave Hansen <dave.hansen at intel.com> wrote:
>
> On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -2730,7 +2730,7 @@ void *copy_mount_options(const void __user * data)
> >        * the remainder of the page.
> >        */
> >       /* copy_from_user cannot cross TASK_SIZE ! */
> > -     size = TASK_SIZE - (unsigned long)data;
> > +     size = TASK_SIZE - (unsigned long)untagged_addr(data);
> >       if (size > PAGE_SIZE)
> >               size = PAGE_SIZE;
>
> I would have thought that copy_from_user() *is* entirely capable of
> detecting and returning an error in the case that its arguments cross
> TASK_SIZE.  It will fail and return an error, but that's what it's
> supposed to do.
>
> I'd question why this code needs to be doing its own checking in the
> first place.  Is there something subtle going on?

The comment above exact_copy_from_user() states:

Some copy_from_user() implementations do not return the exact number of
bytes remaining to copy on a fault.  But copy_mount_options() requires that.
Note that this function differs from copy_from_user() in that it will oops
on bad values of `to', rather than returning a short copy.
