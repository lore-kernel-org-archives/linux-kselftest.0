Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CE2F361E;
	Fri,  2 Oct 2026 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901621; cv=none; b=nWB17z5VqWBefli5M/5Q4PDwxIoOdsGRLSDxM15Ri1uBbEYwMB6o/WGa9/NNuVOoARHvSVwtnNd4PFGvR4wJKj4/Ak5x2C+IMvdELLjslTklPh55O4dV9n8O5F8WNfIOiC+H71hG9GiL8WeWSo59dIYlmXMBf5GiKaJ52Dpkr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901621; c=relaxed/simple;
	bh=bvxSfzJ1Do6DP2fV4Uv3RtwyxARHGg3VSfADEHsFvPA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eyIY7OVdJQAKCAaOHYPBHu6E0hQt6z5mOx1oOKklTploxlIV4YmayZBnozPbA/cOCCgb2MlXcr76vlAw/R0O3SDuZyfFeM8YN2lH+tOpG6W5rnRp54pzMhJhixQm9a5TeEWcEMQbP/gyxR22f8SjPg7d6LLB7D4OfGTahVINZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7jxFMqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7jxFMqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0629D1F000FF;
	Fri,  2 Oct 2026 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790901610;
	bh=TRPS9y/D6Tp/goluC2H5KUikxeiVKybRcoa8yCPc+B0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=k7jxFMqcFHZmUEe3kfk6CwtkjRCtDc8aTTsqIvAdUeK0AGdOXEzsZVRInQdsxYe0u
	 yoKVrFrie6e7M+1/hcKBM2lv9X2wiZEdOaiIx+fx74vaXBSI4keQ6fJwkA55qZIP8H
	 3Jd93XyU+G9t2Eo0OZ5flkGv4AH2oYIpx2L8ve0c/eZ4CZDwTwzu/4vHzGXL0a8sZV
	 xkpVmyFNylWqrbDbqKdyFRFBYK/l4uoPanvWA4+srQS7lYkSysKOqgBLStTBv/gqNs
	 W1brKcmSrwcas+WlUfjYFZ7MA/MYSbGN1Id7sonVg1m7a4cPSuOxoh+TkLqLhTlxpc
	 hEHyBgocAss1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F152E381197C;
	Fri,  2 Oct 2026 00:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6] selftests: net: move log_test to lib file and
 remove duplicate code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179090160852.3158777.16183907324374057117.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 00:40:08 +0000
References: <20260929-self_log_test-v6-1-41199262e50b@kylinos.cn>
In-Reply-To: <20260929-self_log_test-v6-1-41199262e50b@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, andrea.mayer@uniroma2.it, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Sep 2026 10:06:40 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Many test scripts under tools/testing/selftests/net/ each define their
> own log_test() function with near-identical logic for comparing a return
> code against an expected value and printing OK/FAIL. Add a shared
> log_test_expected() to lib.sh so we can replace each local definitions.
> 
> [...]

Here is the summary with links:
  - [net-next,v6] selftests: net: move log_test to lib file and remove duplicate code
    https://git.kernel.org/netdev/net-next/c/ffa16b43078a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


