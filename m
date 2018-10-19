From: valdis.kletnieks@vt.edu (valdis.kletnieks@vt.edu)
Date: Fri, 19 Oct 2018 14:49:11 -0400
Subject: [PATCH v3 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <CAEXW_YTS2n2tOpXs3eVQZhYu7tmM_at0ZBA-04qYkHw4UE80nw@mail.gmail.com>
References: <20181018065908.254389-1-joel@joelfernandes.org>
 <42922.1539970322@turing-police.cc.vt.edu>
 <CAEXW_YTS2n2tOpXs3eVQZhYu7tmM_at0ZBA-04qYkHw4UE80nw@mail.gmail.com>
Message-ID: <118792.1539974951@turing-police.cc.vt.edu>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181019184911.E2ZNmwH8F-rhOBCFI7zYVZuT69ttmw8EOg0Zerm9arY@z>

On Fri, 19 Oct 2018 10:57:31 -0700, Joel Fernandes said:
> On Fri, Oct 19, 2018@10:32 AM,  <valdis.kletnieks@vt.edu> wrote:
> > What is supposed to happen if some other process has an already existing R/W
> > mmap of the region?  (For that matter, the test program doesn't seem to
> > actually test that the existing mmap region remains writable?)

> Why would it not remain writable? We don't change anything in the
> mapping that prevents it from being writable, in the patch.

OK, if the meaning here is "if another process races and gets its own R/W mmap
before we seal our mmap, it's OK".  Seems like somewhat shaky security-wise - a
possibly malicious process can fail to get a R/W map because we just sealed it,
but if it had done the attempt a few milliseconds earlier it would have its own
R/W mmap to do as it pleases...

On the other hand, decades of trying have proven that trying to do any sort
of revoke() is a lot harder to do than it looks...

> We do test that existing writable mmaps can continue to exist after
> the seal is set, in a way, because we test that setting of the seal
> succeeds.

Well, if the semantics are "We don't bother trying to deal with existing R/W
maps", then it doesn't really matter - I was thinking along the lines of "If we're
revoking other R/W accesses, we should test that we didn't nuke *this* one in
the bargain"....
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 486 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181019/49a2b9f1/attachment.sig>
