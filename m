From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 19 Oct 2018 12:32:17 -0700
Subject: [PATCH v3 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <118792.1539974951@turing-police.cc.vt.edu>
References: <20181018065908.254389-1-joel@joelfernandes.org>
 <42922.1539970322@turing-police.cc.vt.edu>
 <CAEXW_YTS2n2tOpXs3eVQZhYu7tmM_at0ZBA-04qYkHw4UE80nw@mail.gmail.com>
 <118792.1539974951@turing-police.cc.vt.edu>
Message-ID: <20181019193217.GA181176@joelaf.mtv.corp.google.com>

On Fri, Oct 19, 2018 at 02:49:11PM -0400, valdis.kletnieks at vt.edu wrote:
> On Fri, 19 Oct 2018 10:57:31 -0700, Joel Fernandes said:
> > On Fri, Oct 19, 2018 at 10:32 AM,  <valdis.kletnieks at vt.edu> wrote:
> > > What is supposed to happen if some other process has an already existing R/W
> > > mmap of the region?  (For that matter, the test program doesn't seem to
> > > actually test that the existing mmap region remains writable?)
> 
> > Why would it not remain writable? We don't change anything in the
> > mapping that prevents it from being writable, in the patch.
> 
> OK, if the meaning here is "if another process races and gets its own R/W mmap
> before we seal our mmap, it's OK".  Seems like somewhat shaky security-wise - a
> possibly malicious process can fail to get a R/W map because we just sealed it,
> but if it had done the attempt a few milliseconds earlier it would have its own
> R/W mmap to do as it pleases...
> 
> On the other hand, decades of trying have proven that trying to do any sort
> of revoke() is a lot harder to do than it looks...
> 

No it is not a security issue. The issue you bring up can happen even with
the existing F_SEAL_WRITE where someone else races to mmap it.

And if someone else could race and do an mmap on the memfd, then they somehow
goes the fd at which point that is a security issue anyway. That is the whole
point of memfd, that it can be securely sent over IPC to another process.
Also, before sending it to the receiving/racing process, the memfd would have
already been sealed with the F_SEAL_FUTURE_WRITE so there is no question of a
race on the receiving side.

- Joel
