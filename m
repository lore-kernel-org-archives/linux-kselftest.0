Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6D3264DA;
	Sat,  5 Sep 2026 01:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573074; cv=none; b=UfR2FQ+gNebbmgwTedUJ2c9+06JSevaEgpVIcIAoxXDmC38hbzLrOo6WgYyOuduDw2zjitsBBVf4O/4TdGdfDgW7G1BcCtxb3fBZVYw0BLNPyk7GJCPpJ/Qc0oDT1ffjt7ysvJHSriJ+CE2i4JD53jjacM5Rpv8p/6jdaFqLIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573074; c=relaxed/simple;
	bh=mwpkj3/GMv3ySndeOfBIDi24Unpsgx4ckWqGrNkE4M4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E57PHi0Rgk/Kq7AJ5RjiNcP0eQvQwb+zpI3Ug+H7jcmsVZV0+qzrbx270teAMDMbTeu/ipGIXn3bgpHldOy37ugRUCZlVyNX83dPAGX+io2tz5OqvjOERkBhKFIRnWR3nkjeZfWnNrasUJUW2FL3853SD2Ez20qH8XUw/SV0bkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7uPtDoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7uPtDoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7901F00A3E;
	Sat,  5 Sep 2026 01:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788573073;
	bh=jlf1enwXBUHsrayAt+CgDCkNY9jVlomm/q+1iI+3jTk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=h7uPtDoLS3gix+I4EgoW0qK4qNWD9rZuwyjVYGymmi3ExEGF1qb5p1JlGzNCdugB4
	 CSdSNflOIl5QAcCgILj0kSrxkJdqIbCRi6b/Q+9YRrpG3nJ3+Fi53I0pOJa6Iv4b75
	 JNamrhZa2Ds5UdtB2zPjbDAtpg3vaOWQ5badB/QGbSewXjY4q+YfefN59o9aWManWN
	 zeTd7NTQMVSXZPlqZZROEoBgVKEQEx6DuB444FzG4+TAKqaIPJMAveDFfPDVftgia2
	 fmqfU2uEwRioW63y0x67cy3Xr+ElNQuR8Ydc3eUzA6N50ysEo20T0HJimtX/PB3+9O
	 HlJD4A/GdrMEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F199D3924FC0;
	Sat,  5 Sep 2026 01:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests/net: Fix flaky bind_wildcard due to
 ephemeral port race
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178857301364.1055020.6064019956181481197.git-patchwork-notify@kernel.org>
Date: Sat, 05 Sep 2026 01:50:13 +0000
References: 
 <20260901-selftests-net-bind_wildcard_race-v1-1-880ddc7ed62e@marliere.net>
In-Reply-To: 
 <20260901-selftests-net-bind_wildcard_race-v1-1-880ddc7ed62e@marliere.net>
To: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29_=3Cricardo=40marliere=2Enet?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 01 Sep 2026 08:31:58 -0300 you wrote:
> bind_wildcard picks an ephemeral port by binding fd[0] with port 0, reads
> it back with getsockname(), and then reuses that exact port number for the
> other addresses/families in fd[1..7]. This all happens in the default
> network namespace, so unrelated processes on the same host are drawing from
> the very same ephemeral port range (net.ipv4.ip_local_port_range) at the
> same time.
> 
> [...]

Here is the summary with links:
  - [net] selftests/net: Fix flaky bind_wildcard due to ephemeral port race
    https://git.kernel.org/netdev/net-next/c/b910d4220d42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


