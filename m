Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B833FE02
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369012; cv=none; b=KEvFXOejCvlJaqGHsrPvHZuN9i00opK66BzmI/v5GhkV3RANUfeLk5MCRBqu6u+VCToZcCxOthqmikrlN8gTSs5p0pqqGMQnVrLrZ7vJUnfRpNXGWrtQRUP40DDoFCTUAN9BxwqgjxAGiXkUfmVRB/Q1cYalQCTcKzaYm4pT1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369012; c=relaxed/simple;
	bh=2VzHo5SsysT9kUC51+DXnZRev0k8Ai2rDUDR4IKX9Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJshA6To8qE4w5VYnsER2DgGuzTdhFLGI8y04gk1d7n2VN6DQXWbLlwNxNb0OXAipmw3d0wcjeGFvKqlmRwcg7bBkoko0Nnj7SHmO0bY9TZ/h3zX9Ab63W+RvgBdHHZWqG+BsyfWWadfY8djV6onxtyPgig0qlNuehWa+K3XgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1aHmazS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1aHmazS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773369009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQNvXZ3ufJq5Ptz1GhUExxZdPT0/nf/hyFjgiErUnuA=;
	b=N1aHmazS8UhI94sE6y1nNohkBvNzmkKcjcHkKn6tR3daMMpmWGcNFW+zK406iApFVoH3Is
	zzuGjIlFaGk4vYG8Qzmp5JRa9qzXlN7lVWi2H5zHGRD3+0G+M2KAwswn5tEwz+SAvJxFs9
	tFkGUBJclnkpRK1R2M4mGH10KPTcGoQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-NegBLtDyMRu4pL4U3DUivg-1; Thu,
 12 Mar 2026 22:30:04 -0400
X-MC-Unique: NegBLtDyMRu4pL4U3DUivg-1
X-Mimecast-MFC-AGG-ID: NegBLtDyMRu4pL4U3DUivg_1773369001
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE59C18005B3;
	Fri, 13 Mar 2026 02:30:00 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.171])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13038180075D;
	Fri, 13 Mar 2026 02:29:48 +0000 (UTC)
Date: Fri, 13 Mar 2026 10:29:42 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Message-ID: <abN2ljgOy80KiVNQ@gmail.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

indeed.

> 
> Can you rename the split_huge_page_test’s write_file() to write_file_local()
> and add a comment above the function like
> /* add _local to avoid a function conflict with thp_settings.h */?

Good point. I'll add that in the v2.

> 
> With that, feel free to add:
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thank you for the rewview. Will add.

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
> 

