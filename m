Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DA27B353
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669728; cv=pass; b=h1W5hFBIY+Or6Qmd+Hc8Xxj6o9iorxPrpVXgm1UQf6dm4NuPie3iioTodqBZWB5nc+PGzEv8G2PeJupB5kbzyYwhI2AfwHhnzRAp4fnJ3UGwqdrFEwrUeg9PwfYM5LPSqIy6ZXx+dp2p4jh9HhWMM8yYL3Jo8HW6CUbCn9Z9u34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669728; c=relaxed/simple;
	bh=KCWKz+FtlPBgRCYFABaMUT1OdH92SjQSov3W4C2s+FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjXU8QfzaLFhGn6VkEey5TNXabUKjS0l1LfYlkWT/9wLnVLUAxZnmPGlTzcBLXbOMJd+7O6dk7i+M4RrkbDhmqbp8+CG+ts1wZbX5EW+KBS+fuzgCP9JnmU5Mr5hoVlgIXUXxr2UEtsFAOmeImcVdf1lwmeWXYb02VK2XLlrxls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=foVDIpIh; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="foVDIpIh"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb20bcff5aso260100385a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 00:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776669726; cv=none;
        d=google.com; s=arc-20240605;
        b=k5QQF037INEKbo05jsu+rDh11EeWYWVPlXsb851xYnsfwXdYVYO2QeIWHLj+rEl7kS
         V68GnfRg7uBdWeYM+BxiaIRB3jV0lCmLaOw0tv/QmKRRZqOOT2BOUQsS3N9D2FCrj3qn
         eXCeMQ0muyq28FSHdiDiSyDEgkjb28ASpRef8x7T4OpMocKDJUJ1vV4+ehElL6JSgqcL
         JYE3aUUyGt2W/TO3Yfxga8kJKxCz5EtwgxKviODMFmg7eY6bcbYEz3llYIWL8rcNf+rR
         Y+31dX+3nD/ZtgKrwSrPSd3+ZGrfK+zUfcsOsI3GtMFWF6IaHLapaauabKCvbUfYSx9w
         XrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BDIniOySTzGT5p8wsR3mWPyJ5w+on2w+W1qyzBFCzag=;
        fh=MD74rL81xVf1kByazU43PG6OBvt94SGBk/6JagrELl4=;
        b=kewll6zA1bJIRcrBf78NdUV9ugT+/2piaTi85Ltn5wO3u/dIjOKhQzLNY9YJ3zbtIw
         Vh9pVKDlsLegvL3oGJhn23XRPnzElpxwGmukDySWg9m+OlIWop1649KhGI+7FDGMVIwO
         srwyo50k7q5KO7hWLv0HpCUt1YPaKTNHoTuz9CCgBG/zajo/SXvBjsM9cPvasfeRLseU
         Y9kLAK/Ko/xEx0zrvIXqQfsg03abDfMd3pp+JrgDEl2v2Pd8NOMbVEmsA9QRWTJYhuGM
         2TpfBEiCaRoBECuaWxZp9dAVIS9yRkKEVuHdYqUq/0BAVqR1+GtFJMmpvWzlAy1A/aKV
         e11A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776669726; x=1777274526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDIniOySTzGT5p8wsR3mWPyJ5w+on2w+W1qyzBFCzag=;
        b=foVDIpIhHeNSb0/J2kEYcvJ+2aXoOYCyrKm46ksomOAVEsxyW+gj5vJnoChTeWdco6
         qZL42QD/KFvIWCo6fC87RkDP3GqQA7Mkogp9CZ+IIqo3MiwG8jOkuatLUwtba1Qmxodt
         OmP6YjZJ5TSdrrIPjwSdTsUaOr3lKEzyTBFcuTWZ/fRFYP/cZZuHzVdXl3w5m4v/wBSM
         haBz1QK8IY/QHyocdE5G+RUz29Nt/X2TJNwsoNiUQbu5nbPmeKp9oLuUrVJRtN8KAnCn
         15BH7RP3futcSPGcAyVHnylne+yEZMVI8fQvc5k00wpCe1zo25X6b7kvGE7K88JCHYo8
         l7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776669726; x=1777274526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDIniOySTzGT5p8wsR3mWPyJ5w+on2w+W1qyzBFCzag=;
        b=R78jroON3aMXdVPsjPCW1uvS4PPAuY6U2wwlGkOow8FkCHPveMx3O1eW/xIo1MEFp+
         HV5SqqCyfd14Y5cSy0GcXaFhfi0idVoguPYcTUBt65qqU8g/smT1RYIomS6sRa5zU+TC
         i9GLzbtS7SsF0/fkzC6eiASOC0KPQ9Bo9yy+BcuWV7e/ETIlgREhYzzRKB8GvKxwz91A
         /LI9BJaVKf8oIXlXIe69m0bdHWPlWwI14IEGSNWXfzikjFgv90lCbeFr6a40oX8WeOCv
         khabtZ/h1xbX6aFe8tv61L0qMuz0gABgOMJlJF8Hoji8E0UyauYBzBfRMgq4EeiZ8T40
         UbeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+D0GfhZCHot0RFVdEZws2N1znitIG/87rr+uiwWBPgh+0um0A4Tm0DRbJyG1h5G48yxxVZc5KXRchel2yHxr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0Pl1H2OwSRO+hQFPJ+JoJDDIAg73EZomE7/hfBtx+2V9TbnI
	V45sf4MNkX9UbcKO2C3an65aWbWWDplYHW9VQmqMTP67Pi5Qn7UF0d4jY0yBG26swxcKjZY6xDU
	YNo4hldy0NM5oWLpL05KFWbBiL+9S2/kHPorMhKB22VHnFPou0Zk92jU8
