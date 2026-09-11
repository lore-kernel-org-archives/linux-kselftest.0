Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C4C489869;
	Fri, 11 Sep 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134271; cv=none; b=pJxVJgKbXIWoUlUn6QmSDVzU0AYbfveWsBaIal/oBYknvSOXslURt4YiLQ7UFBpuyjj4TeNTyZD9B+KC9SqWANLRhRSCqwyntWbcWiG4jeT9MwV9ZQsRKrXoKZfjPk8o3uGu/Iy4eQAw6TUp6G+lTbmk+XGDRL/+mWESMzl0xg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134271; c=relaxed/simple;
	bh=84z48g7BeNIGGoxAAapwtKiCek8WHiM4r8G/HTmSWHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AL4u8YZssmzLROa0NaBrpBjivbgVuPgebmc7S7rh3QCKirKnKcbv4m3zlGI9AwG3gOQ2M9sVhO6avLljLxjvuTGg0UIjyV0P1q53MRi3VuXGbgQEiDDCUPpl4spjsoqaGolaBmEPPcmfD+LiIYbG1tV6O3XrAV1GMVAPhPUyjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzP+UXvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzP+UXvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C401F00898;
	Fri, 11 Sep 2026 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134270;
	bh=HARc2n7GY/N2x7f6bMrbNdeynxw6URCRU7fKnVfDbzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bzP+UXvxG2EhT8V8HiCrLslfuzjCQ96o7LbZhH50LxPHnZM0mX9WM89UFWzci3Gtr
	 cDgE4isxrzSMIQTaiR+/hYgAi6u9unyvYgGSg8Z+z976pJmATUH59IfUIc5sc2J1aG
	 E+lAM+HZotrtgmhUpL/AzX3gRYN+zS8KC8WGclbCe7c13SUflENJgEH5xpXGu6AdOj
	 rtq1yaBEPE0Y20E+GKBW8hVnkQ/PXQClUL9twZ21MmKhy8ONtqqWA9VB9n1CRdmdRo
	 RuPNPQBhCgfDPmsVDSUXYUSMLZlgoFRiaReDciVay/GejvV56HiAzMW9XYz2o2YA3y
	 S9pMUVpZlEAMg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Huth <thuth@redhat.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix size of thread_data values for pthread_join()
Date: Fri, 11 Sep 2026 14:44:11 +0100
Message-ID: <178913088317.2458205.17622266384307064211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909155707.161121-1-thuth@redhat.com>
References: <20260909155707.161121-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 17:57:07 +0200, Thomas Huth wrote:
> pthread_join() stores the thread's return value (a "void *", i.e.
> 8 bytes on 64 bit computers) into the address that is passed as second
> parameter. However, the entries of thread_data are only normal "int"s,
> i.e. only 4 bytes. The additional 4 bytes of the return value clobber
> whatever is adjacent on the stack, i.e. other members of the thread_data
> array (which will be re-written in the next iteration of the for-loop,
> so that nobody noticed this problem), or another other local variable
> on the stack for the last iteration. Use "intptr_t" to declare the
> thread_data array entries with the correct size.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Fix size of thread_data values for pthread_join()
      https://git.kernel.org/arm64/c/3d1ba5cbfb62

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
