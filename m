Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A538F947;
	Sun,  4 Oct 2026 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791144474; cv=none; b=ktG08cDnXSLSdVPXN6C9c5UVM730nZP0Zp9MWMeaMCaSgAwMo8Wh7KYZFyg3ZfXqS2tKrEr8X7UZKJ51WL7oYRUoYL+mln6SQKq26rE0WhGH9Pgsj+cg7IZ0eVYvpEGDvGHj+JYsFWTT2G17wasK8wP9ZVF7d1Z0Ai26q1ibjCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791144474; c=relaxed/simple;
	bh=+V5HdgvvgZEdIQsFusxwujC0aLiKZVBJO9ImZsym+DQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ty/XB1dKw8key4W1MKLIah61U9+0ZY84y5NzaaWRoGCrGSXBkHOT6Z3RXKGBJJ0yX4j+AZ/ptOWrWmiQs84Dtc4HMoQV4DqAbc0N3/y7lkCR0o63AKshGM/1gbYJpP9ucZzCQC3YKj+T+fjBcnlUIaNk6R9g3R2RNrVqQnexIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mx3OeGyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mx3OeGyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9B01F000FF;
	Sun,  4 Oct 2026 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791144472;
	bh=F2CprrIV1+vnrvZtv7aumlrns7J0kiy7ez1pluHWuPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Mx3OeGyw4mBMuZbhxP+kZ8Yze1JJTWm6pV1IAfezi4CT5EdyzeaQ4TdJfJEW6VwBl
	 p8EdqXusXxKObgj9b4Q4/xfVD61oTz+Gb23FrCuX4GO8LyEuMBBsTXivo5hQR43jZf
	 Dw65pGexM1LNSYVm+ZFNLaFjxvakbKogJgT96vEI=
Date: Sun, 4 Oct 2026 13:07:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: rppt@kernel.org, peterx@redhat.com, surenb@google.com,
 aarcange@redhat.com, david@kernel.org, ljs@kernel.org, liam@infradead.org,
 vbabka@kernel.org, mhocko@suse.com, shuah@kernel.org, kas@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] userfaultfd: clear the inherited uffd bit in
 move_swap_pte()
Message-Id: <20261004130751.1cdab825ae521c16e02f66ec@linux-foundation.org>
In-Reply-To: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
References: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  3 Oct 2026 19:30:28 +0900 Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:

> UFFDIO_MOVE on a swapped-out page installs the source PTE at the
> destination unchanged, so a uffd bit set on a write-protected or
> RWP-protected source lands in a destination VMA that was never
> registered for either, and nothing clears it afterwards.  Patch 1 clears
> the bit, then re-arms it if the destination is RWP-registered, which is
> what the present-page and zeropage move paths already do.  Patch 2 adds
> the tests that catch it.

Thanks, I updated mm-hotfixes-unstable with this version.

> Changes in v4:
>  - patch 1: add Acked-by from David Hildenbrand and Mike Rapoport; no
>    code change
>  - patch 2: protect the source right after registering it, open pagemap
>    at the top, and use a designated initializer for the move (David
>    Hildenbrand)
>  - patch 2: fail only the test case, not the whole run, when UFFDIO_MOVE
>    fails (David Hildenbrand)

Here's how v4 altered mm.git:


 tools/testing/selftests/mm/uffd-unit-tests.c |   36 ++++++++---------
 1 file changed, 18 insertions(+), 18 deletions(-)

--- a/tools/testing/selftests/mm/uffd-unit-tests.c~b
+++ a/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2049,28 +2049,29 @@ static void uffd_move_swap_test_common(u
 				       bool rwp)
 {
 	unsigned long page_size = gopts->page_size;
-	struct uffdio_move move = { };
-	int pagemap_fd;
+	struct uffdio_move move = {
+		.dst = (unsigned long)gopts->area_dst,
+		.src = (unsigned long)gopts->area_src,
+		.len = page_size,
+	};
+	int pagemap_fd = pagemap_open();
 
 	if (rwp) {
 		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
 			err("register src failure");
-	} else if (uffd_register(gopts->uffd, gopts->area_src, page_size,
-				 false, true, false)) {
-		err("register src failure");
-	}
-	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
-			  true, false, false))
-		err("register dst failure");
-
-	if (rwp)
 		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
 				page_size, true);
-	else
+	} else {
+		if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+				  false, true, false))
+			err("register src failure");
 		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
 			 page_size, true);
+	}
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
 
-	pagemap_fd = pagemap_open();
 	if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
 		err("MADV_PAGEOUT");
 	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
@@ -2078,11 +2079,10 @@ static void uffd_move_swap_test_common(u
 		goto out;
 	}
 
-	move.dst = (unsigned long)gopts->area_dst;
-	move.src = (unsigned long)gopts->area_src;
-	move.len = page_size;
-	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move))
-		err("UFFDIO_MOVE");
+	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move)) {
+		uffd_test_fail("UFFDIO_MOVE failed: %s", strerror(errno));
+		goto out;
+	}
 
 	if (pagemap_get_entry(pagemap_fd, gopts->area_dst) & PM_UFFD_WP)
 		uffd_test_fail("uffd bit moved into an area registered for missing faults only");
_

