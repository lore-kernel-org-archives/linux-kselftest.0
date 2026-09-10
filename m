Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9A27AC4D
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013139; cv=pass; b=TLFyPhTRsZThgmolYkDT4+p3QxbiDKcwUysNu2DgJaOGrzdiTIOJcDU8+vqLXT5lbpPQ20uSV2wLk10BsWl2X2yiMYR3Ui/0vx5/r7hpGqEj5qO85SgAegc42cs/g7uS/xOEAd1iSX6/6qc8IczI/t7iPNijjRhD/8nNIBXGkIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013139; c=relaxed/simple;
	bh=cIB6oLLxIpfMMXfc6SPhaw9BgxUvuAuXYXicau/x3EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MM1zfS5jtpyNtpkY1GEEOEHlzezCzaXb9fQNk1suVDpRMktJVngjLkRFCO96JhbcgW/PADLEwJiE7DXM1a3yWEEZlYe5Q1eLlKCfjyzoxCMgT7rCyatrCbLA7+LcW23Si+1dltSGgBmvX9fd937P7+qgwHqbBWhaivAT+Yclqgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSIvP0YF; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSIvP0YF"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a468f4c547so43558631fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 21:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789013136; cv=none;
        d=google.com; s=arc-20260327;
        b=QQ6zK5aBKE/VH4VnMMK8ye8sCGQ1EJIUp8hYTRKhOL2skBZC4XH9HY+T20kRa8DWQb
         Gi6R3nhyiT43l0QMHfOvg//0ACg31BuWnBHQT04R5R32pTiMEL0L9jAALD2Qqtzzze4N
         bRMGlIahz+N4E8h3tmiqJ4wJTYjN9zxTiZwDMOKpaOd8qD2oF3o2DD5w12oL+XT5vozG
         hVFcV6Y4lNxcJvUT/P2w5SeFu03uhk6GGIV2R4e5rZAfua44N+at8SVzkAHbhSqdCC2n
         WiXEkMxUlmQmPKQElN861+4tFj5SvZukiZ4aCKIOs4MCxigZCowgvC8PDqAOvwG8WjhH
         pbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        fh=FXEVpnYt107rhERLUWULMPyL+Y339HFGZNXwDEt6bl8=;
        b=Av3DIxgVl2oEYeX02YoNDAuYgCQc8eZ/zwTYUw/pFv/yFufPbUtXNWgVYbUuK24WV7
         XOEA/oveFlz0fBRPmH6yZx+P4ioVt1B8AZFA7in8PDoGJ7D0hOKRHzbejYls+6qy2RLJ
         3KkGKjkt2l5DkvwZE/cmaYqK9191MS86vwA3lIwZq7IFkHR27JaHhyB+mygCepnazl1J
         gDgm2YmV1cZghlwnOTdYE+uE+XERlSG99iLbyR7HBcLyUZjaRnKtJPC0Sn8BTx4qCXWm
         4H0anDUWYcxS+mrl05HvcbCyeQg9tWtbC92Wrf7eAmp7niC40soet/Wa3PiDcYwlDZgg
         dwoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013136; x=1789617936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        b=XSIvP0YFENBnGXk/ya+4tmRlWSVGZd5JzXbwsFu2XXK8pvRxrrBYjlzKgsYF1Qr+2Q
         sla61vAw6ugcyj7iNPJ+g0rzbTeQX8KoqeFeyWXuC5KSxhuqX2XZOBOeyOmUGfPOuP6l
         HYiV2dq+UZZ8mKc8x2jVD0fkwW/ZtjiO2tZqZfMzGrdsdqJpSsMmaFlfhsqcEN5FWqMB
         mGF8FIvxGCzRhFtZh83gitciEnGm7mjOtz05kies4KsTAIKoR+9cN1UGPxx7f41Pt/r/
         EVKmd0Y3zlLahR0Eo7CKyAsdFeOCvgPEPVkN4qL09Q9BgDUbRj3kYLFOaTvCaYS+BtDb
         yfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013136; x=1789617936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDVcQUv0ft4THKOXTAkOW6jh8BrJrtEn9YRLIX/ZPD0=;
        b=oRjRPxJz73yaAPD9Wh2Ohyb6sslVKwkulQSXYbomI9zcZAXm+LH6Hs3Ny5ZEP6A091
         Oq2Pwdb35YzyEyxPrB7d81pvvioqV4KCotELLbUraqZCAiG/Xpxl+JUPAlAAwLoA2aPS
         4YfPWBzeHYuq+kyh3BRFU4yw/S5sov+GhFeIzxkBMMHyESrgZymV0qZadhz9HQ1vvLRA
         2gZ/HnMypZFdUVlrkHkT94YrDhZDG5rXZEhVQv/vfMLbXkNqrOAqjck4xAzHfeRJiXl8
         D6bG5trOHUPa165Xmi50an65jBr+z3S/RCH8XSSHGh7uSxqE5kJCVxwT/MAdWAuZ+rlJ
         Rw4w==
