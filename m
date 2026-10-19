Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F78471D16;
	Mon, 19 Oct 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385974; cv=none; b=WeDIHlf70vvFAqMSl9GCpsT/T294YmzxmsJmVxNT/lgNYCT7D5EIW7gzsjYwE26a3DQftv+iLNiSqwuqmHn+vKpagp89RiuXoIm5I1r+lRI+cjJHJrjAyJaRwO2w5s00ZygsB5BcIxj7J03i/9etr9MRZKCspxxA69eIPwJXwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385974; c=relaxed/simple;
	bh=wSKR26ILxURLnFx2+QlKpgJeVV02uGi/OJ246XfSBBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OppTmljymZGZObyih4RAaKWyPwTkBjnYS64riX4UHowb+1FH6Gic7ql2F6P4h4UWXf8h4WyI01IRXM7c6sxDcadEOqXoCZvZkZGey2aMKqqFw5CB3rjjYSNgvmqcL7AzTSTfcmb5D4yQ2eWF1dhaPc1GFNVx8I44hn0Ugrik43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OoKVnnAW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OoKVnnAW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5860A1476;
	Sun, 18 Oct 2026 21:59:22 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957D23F673;
	Sun, 18 Oct 2026 21:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792385965; bh=wSKR26ILxURLnFx2+QlKpgJeVV02uGi/OJ246XfSBBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OoKVnnAW5h6G8pIZOaIkk+8Ax2CDh6YIjtCquL38N20RtIps5AAUG0wRkrAL0y2Ou
	 jIOksQFm78zNWVnU9EZILHAlzRG9ZcXG32/md25shOTNxjWF8OPEXrmyFn8rLW1en7
	 CwIROAczVQTA1z3R0zAmIOSecWfJq5EwNW1lCT+U=
Message-ID: <ad987ce7-1aa1-405e-a647-456c0c2283f6@arm.com>
Date: Mon, 19 Oct 2026 10:29:18 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract
 tests
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-2-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-2-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> MADV_COLD and MADV_PAGEOUT share a page-table walker covering ordinary
> PTEs, PTE-mapped large folios and huge PMDs. Existing selftests provide
> little coverage of its range, folio-state and permission decisions.
> 
> Add a kselftest harness test for both hints, starting with the most basic
> behavior userspace relies on: MADV_COLD neither populates a PTE hole nor
> faults a swapped page back in, and neither hint may be applied to a locked
> VMA.
> 
> The swapped-page test skips when swap is unavailable.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/Makefile        |   2 +
>  tools/testing/selftests/mm/ksft_madvise.sh |   4 +
>  tools/testing/selftests/mm/madvise.c       | 134 +++++++++++++++++++++
>  tools/testing/selftests/mm/run_vmtests.sh  |   5 +
>  4 files changed, 145 insertions(+)
>  create mode 100755 tools/testing/selftests/mm/ksft_madvise.sh
>  create mode 100644 tools/testing/selftests/mm/madvise.c

I am not sure if this test needs to be called madvise. I think this
might be a too broad name for a test for MADV_COLD and MADV_PAGEOUT. Can
we maybe call it something like madv_cold_pageout (similar to
madv_populate already present)?

Apart from that, it LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

