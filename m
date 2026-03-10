Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685A43901C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132913; cv=pass; b=MlECqWRtFsC4WZdsXqVLAOQ/dwLyFAmkfAXcpJgAbNShQwg2fPwzIF5N3ssg4QCB4HpZvu3WcX7VKK412z9q/51yCsMqlb79FFlbCJFADl8Y3YOKtEh8yqQklNUHuJ7M4fBckihvDB/oOlHYpsGpKqHn812ilCyblEO3CMhahhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132913; c=relaxed/simple;
	bh=MTpfFIjKFrgdOM/fNUp2/tdXoh0iY9f5YiOgrsaFrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPPpYnlTHw6V8lU2wnhziq3KXN8BNDcY9UtY1m56eBQNezDeUnIX7yyKN2yL1s0qp3bYzhyjDpnzFX3HPytgjvwFJ6LzX/vMfe0PaQlQtxPm9J/lihMwvpGCmfe3+8PJrH9ts2muYRxB8OVVkfQLN2csLuD1UBAcB1m+awx+SME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Na+svgUq; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Na+svgUq"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506bcb23a78so110358341cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132910; cv=none;
        d=google.com; s=arc-20240605;
        b=JAQ97gpoj2tr+TNK33TMYN+c+ZH2nRgGL/KGbQIRZ2zWMQDSQmWOtakZH+MXql3C4t
         1q0fKG2fRH1Zw1AODaReKsglw7cdzWkTL9lAlR9MER9GfuQGjwqO5izBQ/KWEGWLXPSc
         3EHnGZn0OCOw5XWA2K11CJ6zv7Jo/vhxyO2u79ShxtWQ59WA1935qKzK0g9Ag9cTlXOG
         tND8iU5zHaLWQnKDfhGWYPSb21vqxVKtUDW18qSlhi1msQt2Iz2ispsdQfcNIfKewfIc
         3NNh7VwLNzu0lxDAWB9D0hh1iRCLMeFXisqkW9VQSo/sOZZ8ByQrjRPupH9qXazewM1o
         kZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        fh=CTT9i8m/a5gf9d1dUMeHvF+Vtk2nQSRxZX1XmqPK1Qw=;
        b=NcFofmeGIu8ZDXwRj/Pflf3TXFR4hmKVgQv1u+PNG50YtueorXF74E+GpfNzm6lWuY
         ARawufxiJvw9vejJ9Gp05raTVCfj4e0eoqkbrTETlzPpWG5IEcmtgk8n5vzus2XmJ0PR
         Dppfi8dId3qLx9Co0pzAymlP7CA60ee8iXyqJadiga9Uis2inJg0uKn4WaA9uVeGF3gT
         cQuFTSB9CbjqBqkCng2bhUlOaMvebr1sr/26qBbjs6ZGSfexdK+fdXZvovPxGcFRvJrL
         UXRHH+1X7YG18lXec27e2aqFuFLd9BplPxn2vj0+tVarKQwfOOjfdO63KS9X/rPRsXkZ
         ZpnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132910; x=1773737710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        b=Na+svgUq44IuBfIMo7Klc0RYjv/TsrLaKTwoey9HZ0bXK0wo8C00IFs3Jv1+ms5dUl
         p/DxQp3wfeVNluCcoAGu/2FXSmUm/2wMM+kB6H3jBWhMue0QQ+mw+JOHsqUP8RDahWNg
         d1FV6Pzd3gC8T6rvTQbp3BtxxlinrVXfspaik3PpSNVS8dVuJI+d2dkPIRRMq71r0reR
         D17ZozN5YC22WBM94XO85aaydhrSSAvotl3mRbTHdAxspt28345+x9xEIRCMXUs9CRUv
         6T/AgUH90TpT1ktJphoZEbnR5EqPORJVZTozklqgPWOMa9Q+rotpTUnE5HlycLQJ7aaB
         wpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132910; x=1773737710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57HCSNZqdX/pE4pNruhHCDIUKjmgpBGDki8+akqS8UU=;
        b=eYrOFHQI4rwE4OXPLCgUrROJIE5m7q+Ad6oXdOBnxKbdp4d1HuV0rhVxonro6rRMml
         CxL7EBz8KbUs3RPODfmobXVZAdAfsBTBXIvK+YSAcQTX0yMzNghF2eCeqcKgryoPr/+D
         P5Eb3Jg2Qe8RElwXt67eNVEZmf9Y92sCBgZ0Ec+u4pi8BjcyJvNDnyEf6hpD61iPPfGr
         9ERUwfyUD8Nn0eDye5f9dbIcq0q1/EJRa3dW7mR2sAl2F/O1iMFbCNkl5cc58DvzhqSP
         tZaM5Eud9OdiWOpn4s+y7EzYRuZ2KEXLeCUBjTic3M3pL+LPmFBrQ1sJzDFtHFhYQZZd
         TgqA==
