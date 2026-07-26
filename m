Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB79837CD30;
	Sun, 26 Jul 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785067008; cv=none; b=Lm6WnJodSM4acGine/pJ4YQI540kagF2TaDQYO7CfTE4QgYUV4p8lKoZH1ezFWjysg41N4ZCi8ONbYTK2gdMnsRMfIZBVLZrSJnnP/WRlRIV1//inGgap9yW5KHKog+pL3t4R7OSC6R/Ej9JkbcmY8Cfn3sN41frQltAzYNEcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785067008; c=relaxed/simple;
	bh=Osw5vhnUpa8KJNod6zh8DjDcfqxO2OVv2i3PG2LCAgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz5UBf4b0JHFqJL/jhXd2EKLP3u749NKRaupglXHHSjB2N6ZbX/FWEmppDiR1uhjqki9A0i2dzV2A/SA+2tIoxNCl71zyVwpO5Ra1mJS8w0slxl/osu0A4trBDh9lPQkrKG4tnXGQi2/gWF8gq6VAUTy2cgYqtYAiHmELzqXJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kN4vCvFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN4vCvFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD2B1F000E9;
	Sun, 26 Jul 2026 11:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785067007;
	bh=kpwU+9PKazOTFn1wX64gm97MpS/jIFgxMXAts3m+7Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kN4vCvFEIgV8ViFcpG28tUFvMQ/NZfw+/pfeq7b4XQHz+5bHlvUeKy9cXII/jYN2B
	 Y0CzraY1iQ2PJ20S4vO+iRTr8ZzK/yA8U4yJc1zBXNqU83xxE30hgmeMqYLxDQ9MQS
	 kOVomnN19GNv3ZKAB8K8V/7oo4ZxCdl70tw3YeRQAwdH81cdcvUEgjZhitQY97Jstt
	 FhzsIADmOBDD1bbgszb0YP/IJcecrYq7rEF5uheu7nGS1k5jAHLGCybYuza9HMUjIq
	 IPMYb624pEaWGfnnFN+s2uewzUFIszOruMFTzINwSx2XwS+Dlk4TmLyhAVEzq4ZKKC
	 WopPjRqwKbm3g==
Date: Sun, 26 Jul 2026 14:56:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v4 12/12] selftests/mm: add a slow-GUP content and
 COW test for mTHP
Message-ID: <amX19fK0YVIEonfI@kernel.org>
References: <20260724222934.1463812-1-riel@surriel.com>
 <20260724222934.1463812-13-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724222934.1463812-13-riel@surriel.com>

Hi Rik,

On Fri, Jul 24, 2026 at 06:29:34PM -0400, Rik van Riel wrote:
> follow_page_mask() now batches a PTE-mapped large folio (mTHP) into one
> contiguous run for the slow get_user_pages() path. A mis-batched run would
> hand back the wrong pages or a stale COW copy, which the existing tests do
> not catch: gup_test checks only pin/unpin integrity, and cow exercises COW
> mostly at PMD size.
> 
> Add mthp_gup_cow_test. It forces 64kB-only mTHP, writes a per-page-distinct
> pattern, then pins the region on the slow path (PIN_LONGTERM without
> USE_FAST) and compares the bytes the kernel copies back from the pinned
> pages against that pattern.
> 
> The test covers a read pin, a write pin, and COW after fork(): a child
> write-pins to force per-page unshare and checks the copied contents, then
> rewrites its copy while the parent verifies its own contents are intact.
> 
> It also reports how many pages sit in contiguous large-folio runs, so a
> kernel without mTHP shows light coverage rather than passing vacuously.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  tools/testing/selftests/mm/Makefile           |   1 +
>  .../testing/selftests/mm/mthp_gup_cow_test.c  | 213 ++++++++++++++++++
>  tools/testing/selftests/mm/run_vmtests.sh     |   1 +
>  3 files changed, 215 insertions(+)
>  create mode 100644 tools/testing/selftests/mm/mthp_gup_cow_test.c
> 
> +
> +static long PS;
> +static int fails;
> +static int tap;
> +
> +static void ok(int cond, const char *desc)
> +{
> +	printf("%s %d %s\n", cond ? "ok" : "not ok", ++tap, desc);

Please (instruct claude to) use ksft_* helpers for printing messages and
tracking failed and passed tests.

> +	if (!cond)
> +		fails++;
> +}
> +
> +/* Deterministic, per-page-distinct pattern so any mis-order or leak shows. */
> +static void fill(char *base, size_t sz, uint32_t salt)
> +{
> +	for (size_t off = 0; off < sz; off += PS) {
> +		uint32_t k = off / PS;
> +		uint64_t v = ((uint64_t)salt << 32) ^ (k * 0x9E3779B1u + 0x1234);
> +
> +		for (size_t i = 0; i < PS; i += sizeof(v))
> +			memcpy(base + off + i, &v, sizeof(v));
> +	}
> +}
> +
> +static int wsysfs(const char *path, const char *val)

There are existing helpers to read/write sysfs in vm_util.h

> +{
> +	int fd = open(path, O_WRONLY);
> +
> +	if (fd < 0)
> +		return -1;
> +	int r = write(fd, val, strlen(val));
> +
> +	close(fd);
> +	return r < 0 ? -1 : 0;
> +}

-- 
Sincerely yours,
Mike.
