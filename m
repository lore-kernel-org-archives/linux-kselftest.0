Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C963AEB5C;
	Sun,  2 Aug 2026 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672780; cv=none; b=eKvhvRBizH0yK4gOJJPwuNGcDpfHMC1tXGRpC9EaWDuXjMQ6NoFlv2k6gfB1Z9NyRm8IHAy1B1aIE9023vqENN/5h6ggJW8cdYSsp8xT5U5V9ecNRaQqHRoykpqgRaQo6TMrlQ1+upqjE/HHQ5dOn3ieWmccNDeJbKDBDs4iBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672780; c=relaxed/simple;
	bh=ry8K+veviXW78GrPnTOTHILt5GCYymbTUVv2y8NSu5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dzv5xu9bE6JK4pqnRiBMEvN4lT+Q3bbQW+AeTPhAc4McMIBHeCcCE9+MxwL1w5kaBfxiD4314BtSvc0UhCqUYZA3ukOa2g21SMA7UJ/FwHWe+4rMGDyvE++B9nfOP5LP5NXR4mItzYr5jP9df9xW9NVvDMsHxdK0Ba24kdaf7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fts/H2R4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fts/H2R4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294A31F000E9;
	Sun,  2 Aug 2026 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672776;
	bh=0ButMBPMYnmY+Ls5CyIA3CamKNvK6o2HH6itw67GRi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fts/H2R4VzKIIDoPW5c3M+BH2MkX8SGM3HdVLebm302yY0ZDdu03fipvw54QazpXU
	 X3QCWSNna9VBoyhCxB5UWo6yXvRZuB8UsZFEDv8Q+4icz6sCwbJ4UWmVKXS/U8DG2o
	 5qKVSYSUvYM2/R1A5WYz8fTavuL/479fcrUeJfLiPbhlc1/R7L9j7zOwFURSp0eOG7
	 XBrr0UirC/xrWgz+eCNS81yU+4PxPJQ0IJVrdaZ7SJ1rS5oQmbsLvJEAUjk3xR7/iS
	 X7RXqDOyt44Bik82SlW1rE8zso3K25Jr51QX3TiMu9VeLhkFm4fNdB1XYm7KzFhS8m
	 SDiUAv5D4adKQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Sun,  2 Aug 2026 13:12:24 +0100
Message-ID: <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> sve_init_header_from_task() takes header as a pointer, so for the
> inactive mode
> 
> 	header->size = sizeof(header);
> 
> stores 8 rather than sizeof(struct user_sve_header), which is 16.
> Userspace sees an impossible size smaller than the header it
> describes.
> 
> [...]

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
      https://git.kernel.org/arm64/c/bd290e7fc245

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
