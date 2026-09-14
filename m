Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCA43CE45
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382432; cv=pass; b=H7aACkXXAO1jNWRdiKR1240CgoxiitKQmC3ffUMUj+iP6K/9if+XtnCoMnV5v7FVF7lobWGlFHbPYjevTrrrX/0xEapEZ5Pznv1BEnFF5U2Z2qsNN7rJRK0CIWWsdWQT8lqzYZOSI11LSVGMrJnj5DtrZdW7plnOhnH0qr3dMSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382432; c=relaxed/simple;
	bh=uRtnttauUpfeIGypcutrfS/HLykzoQ06BKczAkGSR14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/fpNOg2q7Qp0myeq60PFQyWS+YpPXKjv7kRYEyMsimAGUEq4CB+uPtPniIYC2BROw1nFtXY6fOF0SUKNnOkf+gcw6YuvBxoGklhRDRZOloZRSqpPSvFE4tbbJiiW+7gNSdDjehlmI8P2tjqONc45KP48DsfJ/T8Uhwr88SRZH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYkCx/gS; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYkCx/gS"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca2eso22669361cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 03:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382428; cv=none;
        d=google.com; s=arc-20260327;
        b=AQeM6wX6HbHoB53AZk189COLhTUu0hXKeZS5CdfnRDxh0PA6nkBFwGWjpphwhAPqv6
         6NILlxsJWwQX5a4KSJFcjd4Wns+UU6TAVwSKRApTxduPeSBwTCrC3zdZ9Hb/LZVuCLJl
         XGRreLeMjRnv2KDXHRq2co1bpIsYk6D62/zwt068pHTw0rsLLf9x8QzZkfSySyAwzI8f
         U1gCqEJvlMrQw2gPBxljoa9Uj+xYP5BrPEJC2sZOiJrsCY2rXhApN1N9X4E3PILcu/bp
         O6NXrLBlYAzZjXH1vpoVjq38KQ6nZ93cio8XLo3z7IAX9tyrKLSgyNy0Uoe42YgSJ+B9
         Q8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GAKmENrqU15QTtr2B6AdmjiozxUTftLDYrpEGIkKWIg=;
        fh=K/mCCfChsU4iIuuXUZ0al0AdgpJwtpAwKuvqKEGTGv4=;
        b=AtVq06T4esdyhgV5OEmbquo1Gi11JKeTAxtVMNb/hXdy67cqH0+q8RwmrL/JlFzf7M
         zyTP62EezVeqZehgiMkvumHYqSuhK2NTIjFJlIwAhVVRKfW267MPDODcFBGWRFMjRrTq
         M42mHYpenbu0drB/lAIQOIZxyUDdXdoOqGiUvXNS+HxKeh15OQW7oZpSgnEoE3E//1l5
         j3HMdN124AXMXEEoO4/Uwm3+Cf/wb3Du7JgzclHFMD3U5NCb064pov6Wy0SjavaT27Bn
         +ccUBqhnYWr1yl7gAbDfWcHvEeFiTJkfLpb8x5LXxi965gySOMW1QhfWZnC2a4YOLv0V
         tcNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789382428; x=1789987228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAKmENrqU15QTtr2B6AdmjiozxUTftLDYrpEGIkKWIg=;
        b=LYkCx/gS7QPVcr6ioAD7fXJwmgwVOxBSugUgtawV9OIf5SMgWXZLsTsG0o5kQQBPHl
         Bi81kAshdL8Mkpnvx2tGuj6qOEWQr/TI8xS23/lN0rsfJw82uhZ5nxkwriPjc1mh/G8Q
         zqKQhyMxxvCS+D+y6dEU24DKZGp966cQ7MBoOrXD3Vl/zzsLesa8QWKSHdmJ7bQIbsLt
         evQUHNvQ5AJqILSs4lcOBHv3Lvwzg95Z86H9y6GZj7w6n34dH6SfD6PKmydvnyHUgcSL
         2p5mzw8yrS6UJlprxi+3qyJbJp7ePvRZUu+o5NnvGaBaA6kJD0YRB1iF5kL3pyP31U+Q
         WqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382428; x=1789987228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAKmENrqU15QTtr2B6AdmjiozxUTftLDYrpEGIkKWIg=;
        b=nk0c/mr/H+KFDzpidJfbCmPJhHXBqALx4LdXrvvbJdOg9fHYHo8XbPrSB6tVbd5/uq
         wmpE7/OjMjkrwgCVbUBEKMUzwfCOnBNmPhL49Ue4stGiJ/cY9h1FB5n/W5oPMWvOncTb
         2lcDUtIW8mk3zPmyZ0+MeDOa01baasc+UNhOtwN+jRZLt+SQgVx6hpI/9adUBbYrJKlA
         OBsFqcP+6VLirtwJpZLfppFGwLhmy2izzXsI/Lov5O+eg5Fwv2vPT+9b7w2ANunJHQrO
         8KcPcGTzANZz5kUxK67TzTx9ajeRETej9ZZV377OOBf2jAMt1Ir7m1irEEgCJEeSbDKO
         wr0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzo15ydY7fMruSk2ZO7s///UKWcF0y3yTXSdd1GfYv4DO8ZP+o7pt94KZGuYEGNGqSSu8Rx6CReStWz3aiJH+8=@vger.kernel.org
