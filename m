Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7EA3D332C;
	Mon,  3 Aug 2026 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755110; cv=none; b=GFPqSPL8zQ3m9YE00CBK9tf6T9s8DLR0DWahhuS7sp8bmYF7/f0QaLHcuqkfTV2s/hNgsjF+c41lag341baYmkdB6qXuHEyyAQvF996AQ64hBczQIT4REcJh27YWCWtfBjCiMkkHmqvSI/GtnMBvJ6Q6AcH3f8hfacGoQXkj6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755110; c=relaxed/simple;
	bh=SZVvYeEnoVRUSiRtv6e4HpNFsRVO3C05izVZU0Td/14=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bRtTSfRiRP70VO3SOhQdgCH5fd8gQDsUGVGJso/7mscdEZCwFMKUWQnyRcGc2M7b5R/kl/ysjud3nbvgr0UTLZXApACHdZequNBfc8lbStr/JyGKrdo9LnpK7aWlZYpJIPUGY4TX3xFoFWlk7FLIjulHbXgt/z8cN6EEKXLR7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHOAih4y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHOAih4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD391F00A3D;
	Mon,  3 Aug 2026 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755105;
	bh=ycZI+dP9lyNyUvbZGErQYkVbB2SU/4cSINSvONZ92RQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FHOAih4yfEX5WHe52OXAdLKXQDI666arpJC0SoTN86Q/ZAp2XD+qubZr2xAGFOUoS
	 jz4bVfp1yAfJU4gobIyhaKUG3A7Y+9DtT5S1Bfn39WnoIBXDnUSihrenRoQohyvOqv
	 i4c3mZ37h4lzcUMDK0nRAnJOcPSFekmk8BcYMUPsJX9NwvdJmqBtx1r0VCLjwXuvx4
	 gRtUHGCgVEvgHfMor0VDs5byhv2igUTSIup9DNpQMQ4L1cprg8hoLxuSPIdH6D3D2D
	 7FauQf7kXNeJd9ITREI2CRNTp7VUc9BVsU2KQ/I5qjKT5S/WqU2J86WRtkzh8xJCHA
	 AcB7G0kmraZyg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 05/16] selftests/mm: add khugepaged completion barrier
 helper
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-6-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-6-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506331.1561566.4863322190872953233.b4-review@b4>
X-Mailer: b4 0.16-dev

> Race and functional tests need to drive khugepaged synchronously: set
> up a layout, let exactly one full scan pass over it, check the result.
> The khugepaged selftest already waits on full_scans advancing by two —
> a completion barrier for one pass that started after setup — but it
> relies on a short configured scan_sleep_millisecs to make progress.
> 
> Lift the pattern into a library helper, khugepaged_full_pass(), and
> drive it by the sysfs wake path: any store to scan_sleep_millisecs
> wakes the daemon, so the barrier completes promptly regardless of the
> configured scan cadence. Wake exactly once per missing pass:
> over-waking would queue a straggler pass behind the barrier that
> overlaps and perturbs whatever the caller sets up next. One wake
> completes one full pass only when the whole mm list fits in a single
> scan batch, so callers must pair the helper with a large pages_to_scan.
> 
> Settings pushes and pops must not start passes nobody asked for
> either, so thp_write_settings() now writes each khugepaged knob only
> when it changes. Switch the khugepaged selftest order-parameterized
> cases to the helper.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index d7917dce3aba..a26a0cffa9c5 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -183,6 +183,17 @@ void thp_read_settings(struct thp_settings *settings)
>  	}
>  }
>  
> +/*
> + * Write only on change: any store to a khugepaged sysfs knob wakes the
> + * daemon, and settings pushes/pops must not start scan passes nobody
> + * asked for — khugepaged_full_pass() is the only sanctioned wake.
> + */
> +static void thp_update_num(const char *name, unsigned long num)
> +{
> +	if (thp_read_num(name) != num)
> +		thp_write_num(name, num);
> +}

Don't you want to expose this to the users?