X-Forwarded-Encrypted: i=1; AKwUvBzeA5Hhrva+w+aj0DjrEfzqw6bnT0OpX6KUbXjmOPowVQXVBtw2+2IAeTdAM3FyjFkhOEUf+KZUyDMRQC/xwpE=@vger.kernel.org
X-Gm-Message-State: AFuF++mWRzMGcmDhVuHFQqgTKmEiGE6CT3Yfw7fackZxkYeSsFwXvb0y
	mOA0Yp4s19+FI8PVNPeNI7mfFU8tKRWqF61+nxgD9fnSRNXqej4xAHCsawDX/l5Dz2oAoR3MUfq
	oJrLhFSpyvgt4qoaApyyq1JpXx356W7A=
X-Gm-Gg: AYBFou2AaxacRAsYc8iK45TKSvM4ONoZr8D9Ox2+RLk3WYUVQsNQ/Hj3emGXzRtqlp/
	uONbKxsN20Vz/Z/KBOkNZwilmJ9Nwn6VU4xGgePw9PQNg/llBrTgnXng4k9C4wMSZuxtHiphSOY
	P3rC4Qhuv90jxIvLoRqejJlqEoLOc6aY3tTFAAKdiSIi9U01CjkJ4cssarRe+ZcAm+xemZdOETe
	3uISmEj926BAD+r+yySMbPaY9gKqm8e7PkCc5IAv9ynfTqJKLaF055qpJvPwUewXq7JcdFkrxlX
	GH+1FbYIzIbW3gEYBzPQJOEwannhUz/HviBYHO61NcijkihY1nqLl1d3ISVKQJCveaEZ2rv1OPk
	npWvGjwILZK20z3PAbTvlFYU2nNhCtZLMEfFRyUH1Ig==
X-Received: by 2002:a05:651c:2213:b0:3a3:749e:319e with SMTP id
 38308e7fff4ca-3a3749e3381mr39434621fa.18.1789013135821; Wed, 09 Sep 2026
 21:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-4-sigefriedhyy@gmail.com> <178901169484.219967.3624591832079760064@kernel.org>
In-Reply-To: <178901169484.219967.3624591832079760064@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 13:05:24 +0900
X-Gm-Features: AcwNN1Wyvr5GEUMi694_30SRPcVjVb5vZp8y74DSCcC_5qtyY0PjOtWZgmHeQ78
Message-ID: <CA+7S2v+7tGH2vRnN5g_oWLwGs=0JfFCX558+CgGOGAhWM6VxwQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, 
	horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>- [Low] dump_mcaddr_l2_check() in
>  tools/testing/selftests/net/rtnetlink.py dereferences dictionary keys=E2=
=80=A6

Same issue reported in v3 thread, already answered there.
