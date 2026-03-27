Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6066A81732;
	Fri, 27 Mar 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616441; cv=none; b=nb/bhTfyGv0OgDrVOoP7dOlof5L6QwQmFeO4ZKTLgO3OFcTlsFSgT58dFj1gLtjH7MmtoSB8SqEjlzK6lvoaGMgmYa88EPJOIQZWX8WygW/1j0hl+bkH9uubBBzGD8qT7AS1Qe02rbyx60v0vSLIYLLONwubk30Q+k7JPfK7z5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616441; c=relaxed/simple;
	bh=NRpLU3VWNM4bFKxiVpEMaLJQ3c2gSocDeM31nmwqK/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA077Ig/7aHCsT7Q6N5Tg8QPBdhJ5MXovDgUR3aK9xZBWUJnglgqHZBmlgpqaHg7LqlImfj91UGf6SN8X3dtf1Oh7KR/9LKPtMcsl5NsxRyHmPSdcVULuNlmoSAVvXloMYeYwy1jsRSVr2qfcnbcRJxjmBzL7Tg1x+N0+cWstyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ayg3wAwU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ayg3wAwU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41A635A1;
	Fri, 27 Mar 2026 06:00:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC02B3F905;
	Fri, 27 Mar 2026 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774616439; bh=NRpLU3VWNM4bFKxiVpEMaLJQ3c2gSocDeM31nmwqK/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ayg3wAwUNXPLxFqAh/uWuZwPccKhFmk7ZLTKxpy1ttsWaS8BxS8dNbQ/tLk9NREUe
	 tvjH1iqKRZVHjILG15WYSvazb3ayt3XldhFT2gER3haS5T08HXsiX6ksk3F3wU+aZ1
	 Cq+mxEJ8s6mcYChMj/EZnX10T5VNkjlMO7yOpOVo=
Date: Fri, 27 Mar 2026 13:00:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, shuah@kernel.org, broonie@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	Yifan Wu <wuyifan50@huawei.com>
Cc: xiaqinxin@huawei.com, prime.zeng@hisilicon.com, wangyushan12@huawei.com,
	xuwei5@huawei.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Subject: Re: (subset) [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and
 add cmpbr_sigill() for hwcap test
Message-ID: <acZ_cxnUjoFiAuJp@arm.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <177461612664.2271410.12022212735709481989.b4-ty@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177461612664.2271410.12022212735709481989.b4-ty@arm.com>

On Fri, Mar 27, 2026 at 12:58:11PM +0000, Catalin Marinas wrote:
> On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
> > This patch series fixes and adds two selftests in the arm64 hwcap
> > test suite.
> > 
> > Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
> > FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
> > the presence of FEAT_SVE2.1 implied support for the BFADD
> > instruction, which actually depends on the FEAT_SVE_B16B16 feature.
> > The test is updated to use the LD1Q instruction, which is
> > unambiguously implied by FEAT_SVE2p1.
> > 
> > [...]
> 
> Applied to arm64 (for-kernelci), thanks!

Wrong branch, it's for-next/kselftest (script got confused).
