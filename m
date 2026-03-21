Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF1286415;
	Sat, 21 Mar 2026 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774070427; cv=none; b=oWpMndXMF+UwTl89+J9clk9CU/zrA1i6p7kgx7HblSnaZc/YGwo7leT3SHSsCYO0OIUqLhGH49ETnclE4owX3j0VDtfnTkJN4J7RgBFcd7wgtD0IaXg5KO4MOVDw1sn+Ndt9nqdaAHGEdPjWyJuru/2PyHlBEbCBf7rLQ0qgWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774070427; c=relaxed/simple;
	bh=AgNhP8YlvpxDri8kLMZnKIYSzwh6Atbnsw047hhQ7kQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mf6G7le1Ymek9vRJ6mer06BD/DMkwLUo20cyp/wcVtSBRyyoFcp0vX7kGzV5z2Dj3FGVB86Uhg8SDQ3zBGlPqLaAnKJQbVZAZItGqp4GNdT3bx67sW9XChVRfGBXBFvVGow9C+dLf0P/PUW+dEWMLbr4SCJgdL/LA9qSD0YHWYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhS7mv5r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhS7mv5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9796C19421;
	Sat, 21 Mar 2026 05:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774070426;
	bh=AgNhP8YlvpxDri8kLMZnKIYSzwh6Atbnsw047hhQ7kQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LhS7mv5r4EsagSdYSn3Pf/WkCaES9YPpujqBaf2B+QNzzMkP/xmJP8SYS2rx2PADA
	 rgbuzZ4pXPJI3WOg9PlCSR/XXaoNLIOrPz4p3ty31MAXD9vXI3LpTLLAZeb31h4mQO
	 AqxhTrSwHAXDJmwByQFIEHWnfh9mnCtR3HJPcSx7Hto4l6HxiU6ELTkWyCB4JoQjja
	 DC90d1RrrdiO9YidUKYJRVovVKYc0DtFRJaqY4M9RR2nF1pl5lUsRLgjUS3oSCXkEF
	 /26DngztyXazzavTKdap3oXHFDT6L/Vmxn+TqCojfO/QAoiSStrsOlNTeI7zbN9I2n
	 2UOzgohjrRBzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DBC3808200;
	Sat, 21 Mar 2026 05:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177407041680.2771302.15564937503592221226.git-patchwork-notify@kernel.org>
Date: Sat, 21 Mar 2026 05:20:16 +0000
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, geomatsi@gmail.com, andybnac@gmail.com,
 debug@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 18:52:09 -0700 you wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] selftests: riscv: Add definition of BIT() macro
    https://git.kernel.org/riscv/c/e93c2978c9db
  - [v2,2/4] selftests: riscv: Add braces around EXPECT_EQ()
    (no matching commit)
  - [v2,3/4] riscv: ptrace: Fix BIT() compilation issues
    https://git.kernel.org/riscv/c/b1b59c40962e
  - [v2,4/4] selftests: riscv: Add license to cfi selftest
    https://git.kernel.org/riscv/c/5ccc568075c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


