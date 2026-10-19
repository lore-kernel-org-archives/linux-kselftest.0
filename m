Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423879;
	b=1doD5iDE6ng9T1CDpF7Iz5eUNRdksgmJ8Hi5hfJWPsAlMqi2zUBw3hZLCQ1E9shsIG20
	 6iFq3IfW/lVDdeL6TVaX2dtsDpfU1NGEh5VsRfNs7LAV72hqbsVMvYvBcq8flF4OEjhYU
	 E84KlcUpSj2dEhaj/1vQEHc98sz+NwH2MZFUWyQVlvS8rl9sCTfKJCSwRSQh6lM2Tk6Ax
	 ZsWJkq5JhPKSwvDQOEXiFH693p5kPoydmuy1DKnkPI5z72AG0bc6SEYyrhhQjGaMoilAE
	 fj9DrryR9h7H+o/vxiY49ogbxLk04ioow5zic5mwFfjLrmbki0LllZZmPy5yQjZgzmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vH8K0tY0TTIHvq5G2+R9r502vTAhxsKA0mwhegsYO5c=;
	b=jVNKcUjBKiAWg6e+wIG4pmWHskiHAIQ+N+zRPcHN1AA4j+SYMnR6sXOSwuP3LhMj7Y52
	 Q0HYGWzI+5OdwvuDbQw4YLWICUHkLRTE0ffWIGh8qWmVlNLDw7aMBCh3w1s5N85DAFSVu
	 m+rZZ5XRwXnP9HxQy1m/blruUTf/4v2IzSpvIpS6IEItVxrNJTErqerWZmgMmRREqq9w2
	 MnHvsegTeobNYnsMMykV8JrfZBe4zuNV4qqrXrXVQpGV2Vbo22WycBFQuz1TG4BEldmuB
	 3r0VIHXV+XpJVzb5wSv7WNQKqzbJvIg1itmp7DGWFFIaL8Pk5T3+xvzBFO4zzvzEM1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UPpsJuHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516EB60ACCE7
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516EB60ACCE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UPpsJuHE
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so433521cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 08:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792423877; cv=none;
        d=google.com; s=arc-20260327;
        b=kifTxz7DRohEUn4bjsM8GtCwjVfBinc9Y8+KPQ26oq1834vfMsh1Bbsg9+6SaJintz
         wqhEomJgZB9BMT/kTjc95iGQonkJayIGNxiqCc4IBnTDTkBWC7WQhzWO2PdyKKMTfBiA
         Zw3XMN59/u3nj0imv+XlEzLvFnOP/fLnmTSr3ftmGPdpU3JJ3ce4do8/c3wIM2x1bfaX
         jMWdxtfgaeXL5fSvFn7YWbMaFgk6IdnxqXH309NjDR1ySDwARxnDV/H9F+D1R9prJI+F
         sW0c9UQjJi3lhQqM8OJXflxmCyTbSPLpkD0kBQpBC5MRBPRARFoRCEW2Giu6f95vMviB
         5J1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vH8K0tY0TTIHvq5G2+R9r502vTAhxsKA0mwhegsYO5c=;
        fh=8AV41qVCvSmSYX0W2zWIx9nbNbKkh1dKu4gnti5rS/k=;
        b=Kb5KvUiJDYKsYdvc/RD2lUt2PHGpw2LqNa/vQ4UxR431M5u3o3nmc0Y4r0ZDloBLkJ
         aFlWnppOJnHjN+aBrIcJMeHFrzuPSbZzSZIeCantbjqzSOVr+g55SD573EwVe5X1kgP1
         NvHM1qC/9dSXnQfWsAiYjgiQvxgIRFPPD0PTxXS3Uofytv2g2Cf0ZbgQjRaHDQwQBovM
         lpLsjlAK2F/zlEaVx+wv7ZcYsTK8SJ81xDvQlAblKlDHSKTJ0O3uFzZOoWapXMNiaPvB
         xh+BecIS1RznRQvk6ETvWKuz0MOnFbd+09phHKEhjJGQ7PLgbFZsuRHsn35YpxMA9zh+
         G9AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792423877; x=1793028677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vH8K0tY0TTIHvq5G2+R9r502vTAhxsKA0mwhegsYO5c=;
        b=UPpsJuHEPgv0ykjk6AgT2el3DqaUNvZ/ii74oL+fkA0VD4d6rEpTHFBb9Yd2m17Pyk
         NvgNWaGKTGRoSixKO+UmU1+kAex4grt/wH3hvHULqXf7DFv+QmNGEbYbvyJcIalXdOvH
         yU30rRb0q2rl7ASvSqCML4e4l9cJu0nDIwGfTjClRgIC22QiuYccXCQKX4tiRGQdVIhy
         DjyGSWl2fi5FdquSZMtl61xJv+z9ody6d+qyeeuXf73LgoJidyI7/CNBKnxw/J3Diear
         C9cFn7Eiav5vWJYbS6Bs08c29j4r4R9cj4DGj8Rq0kKo8ZDI7VusqfvvVCfNBY8+UIaa
         vxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423877; x=1793028677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH8K0tY0TTIHvq5G2+R9r502vTAhxsKA0mwhegsYO5c=;
        b=Z7OP/bcO3aedahHkRdjYGs+cq2tIGfbd04fwDEDZXZGjN8pOG06KSzRmkIeqtJGJkv
         kYPhMvCzdHL5OTqecr7i3XOH+SO702yaQwPxqACr67EXX2nYiOCm1l4wYRsLdcezz3S4
         A6MxulohdcQi810pTFEiPcKhs6St8JjDO4CoKutpd/7NDQjE9vYniOsNbHYuv1uffn8L
         SMYnPUCgBH+9J50paWvw11nDfX6qLh/KcKIK+kqcXFm3Cn65wkyAGbcEVvZKHI9PdkeF
         KTdYDIULK1sqx+G+P8ZQACP5e7PMbke5WFTExAreXzxmUKA4HDxwEWUlwkgp5asefIq7
         O84A==
