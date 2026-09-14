Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A35448BB7
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387894; cv=none; b=nn4QM0X7ZovrR5l8ffMpRjbzvY5PgVGlNvYYxGA8wG/A5qkFz5IP3aSBdyoVk/wp4iJU9lNzQYfgWTn5va7yf1HtM3qAYT0paEsPP3BGy9HjZUQUx2Uvp3LvYZVwYoW7eXBYPZAFZnRgIAdToQD5KfAYkl3PJbQbaf4lCm5f1Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387894; c=relaxed/simple;
	bh=GJ51L6PU73x/ZswKbfKIZvdnD9RqEya+4zhz7G51trY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cz+BOVV28r0OnutUXSDEP0Ogk6SJgAClc5HnsY03JJnbY12H2XBcS5207ds6ddNGEt3PLw4a12UaK4NKHmM7ryAVAHmOrGBdva7SZEV/nLKhwRIHz4aJHuwCaIUu64dPxXG0/kvMQDVlMZgi7zmw+trKFfiNp1N/6AZ7EkpgFrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUOjl2x8; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUOjl2x8"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a125dd74bso128159785a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387891; x=1789992691; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j7bFRNAXoBM99MsZJViu+2uBHjKDkiDMMx9Fz+T2Tu0=;
        b=UUOjl2x8UQAgzCmvVpZsaOwU47Vy377ZpUUt83Uhca3/pmeJ6S0OgXaqkdWQZgSxlq
         WRxWxm6jN4njQ38cOBTvLyp46U2ryLkrIT/zuPZ1dTKDDZ41J1V3zAKu/WUe/UameECi
         CueYdZN4XGtJ3ppG/Z4N/IzKADVa2Xb99L1a3s/WQ4DjqWwr6bEkilaxeL19ualeHuzn
         qyTj+HmuRWVJuEV7Opo2CnJENwbVL0+f37KYyjdQhRQTtqMW8X8gEsVaWuUs8SbJHQO7
         otMhMmp+yGIh0bod0JxYia+MsMn7/DMizQ0zd0e+cfUXD2EYJEpqEY1BBqLANtwGJqp+
         ATDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387891; x=1789992691;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7bFRNAXoBM99MsZJViu+2uBHjKDkiDMMx9Fz+T2Tu0=;
        b=Nc4A7GZgJRgSLD1Q771wZOHvwS/HPZM5JwDs5h39eyWUST8ZOrfA49c6TPl1svJi/Y
         IHFoSAJKFnVno+DiBlJUqQT0St2sBwY8NoAipOY5fh6DQebqO7jE++pe2Zh02WZdE4gY
         u20SkDbHk86RAu04PaCFe3uCoYwBt5yj7Bh18PKBq3pgtH9MoE41Mlq7oZs98rC6uV9R
         KlcXMJYCMGPgbryOzuGB5GL9y4X9vhyMPGR0fZUJpJCZIVlw8gi9yttnec9Z9sw+HFrW
         WdA7A1+SmniYUsJrihkMFGqABFSM03P3kmuJ+I+no87fQIgbK01Cgke5q3sLsid4Q6F1
         jh1w==
X-Forwarded-Encrypted: i=1; AKwUvByJi57DLApo16/8CjBmMe+L0RqJgHUIjcNhqa4DzrC7mvea0ko8a9hrQG5NnlreJUl42AeT7EUCA2VAPyeD8+w=@vger.kernel.org
X-Gm-Message-State: AFuF++n5JcoHQgT9PwtMcjZaUU9MkgWNfN7jplCIY/p4eSa10DF2Pu2M
	3NP6DGUTPm9mvVO7SjjqOgaOZQdQS9MFb9jl6FvInp54do2qQevkdvSC
X-Gm-Gg: AYBFou2RzsAL8AfPgiPFzHuXjqMOkWPZEiVWxtc+2MlKjvqVtfUw/Uwq9Fr0xSL2fmW
	12YLL8rmJRfE1vzpF5BLk0N8rlwua7zPej/FAPeWPIujOrx8wc+mNB3cBEwyvpyQlXzfzo5FEXU
	1OlWhnTrQ8WHqNIU54fmfysIcTHZdGHierMF33QHEtJy3YbCuPq9QRXlamrgC7B2Hfuayn6BLkA
	h1ktCyG6KT2OJ6fIXBoxsm7nMZ70sBPDEQFY3r+qZGlxlDaH+Ts5k2QmeTp0bccg5caBjn2fYnu
	LlbKGtmLK5wcHaq5xbfYYAPv4640WEr08h2Kqs71aLUfUp6usMNhjPULPKNUyAtkGlpcg4fM6F/
	s6Nj6XrM+gLvRSG3CQ890NxYefvbANM68QnUCP6LveQMPmV3hhpHM5gfiJcPGuYlG0DqOsya866
	ZwSj0UPk8DuMUWN0YFyfWbuzmFfGM8XU7dV1tVs8pmDYIlQrziRnb9NGdPTUx0Ymjc+LVD9VKK9
	h8W
X-Received: by 2002:a05:620a:1983:b0:939:e62:bf0c with SMTP id af79cd13be357-93a29709778mr300022985a.4.1789387891147;
        Mon, 14 Sep 2026 05:11:31 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80462ccsm973006485a.21.2026.09.14.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:11:29 -0400
Message-Id: <DLF12GALA4DL.7AWICVZK2PY0@gmail.com>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 3/6] selftests: drv-net: psp: check the ifindex
 an associated netns sees
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-4-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-4-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> dev-get must not report the ifindex outside of the main netns.
> The dev-get checks for an associated namespace are already there,
> add the "no main ifindex" assertion.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/psp.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index 5e87fb50c348..43780efb84ed 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -749,6 +749,10 @@ from lib.py import ip
> =20
>          ksft_not_none(peer_dev, "No PSP device found with by-association=
 flag in guest netns")
> =20
> +        # ifindex of the main netdevice means nothing in this namespace
> +        ksft_true('ifindex' not in peer_dev,
> +                  "ifindex reported to an associated namespace")
> +
>          # Verify assoc-list contains the nk_guest device
>          ksft_true('assoc-list' in peer_dev and len(peer_dev['assoc-list'=
]) > 0,
>                    "Guest device should have assoc-list with local device=
s")

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
