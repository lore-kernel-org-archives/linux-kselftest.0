From: david@fromorbit.com (Dave Chinner)
Date: Mon, 1 Oct 2018 16:14:27 +1000
Subject: [PATCH 0/3] namei: implement various scoping AT_* flags
In-Reply-To: <20181001054723.lekp3nqgctdyly7m@ryuk>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20181001040821.GP31060@dastard>
 <20181001054723.lekp3nqgctdyly7m@ryuk>
Message-ID: <20181001061427.GR31060@dastard>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181001061427.Fdb7KfaJittiXDCBuoz5zy7Ht4f6R1Hyw8e1a8Ay_dw@z>

On Mon, Oct 01, 2018@03:47:23PM +1000, Aleksa Sarai wrote:
> On 2018-10-01, Dave Chinner <david@fromorbit.com> wrote:
> > > I've added some selftests for this, but it's not clear to me whether
> > > they should live here or in xfstests (as far as I can tell there are no
> > > other VFS tests in selftests, while there are some tests that look like
> > > generic VFS tests in xfstests). If you'd prefer them to be included in
> > > xfstests, let me know.
> > 
> > xfstests, please. That way the new functionality will get immediate
> > coverage by all the main filesystem development and distro QA
> > teams....
> 
> Sure, will do. Do you want me to submit them in parallel --

That's usually the way we do things, but we don't tend to commit the
fstests changes until the thing it is testing has landed upstream.

> and what is
> the correct ML to submit changes to xfstests?

fstests at vger.kernel.org

> Sorry for the silly questions. :P

You're going to have many more of them when you start moving the
tests across to fstests :P

Cheers,

Dave.
-- 
Dave Chinner
david at fromorbit.com