X-Gm-Message-State: AFuF++nrmfq/V4BcJcX+SES9VkqCp+WTCCeiEH1Wg8pNvNI6XfSWBpQx
	IGoH+o41tmUqwPJiOHLK1pTqqG5VFIBHPTrza3CmrqdEg6rozG6Xhw35Y42PHT1mXAa6D2KKhJ8
	HoT6jiQAquQ/e/c0QekE0qsLxsXL/nU7vZKnjzEgN
X-Gm-Gg: AYBFou3sjas2VP6IhTR9X3AsMqu2iXWenYinH4HY8lI+kvHiwV+ZeMNKLMh209l2/o6
	0o2P/5vtSv478Huh+A/2kgxnG5EyzQxvlyoeJ2GGFJtm+SAklSrsezj5tDxrd7TSewWfGZjYkY9
	bwTIQ2hrIauQVEcpPqXhZz41IMwltjdpg7xOoLXDHaHQ02nZnjSyk3Qhir9g9e2KCwF8uCUOa5F
	tArXOyjeO6M+1s1k9Idh5SCvUkYcdFg9v6+f3clCJ6LiDub366xWwGYCL1ys7F6g7GOoZmEAI2b
	uBVIRWD/6LL9StHDNVNlVWoc/a6pSJhJ5rn0yJ8njoLZAOPtPA4D/k2QmEeuN91NW9R4HTxcfZd
	82FeTNfIE1W5E+Bjxp3x0hSLj/p8KYbYcpjWVTw/neA+fU0UI88+wTUn4YUiebl+PmDI=
X-Received: by 2002:a05:622a:4005:b0:530:f3b2:9c8b with SMTP id
 d75a77b69052e-5310d093592mr28405701cf.48.1789382427670; Mon, 14 Sep 2026
 03:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il> <20260914090408.1435080-2-inbal.lipshtat@mail.huji.ac.il>
In-Reply-To: <20260914090408.1435080-2-inbal.lipshtat@mail.huji.ac.il>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 03:40:16 -0700
X-Gm-Features: AcwNN1XeWYhpp_YIEh50XzUKFPCtVBpqJefPYlt_FATnNskzQk5FMIx10HNP2b0
Message-ID: <CANn89iLBHj=LnPgxtm6z2iLDUt894yKcUU-wFBrD7vzvz576mw@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] tcp: exclude old ACKs from tcp fast path
To: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, amit.klein@mail.huji.ac.il, 
	Tamir Shahar <tamir.shahar1@mail.huji.ac.il>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:04=E2=80=AFAM Inbal Schussheim
<inbal.lipshtat@mail.huji.ac.il> wrote:
>
> Exclude old ACKs before SND.UNA from the tcp fast path
> as well as ACKs after SND.NXT.
>
> Such ACKs will fall through to the slow path, where tcp_ack()
> performs the appropriate validation and challenge ACK handling
> according to RFC5961 and Commit 3d501dd326fb1c7 ("tcp: do not
> accept ACK of bytes we never sent").
>
> This prevents old ACKs from being accepted
> or modifying connection state as part of the fast path before
> appropriate ACK validation is applied.
> In particular, this prevents payload carried by a segment with
> an excessively old ACK from advancing RCV.NXT before the ACK
> is rejected.
>
> Fixes: 31770e34e43d ("tcp: Revert "tcp: remove header prediction"")
> Reported-by: Amit Klein <amit.klein@mail.huji.ac.il>
> Reported-by: Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
> Reported-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>

nit: (no need for a new version)
You are the patch author, the " Reported-by: Inbal Schussheim
<inbal.lipshtat@mail.huji.ac.il>"
is redundant with Signed-off-by from the same person.

Reviewed-by: Eric Dumazet <edumazet@google.com>

> Suggested-by: Eric Dumazet <edumazet@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
> ---
>  net/ipv4/tcp_input.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index daff93d51342..03d317a58132 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6490,6 +6490,7 @@ static bool tcp_validate_incoming(struct sock *sk, =
struct sk_buff *skb,
>   *       or pure receivers (this means either the sequence number or the=
 ack
>   *       value must stay constant)
>   *     - Unexpected TCP option.
> + *     - ACK sequence number is outside [SND.UNA, SND.NXT].
>   *
>   *     When these conditions are not satisfied it drops into a standard
>   *     receive procedure patterned after RFC793 to handle all cases.
> @@ -6539,7 +6540,7 @@ void tcp_rcv_established(struct sock *sk, struct sk=
_buff *skb)
>
>         if ((tcp_flag_word(th) & TCP_HP_BITS) =3D=3D tp->pred_flags &&
>             TCP_SKB_CB(skb)->seq =3D=3D tp->rcv_nxt &&
> -           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> +           between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) =
{
>                 int tcp_header_len =3D tp->tcp_header_len;
>                 s32 delta =3D 0;
>                 int flag =3D 0;
> --
> 2.43.0
>
