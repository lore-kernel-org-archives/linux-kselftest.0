Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151E3D6CAF
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911014; cv=pass; b=dwKekUbUoUBcM7uVEIkEZ7LpGEv3UeJ+XRnv8+dcKITq1thjoo/hSFny1YY4NAuV9wei4fBCyXDFLie7hjoRo0sRzqsF8QrcyDZsKpfqQRZaXTrDkEtuoioT/ApF/qE+G8OmhWi7AYkRCfFptEPlhEbRAHLE/QbMgy00azhTPks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911014; c=relaxed/simple;
	bh=uoYIsiNnp8B5t698iHvOdLv2MxANuYFqYuG6O8DJCqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXhkPOX+hWzuc/Wtj3Bsv4MzpEcDydrKBiAgqQZI4FshzXuJTaB/DTGxPsz2eFNpf5Zfl+y1Hoty/LEFnaFF09Fqb+bWAy8tUqos605MjfylDD5F2jRQU+urGRqdbhtsYBuxDb1SziE3gL0OrEKvQDrGN3uG7jcay/Gl70PAJLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fnrFLpYw; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fnrFLpYw"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e594413c2so26342591cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 09:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777911012; cv=none;
        d=google.com; s=arc-20240605;
        b=M20ppjFgd4DwF3AiPgd3pmRu3AyMf+amPrSUu0EO8sAz29dcYdrsMcVGZdvaM26Y68
         IExKp/A08f/nq9tA6f9QcgH39klEV3nHPWm6bT6PMPxsx+LY9+DrqIwdLWdU8l9a7Uzz
         ZxILi91bUBnWXvUoDgi4XhiqQiHN8ffoQbA1qEkYpoHhrYWtAPFZSQh/5kKifaBIafcU
         RljYPV2ZThuTzqaGpH3a9KbemgEFUbL/4MnvMERMqN+fTTJ+zPrMSJIkYlpkwfXMvpn/
         adDoWbPvdzpeArdnzlOH2GMNx9f4WFsZFyugfmMB/kOVs+69JnZA5lSL0YFSIxVyq4LZ
         aMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egOYHEAv0L6hvc3JzaR6OIc5zhvVouVIH8ZCrlOe4UU=;
        fh=SbOwQ8d0wO45VHziZCkyJNiB/4P+9/s4uPZ76krk/Jw=;
        b=Rhg2yyWzg7wYlK0g5zuH8eNh6aLcnY/2d8kf7FQd+V+V8/8O94RdVttd28f/CL80du
         r29gDJepWmDhPfIE1XmGhmpJ8A4ONuiPYEBLC8R7H5C8IcDQnMsAUkN4CdXnSBcHDujq
         2WcwtpLPOW0cqZW/TRHtCG+MpUzVY0MoaemyG9jA0lTHvZee7huylhGe18ITfaxNJaDa
         +WjrJsi1YAsBYpLU2CA51wWXVUtPZnWqo9CoLTRfePxZ/zyVLWnRwUKKTcgC+IKV94xq
         YJ//6Tj8diZ/y5mryem9szPbHdwMvb29p16sL4dS7+p4HGphARaL/5A7NE55gUtIAUDR
         aO0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777911012; x=1778515812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egOYHEAv0L6hvc3JzaR6OIc5zhvVouVIH8ZCrlOe4UU=;
        b=fnrFLpYw4VgfYZoAstW0Fe+MKYpwiFAUaLQc8rRWZAPU/KzvCi58XhaOG9fxDovtjJ
         X+V3Ao8ZM5awiXivSwC94TcuJMGhee+cwQdsZu45rfXCbcB5AARCLtjOds8l1rGzRNQo
         J/g9m/yRLRQ2qIbVTDYIBboV9pa5Qg0O3JOGC4f1bBwjYUmdzRpZFYDwhDOs0jNQD17n
         QkkkVgADh7c9ZB+cz7eXfGkh5c6eHbGmyvTpVr9fl+lofV5PMXiGra64SHK6/bHFGgB+
         3M1sXDC32ExZOEC4Vqw/I713PzW9EiV/WTqysHVpDBmFC38Ds0LJkfKZhgUSHvOftnaX
         RxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777911012; x=1778515812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egOYHEAv0L6hvc3JzaR6OIc5zhvVouVIH8ZCrlOe4UU=;
        b=XD1DrbFGqOF5jqVom03zm38qQUU7UtQR9EuhISvUEXziPOhyEdSlOXpYm0hn9EQ3ec
         fGzYOVB6kHuEokGvx+VSWSE1DPxuHndwi1BE01ZwbGv/zTiHDKeDDRE1VXyQz1Wj8t1L
         ReqO4C6WZdOVuWSkq9cYEqbWu6EYn8enUc2rWuJ+2ZZph5cBL0hrcuOL+6W1hiy5InDb
         Bt4eWklEZlDC1UClU4bm3xHnPfe9KUneAyiN+fMe08A+AeGugezdQFQ/qktcdK7qxB3Q
         W4T2CaVSCnZEoMY3j3QZOvkGFFIXsH4ZkN2u3E5yjcci4Zm6lSLtpJIBbUC1DwOkGb0/
         3CLg==
