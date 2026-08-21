Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1BE3E0724;
	Fri, 21 Aug 2026 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302552; cv=none; b=VOQGPebjHI9AdKBPKF/4cQbNORM2RkF9rbsYmQ3tFSPT1PTkIpi4qX5zZ//V1TKpsvCKJZchCgPdths+DEB9Z6pULPcIlZ2CsjmF0Knpd5UqbYJR5nIitED5HpnJWdZ4XDjuwGk2+7/+sole18z2/ydDeL9aZy/6P/7qSpLh0f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302552; c=relaxed/simple;
	bh=wcdTd5B/RaOOWV5qretAunfQFbsYHOpwzyHoWc18erI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0AvI2ixllTPlxkYgQEDqPZsRji0a18L8wOdBGgRHIZWgXFUDx9B5EeK/EbgQF5vyMk9W3pgRuLzER4+m9AfqHs6Rpz2HDo9neRMS1Ujx8/zqEKfPYaaT2KSDOIZbAKUThq+cgzXgTXn/P/zRYTkAp/pxT9AP6jKUsMR75SWEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TWdFNY3b; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TWdFNY3b"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9E71596;
	Fri, 21 Aug 2026 01:55:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 085EB3F66F;
	Fri, 21 Aug 2026 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787302548; bh=wcdTd5B/RaOOWV5qretAunfQFbsYHOpwzyHoWc18erI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWdFNY3b68iy0MWDcR3xLM88mOwb4xQ08AlfOCA1myAiymVJh+Tw6lBpIILF/CvNR
	 VSseBE1KnZG9LMpSHVGBtblrEpb18HK5IF3Ih1BHtw1ZxB00xBPKLFbHZ7TvhMCp9Y
	 OEOZvff9FSOJmW4QdM0vtk6Ul7ejpOvX3sL+26fI=
Date: Fri, 21 Aug 2026 09:55:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <aogSkJxWf9QndjuE@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-5-usama.anjum@arm.com>

On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by the MTE tests.
> 
> Add a fragment covering the userspace MTE and tagged-address ABIs, KSM
> and its sysfs interface, explicit HugeTLB mappings and their proc/sysctl
> interfaces, and tmpfs-backed file mappings.
> 
> Do not request NUMA solely for the optional KSM merge_across_nodes.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/arm64/mte/config | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 tools/testing/selftests/arm64/mte/config
> 
> diff --git a/tools/testing/selftests/arm64/mte/config b/tools/testing/selftests/arm64/mte/config
> new file mode 100644
> index 0000000000000..8587ce70c294a
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/mte/config
> @@ -0,0 +1,8 @@
> +CONFIG_ARM64_MTE=y
> +CONFIG_ARM64_TAGGED_ADDR_ABI=y
> +CONFIG_HUGETLBFS=y
> +CONFIG_KSM=y
> +CONFIG_PROC_FS=y
> +CONFIG_SYSCTL=y

You may want CONFIG_PROC_SYSCTL.

> +CONFIG_SYSFS=y
> +CONFIG_TMPFS=y

These are all covered by defconfig. Are these fragments still necessary?
Or are they supposed to work on custom configs? If the latter EXPERT may
be set, hence the PROC_SYSCTL above. You probably also need SHMEM.

-- 
Catalin
