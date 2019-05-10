From: tytso@mit.edu (Theodore Ts'o)
Date: Fri, 10 May 2019 00:47:43 -0400
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
Message-ID: <20190510044743.GA6889@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510044743.om4cQepB6PxHMAyIDkPkR0hLDIpvLQFvKpYoZ7vcTL0@z>

On Thu, May 09, 2019@05:40:48PM -0600, Logan Gunthorpe wrote:
> 
> Based on some of the other commenters, I was under the impression that
> kselftests had in-kernel tests but I'm not sure where or if they exist. If
> they do exists, it seems like it would make sense to convert those to kunit
> and have Kunit tests run-able in a VM or baremetal instance.

There are kselftests tests which are shell scripts which load a
module, and the module runs the in-kernel code.  However, I didn't see
much infrastructure for the in-kernel test code; the one or two test
modules called from kselftests looked pretty ad hoc to me.

That's why I used the "vise grips" analogy.  You can use a pair of
vise grips like a monkey wrench; but it's not really a monkey wrench,
and might not be the best tool to loosen or tighten nuts and bolts.

       	   	     	       	   - Ted
