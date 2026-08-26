Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628804570CF
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757634; cv=pass; b=ELjs5NdRtxMoP2l7l0RRFhpQK0ymYwIYsx/9SqopHIHAaAsjr6OmmryZKWi1J17XFkQXF9dy6mrXBtGTcKcf9kNu4mKN1X/TYc8Xhx9NDffW42DvlmY6on333aHP7J6KAxkoj+/zt9sR9ao1IYJi1Czrkm22dORiNAr0UNwpyxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757634; c=relaxed/simple;
	bh=sCZYn2GfaCakpfs73hnSx6QFjMiUhnTYTcyWSrJLlxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYRgbsz+u9bKlZwLzija1RO28UQWirk56WdqGU9a6P8IEXaD3DooR0nFjXNZIsAP66nMC1KOQCT5kqkFP4ISXyEedSktGJGrXAsvHpo8lkFFVh29AuuHI3iayRtUI+6tYGecGI2GPcOKSilPZnC+HhmeRrMXMZT9qiiTu7c4Y5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VjJQhA+d; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjJQhA+d"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-517dc520840so9473041cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 08:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787757632; cv=none;
        d=google.com; s=arc-20260327;
        b=acjZIyr82Oh9avamdD9E1DQVvcIBTTvSW5WiPdBLSc025beSirJ0zATIfIS4f7/jor
         nHTig5wJuJcOVJqutvSbLuiy5RDShdlfCzUrJqtVB3EC4FaPeDdjmztb8uTqXliIP9GE
         mwtsv+brxYve2tpCDmiJs4xC+t/Lq4Hghb7YyH/CM05Xuv8hfAk85BAjs6u1eGUWBWj+
         OpTS9TVHR4ypTpXHRRj90EFHwl5gUeI4EKRx0khqKkeao7b4c67p2IF2VOz+fea31sPg
         ShGT3K9nSWhumYm0QzS2nLqVLQUzSICEmXV3zmonj2RzgDknNNKIJZzJ4nf0q0QYBQyf
         CRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        fh=5GVWp3ma0lvoqDs5DLVouq+Rd8EG8H9Iq6Bbdr/1adw=;
        b=fDjGgGkFEX2Fuwl67XRuztXI7mHWJ5Z/kFJg8vmC5KmE59EiJdlp6UKb/tS5lvBn6o
         JT5hijBmFecimofUb08nojdoMU40Pzc5ChpoKacCv4sW2Oop7yKY79C4U4TXO/yI1Bbr
         4cOS7txFZj8jeWXgvS9chfTyEI+t6mlBW5YUH8xMIOLzy6MCXjYILQYM8NG4vV3VIkC6
         T3DXLn5OavnsfEARdid0IiAO4oBqW9+RzH/de6WbauVCovEO7ABpQMaHnboZSIPJwXBY
         O5O50Red+YZA0H0hgo4k1Go/9roJlnoPAD9fExmRInr6nUUZxF1kLidRLB+rzdRwnaYK
         aCfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787757632; x=1788362432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        b=VjJQhA+d3f5RNWfQEtO1A4AOrclo5pmaML6oorqjjVas3DDvKTdft13h1fITVXB/yx
         O2snHxywdg5KRpmLnYnYTtaeOTn5crdBVQRbazYtVlWUTz56c6fi7Za6eITV5QZ73cTL
         4Nh2AOGk4RgQyFDHTlquQ+KO9G371yaNaHfNzx6D+BSRVBfFPI/UdboKR22+70++om7R
         PutM6fkaiTtQI2HP2ufmE9plP6CdLg+80EWhnZgCboZGjssCj+XNu/guA+J2CxdmDl2N
         ClaVD5KRw0cZCqJ+cu4Ewcl2FfJe2tlb9GKoK3sUJ+t1+chD12o34GmjXemXT55inosH
         UUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757632; x=1788362432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        b=l4FfCYDxta8ZBcRczeFWGfYpvkzawJh/o/zyT2m6BlnqIA7HjKJOqiJhcGsYCLSXvt
         lc2As5V/TFRv9jGf12skxCjf36JzU+4pa6003TLD+htR47R86D5KbV0+51JQtv14zKaD
         gQSCBCX/nDvseNj5WSH4LFCUe/OqovdFSOL0MrVubE/ljqx5XjZoFrgKMrbJ4bR3G1mO
         ijIn3Z2CvojMzQRw1PMcMH0v7oIoLtf1CYrlebOHLM28pr2bLzAKWIEwka5REJTAKp6E
         h0UDQBgubViyiV8s+RmITifgSC5qeBUgdex/xk37LiI8kxSSZpcSKuTRvaJ15bc/xKu6
         q/Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrjBqx2Vn69mwwyAeJA24y3rCgmcWVsAesjU7R41zJfJO3eIqVcwIeeSSnUBbiZlUqBiZ3Wd/z15bUbtlYdVSY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJmc51CSKkEZGx5jc8nmiZYUNqZunPxZmycq67fXSXAx0SUX+C
	PgvB0OrmcJhKf9wiIMB8NO9z8lfsA1qsjTMxNxEw7IN5GoODwCGJ3nNbiaZ5Jwu0kJbzVtECqRM
	FGJo8rNsgiKbxnarX0rEY9p4C24sbTSFolq7BjbC1
