Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789807;
	b=d9QRRMa77/sh4EhGTu6xMY5Js2MLWtWEOImGLS8jDgCpOkixq5wzjnZ6D/VwqUvYkxbM
	 yW6np8JYPeIqmsnXfMm6HUQwJWKnog9tZZnjhQK73X3xrLxpxi6UExjoyZyNacyTuEgmt
	 HtwZyGQ3gqLJMTT8HhiQr6GOkznfY+QAcRtO9KGeWVCmZQRsHsYawQRa+e/2WxDzgF1tm
	 KJcBjf1UQEvn2+QLkMeU2BDy1fVDtI7grj6eo0lEHQogxhABB/Jm+dqwHfphf3FhHwN+d
	 C0E6/bf+sSecKzNTsB0SgxmJJSdwcIpYG22IZe0KTiyoWDT7FyGFGEDUnKZbZ5pBI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=hTEhseTLH7HIhksF18xyE38vjWMf35frnF21UfwVqGE=;
	b=LtbgnT8S5YE6BNVsRIoE2bcHEs/gDmw1bKUjCUryYSSYR3pcsgROmPaoO13XmoToKIGI
	 C2xwdp5Obc7cBbcib8C9EKXmVhRQa6DK3h4lLGlGV/L4eC3XPH6sHEXfT5e+9lsQ+rlOh
	 JtE5cQP2lyGiR6mU0pzB6bNc47RVLYLyA/OroIxdSBANHtbzRDomJgS2nRivs3Osb7Kkw
	 lr0DaRljZl0oQN5rOfCuuaaNHRyF0WQ0AewNVtNlHhzpBfrdAPfqnrm2ngunajgFRjWjI
	 stXeEk+I+HAnbLkIM3tDvyfaqHbQrivWnJ8Dqdl4weBTywz7P+YfbRtcrdAQM80TI3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1BQ3sPg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E8606A31B;
	Fri, 23 Oct 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1BQ3sPg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5488B1F01825;
	Fri, 23 Oct 2026 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789806;
	bh=hTEhseTLH7HIhksF18xyE38vjWMf35frnF21UfwVqGE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A1BQ3sPguMRmn369LTM6GD9Dns8bi7n3k9S0dN3chfx4SShfFJDICqvfs8syG0O72
	 XLs0pRNo78IAnsrw6swJ4UipJAxUuXv3oW/eLHTeE41+gVs9ikn7yvDk3lj97IGq+n
	 iL6y1ewN6FW8IEbWJuQfInrs3V3uMMGTsz8sRpheVlgmQlyEep43Zg+btU3Az2/per
	 9k2Obq1wWylDSQHpar5NvMSMkpvJ59YkrHiKMnzJAidmHssUtuig/29kVvk6gHR4q+
	 7mto9tz10dxqX6QqUKVlH+ctmfGuE8tO1G28r44wWdMlJGFWGMExvL8fjF0cbEwsEG
	 /MLoe7AiQkTTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 445C2391B157;
	Fri, 23 Oct 2026 21:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: gro: remove unused variable total_data
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179278980508.1272863.2218189663922008581.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 21:10:05 +0000
References: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
In-Reply-To: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, willemb@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 22 Oct 2026 11:09:35 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> I hit a build warning when building the net selftests.
> 
>   gro.c: In function 'check_capacity_pkts':                                                                                                                                                                                     gro.c:1249:13: warning: variable 'total_data' set but not used [-Wunused-but-set-variable=]
>    1249 |         int total_data = 0;
>         |             ^~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [net] selftests: gro: remove unused variable total_data
    https://git.kernel.org/netdev/net/c/86537a8fb247

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


