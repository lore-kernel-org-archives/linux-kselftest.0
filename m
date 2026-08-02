Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A53B1034;
	Sun,  2 Aug 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672796; cv=none; b=Ssbq9rNjSRD8Hp/Gx9+4qrWIEo/Q03nklLEiiIyGcbQwEKE87l3zcRY+DVjWTGGmPn61TgjJ4mEYxSj6bPmDuAQfP+zIcnZP1ALFlX73GnFdEKO6lwHGyCoaO3tjkLox+ZiaEA2+a5VfqiXfNhdac3N7xc785sacaPZqgnc7HHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672796; c=relaxed/simple;
	bh=QPtYCfasPX09a9+Idi+TZfijK57IBKX/XsVMVlEdymY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJO078yvCdhd2XlT/OuDHfqpwMFBuTTFeZcLtxQEyhVbmHHDk0kcbzLcP67RIum9qpTe075eLWS3/78vDteTGVXZgPUk8/1U3aXX9PBpCwgeCS1A0PunDMDSPZ7nMYKga3TDMjYKb11WMDSF4aMmqjIKaq332B/9u6wR/Xeb61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeiAd8kD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeiAd8kD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257811F000E9;
	Sun,  2 Aug 2026 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672794;
	bh=V2avLvPB80HIFXkBSkpiF/wYujLC5U42IwkZ/F2PszQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WeiAd8kD7RZ7Cy9BY0UEnsOZp7QiaPyfAGkKzfIbmqxbvTv2Qlc57WFGenCwpyo4a
	 eOF7VdhbNAd06ifc3Qo+Qq1jMpQmexfEsp4rab3zFSriz+mMbbgdgZ60VHI0Dz3Zzc
	 vmDhUjmeJZpM6CgAsbc+wNKCkTPguHCFcs/I4MHklECSbiE8PadjbRJZIcQBzqIgMc
	 fSz79vXwF01bCeD+I7aLoLnrAJxKJ1GfrXJp/Thdj+RMhLPKixB0GQQ5OTVyHOtxM2
	 eKuDr8tMPe1JGb+H2KdndHthHH1lxn7c1grMlQYyILB3aUNdOZ+m6FiErCnEyEcWmZ
	 jmdyGigLPnqSQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/2] kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Sun,  2 Aug 2026 13:12:31 +0100
Message-ID: <178566425249.4143122.5280798109588478069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728021122.2640104-1-ruanjinjie@huawei.com>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 28 Jul 2026 10:11:20 +0800, Jinjie Ruan wrote:
> Recently, a security issue related to orig_x0 was discovered and fixed
> in arm64, but there are still no test cases covering it. Seccomp,
> tracepoints, and audit can observe a stale value for x0 after a ptracer
> or SECCOMP_RET_TRACE modifies x0.
> 
> As Kees suggested, this series adds two kselftests for arm64 that validate
> the orig_x0 re-synchronisation fix in ptrace, the first one is for ptrace
> update, the second one is for SECCOMP_RET_TRACE update.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
      https://git.kernel.org/arm64/c/2fcbc4adf997
[2/2] kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass
      https://git.kernel.org/arm64/c/21e37da12071

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
