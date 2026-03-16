Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E572DFA4A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 03:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773633108; cv=none; b=SGNCUO8sBR7vEseuym/yYcbpP72RJx/U4dcsQtD8CnK365JJvXGTfyl4foQEpQU8wzoGo9ebb/79ms6qf5amlGhvfJ5wODTYpsZMs/YjfbGX3UjQYLvmPV6cu2gSyvB0ABilmNV0PFdr4UV2rUON+f6oU7PcwrxyIw3elEA0QcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773633108; c=relaxed/simple;
	bh=Yib7BuNxUtq9dqvQtY55ZnEbM1dRpzJvmBGI7K8YPjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEyNtYhdYFAvJxg2W2lTeIXQbXcsFHpoYRBDw8dA0fkz/hPc8zeERE/Y03cmz+0VROmnP561XQK3vr1grqIKrmy3Jy2H+FsYR6UZpdYyCTRiR4+61O/YAsLuXPd2t16gUD3tHoRdIwv1av+uyvr0xJo5ZmM1EvU7FQFPMSA5TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G01vdtu5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G01vdtu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773633106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/bz/OlRIsr3yCmSufJAxeWqWIyBHqS7n7g2qlL+oDc=;
	b=G01vdtu5iJhEYr+7fDO1GmkaYYgKtLgXcwQtzxmZVIu0m7xdnBjSK/3Ckxvy1klAQECx9k
	1C8BFKF4icP9lOpHhzpEJgML2JaE24txvMuETk7jhDBXDe1cXyEi+MpJArJbe4DjFlPR48
	Ofa5DXeecioKrjjjlpdete+Bb8evc5U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-gq2VcK39PcazRcXZAKMU3g-1; Sun,
 15 Mar 2026 23:51:41 -0400
X-MC-Unique: gq2VcK39PcazRcXZAKMU3g-1
X-Mimecast-MFC-AGG-ID: gq2VcK39PcazRcXZAKMU3g_1773633098
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93B901800365;
	Mon, 16 Mar 2026 03:51:38 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4AC8180035F;
	Mon, 16 Mar 2026 03:51:28 +0000 (UTC)
Date: Mon, 16 Mar 2026 11:51:23 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Message-ID: <abd-O8yFlB-ZFu7e@gmail.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

It looks like work in my try, even before the cleanup with the
kselftest APIs.

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
> 