X-Gm-Gg: AR+sD10wG+iSBIxevwkjbRFu5ugbLoX5rrIbu7WWulKmaI2SDnsqwKoFG9ocuxewZ/9
	x+DfiIy8APWoAlxmdLWjlVbWkucmJqr5cZgHjVN1VH6svVWlFyCJWVudu6hhGyQPuPQWi86BGKU
	hE0pBOfuRSpmftSxIRQhwLXYVi98+oOvztbHXMP6hfBRx4wG1AEYzQXt7ENyglBkigfSNao0xuC
	Qmr4+ih3qeRcabKB8U9TL72RScMJpKa66XZOmv+B3GHhsZLOdNmzELMGoQb7hp3+UCP78C4f02B
	WsY/+qbBRF7homIhGsBhsre3+FLEP5eBF7PcV2HAnQXbj4UKRGZZ89+bicCUfFanUyJUumpgrXm
	JgQX30oqnEeiSFQUNwGOKR5M0Y8x9K2O2vpOC9WMZuwjsdvxbrfy0TC0HH50=
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id
 d75a77b69052e-52e423e01d9mr75971011cf.27.1787757626391; Wed, 26 Aug 2026
 08:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826141145.67823-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260826141145.67823-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 17:20:15 +0200
X-Gm-Features: AcwNN1WQYfOEPBxc7l95bDB56B-HoAnly0oktECUAuu-7YHrmEIMuUzsrsZifHk
Message-ID: <CANn89iLWF7qg+VYcao1L_-e1vXSTCKPLw9a855Gr5+gPe_yG2Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: fix corruption of urgent data on
 multi-segment retransmit
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yuchung Cheng <ycheng@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:11=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> On the normal xmit path, while in urgent mode we refuse to build a
> multi-segment TSO packet, so every segment gets its own urg_ptr:
>
>         /* tcp_write_xmit() */
>         limit =3D mss_now;
>         if (tso_segs > 1 && !tcp_urg_mode(tp))
>                 limit =3D tcp_mss_split_point(...);
>
> The retransmit path has no such guard. __tcp_retransmit_skb() builds a
> segs > 1 skb and hands it to the GSO layer, which only advances th->seq
> per segment and copies urg_ptr verbatim:
>
>         /* __tcp_retransmit_skb() */
>         len =3D cur_mss * segs;           /* segs > 1, no urg_mode check =
*/
>         ...
>         /* tcp_gso_segment(): bumps seq only, urg_ptr is copied */
>
> urg_ptr is an offset from the segment's own seq, so a copied value points
> at a different place on each segment. The receiver rebuilds the absolute
> urgent seq as seg.seq + urg_ptr, so it walks a moving urgent point instea=
d
> of the one OOB byte:
>
>         seg1  seq 1     urg_ptr 5001 -> urgent @ 5001   (ok)
>         seg2  seq 1001  urg_ptr 5001 -> urgent @ 6001   (wrong, +MSS)
>         seg3  seq 2001  urg_ptr 5001 -> urgent @ 7001   (wrong, +2*MSS)
>
> The real OOB byte is never pointed at, so the receiver stops splicing it
> out and delivers it as normal in-band data, corrupting the stream.
>
> Guard the retransmit length like the xmit path: keep segs =3D 1 while in
> urgent mode.
>
> Fixes: 10d3be569243 ("tcp-tso: do not split TSO packets at retransmit tim=
e")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Nice!
So we had a bug for 10 years.
This is a testament to the fact that urgent mode is no longer used as
advised by RFC 6093.

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks.
