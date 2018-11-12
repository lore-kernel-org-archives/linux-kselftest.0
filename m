From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Mon, 12 Nov 2018 18:55:59 +0300
Subject: [PATCH] proc: fixup map_files test on arm
In-Reply-To: <20181112141456.GA15690@avx2>
References: <20181110184920.GA18252@avx2>
 <1541904527.857883.1572718104.2AE8D0DA@webmail.messagingengine.com>
 <20181112141456.GA15690@avx2>
Message-ID: <20181112155559.GV13195@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181112155559.UTtP6X6FikMRHeeyH-mL19ovvyCgtcBjEq_vUBQY1mI@z>

On Mon, Nov 12, 2018@05:14:57PM +0300, Alexey Dobriyan wrote:
...
> > >  int main(void)
> > >  {
> > >  	const unsigned int PAGE_SIZE = sysconf(_SC_PAGESIZE);
> > > +#ifdef __arm__
> > > +	unsigned long va = 2 * PAGE_SIZE;
> > > +#else
> > > +	unsigned long va = 0;
> > > +#endif
...
> > 
> > I have sent a patch removing proc-self-map-files-002 AND making 001 to use as a
> > HINT for mmap (MAP_FIXED) *at least*  *(2 * PAGE_SIZE), which would, likely,
> > attend all  architectures, avoiding trying to make the test specific to one,
> > and, still, test the symlinks for issues (like bad chars, spaces, so on).
> 
> If the goal is to test the lowest address then going for 2*PAGE_SIZE is
> a mistake.
> 
> Which BTW hints to add a test for the highest address.
> 
> > Both tests (001 and 002) have pretty much the same code, while they could have 2
> > tests in a single code, using kselftest framework. Is NULL hint + MAP_FIXED
> > something imperative for this test ? Why not to have all in a single test ?
> 
> I dislike tests which lump everything together into one process.
> 
> > Are you keeping the NULL hint just to test mmap, apart" from the core of
> > this test ?

Guys, lets simply stick with Alexey's patch. I personnally think that
testing mappings should be a separate test in vm/, but seriously this
took too long already :) If Alexey's patch fixes the problem with arm
I think we're fine.
