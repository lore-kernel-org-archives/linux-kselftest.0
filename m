Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39D4B1B41;
	Thu,  3 Sep 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444306; cv=none; b=JIFs3dRVVErdjTNBLY6TQqqVv4QjKk13qnSsGFPuB7I1962MAuZmKHa/t//PhmdPFW7zRMtH7srZcAqFutcS4XBvXvYZv+bYPEKQUPWx+6/bGp5dfgMCOyADlLp0lSjRBUgPRnFPeo42tSbltWXC8AEkLDCJ7/429FOR2S/MOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444306; c=relaxed/simple;
	bh=/bwUsPFOPColKlBNTYApu5MktiyXtyxEoVxqVzkOAG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLas9pPpl9YJxerfve+Cb9artKqJI2M/8+pKrnkNCfJJRNMBPKZTigNnb9KO795CDgkiv5jtbs6g2FjlTktK9duy1IuvstVnYa7Fn3r4iHYNvXc7BQAuHRtlzyoGUKwYPC2bq0iZnPjqPKJ4308bcDLZCd5R5JcdHpRWocj+2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1dKkoSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1dKkoSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2951F00A3E;
	Thu,  3 Sep 2026 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444295;
	bh=elge9bDwtCLKT6xvAo3JEAnzLjGry/X8H8tlMHRXEkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U1dKkoSPdAWi+lBx2IodRAo+PkpJIhGCvTSJ1ADsxn5z9A2citGbidswvrrava5iz
	 ++OYMoE48S/FkIlqNm6nOVnquLiVBZeP17Bd0w81JRE0U9f+x1UgeDzMqMEkoKS3zJ
	 wF33hMQM0KtC8xU0KwGdS1jDmNv3eZDvnGIffxXzvT3d6fMHZWrp7fX3PDwV4h9RBT
	 EgHZ6+D7tLUZDNsT9CHbSTPVCHUbVQaKauNHhx+AWBu23+LiPfJPTG63l8yyz9Y1UN
	 ijDg3/bwZEG3FE+VFXUxp1mI+Xfjhflq/tdU+l6+5UJWrzpN82ooLFbSMh6l/h+Vqo
	 tjK95QBJzG+Yg==
Date: Thu, 3 Sep 2026 15:04:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev
Subject: Re: [PATCH] selftests/mm: remove unreachable returns after ksft exit
 helpers
Message-ID: <apl-bS787dYOwTP-@gremlin>
References: <20260903135251.39593-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903135251.39593-1-zenghui.yu@linux.dev>

On Thu, Sep 03, 2026 at 09:52:51PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>
> The ksft_exit*() helpers such as ksft_exit_fail_msg() are declared
> __noreturn, and the ksft_exit() and ksft_finished() macros expand to calls
> of them, always terminating the process via exit().  Any return statements
> following such calls are unreachable, both at the end of main() and on
> error paths of helper functions.
>
> Remove all of them.  No functional change.
>
> Assisted-by: GLM-5.3 OpenCode

Thanks for providing the tag, much appreciated :)

> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/folio_split_race_test.c | 2 --
>  tools/testing/selftests/mm/mlock-random-test.c     | 1 -
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 1 -
>  tools/testing/selftests/mm/split_huge_page_test.c  | 4 ----
>  4 files changed, 8 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
> index 45b84f7b364e..1960635a953e 100644
> --- a/tools/testing/selftests/mm/folio_split_race_test.c
> +++ b/tools/testing/selftests/mm/folio_split_race_test.c
> @@ -269,6 +269,4 @@ int main(void)
>  				      NUM_ITERATIONS);
>
>  	ksft_exit(iter == NUM_ITERATIONS);
> -
> -	return 0;
>  }
> diff --git a/tools/testing/selftests/mm/mlock-random-test.c b/tools/testing/selftests/mm/mlock-random-test.c
> index 16294bc7dae6..58772914fd79 100644
> --- a/tools/testing/selftests/mm/mlock-random-test.c
> +++ b/tools/testing/selftests/mm/mlock-random-test.c
> @@ -71,7 +71,6 @@ int get_proc_locked_vm_size(void)
>
>  	fclose(f);
>  	ksft_exit_fail_msg("cannot parse VmLck in /proc/self/status: %s\n", strerror(errno));
> -	return -1;
>  }
>
>  /*
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 74bf79a5399d..f9c728ba96a5 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -556,5 +556,4 @@ int main(int argc, char *argv[])
>  	}
>
>  	ksft_finished();
> -	return 0;
>  }
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 86a603692826..c01d227d7fd6 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -101,7 +101,6 @@ static bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>  	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
>  fail:
>  	ksft_exit_fail_msg("Failed to get folio info\n");
> -	return false;
>  }
>
>  static int check_after_split_folio_orders(char *vaddr_start, size_t len,
> @@ -548,7 +547,6 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  err_out_unlink:
>  	unlink(testfile);
>  	ksft_exit_fail_msg("Failed to create large pagecache folios\n");
> -	return -1;
>  }
>
>  static void split_thp_in_pagecache_to_order_at(size_t fd_size,
> @@ -711,6 +709,4 @@ int main(int argc, char **argv)
>  	free(expected_orders);
>
>  	ksft_finished();
> -
> -	return 0;
>  }
> --
> 2.53.0
>

--
Cheers, Lorenzo
