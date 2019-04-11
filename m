From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Wed, 10 Apr 2019 20:15:42 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
Message-ID: <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411031542.DqRdFjqottcM4uppwcZzCWRrkCHdtEf9douDkyqbzvs@z>

On Wed, Apr 10, 2019@09:34:49AM -0700, Olof Johansson wrote:
> On Wed, Apr 10, 2019@8:51 AM Joel Fernandes <joelaf@google.com> wrote:
> >
> > On Wed, Apr 10, 2019@11:07 AM Olof Johansson <olof@lixom.net> wrote:
> > [snip]
> > > > > Wouldn't it be more convenient to provide it in a standardized format
> > > > > such that you won't have to take an additional step, and always have
> > > > > This is that form IMO.
...
> Compared to:
>  - Extract tarball
>  - Build and load
>  - Remove file tree from filesystem

I think there are too many assumptions in this thread in regard to what
is more convenient for user space.
I think bcc should try to avoid extracting tarball into file system.
For example libbcc can uncompress kheader.tar.xz into virtual file system
of clang front-end. It's more or less std::map<string, string>
with key=path, value=content of the file. Access to such in-memory
'files' is obviously faster than doing open/read syscalls.
bcc already uses this approach for some bcc internal 'files' that
it passes to clang during compilation.
All of /proc/kheaders.tar.xz files can be passed the same way
without extracting them into real file system.

Joel, would be great if you can share corresponding bcc patch
that takes advantage of /proc/kheaders