X-Forwarded-Encrypted: i=1; AFNElJ8je8TW5lOV9p2h1916RAI5+kF/pY9nJN4C4CeH8X78spWajGFyyCgAdA1ljiqeF3CAVB7iD+R6wEFYszjAhYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJpC/9m5VTeeQfTajL8taoP4Q4rdfh2nKBSDTH/fA+eWKf1Nv
	sB2zSDz+U3mBe/8lMzmRl3mQaRmYe6buULU5YDbjUapcPOg4vDGjHM8Yms+wkIjR2uFRJt/XwmZ
	qmJld1iN+xPwP+6S7nu7ZOR5shCVzIjgfGk0DT2HK
X-Gm-Gg: AeBDieuhJ8K4JY1HdMQiyW664vUnHCb61PNBvUgSNYb7pPl7CgBCLwoeZeh6Arl/ANQ
	/HcAjOPV86mQbQHrgtGLLIlDYQ/liCR/G7N18aww61UtWjtXr2vO02KuaLCBlE9GFZhVA5OaPbp
	pgzKc8wL0bG0IWwYQgl6Q2kNJUj5gXEFCHHJMR9zc34LcrjZ1w/z78FW3NFwtEcmPbCxPTAZ3au
	EjFWU9lv/ysP3iHw3aVARzO6lCK62LTY6sVhBBSpPT1cZNf25kw8nTRCtdhtO2o52VesbiKjgJ9
	K8E/X1Os3bECqnxVKLFtzuuCyQFKhiGGXmAiRHHd/uT8LfoOV/yAOppuSgWdLCSQaQxDTBLbtdg
	4RqLK/rLtlfyRRzInuLTgcOPdwWFPyvfClpbvXCh2lFpJa8le1zc=
X-Received: by 2002:ac8:5acb:0:b0:50f:c133:2dc6 with SMTP id
 d75a77b69052e-513052ffc59mr2115781cf.19.1777911011283; Mon, 04 May 2026
 09:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144945.13477-1-ankit-aj.jain@broadcom.com> <20260504144945.13477-2-ankit-aj.jain@broadcom.com>
In-Reply-To: <20260504144945.13477-2-ankit-aj.jain@broadcom.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 4 May 2026 09:09:59 -0700
X-Gm-Features: AVHnY4JgipRNKWKY0LcrsoSXVmObV-WiVxAP8JM6YGvi_bhJWCk-t_akFQ6tU4c
Message-ID: <CANn89iKcaOK6rrY=m0SVfXdx3jTRXCE3T+jNQpw434UZ8oxtpw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: protect locked SO_RCVBUF from Silly
 Window Syndrome
To: Ankit Jain <ankit-aj.jain@broadcom.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
	pabeni@redhat.com, ncardwell@google.com, kuniyu@google.com, horms@kernel.org, 
	shuah@kernel.org, quic_subashab@quicinc.com, quic_stranche@quicinc.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	karen.badiryan@broadcom.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, vamsi-krishna.brahmajosyula@broadcom.com, 
	yin.ding@broadcom.com, tapas.kundu@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 7:53=E2=80=AFAM Ankit Jain <ankit-aj.jain@broadcom.c=
om> wrote:
>
> When an application locks SO_RCVBUF, it expects strict memory bounds and
> disables TCP window auto-tuning. However, recent TCP memory fragmentation
> optimizations still apply dynamic truesize penalties to the `scaling_rati=
o`
> of these locked sockets.
>
> For workloads processing small, fragmented packets (like Java's Tomcat),
> this penalty drops the scaling_ratio to 1. This shrinks the dynamically
> calculated advertised window, leading to Silly Window Syndrome (SWS)
> deadlocks and 504 Gateway Timeouts.
>
> This patch fixes the issue by bypassing the truesize penalty for sockets
> with `SOCK_RCVBUF_LOCK` set. To ensure the kernel still defends against
> memory exhaustion from large aggregate payloads (e.g., GRO), the penalty
> is still applied if `skb->len` exceeds the advertised MSS.
>
> Fixes: a2cbb1603943 ("tcp: Update window clamping condition")
> Reported-by: Karen Badiryan <karen.badiryan@broadcom.com>
> Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
> ---
>  net/ipv4/tcp_input.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index d5c9e65d9760..569299dafa88 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -240,8 +240,14 @@ static void tcp_measure_rcv_mss(struct sock *sk, con=
st struct sk_buff *skb)
>                 /* Note: divides are still a bit expensive.
>                  * For the moment, only adjust scaling_ratio
>                  * when we update icsk_ack.rcv_mss.
> +                *
> +                * Protect locked SO_RCVBUF from Silly Window Syndrome
> +                * due to truesize penalties on small packets. Allow
> +                * penalty if aggregate payload (e.g., GRO) exceeds MSS.
>                  */
> -               if (unlikely(len !=3D icsk->icsk_ack.rcv_mss)) {
> +               if (unlikely(len !=3D icsk->icsk_ack.rcv_mss &&
> +                            (!(sk->sk_userlocks & SOCK_RCVBUF_LOCK) ||
> +                             skb->len > tcp_sk(sk)->advmss))) {

Testing tp->advmss is not doing what you want I think.

A remote peer can send GRO packets with tiny segments, regardless of tp->ad=
vmss

If GRO is what you are looking for, why not testing (skb->len > len) ?

>                         u64 val =3D (u64)skb->len << TCP_RMEM_TO_WIN_SCAL=
E;
>                         u8 old_ratio =3D tcp_sk(sk)->scaling_ratio;
>
> --
> 2.53.0
>