X-Forwarded-Encrypted: i=1; AKwUvBw/llZdVKbl/aHOxun1uFsQ5Yat2hD73f/bhHQnNcOwm8l8VaLLerJnwtYsrheyPz9TctjJcBinQba8+JsiGBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2EpQ6IBtXbclVzoYQqbTJbWb7fx23rFlTmCpb1RPD+6YijIOV
	Vospic5raov05FiC7+eGC5xkyqCKoVMVdYmGXVriVBJTuEPfE7Okvjbq7ZtPGsTTwfbmG2C5Oyf
	6szSJnXzhR4eorMQGuPEY0GZ5WkWQpMqaMP/K5o+L
X-Gm-Gg: AYBFou1ZILPuqbsqgfQ8N4AHE0sRzr4NmpwrNBePjo56BITWhlxjt7b6wdtkFiVE2De
	Oz2gjYk9QYnOx3E8ydtXPSRsvw3oD2jHgZNdqIcb6UnlPbwkz8pyn9Rj9kSWuF5BI/zpFgvatA3
	2rJ6GzXJHfIeXCigMeZbTBClzV4OOZtnNpErvtO/zrhhYS4hTHdvvAl/x79jBvFLTXF4JOAAISO
	RGdR2bTSK7sW846RH25yXSnfUJlg7vjeoLe4hAtxSkn0a3IjmlDNf69hdRR0OCdIFQ+9vr5zp3f
	zia9Iii8IEs7ntWM4UZroAzL/KHLllQMr+2VNjDgJiczna3xVqbHLrA0H+wiDvVidOnICAbLoWg
	BMUCTMuDfG1/0RGdBJrrgJEI7uUwKA+Kxt3aLbNwYl4t/
X-Received: by 2002:a05:622a:aad1:10b0:533:9746:9a86 with SMTP id
 d75a77b69052e-536499e8967mr30482911cf.5.1792423876418; Mon, 19 Oct 2026
 08:31:16 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018211514.2817293-1-chia-yu.chang@nokia-bell-labs.com> <20261018211514.2817293-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261018211514.2817293-3-chia-yu.chang@nokia-bell-labs.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Mon, 19 Oct 2026 11:30:58 -0400
