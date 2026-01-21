Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552A188713;
	Wed, 21 Jan 2026 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768953839; cv=none; b=Z3N+CTFwUQo2I1uMGDtPkQUs2QfVVniamaLo+JM1/MOI+DG0ng/pbdJIQCpmZluXj6XaggHQ4AvONzsAkAzI+Swb7EQkIfw7NK04EBJvfyLIcNyJ+hul9jSR5AbHAevgXcTVWjg2L5V+A/o9MLKd/Df5lJ9tpydSYNkKNFkcUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768953839; c=relaxed/simple;
	bh=jTXGGmVSXP9JO4pkCj+wADHxihSX3tjet8cuIZrtmDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7sEclvFzUvRP3QJN8D0HfhJ/x+WaSj7r+pKtfgvorNjwvhicZhc1KFrN2uv5k36sm9pthVEJveHbrANkMGGWVKaNCTyePzDk0Ae+pspmOpot3OiSNNLtEXwkZ3vbl396CdWK1HMFI52OcT1mwzu3teH4MWPXa88Yypm/6FczSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/JpQEO0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/JpQEO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA81C16AAE;
	Wed, 21 Jan 2026 00:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768953839;
	bh=jTXGGmVSXP9JO4pkCj+wADHxihSX3tjet8cuIZrtmDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X/JpQEO0PVXm8uK8xeFikDdENKCXaFf83BM1b1kSn/liFEEvop1F6EfC77Drmxa18
	 uh6s2CKOCbeEhUZB2z2OC14hnvXwssp6yvgwQzCSohq6MqHKY17/O8RmZRQJClwlR8
	 d5q+jnd087gWLxi79ewwnlhPJHzlqd6cpWo+gGpXD3q1Utd7MJW1Y2RUweJhFS7Jw8
	 29ixGJPM8ZS7Dwy3wwjJTAhWM2p/zuyUeoyqSu9o63dxJ2Uxo+aJcA84cj4f7Jcfww
	 QsM2sPL6fc89aT6Dx8xwJkHWQVWqz0QTYSVjsRJaGsDBQtX6QEdmkAcHt5lGHtpm8G
	 jFytIR0J0Y3Tg==
Message-ID: <264104b5-ac21-415b-9021-76d4d9b79a55@kernel.org>
Date: Tue, 20 Jan 2026 17:03:58 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ipc: skip msgque test if MSG_COPY is not
 supported
To: UYeol Jo <jouyeol8739@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 richard.weiyang@gmail.com, akpm@linux-foundation.org, sef1548@gmail.com
References: <20260119112120.83592-1-jouyeol8739@gmail.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <20260119112120.83592-1-jouyeol8739@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/26 04:21, UYeol Jo wrote:
> The msgque test uses the MSG_COPY flag, which depends on
> CONFIG_CHECKPOINT_RESTORE. On kernels where this option is disabled,
> msgrcv() fails with ENOSYS.
> 
> Currently, the test reports this as a failure:
> 
> Change it to skip the test instead, as the failure is due to missing
> kernel configuration rather than a bug in the IPC subsystem.
>   # selftests: ipc: msgque
>   # not ok 1 Failed to copy IPC message: Function not implemented (38)
>   # not ok 2 Failed to dump queue: -38
> 
> After this patch, the test reports a skip instead of failure:
> 1..0 # SKIP MSG_COPY not supported

Did you happen to test this with CONFIG_CHECKPOINT_RESTORE
enabled and without?

MSG_COPY is not specific to CONFIG_CHECKPOINT_RESTORE - I see
MSG_COPY flag handling on non-CONFIG_CHECKPOINT_RESTORE code
in ipc/msg.c.

thanks,
-- Shuah