X-Gm-Gg: AeBDievDirUIfDJgavZlsJPqO11bCDW514PuJhYcXO/+jHA3homebfMBiUCdHd3KkZ9
	BXI4g/PsU4RMDIkEplnuYqUNosSiRCbxzKX169C1WdVJA1hbw2tp9ikZGnlUVKPVRloJy1WCXNe
	BvKhU77L2WIph52DOTl3Cks1T8NHYlm4+OOeTrIMWfNIdu/aWq+lMx8WpG6nbnuSVSmXqusTfto
	GEpL5srfGhh9ORcaFbzovdgcPKI44WOcXzZdR7FEdjo41OZP1TcFLcgWZeDDzv99+9b1fP7zFTG
	WUcDmzr+wYhfBe0Aa+7nYze2aI4BZ9MsrEuS/PbhqmJxK2HwcsgMccErTDldDEopzMKjMR9R6B6
	Pi4nr4Hlf
X-Received: by 2002:a05:620a:4612:b0:8d4:aa50:686b with SMTP id
 af79cd13be357-8e7911ce9cdmr1760867885a.31.1776669722994; Mon, 20 Apr 2026
 00:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420025428.101192-1-jiayuan.chen@linux.dev> <20260420025428.101192-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260420025428.101192-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 20 Apr 2026 00:21:50 -0700
X-Gm-Features: AQROBzAPtbdNncUYWcDbX3rq6a0AQWH842ELgzylDrIvAQmNen0p8Yr8P2Snyzw
Message-ID: <CANn89iLOoA7=rHuGKY6xKUWrVksxR-EoRJ1xWsPm4quBdqWsrw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: send a challenge ACK on SEG.ACK > SND.NXT
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 7:55=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> RFC 5961 Section 5.2 validates an incoming segment's ACK value
> against the range [SND.UNA - MAX.SND.WND, SND.NXT] and states:
>
>   "All incoming segments whose ACK value doesn't satisfy the above
>    condition MUST be discarded and an ACK sent back."
>
> Commit 354e4aa391ed ("tcp: RFC 5961 5.2 Blind Data Injection Attack
> Mitigation") opted Linux into this mitigation and implements the
> challenge ACK on the lower side (SEG.ACK < SND.UNA - MAX.SND.WND),
> but the symmetric upper side (SEG.ACK > SND.NXT) still takes the
> pre-RFC-5961 path and silently returns
> SKB_DROP_REASON_TCP_ACK_UNSENT_DATA, even though RFC 793 Section 3.9
> (now RFC 9293 Section 3.10.7.4) has always required:
>
>   "If the ACK acknowledges something not yet sent (SEG.ACK > SND.NXT)
>    then send an ACK, drop the segment, and return."
>
> Complete the mitigation by sending a challenge ACK on that branch,
> reusing the existing tcp_send_challenge_ack() path which already
> enforces the per-socket RFC 5961 Section 7 rate limit via
> __tcp_oow_rate_limited().  FLAG_NO_CHALLENGE_ACK is honoured for
> symmetry with the lower-edge case.
>
> Fixes: 354e4aa391ed ("tcp: RFC 5961 5.2 Blind Data Injection Attack Mitig=
ation")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> ---
> I'm not sure if 'blamed commit' is appropriate, because I think
> it's due to missing parts of the implementation, or it might be
> directly targeted to net-next.

The Fixes: tag seems appropriate, and net tree LGTM.

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
