Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDEE346E55;
	Thu, 12 Mar 2026 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773344598; cv=none; b=hgkUVYRlCCxDnSz1ivS3/DERR2xa14/N1pjtdjstgMRCnm1t8UNUbyd/bn26wlnplccBvmPacsmAhpnhbkthISBBMqw5xs1RvJFioPF9521mTx8eTMOIDx9n2ZwS51MG1TMiSUJ6T7sI6MWX7jsBI1RP+xZ1E47PbaxWIUPirjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773344598; c=relaxed/simple;
	bh=1wNpJYeE1dWpshwdESWmB2GY2hIpas7logaSTVcI+gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYRYeJJPrkJ5zu0g3oq6VgMZE/Y05+7IJRtsxpMqdMg9eQNAENWArp9KhIiJPXvH5yheMjqGJ0MoW3Up6LpWj4qrxYE2YFoHW+Lg6rAgFoYUvDbCV5eNOC20bd/GWaR3go646LKsHkQnxmOxwax5pwF/XjKi6YZ55hBIW+1zPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIf3SM/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIf3SM/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144FAC19425;
	Thu, 12 Mar 2026 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773344598;
	bh=1wNpJYeE1dWpshwdESWmB2GY2hIpas7logaSTVcI+gQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sIf3SM/cSF4Eys53CHFttBllrEsLPwddPTKvDcu9JiLouK0OX0hZ4RkiuQZJLDkL3
	 M54xIf5vSAfgWLRiUZYF0lShQvx7EdsznNcJzOGYJ8eN4EVmZK0JIxPSmeY/llVcxG
	 T2y5h0U83ZqdtAfZ/w9Uj8UwjmYZ8KL+TuREIABbtAOIuGabIPBZlMfpFrDJ7RKXO6
	 lKQsD1faOACUQshUGZ5r1H9tGi9Gbjb9Gkp+e/D2c3Nn8aKh++FK91r4WsrrmyvuBJ
	 /y4VnNqfFDUb7NWvhu9ChkLkZlfFFufi/0uzsRjtQ3mpKjPL9Rocmtx5VZWtsX52xd
	 yLsZfZ4bNaHdg==
Message-ID: <17254a02-8155-4857-92de-51b9724d4f5e@kernel.org>
Date: Thu, 12 Mar 2026 20:43:09 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 2/4] selftests/mm: soft-dirty: skip two tests when
 thp is not available
To: Chunyu Hu <chuhu@redhat.com>, akpm@linux-foundation.org,
 shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 Li Wang <liwang@redhat.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-3-chuhu@redhat.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260312114027.634559-3-chuhu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/26 12:40, Chunyu Hu wrote:
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
> ---

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
