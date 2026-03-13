Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059B3D75C5;
	Fri, 13 Mar 2026 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424832; cv=none; b=qddvPSwTDsVcw39sIpPx8tMX/OSnqQVDRP2ur5pnD3UDB8T/CBFpkWSvVMGhmIrBGn7nNMFcKK9zc6mFvZWMxgUWauFFnfLcH4NGXrrRwb6+ANWJ4712aRd15dKp1m7TzbmUOMf6Z3x8Ob5+wnqUTSM9xpxiQi7eSH1d6S0TVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424832; c=relaxed/simple;
	bh=j1izIxsHXAtH1Vew0frqZGI8pM7hKLQvwq6UZjh+hhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZEVlEiX1aqn12qpym3ywNfFIAQylZ2oTk6ZI/mvN+OU9690MzBa8OeU2SWICzHoSLQX/MYjNWmMxh/SXqagOr1wb98sK1iwnL++MFcryf7R8Ub9HqP1JgIYAvkTYzGvxfLhSMIHYAjRf4vzDwtroiv/fn9IxBiuTv08tALLZfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUN3/wnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUN3/wnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA26C19421;
	Fri, 13 Mar 2026 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773424831;
	bh=j1izIxsHXAtH1Vew0frqZGI8pM7hKLQvwq6UZjh+hhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUN3/wnPZjfXNMWouCGXhVi7C7o5kanWGYsgBb6LXYa/XKVmSPdpHdLCeYz9ja3v6
	 TpkJaf0yelz/1jp9eJlMILhGmkb4GLNf8EUpj/h6Ua6Qt7r2Ju4OAye0rUJOEiRCJg
	 pSo+RTJefxEJp6l2Wh2J8g7FuOpxWgRPc0Mg1X+Eo10USDaZ5SBQ8QTMXFIHeNZuy1
	 uP4PP2m6+FDcnmvGPmvw+0RKuIzPVQQ+GsF6KHlP6S1nGyv5h8v0D8yu1b1ABs2QaQ
	 r40Sc8UGfAOQFS6JStOnFMxk6bKykfp+OvZatq1kWXg5AkTdHOn4hf+yhnpclLrkjK
	 On4PAnNv1HtUQ==
Date: Fri, 13 Mar 2026 18:00:24 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, Chunyu Hu <chuhu@redhat.com>, 
	akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Message-ID: <d73b4f26-d5d2-4c16-a017-d23d06b07bf4@lucifer.local>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-4-chuhu@redhat.com>
 <CD772D2C-F489-498D-A61C-9EA0D377B174@nvidia.com>
 <abQqLQ_6QqVgzunL@kernel.org>
 <DC5C1A71-2250-4723-9CEF-EDD300DD26E8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DC5C1A71-2250-4723-9CEF-EDD300DD26E8@nvidia.com>

On Fri, Mar 13, 2026 at 11:27:30AM -0400, Zi Yan wrote:
> On 13 Mar 2026, at 11:15, Mike Rapoport wrote:
>
> > On Thu, Mar 12, 2026 at 10:11:12AM -0400, Zi Yan wrote:
> >> On 12 Mar 2026, at 7:40, Chunyu Hu wrote:
> >>
> >>> When thp is not enabled on some kernel config such as realtime kernel, the
> >>> test will report failure. Fix the false positive by skipping the test
> >>> directly when thp is not enabled.
> >>>
> >>> There's a naming conflict on write_file() function, both thp_settings.h and
> >>> split_huge_page_test.c define it. To make use of thp_is_enabled() helper in
> >>> the thp_settings.h, rename this local write_file to safe_write_file to
> >>> avoid the conflict. The reason to use 'safe_' is it does some error check.
> >>
> >> Both write_file() do safe checks. Actually the code of both functions looks
> >> almost identical except that the thp_settings one does exit() instead of
> >> ksft_exit_fail_msg().
> >>
> >> Can you rename the split_huge_page_test’s write_file() to write_file_local()
> >> and add a comment above the function like
> >> /* add _local to avoid a function conflict with thp_settings.h */?
> >
> > Looks like we can move the version that uses ksft_exit_fail_msg() to
> > vm_util and drop the other one.
>
> Could work.
>
> tools/testing/selftests/mm/khugepaged.c uses the write_file() from
> thp_settings.h in file_setup_area(), which is part of struct mem_ops.
> I thought struct mem_ops was passed to some syscall, but it turns out
> that it is used locally. The only downside is that file_setup_area() now
> has this ksefltest friendly code. Someone might want to clean up
> tools/testing/selftests/mm/khugepaged.c with kselftests APIs. :)

