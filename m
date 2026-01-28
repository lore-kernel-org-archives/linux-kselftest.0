Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0245730F552;
	Wed, 28 Jan 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616805; cv=none; b=sgde/9ocXIfmD5werTfKmmvFrxMO/K9WqOX550I6VYEPtg0goIglBlS3dt823Zb9t3YjF1WIIfk9PwUDvIproJ0ZO2v9j8OiRtR37UXJWCfPJMvfJB9W49Y3IRDefD9jJ5zd7Pr/ry7DAUcNGku1Xa/xr9pdiedG5xGdTuCaz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616805; c=relaxed/simple;
	bh=8MNeGIev9fZaWFqifaCXOcVD+0b5chfSzFUco8Ab1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARCl5+QPNkBzGwUKVHUXdIlDDpjLnVQx3n0j4X5HUPq1Ai3bkZiUg00ifV/jFgFcBg/5pPc4NsSueLS8EOD4P4FmzGm+OwXj8b3bqMtHq3d9bFA5oWgXocWmXmTNjjFVniAEtMcoELpB0XYjDyrdlP7+5d653dZN8cRbgvLnvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8O3mebh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8O3mebh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86ADC16AAE;
	Wed, 28 Jan 2026 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769616804;
	bh=8MNeGIev9fZaWFqifaCXOcVD+0b5chfSzFUco8Ab1oY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8O3mebhQPQ+Mc8gjxh/L5BobsCqF2z+LTAPzl9wlRW0dYb94VVPE+hhjJMZcA9t0
	 hWK+KcSANm2vXJm4izrdVITNF2ENlhgUzs+D3FuVkOdgiZVXTXtVqIO+GOlE20yQhG
	 HSYoxGslhQDnwnG/PfuQoCMwoZ+/R4FRP/HX5phh/ZRWmeF9//v7jx1nPGsOQDOrDb
	 dkkWzSPmIlvJxJGg0DJgPyvUcn5hlD0Usd58nv07DUJGQE6JIER2pk6bDtF0cIvuK5
	 vgVfEAg3MiWIjPDtgRh8dsct6dDbkhxdQj/4McivEvXhz7lVQchQT706fXiD1dEnDU
	 y99OhJRJ0ckWw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kselftest/arm64: Small fp-pidbench enhancements
Date: Wed, 28 Jan 2026 16:12:59 +0000
Message-ID: <176960577143.3585946.11441770891629156382.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 27 Jan 2026 16:16:13 +0000, Mark Brown wrote:
> I was using fp-pidbench a bit recently, resulting in a few small
> enhancements which it seemed useful to integrate.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Add a no-SVE loop after SVE in fp-pidbench
      https://git.kernel.org/arm64/c/96e004b4bdf9
[2/2] kselftest/arm64: Raise default number of loops in fp-pidbench
      https://git.kernel.org/arm64/c/b661d753ce2e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
