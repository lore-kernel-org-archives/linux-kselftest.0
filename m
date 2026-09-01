Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862B3B9933;
	Tue,  1 Sep 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291665; cv=none; b=BK70seSQ6wdhnyDmVdZsjK9WnO52K4JQQbDZqEy45Jdp4zOQWwIBzlxIp6gUKPoP023BZK1q2ai44PKlS7dYX9hxvi+8jClDRmwudOwP72RqsRZVl8g2IQDfmfapG676WG6EOdmdpQ07hb62aZJhtnkLiJIo04jF4COeqa5IB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291665; c=relaxed/simple;
	bh=q8Rua0AnnJRBM0nX8e2AwAnB2tJU8KE40lPHqfX8ajY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A8TxCWRDg6c3eUZBhy/dk/ymXCfBKyySbSh/KDXvubDD2Id7dD0qI2JvopBJNYs43SM6/OjVgGwpip5WU0VyL+EPjfOmCMLgIUcMO7tDhs9kfqQjFSKp2C30H/5W8ffn09z2FkrH2/XS+/f7bKvz26+6wQDNy6TsPaUAsiq9ZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A66J4XVP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A66J4XVP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321C41F000E9;
	Tue,  1 Sep 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788291664;
	bh=23/MZB8wrEyX9XWKNI5R0zZXXj8aB24fAIwXwsKt05E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A66J4XVPkBjqRvMBUD2kbAsKdX96r18WsMjLBTPX/HboTYjTHHgW6pdanrolYO8jw
	 f7NZ+gjiHsFpZBOCKm4pbGtAX0q75DKObcEQH1umh4SAn9Pi4qxYLJBX9Ys6FPEpCg
	 bB79LsNWd/PrTZeNo+CWPSDuXFFxvVAR0xiNWPwYTydct0uoQk4xx8/m3Jx1cPvO19
	 tLVZ25tJk0gvcxbt24Ci7h4kRa3ta9RvlBPKleTXH6iRRE0jDjLUR0AUUd7o6zEhCz
	 FHe1L0GvJNrnWdf3k2PGSgbwnLzoyxk2sViWwJQyvtPuUhHgwAf1WLNac/K/cR5hcg
	 WniVsIEMtObaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AE539253EB;
	Tue,  1 Sep 2026 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <178829160640.1815744.5288519540181026085.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 19:40:06 +0000
References: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
In-Reply-To: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
To: JinRui <jinrui@haiwei.tech>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, alex@ghiti.fr,
 ajones@ventanamicro.com, cleger@rivosinc.com, charlie@rivosinc.com,
 samuel.holland@sifive.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 11 Aug 2026 08:15:13 +0000 you wrote:
> The RISC-V ISA manual specifies that Zfh implies Zfhmin, a normative
> rule clarified in
> https://github.com/riscv/riscv-isa-manual/pull/3070. Zvfh likewise
> implies Zvfhmin, as stated by the vector extension specification.
> 
> The kernel currently reports ZFH and ZFHMIN (and ZVFH and ZVFHMIN) as
> independent hwprobe bits derived only from what the device tree
> declares. Platforms that declare just "zfh" (Zfh being a superset that
> already contains all Zfhmin instructions) therefore report
> RISCV_HWPROBE_EXT_ZFHMIN=0, which breaks userspace RVA23 conformance
> checks (e.g. snapd installing core26 on riscv64).
> 
> [...]

Here is the summary with links:
  - riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
    https://git.kernel.org/riscv/c/2dc1f8d0a5fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