> +
>  void thp_write_settings(struct thp_settings *settings)
>  {
>  	struct khugepaged_settings *khugepaged = &settings->khugepaged;
> @@ -198,15 +209,15 @@ void thp_write_settings(struct thp_settings *settings)
>  			shmem_enabled_strings[settings->shmem_enabled]);
>  	thp_write_num("use_zero_page", settings->use_zero_page);
>  
> -	thp_write_num("khugepaged/defrag", khugepaged->defrag);
> -	thp_write_num("khugepaged/alloc_sleep_millisecs",
> -			khugepaged->alloc_sleep_millisecs);
> -	thp_write_num("khugepaged/scan_sleep_millisecs",
> -			khugepaged->scan_sleep_millisecs);
> -	thp_write_num("khugepaged/max_ptes_none", khugepaged->max_ptes_none);
> -	thp_write_num("khugepaged/max_ptes_swap", khugepaged->max_ptes_swap);
> -	thp_write_num("khugepaged/max_ptes_shared", khugepaged->max_ptes_shared);
> -	thp_write_num("khugepaged/pages_to_scan", khugepaged->pages_to_scan);
> +	thp_update_num("khugepaged/defrag", khugepaged->defrag);
> +	thp_update_num("khugepaged/alloc_sleep_millisecs",
> +		       khugepaged->alloc_sleep_millisecs);
> +	thp_update_num("khugepaged/scan_sleep_millisecs",
> +		       khugepaged->scan_sleep_millisecs);
> +	thp_update_num("khugepaged/max_ptes_none", khugepaged->max_ptes_none);
> +	thp_update_num("khugepaged/max_ptes_swap", khugepaged->max_ptes_swap);
> +	thp_update_num("khugepaged/max_ptes_shared", khugepaged->max_ptes_shared);
> +	thp_update_num("khugepaged/pages_to_scan", khugepaged->pages_to_scan);
>  
>  	if (dev_queue_read_ahead_path[0])
>  		write_num(dev_queue_read_ahead_path, settings->read_ahead_kb);
> @@ -230,6 +241,43 @@ void thp_write_settings(struct thp_settings *settings)
>  	}
>  }
>  
> +/*
> + * Completion barrier for khugepaged: wait until a full scan pass that
> + * started after this call has finished. full_scans must advance by two;
> + * a +1 step may complete a pass that examined this mm before the
> + * caller's setup was in place.
> + *
> + * Any store to scan_sleep_millisecs wakes the daemon, so the barrier
> + * works regardless of the configured scan cadence. It wakes exactly
> + * once per missing pass — over-waking would queue a straggler pass
> + * behind the barrier, perturbing whatever the caller sets up next.
> + * One wake completes one full pass only if the whole mm list fits in
> + * one scan batch, so callers must pair this with a large
> + * pages_to_scan.
> + */
> +bool khugepaged_full_pass(unsigned int timeout_s)
> +{
> +	unsigned long deadline_ms = timeout_s * 1000UL;
> +	unsigned long sleep_ms =
> +		thp_read_num("khugepaged/scan_sleep_millisecs");
> +	unsigned long elapsed_ms = 0;
> +	int pass;
> +
> +	for (pass = 0; pass < 2; pass++) {
> +		unsigned long target =
> +			thp_read_num("khugepaged/full_scans") + 1;
> +
> +		thp_write_num("khugepaged/scan_sleep_millisecs", sleep_ms);
> +		while (thp_read_num("khugepaged/full_scans") < target) {
> +			if (elapsed_ms >= deadline_ms)
> +				return false;
> +			usleep(10 * 1000);
> +			elapsed_ms += 10;
> +		}
> +	}
> +	return true;
> +}
> +
>  struct thp_settings *thp_current_settings(void)
>  {
>  	if (!settings_index) {
> diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
> index 726c73c43c05..8de446affeec 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.h
> +++ b/tools/testing/selftests/mm/hugepage_settings.h
> @@ -83,6 +83,8 @@ static inline void thp_save_settings(void)
>  	hugepage_save_settings(/* thp = */ true, /* hugetlb = */ false);
>  }
>  
> +bool khugepaged_full_pass(unsigned int timeout_s);
> +
>  void thp_set_read_ahead_path(char *path);
>  unsigned long thp_supported_orders(void);
>  unsigned long thp_shmem_supported_orders(void);
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 971e97a7330a..65fafab06410 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1126,23 +1126,10 @@ static bool range_not_collapsed(void *p, size_t len)
>  	return true;
>  }
>  
> -/*
> - * Completion barrier: one full khugepaged pass that started after this
> - * call. Waiting for full_scans to advance by two guarantees it; a +1
> - * step might complete a pass that scanned our mm before the setup.
> - */
>  static bool khugepaged_wait_full_pass(void)
>  {
> -	int full_scans = thp_read_num("khugepaged/full_scans") + 2;
> -	int timeout = 60; /* 30 seconds */
> -
> -	while (timeout--) {
> -		if (thp_read_num("khugepaged/full_scans") >= full_scans)
> -			return true;
> -		printf(".");
> -		usleep(TICK);
> -	}
> -	return false;
> +	/* Wait up to 30 seconds for the pass to complete. */
> +	return khugepaged_full_pass(30);

This implies that _full_pass() helper should be in a patch before its
users :)

-- 
Sincerely yours,
Mike.

