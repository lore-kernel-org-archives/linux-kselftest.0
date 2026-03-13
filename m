Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBB938CFF0;
	Fri, 13 Mar 2026 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423483; cv=none; b=tqSmioRIKccIVOj9Gvz2sf61bzoCfdAcp+6MjT+MYaQCebXRwwnOoUMDBpXGSjTGeZWegg49DoZfwj3/FR9XBhsANs7wd2pWzzPDuViCS6IMTGX80dvnDVSJqsDfCTTKnIfHR9tzbgj2job9ZTuV/Tgokj3qK/ibopUwR28nDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423483; c=relaxed/simple;
	bh=TGwRSaWVri5njOX8uLPGY9rlgFfLB03mBYf8HXyvPQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYf5+QbuSJl6ibOO/Ybxlpq9ynfecHAScToKpGP+7VF/x1vpbg2p2VhhmfvEZLBe7eaElfL/yr6bPqo2ZNWOBvN/Ujr5TfwmEml79IWVt1Y4UEDHmJVoM2ephv5MJzWwgajMFekZAg0Nq9LHXsfXtH5YUHWz75C3IwXDuUGLzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0RNL435; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0RNL435"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25453C19421;
	Fri, 13 Mar 2026 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423483;
	bh=TGwRSaWVri5njOX8uLPGY9rlgFfLB03mBYf8HXyvPQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0RNL435ZRqYDOmXtr536PK/UZbU92/ld1tWWsS2/lwmsUnDps1UQtN1kuOehW6/q
	 /BqQhgqTq98H/e9YXy/t/BJ6Cg2u3apj6wqz8RKTQF+v8zV7PcdDluVMIZfiafbknC
	 ck9wMU7FbATLTFI7wu8mF2dHl7b3YB9vGaEb5LF4+zJZyW5TQ+9gmMVM0gKBIw4kij
	 VAnuiYjI7KolgLHDh16SG6rJ7V37qZMkbIXDTXxAR8st9clOnLpgiByqhmCsNOU4NG
	 MYcUnC4SgmHiDcfs3BjNGFrp8oFX6GymoQGTtVUKSEV/BsazGOHEIIzTRcwJwIvLVf
	 aKDsoZGbio9PA==
Date: Fri, 13 Mar 2026 17:37:57 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 2/4] selftests/mm: soft-dirty: skip two tests when
 thp is not available
Message-ID: <60f5a518-1254-4bd7-8272-128fdd56d6ec@lucifer.local>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-3-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312114027.634559-3-chuhu@redhat.com>

On Thu, Mar 12, 2026 at 07:40:25PM +0800, Chunyu Hu wrote:
> The test_hugepage test contain two sub tests. If just reporting one skip
> when thp not available, there will be error in the log because the test
> count don't match the test plan. Change to skip two tests by running the
> ksft_test_result_skip twice in this case.
>
> Without the fix (run test on thp disabled kernel):
>   ./run_vmtests.sh -t soft_dirty
>   # --------------------
>   # running ./soft-dirty
>   # --------------------
>   # TAP version 13
>   # 1..19
>   # ok 1 Test test_simple
>   # ok 2 Test test_vma_reuse dirty bit of allocated page
>   # ok 3 Test test_vma_reuse dirty bit of reused address page
>   # ok 4 # SKIP Transparent Hugepages not available
>   # ok 5 Test test_mprotect-anon dirty bit of new written page
>   # ok 6 Test test_mprotect-anon soft-dirty clear after clear_refs
>   # ok 7 Test test_mprotect-anon soft-dirty clear after marking RO
>   # ok 8 Test test_mprotect-anon soft-dirty clear after marking RW
>   # ok 9 Test test_mprotect-anon soft-dirty after rewritten
>   # ok 10 Test test_mprotect-file dirty bit of new written page
>   # ok 11 Test test_mprotect-file soft-dirty clear after clear_refs
>   # ok 12 Test test_mprotect-file soft-dirty clear after marking RO
>   # ok 13 Test test_mprotect-file soft-dirty clear after marking RW
>   # ok 14 Test test_mprotect-file soft-dirty after rewritten
>   # ok 15 Test test_merge-anon soft-dirty after remap merge 1st pg
>   # ok 16 Test test_merge-anon soft-dirty after remap merge 2nd pg
>   # ok 17 Test test_merge-anon soft-dirty after mprotect merge 1st pg
>   # ok 18 Test test_merge-anon soft-dirty after mprotect merge 2nd pg
>   # # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # # Planned tests != run tests (19 != 18)
>   # # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:1 error:0
>   # [FAIL]
>   not ok 52 soft-dirty # exit=1
>
> With the fix (run test on thp disabled kernel):
>   ./run_vmtests.sh -t soft_dirty
>   # --------------------
>   # running ./soft-dirty
>   # TAP version 13
>   # --------------------
>   # running ./soft-dirty
>   # --------------------
>   # TAP version 13
>   # 1..19
>   # ok 1 Test test_simple
>   # ok 2 Test test_vma_reuse dirty bit of allocated page
>   # ok 3 Test test_vma_reuse dirty bit of reused address page
>   # # Transparent Hugepages not available
>   # ok 4 # SKIP Test test_hugepage huge page allocation
>   # ok 5 # SKIP Test test_hugepage huge page dirty bit
>   # ok 6 Test test_mprotect-anon dirty bit of new written page
>   # ok 7 Test test_mprotect-anon soft-dirty clear after clear_refs
>   # ok 8 Test test_mprotect-anon soft-dirty clear after marking RO
>   # ok 9 Test test_mprotect-anon soft-dirty clear after marking RW
>   # ok 10 Test test_mprotect-anon soft-dirty after rewritten
>   # ok 11 Test test_mprotect-file dirty bit of new written page
>   # ok 12 Test test_mprotect-file soft-dirty clear after clear_refs
>   # ok 13 Test test_mprotect-file soft-dirty clear after marking RO
>   # ok 14 Test test_mprotect-file soft-dirty clear after marking RW
>   # ok 15 Test test_mprotect-file soft-dirty after rewritten
>   # ok 16 Test test_merge-anon soft-dirty after remap merge 1st pg
>   # ok 17 Test test_merge-anon soft-dirty after remap merge 2nd pg
>   # ok 18 Test test_merge-anon soft-dirty after mprotect merge 1st pg
>   # ok 19 Test test_merge-anon soft-dirty after mprotect merge 2nd pg
>   # # 2 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
>   # # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:2 error:0
>   # [PASS]
>   ok 1 soft-dirty
>   hwpoison_inject
>   # SUMMARY: PASS=1 SKIP=0 FAIL=0
>   1..1
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/soft-dirty.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
> index 59c0dbe99a9b..bcfcac99b436 100644
> --- a/tools/testing/selftests/mm/soft-dirty.c
> +++ b/tools/testing/selftests/mm/soft-dirty.c
> @@ -82,7 +82,9 @@ static void test_hugepage(int pagemap_fd, int pagesize)
>  	int i, ret;
>
>  	if (!thp_is_enabled()) {
> -		ksft_test_result_skip("Transparent Hugepages not available\n");
> +		ksft_print_msg("Transparent Hugepages not available\n");
> +		ksft_test_result_skip("Test %s huge page allocation\n", __func__);
> +		ksft_test_result_skip("Test %s huge page dirty bit\n", __func__);
>  		return;
>  	}
>
> --
> 2.53.0
>
