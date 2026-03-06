Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FA37C114;
	Fri,  6 Mar 2026 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800026; cv=none; b=S0MiPE2M0qL983eD36q+GR8G7RVPNvrTALk7jsZbVd3piMb+Qdl7e7TrLuUF5alNLntu0m4DcK43nqJkF8RiSIknKxNUpEHxO8qrs0eAmhsVyWLsjcfUVxPVoIqom7KJnvH7rFuv8LkRi6lIRIo51sQxENTaYkQSkDsEzvkcGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800026; c=relaxed/simple;
	bh=gS1ab7LC2PFHxO9DKZFP0ByelNln6nGVZgZNHhOBINk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NAVoh4nstS8K74cDc2Wsiz6D05M97zqsi3TC9o1FCg4E19ikwa+NwCuG87eBv59GUd3qK9vhbd78vLZtwyZomPRc/5AK3X5dfJcDzijgSi9kujOYi92K2xS1oVt37L3FxB//N1pn/nNfk+1Q4zWiSwhX+jhgFPK8Td53cERZXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftrxRDST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftrxRDST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0800C4CEF7;
	Fri,  6 Mar 2026 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800026;
	bh=gS1ab7LC2PFHxO9DKZFP0ByelNln6nGVZgZNHhOBINk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftrxRDSTIbFHbdDTju4HkI8Ujof+Thf84cV60zyLlRsFrN2y6MwGrOFosNfxNND21
	 j0Qsq2ywG9IixB5RZIDRnDUd8SaVbmfc/HfS0pMSuEj8xL9Bfq4a6AT819dv7aBj0g
	 yzCT+Dd4GVdpjtYugsyK7cYrSs3Cw3hW5+c252wBMTAlr85SlZ8l4cAXx6Z8/Uf8vx
	 tTpzCEegy/Aq5qJ3fzisM2CoEUlcGaYafP1kD6b5zPPzk8iRbmzVh54qg9s4RWHIcR
	 R2nv4kh9jIKbZfchjSPeOvbzMeF+X3HE8szBVwINj4F9REGhWFHtoPGg0LFrdT0Y1q
	 nNxJ3jG1mVlZw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	broonie@kernel.org,
	yeoreum.yun@arm.com,
	jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxarm@huawei.com,
	Yifan Wu <wuyifan50@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	xiaqinxin@huawei.com,
	prime.zeng@hisilicon.com,
	wangyushan12@huawei.com,
	xuwei5@huawei.com,
	fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add cmpbr_sigill() for hwcap test
Date: Fri,  6 Mar 2026 12:26:53 +0000
Message-ID: <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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

Applied first patch to arm64 (for-next/fixes), thanks!

[1/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
      https://git.kernel.org/arm64/c/d87c828daa7e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
