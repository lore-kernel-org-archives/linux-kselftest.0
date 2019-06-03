From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 3 Jun 2019 10:29:16 -0700
Subject: [PATCH v16 01/16] uaccess: add untagged_addr definition for
 other arches
In-Reply-To: <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
 <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>
 <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
Message-ID: <20190603172916.GA5390@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190603172916.1fY7m2x5Sz9209mUSHYpU9dIMi4pMfPsr4j-G9e2A6A@z>

On Mon, Jun 03, 2019@11:24:35AM -0600, Khalid Aziz wrote:
> On 6/3/19 11:06 AM, Andrey Konovalov wrote:
> > On Mon, Jun 3, 2019@7:04 PM Khalid Aziz <khalid.aziz@oracle.com> wrote:
> >> Andrey,
> >>
> >> This patch has now become part of the other patch series Chris Hellwig
> >> has sent out -
> >> <https://lore.kernel.org/lkml/20190601074959.14036-1-hch at lst.de/>. Can
> >> you coordinate with that patch series?
> > 
> > Hi!
> > 
> > Yes, I've seen it. How should I coordinate? Rebase this series on top
> > of that one?
> 
> That would be one way to do it. Better yet, separate this patch from
> both patch series, make it standalone and then rebase the two patch
> series on top of it.

I think easiest would be to just ask Linus if he could make an exception
and include this trivial prep patch in 5.2-rc.
