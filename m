Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E840381E96
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170761; cv=none; b=SBDfWzxX/AbMY8Brgcb2PhH/xYpcvs+G36CRJs5aEWCAylcUsqgiJiyyv1lHOX06aoJ21uMRTnTubQ2fqro422C8XmoKcxw4TnFnkgrSdYXb9cqSCp0LguSDmgqLMuABjQZba91sEHEWe2IEqq6gCktGAEaSxFUiAAWWHPwAn00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170761; c=relaxed/simple;
	bh=lYkxJURr4b8T5fcyUwFfj0VPmUSd++MvHLs+J+120Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgpjlBrV3Bq5Er+kfL78zukmbWR0honoYcA35hLSZAGUDacVmrTI5tMK5y952m21TLvn0ouGJuypmzuAvh1GsLWpOsItVLljbRe7eYKAfDk3zhakq00EJqLtyuKqq7epuyJWPbpDHGcXx9gD5JjqKSCsG6r7GSKoUTlyhE6asLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ODMqdQgX; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ODMqdQgX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785170756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXIlDiKSKHoB5funfN0ip0RnphBZYOqvi0Mcm88qhBY=;
	b=ODMqdQgXDPCFb/Co71Ndjhz9dQ/CkLN9N0o+suX1dbw/g5gB0mLmJ6y+a38Gwo88Fqggcm
	qG1UUoTcn3phpNtrr/yVK+1mpXLMOSvcdhLB56AImA/annvY9vMmjJjdiHTTGQ18vOJbpF
	4NjVfU/GWImgnrW/ICGjPEa0kAUiVuk=
From: Usama Arif <usama.arif@linux.dev>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 1/5] selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
Date: Mon, 27 Jul 2026 09:45:44 -0700
Message-ID: <20260727164545.897052-1-usama.arif@linux.dev>
In-Reply-To: <20260727095225.372655-2-usama.anjum@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, 27 Jul 2026 10:52:17 +0100 Muhammad Usama Anjum <usama.anjum@arm.com> wrote:

> The tmpfile-backed COW cases allocate a one-page file with fallocate()
> before exercising private and shared mappings.  When the filesystem
> backing tmpfile() does not implement fallocate(), setup fails with
> EOPNOTSUPP and no COW behavior is exercised.
> 
> This occurs when the temporary directory resides on a filesystem with
> limited allocation support, such as NFSv3.  Reporting a failure adds
> noise because the test prerequisite is absent rather than the COW
> implementation being broken.
> 
> Report EOPNOTSUPP as a skip.  Continue treating every other fallocate()
> error as a failure so unexpected setup regressions remain visible.
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/mm/cow.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
> index 0c627ea89ff7b..c1b8920e29342 100644
> --- a/tools/testing/selftests/mm/cow.c
> +++ b/tools/testing/selftests/mm/cow.c
> @@ -1718,8 +1718,13 @@ static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
>  
>  	/* File consists of a single page filled with zeroes. */
>  	if (fallocate(fd, 0, 0, pagesize)) {
> -		ksft_perror("fallocate() failed");
> -		log_test_result(KSFT_FAIL);
> +		if (errno == EOPNOTSUPP) {
> +			ksft_print_msg("fallocate() not supported by filesystem\n");
> +			log_test_result(KSFT_SKIP);
> +		} else {
> +			ksft_perror("fallocate() failed");
> +			log_test_result(KSFT_FAIL);
> +		}


Correctly skips only unsupported fallocate() setup

Acked-by: Usama Arif <usama.arif@linux.dev>

>  		goto close;
>  	}
>  
> -- 
> 2.47.3
> 
> 
