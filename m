Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C342C11E8
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771810692; cv=pass; b=bE60NhsOz3ZBr6+IERk6WBQprF4J+rKtYfrk9QvniuASWUfn3Ch5jQ+9RLBi91V555KwtG7BX0dxpoVLAKoPIfOBYWrxdfyOGdlefu/ok/S9q4uF2sgf+xOZCCIWOsa+eO4xUT3gywwdrTRxwNsh0Dcql69kOXIEymPvfFzsFdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771810692; c=relaxed/simple;
	bh=bp7H9nKwxhAflkm+9LXvmfRYR3ZpB8pH/DfQLJel0Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYoL12DY4fnhJCIPBEWgafwWolgqnB39949KzD8X4eXc9RcyOUPKQHQRubgOwgKFAfP1p80aoNXxPPhQunm3E1PRYHkjxL0Oxm97PsNTkYiLQBauA5cvyW/S9kwtwjjh0Vqthw6QSgSoy/ya2TXomEXlJcDxXmbWXgRq+Lp74jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nSScHZl6; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nSScHZl6"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12758ce1e8dso874031c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 17:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771810690; cv=none;
        d=google.com; s=arc-20240605;
        b=J7mW+fM7imjPu9CmppXjWZQBx1gY49z9AM5Lqx2yOHqmlE+LMa8rTGkXvyjdonXya4
         rZ+WPfMpkWfN2tkiY6lklz3CO+/J/kmiX14ur4GtWwIgHb2FqGZSW6liQ2c8XWdbICUu
         4bsnc+LLOkL7RFexm1qiANrGaJuKtF0uE7/JCf4Ap4lnTOfb3VuJWBJD50XMdRvI0x+g
         rd+b+SOkzps6frqiWK6fIRH61TzfehIN2ZvESQTmWTh+KdTQ9DwmVt9ZPFapCtBENuUS
         n4M2NAuqfa57x1hcCeXiUrFA4h0hKpdzMWbEuFtaK+OiJW2UcJOhQ+yZqYxtjON5Uwm9
         ZR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UnSQ5YtPl3nmLSpWU/CZ43YZ80mhY04Vyv8Ao8Lu/M=;
        fh=6aPZP+OpqhnLLvtJa3f+ILj5nJ6tHBrctiPsxZmjo68=;
        b=S6H2BGMiB9rCtQXM3ZZA6LyxLRI9qFCnbHYEsEtr38i5UGh0oyAjqr0+Q1RfmMd3Od
         mQ3tL/0A79sTWqnrUqgTzpp3psKY49I/HxCRqsRdbpIf5PAcZTR4r/xffb17FaeB6UoS
         lH8vGKOiIxMNfQQiOLzFeSHGijohXA2r5IxGNBVDfwXsLbBz5f42P8LEoyjex4Qmb8VU
         FL4JZ7aJdz6k6ZvAZlMroo6UkmkwgbdOaxFJOR5fStxtG+2FhuyLewINE13gNn6M2M01
         SHSBd7xMJj4zCfsOnFouyA7YjLfrbLKsDtuhuj7A9w0d/8+aV2NWn2TMET0SIjp5tnk4
         K0Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771810690; x=1772415490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UnSQ5YtPl3nmLSpWU/CZ43YZ80mhY04Vyv8Ao8Lu/M=;
        b=nSScHZl689o0ViIqpW80LXHPJgGYMv0nNPWG2Absgx+MAOI5w8zfYsrt7Q7HtyUhXv
         +krwvwfb19IFnNfE5/OYcnWAWKdV7I381ns2WG05dhGzIT5ZsAD6JoeUgPzemoLFHgJX
         QZPlxzp8PMnO1G/Ht3Ztl9RwubvFMfEQiXGhFFZdfqg54lWvExH8BRIUPZ/9Ovi+689w
         86n/aDu4qcR+yr5givDOZ/w1WwWg4EczgfPu0J7FxAKd71dLaSQg0X7HSf7eqOW9II9Z
         6r9Dry2ncqQOyY5en1cLX6NTrsbDK6Xtu9y+eN28DM/E3N1cv73iJ2nweq4zLHUihNeW
         WbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771810690; x=1772415490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UnSQ5YtPl3nmLSpWU/CZ43YZ80mhY04Vyv8Ao8Lu/M=;
        b=Zrk32TAjFgC+Cf9pEM6CKDVMWiMz4VKU3Zn0Cx3hoFkrpx+Goe37fMct3oX9Vikp4M
         u7YBpfE+mqw5y8v7psC0H0VD5drqLiVaeGJZsJ8bROPYJ1Is/1GmCpWG626V3fW3eLQq
         /ztvG9ml4+fZtSXQvwLawjyIdyojSd9FMGPfbk5lGyRdk2606/VbDFbQrDJZE3NNUR6m
         PFg8bIDm85/a9S78T2Sy/+zw/tFrdJtBEfvotBrLoUfpL5Mq3aZ7Fke4GSQEAKt5Pqfg
         M6l6B/smnSRVA6LXpbmbww/C+SuZu/pDv/D4l+p752mH/WD3+8vyR0jSO5KVurZv2nrl
         bFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgcrlI+3tRmHAaMCDiAbpPA/pEFq8gExttOe7MQOWrdepKJRn/23VKlq2qjgeHvwCUiUy0w6WHFnLax6vjQpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHQSZmYlqX+WDqKLGTUPN7lrHEAytDW+mZri9/8/6NDp+6yU2
	DXs2pFJrpGOxn+FLGFsmTJsHHpo2volLPcOeM6oOPHqOVgeJsUn1M3OtCih8Ly7cXck5XzS33xq
	NzckdRh526mHXaePvwoKkIFunJpQDBzesZnyDqgZb6bzdu0IAc9FCD0Ew
