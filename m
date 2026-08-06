Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BA3AB5DA;
	Thu,  6 Aug 2026 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979264; cv=none; b=b8Aav01xB9bvvvBClTcBmdJzP+omTZk7pvLH+51t31TMYXHgxHfadElT7CY7Qe5TuX9ly+qfiNhiJFS9HQ5uEG7GPlriqnEa7rEzcAdNOD25lYK0kwYfO8Ht9qwkaz/1/gCWhXpx86Dh1UBPyNunyNJExtutv2/Y8KuugMwbTPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979264; c=relaxed/simple;
	bh=hzXZ37MgsAame20ujr6jxgl/oSZJUJ9WsuCXP/fZeLA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NW99ulgC3og2JPOJ6Pkqpr05kQmMvpYhEVirAzQ32zVq9jpVr0GSx0tgL6w/giyIsxLwDphJ7ZxI290o22+fCUqiEkLL3RxJlMLFm9NpfoyCItdKq9jpOqZ0Y/jreKSTTi5fuYbxhUTMgld61DPcO8wszZXnoWnwaehjACFMg6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHQP/4Lz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHQP/4Lz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC771F000E9;
	Thu,  6 Aug 2026 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785979262;
	bh=X6w/Wc5fW6FcFg/rSlrF25ZDI+i7F+IAotFDqxNC9U8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fHQP/4LzjhYiaMo3lf66xMxEL90KLPh7Zi0mnK45p2LNPNHnhuQ/VPnC4+dYCbiMe
	 V5LaHOWr2Azio1IRpplg3Nd+Bogpd4uFw5264NNcjvolpmT11ElbCW3h25tOpl3pel
	 sVHqww4gjeFAbhl2IGND/mc/aIfkBZDcCQyI+fHcyVedh74RLihpUA+EDZneWSJHFt
	 75ihYrOumIdT8FipZ/jcbJPyEamAunDRhwxnjL3vNgA3CLwZlmzyPM5IGDkjdDFBXF
	 MIDAGRZe1VG3oMiWKVyEBWx9quAHXEwTEk5uiyKgdyFI0OSWPnK23Dqo8SvwOgnYYW
	 10x2W7l4r98+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A17392FFF2;
	Thu,  6 Aug 2026 01:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] ptp: reject frequency adjustments that
 overflow scaled_ppm_to_ppb()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178597922226.593652.14156851954295543924.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 01:20:22 +0000
References: <20260801222923.39017-1-deepshah146@gmail.com>
In-Reply-To: <20260801222923.39017-1-deepshah146@gmail.com>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, vadim.fedorenko@linux.dev,
 horms@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  1 Aug 2026 22:29:21 +0000 you wrote:
> ptp_clock_adjtime() validates an ADJ_FREQUENCY request by converting
> tx->freq to ppb and comparing it against ops->max_adj. On 64-bit systems
> that conversion can overflow s64 and wrap the result back into range, so
> a crafted tx->freq bypasses the check and reaches ->adjfine() unclamped.
> 
> No real user space asks for such a frequency, so this is hardening rather
> than a fix anyone is waiting on, and it is targeted at net-next with no
> Fixes tag per Jakub's feedback on v2.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
    https://git.kernel.org/netdev/net-next/c/504ef04e8674
  - [net-next,v3,2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


