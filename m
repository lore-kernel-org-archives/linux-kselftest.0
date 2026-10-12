Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564024A2E2C
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818806; cv=none; b=uk02LgYB5QmgEeUDYQbVOaDptoVftnfCCTHNIR3/7kM80aSbhGyfzHoFMJhFw99yncKWxAMzSSr/k3qt/W4JCv6VbEqgskXpJ+DXGrD0oCT4N4Dp3yo7DG8I8H8ufsU39GxUTQRtHzj8xn8GkZzTgZAbdTs3fkoEV+9fvbQgX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818806; c=relaxed/simple;
	bh=Saq0h4XHevG6Hg/27Hi4ub9YmFDCGUY9UEFqzA+pYMw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pF4z5h92roYOCBFzQDgw099k++5WhFJWsh4V6R8aJTQZTKz0z67UYLndG8xMhVQBpvL9hni6uQc/AvGj12eCuXmPU6NuNP/EhvhATej9dHuCT8y9amaYK2ECqd6B4AQhVq1FuQLu9CylJWv5AxRUS7ey67jQPwXaiyDjO9jymCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1UIKTDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1UIKTDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A077B1F0089C;
	Mon, 12 Oct 2026 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791818805;
	bh=oD9NeAHRbg96T+N0ML5mMOiRllCQ+2AR2W6jQic66FA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=D1UIKTDZ5pieeKMjlqjaGIla/C0krjDszWa3qcciJQnqDp8lDbCksVJre/RnQGNjd
	 T1/ZUk3AxRIb1aYgwx+RtNL6oKOZnZpmJcAYuXdfa8qEw4uNUoLnLGyvrrjq2EDgYZ
	 yzHjq5FkhbL9UM89kfxZrS6pRjdYnJxXhYjHM4r7D7/wUdRHDMAQsVPrQUR3Mk4r1B
	 /okACJpG+fsAdDUisB3QTOJmibBoPsWPji7Fn7NNdzU8LWAiJOI3BR2HFz5mmHhksl
	 3aUsu9gyrSSOpn9dVYXkbzl2nLJxfDZ976Jw7ZTW+Tb1Q5gibbDU/y37HQBsuDWYqQ
	 3w/R3Z8+7oRnw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id EFD6BF40066;
	Mon, 12 Oct 2026 11:26:43 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 12 Oct 2026 11:26:43 -0400
X-ME-Sender: <xms:M_zMar0EBlwm3QMbmKgbxqa-W1q_5RraVqO-l373Igwbk6G2-BKWvA>
    <xme:M_zMak6mnLb819biahNwKGXYWckvP7bn9ZBFLu8dxtQRwUR7hPRQF1xTwcjY7I31T
    7x90xbewUsa9cCytbGEeHK9eup0fr89JhqIi9H2AttIznrO26bc05IJow>
X-ME-Proxy-Cause: dmFkZTEOnW4i8X4wWC901D8Y1o9KOcazIEmT/stD4L/DlfyOxF0GACBQdDeRx6eDgNyQI3
    yshvgdYsfIacm1KxlDOAS8BqDJUmN2mF6k6sdeR3gAyweWrXhQIBXl3adS3ouMv5M8U6az
    E9Q5k6ge7GIIAFY0x7OLY1UQDSw9WyN1mq/gaKSrF6P1o57m9iFMPL/zAzz32BHXGoscXB
    naeawCkdb4jtBH9vmRiUyj98QkmvUwJenJERcUsQsKKm4pi2+e87Qac4CKPVHDUdCY/76y
    yKksX9K8fThe5AUJukG8iFUW5raJvMVcy78fQw9/usYzM8HKAwvGcLUB8JLMW4hfksHGBv
    gJOIMIYldC6lEejtQOAgfgZ5Ud4C/PfY0SJ44E1Zr898DITy5ElmpfB1cxG5wFtYmZMHBP
    1hGV1/qEMT2ZlOL7lqPSfzGnGXGUhfIfX9QtcnJV3RHZVeUsypAOd1hol8TNEqkLnWN8Dp
    bc+uJJnQXSVj1hXFwS6ffdkRN6hJ5pvnZa2oCy7LFkut4jSsG+FdTaq7Y7ZFmhggAN4XQX
    M4ms9lU5KQdCH1OgjImXQmrQ2Nu0EYYDTMdt+UQ68EuLgWTvDGErrBEsq2es4AVmSbveoS
    d/trpMeVSTSDo4wNjKQSBx94YyqtaVHzVsVK8618BrWh/LvE6rXc+y4+rD1g
X-ME-Proxy: <xmx:M_zMatp_Y2p-Vd0xwhhP_-e5sbPgeSHrnYU0s3RwAY63GC9j9AYIpA>
    <xmx:M_zMasWX3afTIewNkdoRdkYKBIrjf_I6RidsdRzGltYOrujB5htdyA>
    <xmx:M_zMauF_Psl4LubyO_6QtyrMVvdJ4f_t5loYNjhJZCfsEVs0SGGVYw>
    <xmx:M_zMajCMsnVY_bYaPFpzGovltIQmUuooNtMJWGDILPCYkPQY2Nv1_Q>
    <xmx:M_zMagwesCpH5m4kJGERkVcQwVxFbhvZwPF4M0frouF6AB8dUFOi0v95>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D621B782738; Mon, 12 Oct 2026 11:26:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A_R-6tCn933Z
Date: Mon, 12 Oct 2026 11:26:23 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <9b3ea5df-0387-4101-9c04-77396c3403e1@slotpi15m67>
In-Reply-To: <179175091986.434549.854005976353552945@kernel.org>
References: <20261007-tls-follow-on-v3-2-6d52d98389b3@kernel.org>
 <179175091986.434549.854005976353552945@kernel.org>
Subject: Re: [PATCH net-next v3 2/9] tls: Check for a pending signal after an empty
 record
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> [Severity: Medium]
>
> Should a nonblocking reader get -EAGAIN here instead of -EINTR? With
> MSG_DONTWAIT, sock_rcvtimeo(sk, true) returns 0, so sock_intr_errno(0)
> returns -EINTR. This check also runs before any !timeo test.

Yes. The v4 repost will return -EAGAIN when the receive timeout is
zero, as tls_rx_reader_acquire() does, here and in the splice check.

> [Severity: High]
>
> Does this put a limit on a run of empty records when the reader has
> copied nothing?

The patch does not claim to. The reader runs in its own syscall
context, holds only its own socket's lock, and reschedules on each
backlog flush. A budget exit from recvmsg() or splice() returns
zero, and these readers take zero as EOF, which is the bug the
series fixes. That bound belongs only in tls_sw_read_sock(),
whose callers never return to userspace. The per-call rcvtimeo
restart predates this series and applies to non-empty records too.

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
