Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F1256C84
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048445; cv=pass; b=NrP0pggW1Z4QaV/6qZsSnEFoWLRvWbwjQUDstYy+Xe/kU0vcY4kuhA1Zb5/mtD4ny+cwbLvNjhCT0QSLCE3+/UkGYpBWyHh0VhJQX817GyPyjFl/9OY4ayIiCnV08kNCg43MN4X2jultsZxkGA+tUUIeBPyfuLEcaCZVoVcxk+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048445; c=relaxed/simple;
	bh=KRg67KYop4N0GYuq1ulIbzn25MYTnK5W2894J9F0VtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+t0uA+g3iiLhMaF7c10TK4mCmsmSL0r05ArI00ygh3+BaaW5yTgyXigOij6tsXhF+lisIc1JyBcfUG8V2trIEVjkolOhdV8KdOxBtSNZ1tg3aJry4OuTRB7FqKVGv+msijVA13cWTGMK1AK426pSiwxaBbYxrndc8WO+Z4QVDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rhpMDkGt; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rhpMDkGt"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5091d71aa11so5585001cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 02:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773048443; cv=none;
        d=google.com; s=arc-20240605;
        b=gTwpOuoTSgnyTiWll5+meq+PbX3JSNIkhxSG7ehpUzbcb9RR1BFsQH7EOHunDI2LbF
         PXl8zs50L3Md6Eb6UNvxzBhg9hS89oyv5s7HfV4A+lPoDAJy8k1S0Ry0++puZ4ZJLotm
         50H4XY1sk4Yrqbml4OFGGcyY5bshuFLcwLy74Uy1jqJp53ailHZJQczemAbUCMbzUUHb
         QdQvZB42akbpBPhv8AMn6dv06EWXrTwbVt7pT/zugK6C7+GshQF2GkVvC0K33WE/rnyF
         pn/EPqX3or530NtCiNTqxkb+5H3RZ8oz+IdtkRfYsv0oewVjIckK4CBz9Ez2BNS8GkqC
         BDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        fh=10+pFYcy0fCU8w3lEdqmuJBnTBDvbsbJAdH2UEF6cDY=;
        b=dMvUQtxuO8dBBmzI7Eb4GoN9e4XJMOb3cS4tgOjBV+ARHPeHSjGUfMUx6Ok+LaIdqz
         y1YuWeC59InZP0TIDtZKV6NRIfAz09bhm5qq3bHOY7G53SM8QLx6AISimL6IC4+ucVya
         Xn9V/5KY1Zt8nu+le86KQGalhNgDaoKPETfb4XAlR4M4fucXsH0QiX1dv6Ux5Imm44pY
         LClvFUBIOhUy8RRHhgkyva1YO+BOdqoEe9rb5XaYMD6JopaUglHiGOIBxo36Vau1S1QZ
         4b5vhQkPC+duCmByM+1H1h8qEpAsui5nABieuQ59API42KwkOJPNGVqqRXujI1Nit/NS
         zadA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773048443; x=1773653243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        b=rhpMDkGtGMIEmlnLkfDw2oXrfvhd4gXZfyDb7vS/fo19/8788aB0Xku9llKzqY01+S
         5uM39fHj1fLAansQoDXAxWhMsyYZvJuTli/jcZWgTWhuvXRWeAP7hOJfQryBVsVM/CGu
         XDgsPXWJJLUWxjLZjwx1+FOKJpYmwBCmIelJSsD0IhjVtsUmhyjzLERvX4l19CdW+eEo
         SiJ45CxLYR4GAjM5TX7qZRQwTDi35l/6Aer6Bs2SZhPC2HtS7NX3uM1k+USHB/fGnPLd
         RQg56VDtvn4d2PpeTA7GUqbdPc8t6c9H/ep1ChuXl1TaW0tWNEQ0kzJZM2mYzmDuXLzI
         ksKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048443; x=1773653243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V689RnMNCiq5v9NKZp9UJyJzDdaI4f7fA+TJBBF1pOI=;
        b=Vnz8N/UY/rYTrN9+OzygjVtFYDorxzbJ2udzr9Z+dNaHb5y0C1bsaP//Fq+W1d8TT5
         Kmw618TMl4+fqPLShmvCZaKXRVX3zScxj2Bo9Zcb7pJd/k6Op3L++9+PT6hOePp0/6N5
         5UOWpBkszP+khSqIFZ2pP1nz/DcUI0A5ZhipXsrXqe9zZXcPJ108oPClvTw3fR+jqHAp
         sQSCSXmRXPBu6OhqgkQLCEAC9ecxUk+W1rLsXa/wMYZQct94gV3DIMPZiJtgZr6ee29d
         gnJAR/7BSaxsQ4jajAVOBFYLivLfdlo5r3Qq4eon/olsRJAElAomBxEveS+4kNzD+KRv
         lipQ==
