Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB73770B;
	Mon, 16 Mar 2026 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642353; cv=none; b=D8ZlmvPOfm5Nn+ZBLNUaiGrvTIwM28Wg9UBJQ6yQEWVGXnwO9/ncbeKvva/zKm53LZ1vGvZMp9boEx9tLlEVqq/Mf+JIJrHUP3/5e6hZRwj2RrJvPN4uslxPzhYnZoGAVsm5MoQByQmeu4Jmu+5pYzwvyGVfWpvsrmbba+xZti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642353; c=relaxed/simple;
	bh=lCqBqiMY5//on77MUeD/QhHuGUd+SE7F0UXKstc9vUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYtrvPVP0mnvJsGZxVDB368iw5XMwQhPWTy8d1WXf+VmixcAuCbdTc2pnUPl6507ynyrFoZ2QEc5U2QtLUYM/O73LNqaR8cFmLcePz2LNxoAVdjfsgHcH7Qb8mzfYrRfQhYZtkH+2yzU/NaeO2m17LWYAveCjlCqtGaut339XmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/MW+09j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/MW+09j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3320C19421;
	Mon, 16 Mar 2026 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642353;
	bh=lCqBqiMY5//on77MUeD/QhHuGUd+SE7F0UXKstc9vUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/MW+09jFA/OhJA/HW2HZKbOEn2DEwsGgatWz5PzNIk6U9inP/ZIvlFxRggiUXuDL
	 pzc9il0gfSF7NlYxy6HSUgBJE3zVW6ryQDAubEH3GtyrwwubmmHeqasMLY8hzaYH+P
	 7/baj1FlJcZc+4YXkJ+HAiE83MKRguFXofKcrQ3pXDcRBEmGSDYJnYz3+NaioPd+mW
	 WJxqBCc7yA6qXUAcdx/B54/0zDn5J0aoicTzPytPQFtjomsgH1cNbaKiadTbKo3xlA
	 TT0DyUD9WiEUZX+pz7YIO8nyqEmTEOVzNe8/BfuIEyZMD1h+s9mcnykRujdVSUh5S6
	 CT5SvRiXcaHsQ==
Date: Mon, 16 Mar 2026 08:25:42 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v2 2/5] selftests/mm: soft-dirty: skip two tests when thp
 is not available
Message-ID: <abeiZtDFW3YZMebg@kernel.org>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-3-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316044335.1390608-3-chuhu@redhat.com>

On Mon, Mar 16, 2026 at 12:43:32PM +0800, Chunyu Hu wrote:
> The test_hugepage test contain two sub tests. If just reporting one skip
> when thp not available, there will be error in the log because the test
> count don't match the test plan. Change to skip two tests by running the
> ksft_test_result_skip twice in this case.

...
 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
> Changes in v2:
>   - add reviewed by from Lorenzo and Zi
>   - add acked-by from David
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

There's already similar block when the page is not collapsed, but reworking
the test flow can be done on top as a separate commit.

Feel free to add

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
