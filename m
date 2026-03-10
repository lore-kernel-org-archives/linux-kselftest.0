Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA4430BA8
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132398; cv=pass; b=pg3PlYQJXQ/QdbSqhX/H1B9Whx28FZwOuxKvzdP+4hK1WAi1GTkU/OLGa9mTxC1sAKB17tP0z0xjXXjbPv2VaZxDq4ZU/Lb2X4kxf0VvulRcLM1rZ9nymXGjbo7sJme2J+Q5Eo42pz0gt1Cl6tQMS8nybYbO6LZzSqPRq0ws4N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132398; c=relaxed/simple;
	bh=RszETrACILeYN/zC7YLvxSjKCkmrXHy7cyN9O/Mz3ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxNUSzSHTxHpq4i021rhPCv6XzDFIdSbo6hJGpf1vXdaj1PbsAsLPVzfawQhJlz9bXJBDB7/mT4XlveVXtl7tfZfnbbN2eJUcmYTbsbmxDLhZAK2/0IH5UoJZ5BmTnUWfhs/M/lzQ51mJUZ1psN8++RRbJOD2dExHRG9JGrfgl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WfoLbIQA; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WfoLbIQA"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cd81963e73so236597285a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132396; cv=none;
        d=google.com; s=arc-20240605;
        b=SfMajhlRbs4aOCOUO+m8WCvMuzXvRiUzdmwVBDIA/DRKGSuiREd4IjHlBRr2ps8tGR
         FWA00TSO28lTr5YL0n3C1Jfhvz0OjQUrpzZ2MOdRmN0bkU5fAf4kYFxkdj9psU9jxSzN
         6GLdR/+203GpkmHDOM8Wjv4OYiH14p3ujyhjWI2dJQpSwQb2pzlwwRiVsU9HVPYI0XW7
         kxVFrrkz/EeIH9JUmYoHjVYEyI3lrmaTCsfdqO7acijmysVxIYI5Yog9VBS24FLZK7i1
         eAv2vyuDhiSqAVxPAFWQt9BGfJQ+IzT0hDx8GGqbDZfZ48FJXIn8pMC7mXZMZ4L7S5c7
         2GwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        fh=AARKf+LGKKIemfyeZ20Q4LSylGeen2pBJ7AoLzky/eE=;
        b=D8D77PA5lzv8S7fsTeaPztVSIuHj0I1ksRYI76iUPTtvlH8y2kO/r5Nf1a54z7b2GJ
         SCO1IPUx0pqC0ic2KP5aoD7SbC/t5mcvH07OMuCTyJyUy0adNK4Wijg2te/WYYBIP93y
         4e+WB+vLV0R3X6yGdqkNobvBdGm06p1/I5DIcxSx0hwvs8RtLXTgkSCIPZpVSRSAZDni
         i1EwzFVg/HqHm251bFmmXh8dIQgsgvsCz8icK1ECbz+UEdurNOFdEumDkmb/oPeiKdw8
         4s9J/FMWo5XMvDFT7mN5S6D0KgSXCOVPz6osn/elSNoACuEHDeDDeMfDgVGbaaIRYoZW
         siNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132396; x=1773737196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        b=WfoLbIQAD6GXIH2YYz4hBqNgFaASWppvh7aqRvCgMSoJK+r9lpVxAjRyzI69G5zxAM
         GCZYAQS6+GZyBzp2OxNDykljQK3vnDfi7y14Yea7YvEUhvTz2XjTgRbsagmtQ9bCmRM7
         /A68e0V1XxoDf5c3TZswd2LYDIqW7iIijVLbQmMlYau0H2m25MZRILLfCYwGacgvSPKL
         gRTgExW6j6eiTxE+VzNWqYWdUX5TWdWML8Hd+b0l5anKjAIaoiPIOdJd+8sFcjUlT35I
         2xe6xItTljxBeWLasuLgyjxvrD/lPRi0RlnTWarmTN+zKfvlTVR0brk8bN0sT9ZNsjTe
         kmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132396; x=1773737196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        b=NnIZzTqx5frybWTBB8AqjBJwu4bRzZn5/cyiaqS8jAa+M0NKGuPlOy1Yr5/JHBdFCT
         6iT0KiA9rowWaKVEBLcl0BFyODY50B1uDPickIW2Z8tDISlps4KU5m4H2Bwb0dO2RTFL
         YPWoi8hjDU8acKQtge7UgoflbhNsHV3ouw7KfHuKMcTM0oNu+4EYpxrAV1NhEuk9+Ecf
         5DpUvYQ+yHwd6yGnmac/+K2qlsF6DXLIUzGsu4r0xloWgNUO0TrAou66srK6AHA99tle
         ayGeVtabw5ygQbTFidvbME4y9mp7Y7wiFpSOtqwhawtwumc2dyJaPS0BYs64/L0E8+zU
         yLzg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOwCoD8vJ0RbGyc9G9TSGWQpWJVklqygrEN3uGJap93E5fyvgBKlXeYGyo3aGRRw4rAr5DE4kKlFHG9t9Dgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfvn6F/89OqyVSoakhR9jaUrPxyvWjrDgRUbSoFJPW4zNX3bq
	B3uxUPT2TdouClN086ZZls5glsFIqEQRKtBtp/v631kGQjjIX6gtPeAJLONIjsYDpc9cOYBG0tv
	NNG5vUAfL4qpGeViq8NXCl+y0AuJyq7+f1sU2p0mN
X-Gm-Gg: ATEYQzx1K3WoKwP76jOnwhNHfjEsyxy0ayah2O/LTyLCNFdUb9Cd1I0p22AzyJ2VdXC
	CknQj87zdlorXupVYN7MgV/NeH9Ny+4iU9tPK6C/uuCTFPDqV3GOkNwNEnTYMNZ/i0YBCWUyBB1
	UJfQU6Lr1ajkPakAlU3sn0U0d8NTbCt1LG7SQsNsMosqqdTFxKv/zACl7MTaeWXZntvislv1/O9
	D/PUkMlZF8mE96LI8WEUeYqt9Jv2cRmUqrDMUSuFxnrVid/r25rr9MYjkIaTRSGTFDsD4TIJOCE
	g2LnkEGe/0niGAv96g==
X-Received: by 2002:a05:622a:1a84:b0:509:21f6:df9b with SMTP id
 d75a77b69052e-50921f6ea75mr47026791cf.15.1773132395635; Tue, 10 Mar 2026
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-2-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-2-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:46:24 +0100
X-Gm-Features: AaiRm50AVSa2QQoRJnA4Sp6RmxAkhC4YiZSP7XkFIO_4j9Qiq68pO__J-NefzKc
Message-ID: <CANn89iJU2ejyGSm-OyBeRUNZpdzds6H-bNA8KnR085ekF+W0dw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/6] mptcp: keep rcv_mwnd_seq in sync with
 subflow rcv_wnd
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
> MPTCP shares a receive window across subflows and applies it at the
> subflow level by adjusting each subflow's rcv_wnd when needed.  With
> the new TCP tracking of the maximum advertised window sequence,
> rcv_mwnd_seq must stay consistent with these subflow-level rcv_wnd
> adjustments.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
