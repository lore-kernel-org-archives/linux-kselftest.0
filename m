Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8A137750
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833688; cv=pass; b=NG0h4EaLmcr0+elhTt4/l++g9I/HXaYEVyGCQDVAhRsOtO3gIxaOjTxKYERtp7MwCEOwtAuD+uf0cHCn+Exlc9Uoz1dHC6GBG/GjOpnaTN7sqwjsUp8/bK6Ma9exBeHvszdS+KtF75PYsxhP4Vl/J3FtG/+8GwBynBJM/87I6ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833688; c=relaxed/simple;
	bh=K/6q6RkAywcpwdXEYmgKespAU22TbYrWPBmXAoPVm+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgearr3mGr+DpH0EBD0iu41jbohxHK7+8mSqOYap2Ce6urCMhKr5S6oPGL37d2Up2/cCTgtnSSoV/AGWkMjRDzG1LW+JD0G+qVSFBqv7QGx93ss2QSM0P7SbG5WzJU0B7iOyOajBl9v8dD1oHFG44hpz+Rt80G2YnrwVTAZdvik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdK9FwaV; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdK9FwaV"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506c02ec1b3so43628321cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 00:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771833686; cv=none;
        d=google.com; s=arc-20240605;
        b=Bs5TKFbzdyHk5/w7rcNP5N6XKyM6wxnrwwps/hWgQCglXCNKPIGjBC47gHXTCZolt0
         6mRlukqKF+RUUtgb7wxKXyqA5Y5CmQ1vjPjlr/X37Y5T4MDPTehe5ahYU5L0zvr2KDQD
         udhin5mR+sR3S3BW0aD9nUMPpHQIhJdVvErmYbO/6rxgPs6mH36IHO7CHZcRNyqF2pbl
         lblyJdwSL1Al4KGAmKElAxmHcWt9e6U3innm18pN83aPSj1k4zRE7C/WpeNLFlImmGyi
         Tilr1buJ48f5EfwWlWLG3Tm1SUONsfVOZtsK+jCXQrxf202CzJbhZWDH+9thUBTLAbW3
         cyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHeMGjNoyVss0xbi9Q87Th7AGf/k8UCazyBAOVdMvks=;
        fh=g4YuzRzpp2ClbatT47DEfthKyS7g8s9TgF5VQ9o8mr4=;
        b=BHPrC7yGVh21fdAV00bhrzFdLFTJAjBL8HCgPbRhz7FJ9ddw0KQ+h5OdkuCnSljNx2
         nlKkc9W81iQc0gAbYrjfA/tjd9MG8hft6IipAKPemrQ+aRBCepG3Rm+YSzqV9SqPEhAv
         pFP4tKT52OdHwRtPCO5Lsvhmh908JpwjAcM+BByBCFQthIGNE6fX5yUx+RhDV1S0RTju
         2y3yimwdFdtgHYiIJfft781iK62pxrdQTsAWF1DnEb9Z8GcjM6g2zEPe8l7NpOZVMnmX
         WRZCyxmIX/4LW8IqWx5b4VSvVcfJHzXVbn/X03BNPYQptGiVKL+v599IpgiXyaj1lFZK
         9NkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771833686; x=1772438486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHeMGjNoyVss0xbi9Q87Th7AGf/k8UCazyBAOVdMvks=;
        b=QdK9FwaVhnzFMU6phiq69IYWiUe6H2Cv/lLVizsub4gFEpSQGK3k/KNKj8JnzX+Nh5
         9UvPxhVtjpdAsDitwJcHr7PIa+Y/iTTQQAd+w+AYruVsZ2J1cmKRTCmN1yhXnxE18MrS
         o2qzRTV00zQBFt5w8uJzDahEDaLD59DpjN/P2cFo7+Cdg3BRs2NmeiMcHm0T1NfF7DK5
         icWWCsis52EynRC3yZ45ZJqmlR4V5FEbuhp4VOHZScNJ+PrIcCkfpXqIJ+li/jKQXdU4
         cgzkKQpHSnI2BJJx1KRSl15frFB5OXrNj4l2RmrrHvfTLQz4hIaFwfXc6VJouZueEh9E
         QPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771833686; x=1772438486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHeMGjNoyVss0xbi9Q87Th7AGf/k8UCazyBAOVdMvks=;
        b=q1BHPsNt1ODWROUE6h7EknBKOLI1laAnUUkEx7TUXUh1TrLAd0F3irdVk0oHp8FXBL
         61eRqf2W2mkiblDcuMBAfmRM/UTtmcU7e43O9lKbbF/KYJMpOU3zVfSUsm0EiCOG3hRm
         MvP01gixE2W9z3T8IEtdUAGf86n/DUffKa5W4qtGsf9OGc+Bzi34/PoiaSCa2lud+Xc6
         7RItXP6M3sk6SpkAaVjbL3OpXDdbWIFW8SdqgjU4YTSVv7xPeol+V+ntJVZbKp3o8Fsx
         SZGzdz2hT2pyPiXvCINdrGf+tD5R+fTNYDL/30VFsGfDNcP+8G4i5fIjsFCfm7fPiiY5
         aTsw==
