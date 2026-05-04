Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929A232395
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911214; cv=pass; b=b3DXU1HYFQkNFD0lztSxLEDHJMaZIoLmcOnhqm6vRvEKpS8PiVFybzl61f/HwGwr9HApvBkSFOM/qKGFh6MKJGarA3zEItUBxJrHXNwVoO2EJmqoJIIfxxD9x7LcrlCrE5wmCn5m/umYav0fB/gCX4DMHhOFmh1ofXlGwdMgNdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911214; c=relaxed/simple;
	bh=rngbnG7BDe/PSEAJIR/WpQ8dp7dzBhHmNpQRxrMNeJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOfGSGQUk0xfOfmfaiHYiCR4CUlWe/9ayvFpuz1MMwvw/NZO2Ap6o9VzmfdN0VZqclfFIv1tuu3UX7oG+8XJjmAFcwWBSJzLInOZZeub0UDVzhQNzPUo9ksX7GFG3JxR0IsxuhrAQpecTJ0XFNwaJmI3EisyuzKtDa90Ewig/ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QX6J9u2C; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QX6J9u2C"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d6b9bca48so62144461cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 09:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777911212; cv=none;
        d=google.com; s=arc-20240605;
        b=Cj+5LHxH+l120lFhg9y8iosN5eHKVtOaU8GWaF2s6MQy44bDVTon1p97OHWGlpUrtJ
         q8holOjQgOp9hbL19k53iZlRMC2rFeXtGb54WROhT2RT167r79c534o8xw54ITk0Om4N
         2yhYT2KGaF4sE2ACuZwvkvHH9r3M0Lf7Gw3q+PKcWdEVGICuvYlpdrCdPlb8T17sykka
         2BctfUbjCBAb3zLrCixXihbGwyJ6NsfRLeB/6tDPO/UgG1KDTzwG6f1HttFR6QW5pe8R
         oGrXU6UVPkmRpLM4Nj3U9amOaU4jqPoe1amzqA5hsfAfvxCN88OhoMhLMA8an12oxeE3
         w2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMU0ondNGF96N8XD6/S6//2leT0MS7Eli3gTF88yqes=;
        fh=KDZ+TC0bvKQw68cdoZ9AiL9JbmtFk4YW6DIKJyFlvx8=;
        b=dYZ3rVVJqxJOfcEp+fReH58sdGULGR+GLDzeBFwKAtwOFUxVWoGiPpVyTgW0hbgK+S
         GdjerLENy9nb5nocLBYJHpBQNadVmsuHRpBnXvxYiKdCq/w4BHKpo7abUusuTG7hdz+d
         7J3g9elo8dlzEjCNkShxpBs0LPfuNydBnbmgPeDPHiPgW0Zf6cgpDvbniQChc0FZsaWf
         ZRkwQ24Gfv5aIPue+q0TOjM/ufvo3v2cxj2oIgjE+ly4jnVdFWoWeQ0iB9rMZETfmAvu
         yNJjBtvWAuknbhOHcRXuIEBiA5ZraQ3Bp1VGMmZjJjdkDFOL6R7LaPizpklhQD4DPvsJ
         yLFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777911212; x=1778516012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMU0ondNGF96N8XD6/S6//2leT0MS7Eli3gTF88yqes=;
        b=QX6J9u2Cve5qbl7gNyo9WOckdxstoreY59sjI9gPaRF76EPSMfx1vZxA+mSXZ8AJFP
         OXKwp+H5mPfgu5Bu/el1QTl7BbFybz/0zgpdzjBBLD4UPRcJ+/48QVYKvd2XoFMXTpXp
         87xiyQVmINHt8By2ASCKABtd1Cd237AiuTZgx9d2ouL8A+wRZi3AUzsHYiYCvgoFVvaQ
         MyTzLz3WHjqmp94renfzk5uPCGjhITT2YuoaJ3bGww7gTZspFTRlY+fEIH2DfqH4m2RB
         ld7QgRLCM1cKnxcjLDNrGYCAmmxBM5z5au6NLP7SNIfHiR3daB26QDKv5GX6xGI8o2GC
         +rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777911212; x=1778516012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMU0ondNGF96N8XD6/S6//2leT0MS7Eli3gTF88yqes=;
        b=EjFxp/G5d3C5uI8XSkrmyYuPyqSo2J/W6VC8ghMct1laO0xGAgTv9QRWJUoJ8pE90Q
         bny2niQmkBIC/+eTd8T1H3CTzy38lGkUe3BH4JrE8jNHQelrvAgdizCOVRMS2QD1iz5o
         5QilRh/aGgSQgrWPMXXlgZ3/XlBG1qNudUntQyi+CDUgjeRa6h6x7W5ij7xLbB3Fvz/2
         nrEOzfLzUZFUtUCwerddXTJBLPH2POfvhrCR6aeY0ZvkGdrawYtsHlIOBv7W21VGdUcg
         V8tGwczyK9n1emYtuMgPMDf//u0VZCRn88/IHY57qFHXZpTfOQfpPvJFrqQoY+VAiQ30
         aOag==
