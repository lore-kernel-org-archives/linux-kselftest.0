From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 19 Feb 2019 22:34:54 -0800
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <a6ae907e-391b-993e-6011-6f40c761b339@gmail.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <a6ae907e-391b-993e-6011-6f40c761b339@gmail.com>
Message-ID:
 <CAFd5g44AmF6eN-HKwHOqPiGZHNc2K_wAmWR3PkV0OX-=YNUKDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190220063454.Rh2zD6GkybGRPBB9guP_TrnjwvPUjjSkjzCrle6agkc@z>

On Mon, Feb 18, 2019@12:02 PM Frank Rowand <frowand.list@gmail.com> wrote:
<snip>
> I have not read through the patches in any detail.  I have read some of
> the code to try to understand the patches to the devicetree unit tests.
> So that may limit how valid my comments below are.

No problem.

>
> I found the code difficult to read in places where it should have been
> much simpler to read.  Structuring the code in a pseudo object oriented
> style meant that everywhere in a code path that I encountered a dynamic
> function call, I had to go find where that dynamic function call was
> initialized (and being the cautious person that I am, verify that
> no where else was the value of that dynamic function call).  With
> primitive vi and tags, that search would have instead just been a
> simple key press (or at worst a few keys) if hard coded function
> calls were done instead of dynamic function calls.  In the code paths
> that I looked at, I did not see any case of a dynamic function being
> anything other than the value it was originally initialized as.
> There may be such cases, I did not read the entire patch set.  There
> may also be cases envisioned in the architects mind of how this
> flexibility may be of future value.  Dunno.

Yeah, a lot of it is intended to make architecture specific
implementations and some other future work easier. Some of it is also
for testing purposes. Admittedly some is for neither reason, but given
the heavy usage elsewhere, I figured there was no harm since it was
all private internal usage anyway.