X-Forwarded-Encrypted: i=1; AJvYcCWYEZpqm8L2CxO6PTgcuH2PteYvvsqzrnxSlFIsdPgRK/BF451SZYHI5xOKZjHDmKnaPiXW84R8lhCaACDq2Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcpkq9gGrNKQQmIBiW6B+m9/+uSUvjJq3SCOnrBCv1nWeKe4Pc
	QnHuY2m8QJlBbyR3RaxOdOSE/1KOZVAg+io3Gc+sbirQkiZjff1VGJDBgIH3pqNbA0m3Yyz2xdU
	nTlGDUWcAb9COzRlZbNVhVxWAW3zvGN3Rl8vJW3rM
X-Gm-Gg: AZuq6aI/8m5Hvatfy1bqjr+N+JU5a129xfRs+u8RedaDO/7moUqt52AnjQD8tYfdh91
	fDdP7jM4+tDWNjdo0FtQwqk9yDVPe3Nl0EuTfBQTrkBDvFB/7o9/nP4uWCCZWCzdBL63IrrKkym
	CRnOFPDW+XaAJ/iuXhYl3wZY5XDaltfPVinCLGH3ENh7vG4Fu/zvXvILHmK5+VVva97QSw6rhNn
	pSsR9k7hIYMCpyfyiUgsknWC5G2Q7tsPEaxVLFkYRKfolYqPfEFeHMQIBSuZqxKG0hUS3GGunIZ
	2qG7x1E=
X-Received: by 2002:ac8:7f8f:0:b0:4ee:1f69:fdeb with SMTP id
 d75a77b69052e-506f30ad7fdmr174135491cf.11.1771833685719; Mon, 23 Feb 2026
 00:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-fix_zero_wnd_fin-v1-0-5f4034952f3c@gmail.com> <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com>
In-Reply-To: <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Feb 2026 09:01:13 +0100
X-Gm-Features: AaiRm51s6F5nJUNwqq5YLxG7UGRRbTM5Nc5rtJlp4nPZ5LnqHN7N58OnUco-aUs
Message-ID: <CANn89iK5Kk2D-zMiw_2syb9OdmkKdgAA7aGfi8QNZ9XR4=CfvA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 1:35=E2=80=AFPM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Commit 2bd99aef1b19 ("tcp: accept bare FIN packets under memory
> pressure") allowed accepting FIN packets in tcp_data_queue() even when
> the receive window was closed, to prevent ACK/FIN loops with broken
> clients.
>
> Such a FIN packet is in sequence, but because the FIN consumes a
> sequence number, it extends beyond the window. Before commit
> 9ca48d616ed7 ("tcp: do not accept packets beyond window"),
> tcp_sequence() only required the seq to be within the window. After
> that change, the entire packet (including the FIN) must fit within the
> window. As a result, such FIN packets are now dropped and the handling
> path is no longer reached.
>
> Be more lenient by not counting the sequence number consumed by the
> FIN when calling tcp_sequence(), restoring the previous behavior for
> cases where only the FIN extends beyond the window.
>
> Fixes: 9ca48d616ed7 ("tcp: do not accept packets beyond window")

OK, but this commit is fine ? It seems the issue is coming from buggy peers=
 ?

Eventually the receive queue would be drained by the application, the
peer would retransmit
this FIN, and it would be accepted.

> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e7b41abb82aad33d8cab4fcfa989cc4771149b41..fde612f12d3625000081958d1=
3cec8779684a642 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6379,7 +6379,12 @@ static bool tcp_validate_incoming(struct sock *sk,=
 struct sk_buff *skb,
>
>  step1:
>         /* Step 1: check sequence number */
> -       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq, TCP_SKB_CB(skb)=
->end_seq);
> +
> +       /* Some stacks are known to handle FIN incorrectly; allow the FIN
> +        * to extend beyond the window and check it in detail later.
> +        */
> +       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
> +                             TCP_SKB_CB(skb)->end_seq - th->fin);

I don't think this is the right fix. Basically it says that FIN do not
count, but TCP RFC says otherwise.

It also adds code in TCP fast path.

See for reference

commit 22555032c513e62fe744d4cdd553539897e8e922
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Apr 18 21:45:58 2024 +0000

    tcp: remove dubious FIN exception from tcp_cwnd_test()

    tcp_cwnd_test() has a special handing for the last packet in
    the write queue if it is smaller than one MSS and has the FIN flag.

    This is in violation of TCP RFC, and seems quite dubious.

    This packet can be sent only if the current CWND is bigger
    than the number of packets in flight.

    Making tcp_cwnd_test() result independent of the first skb
    in the write queue is needed for the last patch of the series.

    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Link: https://lore.kernel.org/r/20240418214600.1291486-2-edumazet@googl=
e.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>