X-Forwarded-Encrypted: i=1; AJvYcCW2uIDhi8XVXRIurP/VJctKzVGKtDAU+k3ejUm9JUNsUVQpotx5MQI9UbHh8Q+s4qElXzPrQXotMuSLlp2JD7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9r3fG8lEaruWOmtIFSWAWSQbAtZM8ydLY4sg2e0zJUeUQaLe7
	mgf9PNzyhNtK2lB5Vi6ZwrTlHEd3M5JWQtX27ZKceL9uhezediEC0yLdEixojPzS5z3lamxqMD0
	Xg/I2VS5jBgQB2ZUhXMxmfuDyAd26yJd5SsLG0lbM
X-Gm-Gg: ATEYQzwhHf+okgSVA1Rx58Tfm0gpR8kT0Fuh7th17orMCcxvV9cGixFk6yhi95YZ7pq
	bBq03BapmXcnXh4pq8BSHPjcOTIEIAr8vU8axjf7jvchlM9jzzxu5qj0OeHTqojJU9cKkApj6Ib
	vc90cPMO4F2hbl1UJ9aTzAL8gHPU3ov/0k6MLLwxR5VnScLWksrkxz9B6m9161+mvDPbfN8iAix
	uYslcO/8Unjn3vdSAn6hhK9OgNhsNroXlVJ7oR2MoPcBNND23RljfsgOFLhC261lA2J/cFxAsUP
	Y/RdexY=
X-Received: by 2002:a05:622a:283:b0:509:272b:b3ef with SMTP id
 d75a77b69052e-509272bb73bmr26369351cf.35.1773132909710; Tue, 10 Mar 2026
 01:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:54:58 +0100
X-Gm-Features: AaiRm52hpqwFLhiGxunf2HDckqwt_QrtXyTul6g4VBswXcYgEk1a2sH7NGzoxSg
Message-ID: <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
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
> The test ensures we correctly apply the maximum advertised window limit
> when rcv_nxt advances past rcv_mwnd_seq, so that the "usable window"
> is properly clamped to zero rather than becoming negative.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  .../net/packetdrill/tcp_rcv_neg_window.pkt         | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.p=
kt b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> new file mode 100644
> index 0000000000000000000000000000000000000000..15a9b4938f16d175ac54f3fd1=
92ed2b59b0a4399
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_neg_window.pkt
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +--mss=3D1000
> +
> +`./defaults.sh`
> +
> +// Establish a connection.
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +
> +   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
> +   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
> +  +.1 < . 1:1(0) ack 1 win 257
> +
> +   +0 accept(3, ..., ...) =3D 4
> +
> +// A too big packet is accepted if the receive queue is empty
> +   +0 < P. 1:20001(20000) ack 1 win 257

We do not see the answer, it seems this test is not complete ?

> +// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq updat=
e yet
> +   +0 < R. 20001:20001(0) ack 1 win 257
> +
> +  +.1 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%
> +
>
> --
> 2.53.0
>
>
