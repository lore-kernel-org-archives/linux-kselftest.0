Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673B1C5D59;
	Tue, 19 May 2026 05:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168768; cv=none; b=l0Qx21BX8Zar84RVme5GxIBRIYWt3Dm1DNrHDF1/IoombgJozIpzJ0EHwpsM7qmz0vNihDTfSOE04GNJQiysfFIEOJVnfUBnat0JPhCYEkYhLCBPhn3B22HJgEJyPZC9vP40ROEehW0O7MyT+Ik1d+3+CletxjGyJAlwa9Zy5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168768; c=relaxed/simple;
	bh=WvBKiUWG9h8oFoxTeF3GCTCSuFI5S+EmS7RSHBjqT8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJWh/VK9uMm6a8YKtjsUjrCG/ZNy5Ebqp4qHwLE5542VXRygUbAYkGH1Vt1Pd5dMlMhAdC7wUoHZFLy15Ay5j/CraEeA1rSXpg3mg3xHEMowxPCWl5sDqMRLo2IB6DJL7zGT8YgQEiTymsuoaiXberK+2xaf79hBj/0vyXeAbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3KeOfwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3KeOfwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4012AC2BCB3;
	Tue, 19 May 2026 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779168767;
	bh=WvBKiUWG9h8oFoxTeF3GCTCSuFI5S+EmS7RSHBjqT8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3KeOfwzCNzPoFtcEjhfVixt+ZIpGVayyUY2pWGxfZPyMfm1xn7wH2VkDY/kVMtVr
	 vsDfF7hpLYseIrWgHOzrZzSJfFqkFy5p76FrAQT54dnUANdtcnI4ctg2H4M2d9EeAb
	 1WBW4PZgZZHHvf2acp/8p2FwZMtg658BYbC4njgozISgq7C2nfDsP2dqMwHSSnsQLN
	 JuLxDy3CPoKie69H1Di2IO5RUvwk+CnQdMNyqqSAMmc41ukqWsG8AwXkHT/LstbTS3
	 63fofk30OTWUK1oXHE1U5WH2qXMHphKvR4PhKfh7rsv1Gh6i/kNMRGGXdG9ThlkLH+
	 PD8WRhU0+okjA==
Date: Tue, 19 May 2026 08:32:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: ackerleytng@google.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	muchun.song@linux.dev, osalvador@suse.de, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Test readback from fd on hugetlbfs mount
Message-ID: <agv19uVH0pQztjdP@kernel.org>
References: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>

Hi,

On Mon, May 18, 2026 at 11:17:32AM -0700, Ackerley Tng via B4 Relay wrote:
> Hi,
> 
> I'm thinking of consolidating the tests for libhugetlbfs as kernel
> selftests, and to start that off, I picked the simplest test:
> tests/readback.c
> 
> I refactored hugepage-mmap.c to use the kselftest harness, and then used

I made a lot of changes to mm selftests recently:
https://lore.kernel.org/all/20260511162840.375890-1-rppt@kernel.org/

This work is currently in mm.git, please take a look to avoid effort
duplication.

> FIXTURE_VARIANT from the harness to port in testing readback from an fd on
> a hugetlbfs mount.

I didn't look into the patches, but in general I'm not sure that
FIXTURE_VARIANT is such a win for simple tests.
 
> This output shows that the original test behavior was retained for the
> memfd part:
> 
>   # ./hugepage-mmap
>   TAP version 13
>   1..1
>   # Returned address is 0x7f312f200000
>   # First hex is 0
>   # First hex is 3020100
>   ok 1 Read same data
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
>   # ./hugepage-mmap
>   TAP version 13
>   1..1
>   # Starting 1 tests from 1 test cases.
>   #  RUN           hugepage_mmap.read_write ...
>   # hugepage-mmap.c:41:read_write:Returned address is 0x7f19f3a00000
>   # hugepage-mmap.c:54:read_write:First hex is 0
>   # hugepage-mmap.c:59:read_write:First hex is 3020100
>   #            OK  hugepage_mmap.read_write
>   ok 1 hugepage_mmap.read_write
>   # PASSED: 1 / 1 tests passed.
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Let me know what you think before I genericize the 2M hugepage size to
> other sizes!
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
> Ackerley Tng (5):
>       mm: selftests: Inline check_bytes() function into caller
>       mm: selftests: Inline {read,write}_bytes functions
>       mm: selftests: Refactor hugepage-mmap to use kselftest harness
>       mm: selftests: Update hugepage-mmap to support hugetlbfs mount
>       mm: selftests: Port readback test logic from libhugetlbfs
> 
>  tools/testing/selftests/mm/hugepage-mmap.c | 143 +++++++++++++++++++++--------
>  1 file changed, 105 insertions(+), 38 deletions(-)
> ---
> base-commit: 66edb901bf874d9e0787326ba12d3548b2da8700
> change-id: 20260503-port-hugetlb-selftests-9bc63bde5116
> 
> Best regards,
> --
> Ackerley Tng <ackerleytng@google.com>
> 
> 

-- 
Sincerely yours,
Mike.
