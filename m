Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BE3101C8
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297848; cv=pass; b=WlpXh0fj3zXf0z2NXXG/hhiLZ6MeMRudWpLGW2aDgAm0KfGw53yaLvn2Zze3wRz8XoU9BrJGjBe7ih2Agl4aJqKFxJfRrhVE2oyCIBGAbwYIUBna0h300QdGcwlROF14NYuPF/qdn3pq5omIMqjigdg20wFeuNpXFA8T0wgn/JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297848; c=relaxed/simple;
	bh=lBKA7hzH9pjhlzdMFfbHz9SVC1DDES4LjTgOQh6PfRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWLdtRBZjjYHrp/hdubN1+c2wlcxY4SZj2jIKvkJTvVePHFT8Tfejry8AfKaCgY09cAJ8+Asfij1gyBU7cJhsPjtpkQkZhSZ2NzyEE6aLwoZtQC8lTDfloGN9fBgap6svxqpu2bAoLxpRVdRmmu0ruYuLDl3VAfj7wiFxSPVGZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tl5pBI9m; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tl5pBI9m"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so3640731cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 17:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790297841; cv=none;
        d=google.com; s=arc-20260327;
        b=GOhYBeaFslaQ8wCJcCbBp95Q3y+w8qTvCNF+ZgIyJG38VbJeqCXfPmcqlSWx9NVBJ/
         kY55tdTa0Zm5OaFnk4BUPDv0rNSy6UYYFSs1w+nQrWnebpuAWsasX331QvW45/GSNowH
         wLpJbo3uv4Q6u7QYh/blasM56jkgz9LerlA1BeeRpaOMubYddgmoDt9HJ7ThD7G5KStP
         BLOhALev8E19CqwN8cMPvMkVZLzbjx83d1+p1SRItMzYOY156Q/DZ76r/ViYQR1HWKuo
         gM8HPWERUhJ05t2T+QKGmsQ1z0DVvTEYnmkhyOnuyNd8X12m+I/ByzMfnC4SDCwnXQ5X
         wPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        fh=hTVEeQx2J68j8eRbLpGtJIbdiUAO4DjJyWSl86+Saz8=;
        b=hssGxxTLxcSrXRU5E4ykYaei2OG6sqV67THMZV++ucRUD2nYEc/m8AqTqqk4ncIZ95
         3PnRYpiMB1Uuhbkh4d7J5ozucDWdPaERlnhGokNx0hT22og/IikIRwWuD1Q+x37XqEcu
         Pm5elpRLtrtwygQDKl1DV2as0QKH90tVSB7r8hHl7fif0imA+XVO7DMrEsxe5NQc3Uza
         lBvEJaMi4MEq4MrxZ+IZrn09N7holHa0UapHZWJiO1rCiWD3AU442dlZaA3DeT3BOk9+
         luXuN83NVQQtaw/R5PzM+alNMny7J2safLJjqyUPdrYhd+GXHbGK0KF7YESFWQnnYHkI
         cDSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790297841; x=1790902641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        b=tl5pBI9myxJmXgJ3UpcupUmaHIvZ+JCD46NF0/GP/PkdSPuIx9h7SYiTJitKQtj6d/
         vB6vCUVUmj4E6RljHfN5x44zbL+y1Gyn9138uvrK0yW5Rs7rDcZIOtK10CXKh7wdwmvl
         GxGH5hLoPRk6PkecEj203vMAxFWIG5WV/RLoyVcDvPjRSEBl/Eiv2aCKrU0e+WBOWxlg
         c71kx4LsHyRPm+a3RE/RY3WHtXk5gRQPEyEEKH6mF+sQVGkesdZ0hm9R22wF+g7zcymp
         YQyyiS4m+BRyq09anP0UG2y0+1/eiYzxj/tDjOw8KgjR4/eISGMIJGxPv6BFtD3qUVaV
         Q65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790297841; x=1790902641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pyGHIFbtinRqwaj+Qg/alPqYKdXRt+R/3/nBOW/8Ig=;
        b=bL/uCdMURoKworViVji6ETJdz667jMu7eQhgNyXWPpLvBZ84ISeK4NMYCJDlrWGDUI
         +f1dC8lHmOvX3t7tJtgZuXpkSr63qafcG+hfKrjOZ3AwDfTHgVhnYQ9/w++3eI4I+GI/
         Kr4EEmWqhLmPL1sI/N+e2a4eKY/JFFVLiw0kad3Ej/PmU+1tdVOdPB8Pth58RGZA4Zk+
         UlODFH8HzUNqiVPjafzHpkMjftRIdX4mJ0X/aGlSkiDCfHi2W7jok7nRp0T0JQIiXxTv
         YmvC2mNQ7QaYsbLrVw1pliTihCr92wQw1CJtXAEhCx3/7oK3ejJeJHSuPx6wcd2czfO2
         ML3g==