X-Gm-Gg: AZuq6aLk4WqruWUvHOcptRgB+0VId/JGo+JGm+aNYdp0EezDNuNXDZl3ccuamQUdRNn
	eBXixwBf00pLsuWzu8Rjb2vhf03G4tbEJQwGdAVXyH9oJWOEILwAaLtGKd8TZDNv9qrJJjdgfQN
	KgpfbkctcdCzGg5ZtcxlWtAdD67DVmsloZtsX9he8MXoDUqhozoTarOmwk5HUsME72QwPBLJIkY
	+M12OOW0BWt9lpp+JF0X4jRCJVfi8Ui99yEjN62bwBSp18ydgOwsGlnC1K1mR31YdfwUWxzO9/X
	KSU4kM15VJh2gWLcqBsqEStezldoIpQ3mZM14Jb1a9WVxIIXZk55bPcR/6vrZwfYHVFsCEEs
X-Received: by 2002:a05:7022:1e05:b0:11b:c4ee:66b with SMTP id
 a92af1059eb24-1276ad7ef12mr3151433c88.37.1771810689462; Sun, 22 Feb 2026
 17:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-fix_zero_wnd_fin-v1-0-5f4034952f3c@gmail.com> <20260222-fix_zero_wnd_fin-v1-2-5f4034952f3c@gmail.com>
In-Reply-To: <20260222-fix_zero_wnd_fin-v1-2-5f4034952f3c@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 22 Feb 2026 17:37:58 -0800
X-Gm-Features: AaiRm50HO_GSDIAUH_Vpew7xa4MHSNlo62w8RJQJhlg389x64xz_C5iL-OU7G_M
Message-ID: <CAAVpQUBObJz75=_ozmVOnSZ-qsxpXzFKcea4Ntw2GqcdaU_yRA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests/net: packetdrill: Verify acceptance of
 FIN packets when RWIN is 0
To: gmbnomis@gmail.com
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 4:35=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Add a packetdrill test that verifies we accept bare FIN packets when
> the advertised receive window is zero.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>


> ---
>  .../net/packetdrill/tcp_rcv_zero_wnd_fin.pkt       | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_zero_wnd_fin=
.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_zero_wnd_fin.pkt
> new file mode 100644
> index 0000000000000000000000000000000000000000..e245359a1a91d4b6d7ef64496=
681cea57792cb71
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_zero_wnd_fin.pkt
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Some TCP stacks send FINs even though the window is closed. We break
> +// a possible FIN/ACK loop by accepting the FIN.
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
> +   +0 > S. 0:0(0) ack 1 <mss 1460,nop,wscale 0>
> +   +0 < . 1:1(0) ack 1 win 257
> +
> +   +0 accept(3, ..., ...) =3D 4
> +
> +   +0 < P. 1:60001(60000) ack 1 win 257
> +    * > .  1:1(0) ack 60001 win 0
> +
> +   +0 < F. 60001:60001(0) ack 1 win 257
> +   +0 > . 1:1(0) ack 60002 win 0
>
> --
> 2.53.0
>
>
