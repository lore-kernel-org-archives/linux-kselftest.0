Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBE344D82;
	Thu, 22 Jan 2026 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101206; cv=none; b=i3cQ5wIRvlYpLIvpiPt2UiTPF9K4DXH7cp2ZfjOfxUeGbMXRwInuGKTQXP0t6qpO45yxh+kmE8KQEUNlV9dal34iZNJH4d4MznxrDWfFvvLDJEuZdgR8oBe6h6VdTHA6tFFllIc1T8CPFls2sXRSM2EreK4b3o47KmKPEjTKpZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101206; c=relaxed/simple;
	bh=p2U71IBNMwdMRbRUPojDVJ/6PrIbK24gx2RAKTiUKMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVfoDeirKMDRCVXAe+CrIPAiYCaCmhs1w7OL+FYvM/wyE0JpqsoAfFJAmZ7Ygi4Kh+bzOZ28zKyl41v/8RPV+e2VIA0xOOvJOmnmE5/Pa3uIs2dbHnH/jqauYK1QcVZfVvroBM3ZZvAGwq0tKvo2V2Bd8KqKgUV3fUCyUBkOL8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhQwsgXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhQwsgXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C66C116C6;
	Thu, 22 Jan 2026 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101204;
	bh=p2U71IBNMwdMRbRUPojDVJ/6PrIbK24gx2RAKTiUKMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhQwsgXIc9/1ZX1LAvCh8aGaYnxZJSOO233dLEO+B8AkFDZ9zqsw9ZZSUgOefPq+5
	 C0JUc9kd7p6Z+3qrq++YyBJuFwAHoYROx1OYRN3ZILCy2rqELNx/U/vuWTMIpD9Bfx
	 /Kbf9cAujOcgM1rwNaU/EC6HZwHSKYwh+knXhUtk2Qn2r/6Zgz41lMcmkh5hcJluIh
	 ImOD43sV4vDQNf2puB0/UY5lKFsu5jv2Wjt7za/2Mb3RgKIPOeg4jCFF/NiNb4XJOf
	 1Q1bRrpSdHfeBS6aCSC9wMs6GUOjkZ4NnWNkwUSBfnCQN01XNWEox0XtMDGfXDKFWw
	 8tcpV/krKXhBA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] kselftest/arm64: Use syscall() macro over nolibc my_syscall()
Date: Thu, 22 Jan 2026 16:59:43 +0000
Message-ID: <176908087035.2055150.7814472104716413827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
References: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 17 Jan 2026 13:10:51 +0100, Thomas Weißschuh wrote:
> The my_syscall*() macros are internal implementation details of nolibc.
> Nolibc also provides the regular syscall(2), which is also a macro
> and directly expands to the correct my_syscall().
> 
> Use syscall() instead.
> 
> As a side-effect this fixes some return value checks, as my_syscall()
> returns the raw value as set by the kernel and does not set errno.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Use syscall() macro over nolibc my_syscall()
      https://git.kernel.org/arm64/c/2a369c494248

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
