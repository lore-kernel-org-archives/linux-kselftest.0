From: rafael.tinoco@linaro.org (Rafael David Tinoco)
Date: Sun, 11 Nov 2018 00:50:54 -0200
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181110184957.GB18252@avx2>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181110174727.GA26417@avx2>
 <1541872563.3175498.1572453416.153B57C9@webmail.messagingengine.com>
 <20181110184957.GB18252@avx2>
Message-ID:
 <1541904654.858965.1572725472.16816210@webmail.messagingengine.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181111025054.YTsCFpg2jfKxcoAMwhVPd5aRSm_X5cmkmi9oJvf_mPw@z>

On Sat, Nov 10, 2018,@4:49 PM, Alexey Dobriyan wrote:
> On Sat, Nov 10, 2018@03:56:03PM -0200, Rafael David Tinoco wrote:
> > On Sat, Nov 10, 2018,@3:47 PM, Alexey Dobriyan wrote:
> > > On Fri, Nov 09, 2018@09:30:36AM -0200, Rafael David Tinoco wrote:
> > > > Merge proc-self-map-files tests into one since this test should focus in
> > > > testing readlink in /proc/self/map_files/* only, and not trying to test
> > > > mapping virtual address 0.
> > > > 
> > > > Lowest virtual address for user space mapping in other architectures,
> > > > like arm, is *at least* *(PAGE_SIZE * 2) and NULL hint does not
> > > > guarantee that when MAP_FIXED flag, important to this test, is given.
> > > > This patch also fixes this issue in remaining test.
> > > 
> > > > -	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE, fd, 0);
> > > > +	p = mmap((void *) (2 * PAGE_SIZE), PAGE_SIZE, PROT_NONE,
> > > 
> > > I don't know ARM. Is this 2 page limitation a limitation of hardware or
> > > kernel's?
> > 
> > Kernel:
> > https://bugs.linaro.org/show_bug.cgi?id=3782#c7
> 
> Ahh. please test the path I've sent, I don't have arm install readily
> available.

I replied to your patch based on some of the discussion we had in this thread.

Thanks

Rafael
-
Rafael D. Tinoco
Linaro Kernel Validation Team