X-Gm-Features: AclHuK_qCj8A5BQKckfNFBVvGNcKwP79HUqCKtNoolioGZCyxzrnsutbLK1QZbo
Message-ID: <CADVnQykcesPYsRFmZGRJm93knNbPnWf81s6qu30g8Et-rYjsYg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] tcp: ECT_1_ESTABLISH identifier for CA
To: chia-yu.chang@nokia-bell-labs.com
Cc: ihor.solodrai@linux.dev, john.fastabend@gmail.com, jakub@cloudflare.com, 
	jiayuan.chen@linux.dev, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, horms@kernel.org, dsahern@kernel.org, pabeni@redhat.com, 
	jhs@mojatatu.com, stephen@networkplumber.org, davem@davemloft.net, 
	edumazet@google.com, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	kuniyu@google.com, ij@kernel.org, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com, Mike_Rudolph@comcast.com, 
	Jeff_Howe@comcast.com, srichard@netapp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:15=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> When connection is initialized after ECN negotiation, this patch
> enables CA to control whether ECT(0) or ECT(1) should be used.

AFAICT this should be "When congestion control is initialized" rather
than 'When connection is initialized".

> A new identiifer (TCP_CONG_ECT_1_ESTABLISH) defines the expected
> ECT value in the IP header.

Using "expected" here is not as clear as it could be. It sounds like
the expected incoming value rather than a value that the CC algorithm
is specifying should be sent.

Also, the name TCP_CONG_ECT_1_ESTABLISH is quite verbose, and not 100%
accurate AFAICT, since it is used in tcp_ecn_send(), which is called
when the SYN bit is not set, which can be in a number of TCP states
other than ESTABLISHED.

I would suggest calling this something shorter and more clear and
correct, like TCP_ECN_SEND_ECT_1.

Putting that all together, how about something like:

"""
This patch introduces the new TCP_ECN_SEND_ECT_1 bit, which enables a
congestion control module to control whether the connection transmits
using ECT(1) (if the bit is set) or ECT(0) (otherwise), when
congestion control is initialized after ECN negotiation. A congestion
control module, such as the upcoming TCP Prague using L4S ECN, can set
this new TCP_ECN_SEND_ECT_1  bit if it wants to send the ECT(1) code
point in outgoing IP headers.
"""

> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  include/net/tcp.h     | 1 +
>  include/net/tcp_ecn.h | 6 ++++++
>  net/ipv4/tcp_cong.c   | 4 +++-
>  net/ipv4/tcp_output.c | 2 +-
>  4 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 1838389a9d8a..b9def462479d 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -428,6 +428,7 @@ static inline void tcp_dec_quickack_mode(struct sock =
*sk)
>  #define        TCP_ECN_DEMAND_CWR      BIT(2)
>  #define        TCP_ECN_SEEN            BIT(3)
>  #define        TCP_ECN_MODE_ACCECN     BIT(4)
> +#define        TCP_ECN_ECT_1_ESTABLISH BIT(5)
>
>  #define        TCP_ECN_DISABLED        0
>  #define        TCP_ECN_MODE_PENDING    (TCP_ECN_MODE_RFC3168 | TCP_ECN_M=
ODE_ACCECN)
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 865d5c5a7718..210ec63538f8 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -38,6 +38,12 @@ static inline void INET_ECN_xmit_ect_1_negotiation(str=
uct sock *sk)
>         __INET_ECN_xmit(sk, tcp_ca_ect_1_negotiation(sk));
>  }
>
> +/* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_ESTABLISH flag =
*/
> +static inline void INET_ECN_xmit_ect_1_establish(struct sock *sk)
> +{
> +       __INET_ECN_xmit(sk, tcp_sk(sk)->ecn_flags & TCP_ECN_ECT_1_ESTABLI=
SH);
> +}

This function name is quite verbose, and a little confusing, since it
may or may not set the ECT code point to ECT(1). I realize the name is
chosen to be consistent with INET_ECN_xmit_ect_1_negotiation(). But
that one is confusing in the same way. :-)

Also, using "establish" in this way sounds like a verb, making it
sound like this function is establishing something.

How about something like:

(1) a new preceding patch in the series can rename
INET_ECN_xmit_ect_1_negotiation() to INET_ECN_xmit_negotiation_ect()
(2) this patch can rename its INET_ECN_xmit_ect_1_establish to
INET_ECN_xmit_established_ect()

Thanks for the patch!

neal