X-Forwarded-Encrypted: i=1; AKwUvByYsMJk6E4M/4+8/Pvn06m8XjMDpCo5FLIIC5RPWe+UCCsFvt5PIUiF95XsIcEjZ35U1au3uXWVKH9hte855b0=@vger.kernel.org
X-Gm-Message-State: AFuF++ndMwSRqqB0OZgo43bDJ2NBtVEtwAQjtYvavm3PN6aWxe/oTmCb
	6Y8P5QhO4Q46HIgXPo0wZshHgKWOXhhLJlxb3E5auYcIDnmgX6bdWQc3/DHLJ0pbvy0FrQoOlDI
	WQINpB6fw9Am12dCLBFi8yf+JwZA5mxwmIf9tcWHEPZkqsNdIWOD7ozi8
X-Gm-Gg: AYBFou3LAy8hYdwPFPRgzLpa0nVsbcLCkCK8XLnV8WTa1F8M59BZWM0zUEbBjz9uCgS
	FJnzrLXrpNSknCm03uzZodVD73TfaH+Fi4DVNmtS/HE0qZ3CzlOMXtqrsSQsz4BDI+PszfzDezN
	4F10Dxq3XKkOE5qtGV+l4oWfIBLke/MGm3AU44wE8b7/1KGWnEte2WbD7BvwueDCeSt5kmgTAE8
	vMWv/13yf7pjgBXR7baoxj2CKsQcpVVf/U2pa+3YbJWmmV/hDVGo4fQgUDv6y0kzRYGCt7X8xhK
	KR5eDf66J8UQC3cTRsFENF8UU5STte6avTUY1iHZJHcq5jbHcsKXGeAYfdu7nRL8icVWj6aTWqh
	zW3KA+OECf13xzPWaCEEeLN1l07s2JK6//38Rj4THWBs2cLEXR2bxH8i1t7qaTyhE78bD
X-Received: by 2002:a05:622a:e318:20b0:533:1038:ad5c with SMTP id
 d75a77b69052e-5331038af84mr2905601cf.40.1790297840359; Thu, 24 Sep 2026
 17:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924224456.55690-4-jeffjo@openai.com> <20260924224456.55690-5-jeffjo@openai.com>
In-Reply-To: <20260924224456.55690-5-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Sep 2026 02:57:09 +0200
X-Gm-Features: AclHuK9i6M-UlXku212en58JsCz_7tBwqq3_4M6DEUdxB18bU5VlwiunFiLOeFk
Message-ID: <CANn89iKF+MD9TDBGb7oXjR5Nk9HgwXF3kB6KV8_3Li=qLKZ5WA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: refresh TS.Recent for accepted old ACKs
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:45=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> A TCP packet can carry new data while acknowledging traffic in the
> opposite direction. With overlapping traffic in both directions, a
> delayed packet's acknowledgment can be older than one Linux has already
> accepted, even when that packet fills a gap in the received data.
>
> Linux accepts the data, but tcp_ack() takes the old_ack path and skips
> updating TS.Recent, the timestamp saved for outgoing acknowledgments.
> The reply therefore echoes an older timestamp. If the sender uses this
> echo to measure round-trip time after a long idle period, its estimate
> includes the idle time and can reduce its sending rate.
>
> Update TS.Recent in old_ack using tcp_replace_ts_recent(), before SACK
> processing can trigger a transmission. This reuses the existing timestamp
> and sequence checks, including PAWS protection against old duplicate
> packets. ACK validation already rejects old ACKs in SYN_RECV before this
> path, so no additional state check is needed.
>
> Echoing the timestamp of the packet that fills the receive gap follows
> RFC 7323 section 4.3. In a socket reproduction with 300 seconds idle,
> controlled reordering and retransmission to exercise timestamp-based RTT
> sampling, the sender's smoothed round-trip time was 37.5 seconds without
> the fix and 15.5 ms with it.
>
> Fixes: 12fb3dd9dc3c ("tcp: call tcp_replace_ts_recent() from tcp_ack()")
> Assisted-by: LLM sparse
> Signed-off-by: Jeff Jo <jeffjo@openai.com>
> ---
>  net/ipv4/tcp_input.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..99baf14afdfd 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4465,6 +4465,12 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         return 1;
>
>  old_ack:
> +       /* An old ACK can carry new data. Update TS.Recent before SACK
> +        * processing can trigger a retransmission.
> +        */
> +       if (flag & FLAG_UPDATE_TS_RECENT)
> +               tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);
> +

Reviewed-by: Eric Dumazet <edumazet@google.com>
