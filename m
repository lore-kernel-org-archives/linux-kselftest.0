Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292738;
	b=RwAUd5wjmLhj2M4r/b57sVYU+9rwOAz+TLOBDHPMXzjNI1BsWCCkapwLXy41QrDiyAQ9
	 tVBclF1DqhLJR7EWzCBvgQZSm5JrgXs0iqFDFLiRl4y+sSvV+OtwIXkthBWU++zvujYXc
	 VgQ+XrjPoSQGdYv5FxunR2czbY6W8jCiopcdQ8wVYI2yS3OrIRYFkJh2tTwZCBlC4fu4i
	 KAoWLojHFOoMasGmgvzk9xI5vTmdEFDdbtGsK4p40IPa1Tp1QSzqFeeEv1Nv6asY5UGc8
	 ln301/oioh/VPKl4XbAdkykghW3vqEZGqR2CuyEGgvpsSB0+D7HAw819GC6K1UaWWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
	b=pY8X2anXykukRRwwXZ66YIb0KcXAGMrEZVqBWWygTDLJGWQddqhvay8KNVvF2rDjaOh8
	 wwZKoldK2NagxnCVu2cga7WLeCgUQITFI1V383xB8PRlLNw9fc7H1DPNxb0S9IpJwifK/
	 QSPOH9d9dGSkSrAOyTEWqRh1MnWJfywDnUGMGUpR/h20aMS62IHFK3fvRPqDcmRa18t33
	 NingsuWri8adCuvsWNuxNqBnOpnFyUW5uVnU+x0+epcnW0f/e5ncead6bP0QuLXV7D6Bb
	 7kTCWQn+ajHy63favx3GiqjdhqfzsTIrlQUYiLrZ+3V4NHzkDeb6K/4SywtSP6CCPzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUjbyjdq;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2335606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2335606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUjbyjdq
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdba239d0easo1780244a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 22:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794292737; x=1794897537; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
        b=lUjbyjdq0Cdy/5hmHfWdhJaKgFI7fDoSFMrmNdT1apdPUGgqHYEJPpK602EQgZubA8
         lI5KHZU8Baq2CSU7na/Plt9wQEnHzajJ1QzZlUEi34qjWkKzxqExnCpGW0YHA4AljIvg
         wX3ZtrFSbSGq46i6xgqbhdxIyzwP6i0o2Mw3d4DdZsOqIw57bS5eVSo2GbBKFCFgEcdK
         AlvrGGoqmqcR3R0LDxkFNvbnlEIpdT9im9A37TihAhOjc5WTrd65PRbnrZvdM8WZvVGB
         +aqz47nKcu3/P9gsdfAhMVxiY4EN1qK+NBbQF1ahO+m2wUwYjqZVDjvBR0ZGLTNAl49+
         mNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292737; x=1794897537;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
        b=GuGf1zwhm3+usnB2nCRJJ+kfwQg/4CW7h6oOQqAk8bVlEgs0+4sGYKHj26/kKSvx2O
         v/M/IhBrCZIZx+GC4u9lLk+aF+Y6If3bs5LOCavq+MfJF00dZFbUCHNcdfZIAlEYo67j
         I/uaZIZQVFWzLawS2H4puw/3Aqns62R49Q7DcsaJBxZaSD/cltaQde948CSyoCmIlfB7
         Zl+CWMbbkR8BAMm9x16su/ZB7QRDLvBb/1OV3/0hqHCJjsOPEPTsUgRJcgGbMb93n+ss
         /aV07sDHFdwPrS1aB/5JPTJjxy4Hxh8OyILdjehr2HvYDyVo0M3gPMIUIOEEcUV0PEIH
         AOxw==
X-Forwarded-Encrypted: i=1; AL+hErFhKmFyk09z5YC4yws7PF1phtVBciIl7yj3azf5Tjcvosq5GuIjgazaB+i/Q2HHS/MOMr3OqvQZBgr40/CK3Ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u0eJ6DDEaGbAk7ioUKc1r/1T06ZuQ1DTyW25uy/a+NAccbwt3
	NXr/aOu78IUejNII4ij+JUzQrwrJUtUSzhfLsBXX2kb5ndagNzmU89GHjIuIgSubWr13RquTrmE
	7o9dZ4Q==
X-Received: from pjsd12.prod.google.com ([2002:a17:90a:bf8c:b0:3b0:994b:db90])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3889:b0:3ac:3e42:60a2
 with SMTP id 98e67ed59e1d1-3b166cebaa7mr2018376a91.33.1794292736895; Mon, 09
 Nov 2026 22:38:56 -0800 (PST)
Date: Tue, 10 Nov 2026 06:38:56 +0000
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
Message-ID: <avK7nGo4aGxJ7QiU@google.com>
Subject: Re: [PATCH net 0/4] af_unix: Fix inq_len and scm_stat.nr_fds
 accounting leaks
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jann Horn <jannh@google.com>, Kirill Tkhai <tkhai@ya.ru>, 
	apais@microsoft.com, rlmenge@gmail.com, hargar@linux.microsoft.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 06 Nov 2026 05:19:01 +0000, Siddharth Chintamaneni wrote:
> This series fixes receive-queue accounting leaks of u->inq_len and
> u->scm_stat.nr_fds in AF_UNIX sockets, along with selftests:
> 
> - Patch 1 fixes a u->inq_len leak in manage_oob() when an unconsumed
>   out-of-band (MSG_OOB) skb is skipped and dropped during a normal read.
> - Patch 2 fixes u->scm_stat.nr_fds leaks when an OOB skb is skipped or
>   freed in manage_oob(), unix_stream_recv_urg(), and
>   unix_stream_read_skb().
> - Patch 3 fixes a u->scm_stat.nr_fds leak in unix_dgram_disconnected()
>   when purging queued skbs from sk->sk_receive_queue on disconnect.
> - Patch 4 adds SIOCINQ and scm_fds (/proc/self/fdinfo/<fd>) checks to
>   the msg_oob and scm_rights selftests.

I planed to drop MSG_OOB support in this cycle.

Could you repost without OOB changes ?


> 
> Siddharth Chintamaneni (4):
>   af_unix: Fix inq_len leak when skipping unread OOB skb.
>   af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
>   af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
>   selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram
>     disconnect.
> 
>  net/unix/af_unix.c                            |  69 ++++++-----
>  tools/testing/selftests/net/af_unix/msg_oob.c |  12 +-
>  .../selftests/net/af_unix/scm_rights.c        | 108 ++++++++++++++++++
>  3 files changed, 161 insertions(+), 28 deletions(-)
> 
> -- 
> 2.43.0
> 
