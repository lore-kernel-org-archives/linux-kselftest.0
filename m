Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00248C3FA;
	Thu,  2 Jul 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997115; cv=none; b=rdIWVItIMGjcoRo25QPpkUGadjxJnpr32xNdLmrLjaQ+uBS0dlAtiFjYG8DVor3CePrkXxHDVk8aDj/yrsxLLo9/0KRoDq9svNyeQxnEaFDcZrxhBxS3zIQZoiw9/ZkPe3Hm6LWWFxpZkBKZAhI+0gk+4vESMCRbZLEQdTBfoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997115; c=relaxed/simple;
	bh=H0qZeu4JvIpKaw6z3QY/G0SC6dIXroRZxcVuU6FPil0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hf34RBFrrCS9dCE+6AV3Kp/n2kCfgn0GtMI/shbLM9Sm4hOibjm9OyCogSlSpPRN3zm0esW97/yZBSvz4vPLHyYieoDC31wAxuMLF2fDEhdpnzm6xUcUwOhZ39fwsQW2CXGRfhnoAk6gCgGzU1wYAvhNagzecqnUSG9p8nMy6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsEpkhgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsEpkhgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498A21F00A3D;
	Thu,  2 Jul 2026 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782997113;
	bh=nfJGQiLZMT0lCObzgKpJ2ztq6NpnscngYdLYNzXRSXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gsEpkhgWYncq2LdMZrUsooPu/jZHOjUgLjqrSzbuLjR+tIbx7Vcziu5zn7VJNwr33
	 ss5o8JtaW9CCTG12u1JRgikFR4gV/oKcTEgGcedsx87E2YZcnnsU8YnapO8st7gr0i
	 VrIElU5Ps/p/8iYg9Z9UfQVUXMgmDGerpP/fy/leNs4kRlBGQZ1Ne1SebwXhv0DCj3
	 Mmcoexq9euoC2jHaPPw08WJA/V645zwCAepi1yWTAN1Aj6bljYd7G6N7APZTp88tvY
	 ij90n0h97m7Kbxq06CoxrzMeq4z6toZuvCU4gpIbtwrLjBsNIVwje/EKcbbq0UDFlD
	 1/astxQce2lYg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	Wang Yan <wangyan01@kylinos.cn>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/arm64: fix spelling errors in comments
Date: Thu,  2 Jul 2026 13:58:23 +0100
Message-ID: <178298908428.3252584.2973401122289097904.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702015242.361489-1-wangyan01@kylinos.cn>
References: <20260702015242.361489-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 02 Jul 2026 09:52:42 +0800, Wang Yan wrote:
> Fix two spelling mistakes in arm64 selftest comments:
>   - "whcih" -> "which" (arm64/gcs/libc-gcs.c)
>   - "resutls" -> "results" (arm64/pauth/pac.c)
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] selftests/arm64: fix spelling errors in comments
      https://git.kernel.org/arm64/c/a52d6c7160f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