Yes please :)

With Mike's suggestion, LGTM so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

>
>
> >
> >> With that, feel free to add:
> >>
> >> Reviewed-by: Zi Yan <ziy@nvidia.com>
> >>
> >> Thanks.
> >>
> >>>
> >>> Tested with thp disabled kernel:
> >>> Before The fix:
> >>>   # --------------------------------------------------
> >>>   # running ./split_huge_page_test /tmp/xfs_dir_Ywup9p
> >>>   # --------------------------------------------------
> >>>   # TAP version 13
> >>>   # Bail out! Reading PMD pagesize failed
> >>>   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> >>>   # [FAIL]
> >>>   not ok 61 split_huge_page_test /tmp/xfs_dir_Ywup9p # exit=1
> >>>
> >>> After the fix:
> >>>   # --------------------------------------------------
> >>>   # running ./split_huge_page_test /tmp/xfs_dir_YHPUPl
> >>>   # --------------------------------------------------
> >>>   # TAP version 13
> >>>   # 1..0 # SKIP Transparent Hugepages not available
> >>>   # [SKIP]
> >>>   ok 6 split_huge_page_test /tmp/xfs_dir_YHPUPl # SKIP
> >>>
> >>> CC: Li Wang <liwang@redhat.com>
> >>> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> >>> ---
> >>>  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
> >>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> >>> index e0167111bdd1..615b75ca62cc 100644
> >>> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> >>> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> >>> @@ -21,6 +21,7 @@
> >>>  #include <time.h>
> >>>  #include "vm_util.h"
> >>>  #include "kselftest.h"
> >>> +#include "thp_settings.h"
> >>>
> >>>  uint64_t pagesize;
> >>>  unsigned int pageshift;
> >>> @@ -255,7 +256,7 @@ static int check_after_split_folio_orders(char *vaddr_start, size_t len,
> >>>  	return status;
> >>>  }
> >>>
> >>> -static void write_file(const char *path, const char *buf, size_t buflen)
> >>> +static void safe_write_file(const char *path, const char *buf, size_t buflen)
> >>>  {
> >>>  	int fd;
> >>>  	ssize_t numwritten;
> >>> @@ -283,7 +284,7 @@ static void write_debugfs(const char *fmt, ...)
> >>>  	if (ret >= INPUT_MAX)
> >>>  		ksft_exit_fail_msg("%s: Debugfs input is too long\n", __func__);
> >>>
> >>> -	write_file(SPLIT_DEBUGFS, input, ret + 1);
> >>> +	safe_write_file(SPLIT_DEBUGFS, input, ret + 1);
> >>>  }
> >>>
> >>>  static char *allocate_zero_filled_hugepage(size_t len)
> >>> @@ -772,6 +773,10 @@ int main(int argc, char **argv)
> >>>  		ksft_finished();
> >>>  	}
> >>>
> >>> +	if (!thp_is_enabled()) {
> >>> +		ksft_exit_skip("Transparent Hugepages not available\n");
> >>> +	}
> >>> +
> >>>  	if (argc > 1)
> >>>  		optional_xfs_path = argv[1];
> >>>
> >>> --
> >>> 2.53.0
> >>
> >>
> >> Best Regards,
> >> Yan, Zi
> >
> > --
> > Sincerely yours,
> > Mike.
>
>
> Best Regards,
> Yan, Zi
