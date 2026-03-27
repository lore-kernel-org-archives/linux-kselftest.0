Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBCD3BD259;
	Fri, 27 Mar 2026 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616299; cv=none; b=Wn4s0MabMDX3aRXB22JyYhqCOXotzJNDd1JuqIsOG521PFey6FiU7lzTrZKcjF7BShZ0cTUtPrUKSPTWVdFYMEE5UYfHwlOuWOojPAKEaYaU+C6/oWr+m1uzZCbjdWmGwIYTQQ2yB5p5ZP3fhPLGGgLVxTc8Gk6MS5QkHHjv8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616299; c=relaxed/simple;
	bh=gPTmS0afsT8ENArRIOKhHMimqu3xPU+TxcEcMUHpONM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhww2OiY9cvOnsIbp8fxNkztUTwtYwN9XPVay1v0omltTJ4p6ndiAssQvvWUX8xkNfnmPh3YOVmOhDAmoXmYIk4IVW4dsRydvPqq1LUuhNfjk6e+spYQAxP++RmpTAzwW4AhXAuJNvzpwANvReiefwTG0GvODCFqE3DfgHQArTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pzNYBFzl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pzNYBFzl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8112435A1;
	Fri, 27 Mar 2026 05:58:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D8823F905;
	Fri, 27 Mar 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774616296; bh=gPTmS0afsT8ENArRIOKhHMimqu3xPU+TxcEcMUHpONM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzNYBFzlck/W50fnQQFSuSq4CCG9YvlRkreuJcFYuY6iRPte2YEMwx8gFqAUfG1fY
	 DVIDs4rrRxRZVsS8mr0dSs5qz0FNyqelbZD3Vaokye9VJyvjP6OEH9Yuzq7TV2jgpB
	 kIRXyCrOqkjK+ZthOSSK66WmWCruCVBw8zauC/aM=
Date: Fri, 27 Mar 2026 12:58:11 +0000
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
Message-ID: <177461612664.2271410.12022212735709481989.b4-ty@arm.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>

On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
> This patch series fixes and adds two selftests in the arm64 hwcap
> test suite.
> 
> Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
> FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
> the presence of FEAT_SVE2.1 implied support for the BFADD
> instruction, which actually depends on the FEAT_SVE_B16B16 feature.
> The test is updated to use the LD1Q instruction, which is
> unambiguously implied by FEAT_SVE2p1.
> 
> [...]

Applied to arm64 (for-kernelci), thanks!

[2/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
      https://git.kernel.org/arm64/c/74cd4e0e5399

-- 
Catalin
