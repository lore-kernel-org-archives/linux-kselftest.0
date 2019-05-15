From: logang at deltatee.com (Logan Gunthorpe)
Date: Tue, 14 May 2019 18:26:11 -0600
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <5ff098a9-9424-901c-9017-d4492e306528@gmail.com>
References: <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
 <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
 <3faa022b-0b70-0375-aa6d-12ea83a2671f@deltatee.com>
 <d148a554-2a71-a5a4-4bb2-d84d2c483277@gmail.com>
 <20190514083819.GC230665@google.com>
 <5ff098a9-9424-901c-9017-d4492e306528@gmail.com>
Message-ID: <8c693b9f-43ec-8982-825c-cabfd61b659d@deltatee.com>



On 2019-05-14 6:14 p.m., Frank Rowand wrote:
> The high level issue is to provide reviewers with enough context to be
> able to evaluate the patch series.  That is probably not very obvious
> at this point in the thread.  At this point I was responding to Logan's
> response to me that I should be reading Documentation to get a better
> description of KUnit features.  I _think_ that Logan thought that I
> did not understand KUnit features and was trying to be helpful by
> pointing out where I could get more information.  If so, he was missing
> my intended point had been that patch 0 should provide more information
> to justify adding this feature.

Honestly, I lost track of wait exactly your point was. And, in my
opinion, Brendan has provided over and above the information required to
justify Kunit's inclusion.

> One thing that has become very apparent in the discussion of this patch
> series is that some people do not understand that kselftest includes
> in-kernel tests, not just userspace tests.  As such, KUnit is an
> additional implementation of "the same feature".  (One can debate
> exactly which in-kernel test features kselftest and KUnit provide,
> and how much overlap exists or does not exist.  So don't take "the
> same feature" as my final opinion of how much overlap exists.)  So
> that is a key element to be noted and explained.

>From my perspective, once we were actually pointed to the in-kernel
kselftest code and took a look at it, it was clear there was no
over-arching framework to them and that Kunit could be used to
significantly improve those tests with a common structure. Based on my
reading of the thread, Ted came to the same conclusion.

I don't think we should block this feature from being merged, and for
future work, someone can update the in-kernel kselftests to use the new
framework.

Logan
