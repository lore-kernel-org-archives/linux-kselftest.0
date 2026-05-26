Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DC165F16;
	Tue, 26 May 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786074; cv=none; b=jAJPBzXBdsMM7IRmgRcFxz1Psr5h4AmxrsFOrpTBabSurV5CwF/mj7gAlpa1khkIqaDaF0gbIO4R2mu9YYAUHGUC8eN77YshveGPPOW58F7sTHXXiwhEhVp3k1CLM5gS1sqBJ4HoCKXcI2ALq0zUr3XwNK/BdhfWtHtRPr9jxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786074; c=relaxed/simple;
	bh=Jlwa6k7B9VClT18htqWlem0GP1db/t0x0Qd54u6HMr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQqKUiKMSF+1/UbAq6W9AhkPkuZLzZjsStdF+Pfch9Sjr//YBuNdGqZ56tWPMBgraf2lptS2LwZ866L+2PSX2yn1V4LU0jD+tUJLc41rcAqJeh8lb9oTpoUHh1YijNbXPj5WGJPYMqoVR9JHg7ZsQjOz/Xk5vgiZfipYl04vQ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGdUa1Jr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGdUa1Jr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAB11F00A3A;
	Tue, 26 May 2026 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786073;
	bh=6gIEisP8kdco3Djn1c38mmHcBtVair+BJG8S6dLuz6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGdUa1JrH5XUiDOyuLGW0WeCBhQqzqe97tZlT1D2tfa/kUOKy5OM9s3fkBWV/7ZCQ
	 Lc+as+qLHuelmMUDDc2i4t5Kdd4LlaNbsfW4qG2+xFBUGoOB80lpJW7S5QceEVEBpm
	 M16YcXY9Bv8U6IuygGXw+XFe/jBFhV5DG7ddgcQoOy6a34hLVc6FYnstYRGhIqW5k9
	 HFLiJ6GIIjkMod3+/JuGBWS75LA+D1eMFeCtjTtEvGg/43idzw+RyZrlC0omZC9S94
	 hp8D5yTjSn6nJrYvT6KbCVoob4zQA5ylKDha51OMGRplD5YbeH0hXInGArWDw4IiBz
	 0TWg/r/RizI0A==
Date: Tue, 26 May 2026 12:01:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] tools/lib/mm: add shared file helpers
Message-ID: <ahVhTWl0fTF3ASsC@kernel.org>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-2-sarthak.sharma@arm.com>
 <177964236205.4000040.3083558454897469696.b4-review@b4>
 <ff7d212c-d3e0-4476-8903-ffe88fb7048c@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7d212c-d3e0-4476-8903-ffe88fb7048c@arm.com>

On Mon, May 25, 2026 at 11:59:32AM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 5/24/26 10:36 PM, Mike Rapoport wrote:
> > On Thu, 21 May 2026 16:47:58 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> > 
> > Hi Sarthak,
> > 
> >>
> >> diff --git a/tools/lib/mm/file_utils.c b/tools/lib/mm/file_utils.c
> >> new file mode 100644
> >> index 000000000000..0f9322f2cf41
> >> --- /dev/null
> >> +++ b/tools/lib/mm/file_utils.c
> >> @@ -0,0 +1,83 @@
> >> [ ... skip 48 lines ... ]
> >> +	saved_errno = errno;
> >> +	close(fd);
> >> +	errno = saved_errno;
> >> +	if (numwritten < 0) {
> >> +		fprintf(stderr, "%s write(%.*s) failed: %s\n",
> >> +			path, (int)(buflen - 1), buf, strerror(errno));
> > 
> > This would break TAP formatting for selftests.
> 
> Yes, thanks for pointing it out.
> 
> > 
> >> +		exit(EXIT_FAILURE);
> > 
> > and while EXIT_FAILURE == KSFT_FAIL I'm not sure it's robust enough.
> 
> I used EXIT_FAILURE here because the helper is moving out of selftests
> and should not include kselftest.h anymore. The helper already
> terminated the process on these paths, so I tried to preserve that
> behavior while removing the ksft dependency.

In mm selftests a failure to update a /proc or /sysfs file meant there is
no point to continue the test. But if we make it a generic helper for
potentially broader use than mm selftests, exit() on failure is too harsh.
 
> We can change this to return errors instead of calling exit() and update
> the selftest callers to report failures through the ksft_* helpers. I
> agree this is cleaner, but it would grow the series a bit.
> 
> If you feel strongly, I can include these changes in v4. Otherwise I
> feel we can handle it separately later to avoid growing this series.

There are not that many callers of write_file() and write_num().
I think a patch that makes them return an error rather than exit() can go
before moving these functions to lib. 
 
> >>
> >> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> >> index 2eab2110ac6a..5e947abb7425 100644
> >> --- a/tools/testing/selftests/mm/hugepage_settings.c
> >> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> >> @@ -8,8 +8,9 @@
> >>  #include <stdlib.h>
> >>  #include <string.h>
> >>  #include <unistd.h>
> >> +#include <mm/file_utils.h>
> >>  
> >> -#include "vm_util.h"
> > 
> > I think it would be fine to include file_utils.h in vm_utils.h and avoid
> > further churn.
> 
> Okay, I'll change this.

-- 
Sincerely yours,
Mike.