X-Forwarded-Encrypted: i=1; AJvYcCW50yOWLw7PSvAMG7iqdtSd24IYUydh5MA6g3pjFYBp/yOXbcVOyaMHlIFMFjm7hfGChL598/XjkcvD6BfvhcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LBnxDVl78h303F5z13T3K/9d7E50q+fr/1jT6T0znnDdBATg
	3agjTqXTWkGXmOq3YgH1HZjvnWj5LdF+FufFEozXtOejhNRePt5WQzBk9s2ZeP45NhnCr6VYOcn
	fLF2UFEXKYaObqpoOI8dMYAZQwOJWBRM+DlGoSum+
X-Gm-Gg: ATEYQzz1OwK8Z/0rnu397oLWEL57Q/F5568ZEOrXvcoZO405n2PsGnXf55yjBC9fpG/
	zw1D2GxuZwcwz1rTRtOJFx0lCZck6XAz8iBE5hyVSG9Y0iKhZDC0nPE6xAPAIHw+n+okIt18JRB
	/nUmtcthI+QjKEkpoTyT39hrVdq7po1G11GV2ZgEpGzRMwko1YGK7bvHhzT2PKy6pNRwDAzW2nt
	aBvue1FvAg5+VwO17aOFXYUfcyRWOILeTiA6EEmM5QRDHtDZQ/wgClCSAmnBpn805lilp/yiJcq
	GnTPzV0=
X-Received: by 2002:a05:622a:211:b0:506:1e25:c0d3 with SMTP id
 d75a77b69052e-508f4b39629mr125560661cf.30.1773048442380; Mon, 09 Mar 2026
 02:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-3-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-3-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 10:27:11 +0100
X-Gm-Features: AaiRm52XfGKozvuZyB36ujKchA9srFaJs8-SNxpJxUZoRWouiMvaeYGJTNLDzWM
Message-ID: <CANn89iLzOhZ_DbAQytwZrzoZ6cvkkvLPbvUF81k1C2tBYRSFDg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/6] tcp: increase LINUX_MIB_BEYOND_WINDOW for SKB_DROP_REASON_TCP_OVERWINDOW
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Since commit 9ca48d616ed7 ("tcp: do not accept packets beyond
> window"), the path leading to SKB_DROP_REASON_TCP_OVERWINDOW in
> tcp_data_queue() is probably dead. However, it can be reached now when
> tcp_max_receive_window() is larger than tcp_receive_window(). In that
> case, increment LINUX_MIB_BEYOND_WINDOW as done in tcp_sequence().
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 2e1b237608150c2e9c9baf73cf047ed0823ca555..e6b2f4be7723db14acf2ae528=
df17b6d106b9da9 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5678,6 +5678,7 @@ static void tcp_data_queue(struct sock *sk, struct =
sk_buff *skb)
>         if (!before(TCP_SKB_CB(skb)->seq,
>                     tp->rcv_nxt + tcp_receive_window(tp))) {
>                 reason =3D SKB_DROP_REASON_TCP_OVERWINDOW;
> +               NET_INC_STATS(sock_net(sk), LINUX_MIB_BEYOND_WINDOW);
>                 goto out_of_window;
>         }

Reviewed-by: Eric Dumazet <edumazet@google.com>
