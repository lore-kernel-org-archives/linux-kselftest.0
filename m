From: valdis.kletnieks@vt.edu (valdis.kletnieks@vt.edu)
Date: Fri, 19 Oct 2018 13:32:02 -0400
Subject: [PATCH v3 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181018065908.254389-1-joel@joelfernandes.org>
References: <20181018065908.254389-1-joel@joelfernandes.org>
Message-ID: <42922.1539970322@turing-police.cc.vt.edu>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181019173202.xhZGxW-tGGmz2qkBC8Dbr5khFY9lOdOHnSHntw918wk@z>

On Wed, 17 Oct 2018 23:59:07 -0700, "Joel Fernandes (Google)" said:
> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
> which prevents any future mmap and write syscalls from succeeding while
> keeping the existing mmap active. The following program shows the seal
> working in action:

What is supposed to happen if some other process has an already existing R/W
mmap of the region?  (For that matter, the test program doesn't seem to
actually test that the existing mmap region remains writable?)

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 486 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181019/75adf5b2/attachment.sig>
