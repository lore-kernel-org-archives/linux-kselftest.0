Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719193AF652;
	Fri, 13 Mar 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414967; cv=none; b=MLpuUrc15X1Tuh3rl3vh/IobFVsRRuP6d/WWwoUKi0VMnvznP1ZZfkwUQK6U7Sd8GqBkHFMnCXEvG3UWUHwz1tIgoqdemhg6Ehpp4gymbXbOpKFwg1isfDbukw5acA6ke1m6/kjkJLbrexA5GF6fLv/DFlFNEPMmk7f++qjrlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414967; c=relaxed/simple;
	bh=hmPBFRDIjNYL93/8I6WyJ/XGzf5bSzknZVavkSNFMEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXVOW4pXo32bJLbxZv9J782Rr8P1o/MJjMtUEs3hWEnT4DoMfgNKm67C2a8GrL5GRXVriAZ8ootzT44W9U6nyuyF86MdP1LQNpkH1Rwt+6NLBVsuXFvzsk8cg3MCDHPZoaO4lJUJZ2FisB8quFt8TcqWspB2g2N29re8IytTkG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzHclv9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzHclv9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464BBC2BC86;
	Fri, 13 Mar 2026 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773414967;
	bh=hmPBFRDIjNYL93/8I6WyJ/XGzf5bSzknZVavkSNFMEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzHclv9sW8UPcX+VMX30E3oYY9Gu/EZ2xaTA2akoeMCDEs/x52+Dj10azyrM9xmx3
	 bABrtB2xmzIjbWn9fCRhW8v2MvdDsj5kKNI65FxUVEwWL4Y3B4QLAMtWLgN9/zNFDW
	 2J8AcIJtItn2pW8oAIq3NJBuryFR3AfxnP9ys3oLwdQWfE22f6Khs6nn0Fl1/vaLpn
	 /M/RRJrlY884vpWZF+khgkMXnPXAIDTf7vzm+PEN6zhfC4WPKyfWG30pUAAXdeX3B0
	 uXnS/7I2H1os8AUDChoL+T+2llXF8qnIPB1hI9C8IkUDDk5Ku0kfTpBBZ/CA1LpM9s
	 mYdaibWdJpdpA==
Date: Fri, 13 Mar 2026 17:15:57 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Chunyu Hu <chuhu@redhat.com>, akpm@linux-foundation.org,
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Message-ID: <abQqLQ_6QqVgzunL@kernel.org>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-4-chuhu@redhat.com>
 <CD772D2C-F489-498D-A61C-9EA0D377B174@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CD772D2C-F489-498D-A61C-9EA0D377B174@nvidia.com>

On Thu, Mar 12, 2026 at 10:11:12AM -0400, Zi Yan wrote:
> On 12 Mar 2026, at 7:40, Chunyu Hu wrote:
> 
> > When thp is not enabled on some kernel config such as realtime kernel, the
> > test will report failure. Fix the false positive by skipping the test
> > directly when thp is not enabled.
> >
> > There's a naming conflict on write_file() function, both thp_settings.h and
> > split_huge_page_test.c define it. To make use of thp_is_enabled() helper in
> > the thp_settings.h, rename this local write_file to safe_write_file to
> > avoid the conflict. The reason to use 'safe_' is it does some error check.
> 
> Both write_file() do safe checks. Actually the code of both functions looks
> almost identical except that the thp_settings one does exit() instead of
> ksft_exit_fail_msg().
> 
> Can you rename the split_huge_page_test’s write_file() to write_file_local()
> and add a comment above the function like
> /* add _local to avoid a function conflict with thp_settings.h */?

Looks like we can move the version that uses ksft_exit_fail_msg() to
vm_util and drop the other one.
 
> With that, feel free to add:
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> 
> Thanks.
> 
> >
> > Tested with thp disabled kernel:
> > Before The fix:
> >   # --------------------------------------------------
> >   # running ./split_huge_page_test /tmp/xfs_dir_Ywup9p
> >   # --------------------------------------------------
> >   # TAP version 13
> >   # Bail out! Reading PMD pagesize failed
> >   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> >   # [FAIL]
> >   not ok 61 split_huge_page_test /tmp/xfs_dir_Ywup9p # exit=1
> >
> > After the fix:
> >   # --------------------------------------------------
> >   # running ./split_huge_page_test /tmp/xfs_dir_YHPUPl
> >   # --------------------------------------------------
> >   # TAP version 13
> >   # 1..0 # SKIP Transparent Hugepages not available
> >   # [SKIP]
> >   ok 6 split_huge_page_test /tmp/xfs_dir_YHPUPl # SKIP
> >
> > CC: Li Wang <liwang@redhat.com>
> > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > ---
> >  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> > index e0167111bdd1..615b75ca62cc 100644
> > --- a/tools/testing/selftests/mm/split_huge_page_test.c
> > +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> > @@ -21,6 +21,7 @@
> >  #include <time.h>
> >  #include "vm_util.h"
> >  #include "kselftest.h"
> > +#include "thp_settings.h"
> >
> >  uint64_t pagesize;
> >  unsigned int pageshift;
> > @@ -255,7 +256,7 @@ static int check_after_split_folio_orders(char *vaddr_start, size_t len,
> >  	return status;
> >  }
> >
> > -static void write_file(const char *path, const char *buf, size_t buflen)
> > +static void safe_write_file(const char *path, const char *buf, size_t buflen)
> >  {
> >  	int fd;
> >  	ssize_t numwritten;
> > @@ -283,7 +284,7 @@ static void write_debugfs(const char *fmt, ...)
> >  	if (ret >= INPUT_MAX)
> >  		ksft_exit_fail_msg("%s: Debugfs input is too long\n", __func__);
> >
> > -	write_file(SPLIT_DEBUGFS, input, ret + 1);
> > +	safe_write_file(SPLIT_DEBUGFS, input, ret + 1);
> >  }
> >
> >  static char *allocate_zero_filled_hugepage(size_t len)
> > @@ -772,6 +773,10 @@ int main(int argc, char **argv)
> >  		ksft_finished();
> >  	}
> >
> > +	if (!thp_is_enabled()) {
> > +		ksft_exit_skip("Transparent Hugepages not available\n");
> > +	}
> > +
> >  	if (argc > 1)
> >  		optional_xfs_path = argv[1];
> >
> > -- 
> > 2.53.0
> 
> 
> Best Regards,
> Yan, Zi

-- 
Sincerely yours,
Mike.