X-Forwarded-Encrypted: i=1; AFNElJ/NO96nSGMZqJn9niIoxeDyxE5M60qMWM7R8vu7W++3Ag59ACCNta6A2tJpTAtet2qyDlYQ0KIs1NjXkrPPqtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUa/SbSacyGazCPOOlxqRnCZM7pe9dmj1Ad9MG9FJgzE0SEpwQ
	az0e5paPwclMLNfl4frqCKHBYejuIkyqdGYwMvt5hAvSvgrTJHmLiIlJLy3MSQysUu6h1IMiLJd
	T/58xwE+61H7oIfOSCzABZ4Wsjle58hI5+UCqy75s
X-Gm-Gg: AeBDieuZGnC3TrYKltD+3f1oPolmDsg9LPHpPRpnPjW5SA6ZEdvlzFi8XmvvN8a3ePa
	oafVyK4EHDmo3fPnzFdS1fZioY8glaQ9Apijb+IKGu2IdIz2DUHs/Cl1IBUKGvgtdr9+09wVPgR
	a7fVQNoqvRbIOpdlgJmMx7Xh06Mi22F0hInetx0UWh/PiYDy+x1LTgFhaM7H/C2k9ULrREygWqB
	fQ0cqiKRCw40/Ai1JBH8Rxu8w4sd3URbOFDIKRTYiONmoxfBj23W9b/1nFGaosJsLs6z3F8Pbr7
	cYjWIGPEMcywClpvHY0LkWguZNCNTVAhxqs8AfKrJbI5WsuO63DhIbnORIjI0+ZZwziZ41Uhc9p
	CUUTuUWtSe+cvM0RG+qsljFHJjBlfNrG5XCF5zHa8+1oETd8uNsQ=
X-Received: by 2002:a05:622a:230d:b0:50f:b1e6:a901 with SMTP id
 d75a77b69052e-5104be44f40mr166742351cf.24.1777911211673; Mon, 04 May 2026
 09:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144945.13477-1-ankit-aj.jain@broadcom.com> <20260504144945.13477-3-ankit-aj.jain@broadcom.com>
In-Reply-To: <20260504144945.13477-3-ankit-aj.jain@broadcom.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 4 May 2026 09:13:20 -0700
X-Gm-Features: AVHnY4JZd71Obq4KzZ0qMQOPE3ryaNl99b1q6wXFfL5A25b6TCCeASXJUoXIkWM
Message-ID: <CANn89iK_SrGx4UuN-_h8LY0DFBwf8+hStba7vdjFnEogvo=N7A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/net: add packetdrill test for locked
 SO_RCVBUF SWS
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
> Add a packetdrill test to verify that TCP does not aggressively penalize
> the `scaling_ratio` when an application explicitly locks the receive
> buffer via SO_RCVBUF.
>
> This test establishes a connection with a very small MSS, then injects
> small payloads. On buggy kernels, the payload-to-truesize memory penalty
> drops the `scaling_ratio` to 1, which shrinks the dynamically calculated
> window and causes Silly Window Syndrome (SWS).
>
> The test asserts that `tcpi_rcv_ssthresh` (the exposed window clamp)
> remains protected and stays at a healthy level.
>
> Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
> ---
>  .../net/packetdrill/tcp_locked_rcvbuf_sws.pkt | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_locked_rc=
vbuf_sws.pkt
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sw=
s.pkt b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
> new file mode 100644
> index 000000000000..96d3a0813548
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Test that TCP does not apply aggressive truesize penalties
> +// to the scaling_ratio when the application has explicitly locked
> +// the receive buffer, preventing Silly Window Syndrome.
> +
> +// 1. Create a socket and lock SO_RCVBUF to 32K
> +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> ++0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [32768], 4) =3D 0
> ++0 bind(3, ..., ...) =3D 0
> ++0 listen(3, 1) =3D 0
> +
> +// 2. Establish connection with a TINY MSS (48 bytes)
> +// This forces the kernel's rcv_mss expectation to initialize at rock bo=
ttom.
> ++0 < S 0:0(0) win 65535 <mss 48,nop,wscale 8>
> ++0 > S. 0:0(0) ack 1 <...>
> ++0 < . 1:1(0) ack 1 win 65535
> ++0 accept(3, ..., ...) =3D 4
> +
> +// 3. Inject 100 bytes.
> +// 100 is > 48, so this forces tcp_measure_rcv_mss() to recalculate the =
scaling ratio.
> +// Because the payload (100B) is small compared to the sk_buff truesize,
> +// kernels without the fix will incorrectly drop the scaling_ratio.
> ++0.1 < P. 1:101(100) ack 1 win 65535
> ++0 > . 1:1(0) ack 101 <...>
> +
> +// 4. Inject 110 bytes to bypass the length jitter optimization and forc=
e
> +// a second recalculation, driving the scaling_ratio to 1 and crushing t=
he clamp.
> ++0.1 < P. 101:211(110) ack 1 win 65535
> ++0 > . 1:1(0) ack 211 <...>
> +
> +// 5. Assert the window clamp (tcpi_rcv_ssthresh) is protected from the =
penalty.
> ++0.1 %{
> +assert tcpi_rcv_ssthresh > 15000, f"BUG DETECTED: scaling_ratio crushed!=
 rcv_ssthresh=3D{tcpi_rcv_ssthresh}"
> +}%


I do not see the SWS effect you want to avoid in the first place.

This test is an ad-hoc test about your change, but I still do not see
why recomputing tp->ratio every time the rcvmss is increased is an
issue on loopback interface.
