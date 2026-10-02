Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6751599F;
	Fri,  2 Oct 2026 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971813; cv=none; b=aDxVne/ZEUtHbVG/4mqbG+0iSlNPm2F1d1c7DQ64PV/cl2WoAMBotPH4EsjB8tjB2FC3FCwn5vDJINze2ifeefXXrReNJe3CF+6yglVtQbPFI8voie6DzqU4JFGNXV6a9qC6BuV1QGjpmjkkW4GWhfWpwT578JONdCaYJaeJ38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971813; c=relaxed/simple;
	bh=hmVLROLewCpFa2mqL5M6eEVkfFD0AxOmmbwMQ+rTQ14=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fao5XotKfLG8g3Ny/tcj1H5DZ2yv3iJ0kmkZUiQB4JmnqVgvn+oktubv4TfvXAx84ZxDLURg4w4bnTBSutQ2eCbdugutg0oG8eIap5SE6YjNQmro86RNd4o0Lz4E6ijPZsgVT1M6wv35jwtxj61+XDWcsdYjPw7n7SjDZyyUKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apOCBILJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apOCBILJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810201F000FF;
	Fri,  2 Oct 2026 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790971811;
	bh=2ESefGPY0PLs8kprDTGDaka1qxHCM4PoqX1pvQTnQpA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=apOCBILJh32CYf7rftHJsx4DUqeV+2wRFilnC6f7RFWcDwpVqOBmzgPIDX6Qb/+Wj
	 oTdIgyIAFqEF484aQ8AsbODcyeSUBzhPs2qhYg5/1ZarQ+HN7Mj/tOphD3EJwhKyZM
	 Q1POw+vfU4TvCMk24kUmQJFZ4D/8BoMkwA2pNnAwjN8wUsBlKZZpm9lnbsKL0WTVBr
	 +u6tKS99oX1XLfSKA4+8DxgU97Y8ZXDRufcOZhpq6hLZwSDyF3CrkrxQcpXqqSWPNi
	 tjlW78E2HUr0q4c1qUJRnW+HdIcl2Mh0NDT6ooS7t8Juqc+/iDHlhojAOplTT2hh0O
	 Pd7AZIpjikZvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77B003811A72;
	Fri,  2 Oct 2026 20:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: fib_tests: use per-test return
 value in subtests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179097181003.3568371.7327249691788681314.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 20:10:10 +0000
References: <20260930-self_fib_tests-v2-1-3053e649d341@kylinos.cn>
In-Reply-To: <20260930-self_fib_tests-v2-1-3053e649d341@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, idosch@mellanox.com, dsahern@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Sep 2026 10:06:24 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> fib_tests mixes use of $ret for both per-test return value and global exit
> code. If an earlier subtest fails and a later function sets ret=0, the
> script will exit with status 0 even though [FAIL] lines were printed.
> 
> Use RET as the per-test return value, as already defined in lib.sh. The
> exit code ret will only be set in log_test().
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: fib_tests: use per-test return value in subtests
    https://git.kernel.org/netdev/net-next/c/4841fb8f557d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


