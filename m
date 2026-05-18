Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0301FECBA;
	Mon, 18 May 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147354; cv=none; b=Af7KEQIGL/ay2KtIlfzsVm9r/ck/wdJNFhJ7LMTc8aZzzBH6mrebAZkBOp18kxZgs+kdD8vcaIkcnSF/FuBeCTz/LLO80rsOP28Fv+OMN30GQZ6jtwq9yAtrPZ7bv/IRexVbXkTY0eYJU/MRoLO21b817jXY9WEXnqqF+ye6KMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147354; c=relaxed/simple;
	bh=gVNHBOq1KiP8XHHPybiQcYnWomlkLg2qUtgXy+sjkWo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sii3nEYRiI67J3iz1WQ2cHLiWK/YgG6YEGkAmdFQ/PwWE4AdVwu74+/u459NBDt+kM6qQVcvyKcxqJlZfb0TTJyc9Nf+3uGKlad7rmeQxK83YqiAe6gJjc0SgD5wfJzj//tzmuC1ktLUqNTqWqn2LdbdB1WmMGybJv4LnZzyZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HO2zsGaM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HO2zsGaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDA3C2BCB7;
	Mon, 18 May 2026 23:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779147354;
	bh=gVNHBOq1KiP8XHHPybiQcYnWomlkLg2qUtgXy+sjkWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HO2zsGaMh+GlLpkSfYucUJmMiqmfPY7fejujsFrV1jhvFJXerI3iPl6LQri4+JRX7
	 ci76BMZG4gFP5Sf8BKyq12aG+0uTCIR+teHm7k+h/9hikvjY/pddVYcUb/hHCQ/kA2
	 OohZR+6aE89crWVGuVU4ArFCRp4A/CeHjvRgZxXg=
Date: Mon, 18 May 2026 16:35:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Vineet Agarwal <agarwal.vineet2006@gmail.com>, david@kernel.org,
 ljs@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check file initialization writes in
 split_huge_page_test
Message-Id: <20260518163553.447a45c54a3d419b9bb916ca@linux-foundation.org>
In-Reply-To: <20260515092211.qkmaxcofxwfdexld@master>
References: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
	<20260515092211.qkmaxcofxwfdexld@master>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 09:22:11 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> On Tue, May 12, 2026 at 01:19:24PM +0530, Vineet Agarwal wrote:
> >create_pagecache_thp_and_fd() fills the backing file for the
> >pagecache THP tests using repeated write() calls, but the return
> >value is never checked.
> >
> >If a write fails or completes only partially, the test may continue
> >with an incompletely initialized file and produce misleading results.
> >
> >Check the result of write() and fail the test if the expected number
> >of bytes was not written.
> >
> >Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
> >---
> > tools/testing/selftests/mm/split_huge_page_test.c | 13 ++++++++++---
> > 1 file changed, 10 insertions(+), 3 deletions(-)
> >
> >diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> >index 500d07c4938b..eab69b0f59a0 100644
> >--- a/tools/testing/selftests/mm/split_huge_page_test.c
> >+++ b/tools/testing/selftests/mm/split_huge_page_test.c
> >@@ -609,9 +609,16 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
> > 	assert(fd_size % sizeof(buf) == 0);
> > 	for (i = 0; i < sizeof(buf); i++)
> > 		buf[i] = (unsigned char)i;
> >-	for (i = 0; i < fd_size; i += sizeof(buf))
> >-		write(*fd, buf, sizeof(buf));
> >-
> >+	for (i = 0; i < fd_size; i += sizeof(buf)) {
> >+		ssize_t written;
> >+
> >+		written = write(*fd, buf, sizeof(buf));
> >+		if (written != sizeof(buf)) {
> >+			ksft_perror("write testfile");
> >+			close(*fd);
> >+			goto err_out_unlink;
> 
> Maybe we can "goto err_out_close" and remove the close() here?

AI review suggested the same:
	https://sashiko.dev/#/patchset/20260512074924.27721-1-agarwal.vineet2006%40gmail.com

And it complained about the handling of short writes in the added code.

> Apart from this, I found on error writing to /proc/sys/vm/drop_caches in below,
> it just goto err_out_unlink, which left fd open.

Not understanding - cab you please describe more completely?

> How about fix that at the same time.
> 
> Generally, the change look good.
> 

