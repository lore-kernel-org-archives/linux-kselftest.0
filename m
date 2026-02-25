Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634E0230BEC
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001053; cv=pass; b=Fdea7cdsJTPJpc17t4tajwdvjPIWXHDxwqJzWBPOB4HgnOG/yOhaa6/ET9CoyYOXTg6J/HC3EptmaIZJV2VbrTJT1P91zXpTjS7j6Q9KyTJ7MaQMxn6clHPulSdiURQLso10D9lJJ88hwXfHChmhKs4Bv6j9FJa0Tnygwqw27SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001053; c=relaxed/simple;
	bh=at6/P3ttNsCUbOJppHqZ2pegCdYl3F2OUPNtjyPlap0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQgq1dy+T8JS7rkJTZttgDVV3RerkyLbyNLRY8f9c/I76y82WO3sOX1B0X/MBmxPtjpYSxOT/8XkElA+myAxuDlTWo9pxY98IvQ47nfNjIcNUsF3TzfaFq0AlmfeCI0weuskiMvj++YOJ1JUPCvWI4WFacSDbEiL3HUn7Cg9BOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBROCg6T; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBROCg6T"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a635476fso5988404c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:30:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772001051; cv=none;
        d=google.com; s=arc-20240605;
        b=Ud6XzWkPHokXYKYAQ51+vsMANBvPXuAgPPfKBa3K6rb6P1qfCSvJih32eSu1Q13SiT
         zRFnm/RANTpC5Nx/eb1XlwTgKVZkdAmp9CD5T49SMI/FB9QJkVv9+bvmEk3pnfu0pEgu
         vf6ZpheB+PsKwXfmz9IakON9t6FfeIxw5p1blGNBvD6sKv+RW29kth+Mm3Fislmz0pCF
         nlMy5Rw1OLMKDk3iirhD+6BEhfB/1jz3u0KZj4NMAOVO19VROM4pUK8L0dV8mLvzLE7P
         WNgf2Cfr8iQ27u1bmsfpRYO4pVVpEE4Q6dWJRczPaaOlPao8Inb+A40oN7I57cyfNmvI
         E34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=at6/P3ttNsCUbOJppHqZ2pegCdYl3F2OUPNtjyPlap0=;
        fh=aDH5FfqsoeZjsPu354My9Kl/mCRtAGPHMJkXqhg+bEU=;
        b=GOONZKUBvVzs97vmzi16TUUGk9FfboVwWg8wAcG78JwipQBLs/xD02gX9Ox2EVhRR1
         llUg068sLB3W9bMJJun4X6vEX5uP15+sPdLwMKP3ds4RruJNfiGqfFbCMTw26e5xdGDK
         3yFkEr2xm8ccsDpP7K6GShanu/Otvc+UFVCtPWjMfZfPrKhvqOkmxheUXb6HBMAhhmat
         WeS7i1wb/SVqFbPR4bukw15XOBt05bx7omWtReXOSlkhMkXIzmfjL0hJeMfpQOV26fMA
         bLuoWrLZ9Wb0FIkHvYaQsiIkCEs0wRQS3Q3aT1YMDB83R1QKbLzuOqpAeaH3aoRVTHH8
         xspg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772001051; x=1772605851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at6/P3ttNsCUbOJppHqZ2pegCdYl3F2OUPNtjyPlap0=;
        b=PBROCg6T5ayen820I9CSeDhy7v4wQCqtqcFPeN1Gi91L5mUeVmHp0Drmj5Iar2DUO0
         yo2s1h/p+2iQ51If/GTfHV7ciQ85kJDCmfOXuboi4HDTbIIJJRaVZvXyfFtpRjuxaU3k
         0IEWKgObmWtx/vI3MXdiSqNRu8GzrTOfq81zWF7BFula+tUZ6RcH/sLk98yjKbnWFZl9
         kSybsYpP+tV86bDG0nIwj2JH0MaofSLA/0rt7QSklKImazMBC0bXWVo9NJj3LT8wS2Ss
         t9jIoVLi+9xE7GX2jKmmCI4c62VgCh6VxIDndCaO6xO7FOjZynzi6vh5j+gwpqymOu6v
         g7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001051; x=1772605851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=at6/P3ttNsCUbOJppHqZ2pegCdYl3F2OUPNtjyPlap0=;
        b=rt6VcdQ0y1n/pF8aN89/xv9huwReW91tSnIu4sqwQZLiLpenqy5U95p4R47xdxBw4V
         mOEsSt4CCEFf69zM67DyvAFa4vlwDOAqjJJ1KsuUrhQB3A7LkAbwfCNzbOsGQ1e3uMMy
         J6IWMHQFj+5tENNqkm5la/UzbWeAVjyK2G7PJqO+GzWNtGEjdmxI9zv7a/vNDWYEsneX
         lVGV2ayDcjmtdR9nWUKF5M4wtQaTjQ3PVptDJl7QjgPbIdG8OUpzSnhPiBJa/h7rX5vl
         LRSVJBNVB1B1oSv//j3HgYp4xCIPr+n64rxPEjk7Am9CkeF4GIkScmJsZZzd70X1BCiu
         2+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX56km9xkRotuSGA30lnAr7aRywODqwL3GnJcoCqmNIFSBTtdQo52CiWCDhfDYEQhyimYjRsOMxioKfGwZqJo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZLqkBPtR93bERKVgHG5ZHr9ySGwUoU7E/2sWXm/CyfczWfnO
	BsfzFblRDiPNBvAoYknRBayS7uQGr5b4Cfi7jtwcXyQfm9Tewr+V4cTvMkYQ7+rfpB7Iswxkth0
	g7WWew7AQMIvmb2Bd9APgs3HRm8WFcsIUvlAuXaqx
X-Gm-Gg: ATEYQzzCWAeCOYT30G7WDR5vrOhZc2SkgNdsJ6tBiJpJWPBHD9yn5zhuD227qnxPbw6
	1nSiFbCy3ZxlCEc15oS4YERkq2YFPlWnPpPXOAKFe61L5+faglcNOosxo3CMWOKJUXIAxOl7C03
	ajOEaSRqufz0IpnRHqD+n/Tdn/uki4EAf7kgygwEtcWwX5NE86WrKCV5Zt03cjGuEpVY5E4cyDz
	FgTD6sPRyb7NInLX38HkMx6mT6lGKiFQfR1v2VWxhnecxFUamZrgb0/AOa93ghaxD2pO8y7jDEh
	lT7QGQurKI/nj1evNgBrIIgbSmZmCvB7dSwwuIB0cI2jhvSwziT6GLBOdqMrnTNG/OMwDbxD
X-Received: by 2002:a05:701b:231a:b0:11c:ec20:ea1f with SMTP id
 a92af1059eb24-1276ad1d358mr3834738c88.33.1772001051061; Tue, 24 Feb 2026
 22:30:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-fix_zero_wnd_fin-v2-0-a16677ea7cea@gmail.com> <20260224-fix_zero_wnd_fin-v2-2-a16677ea7cea@gmail.com>
In-Reply-To: <20260224-fix_zero_wnd_fin-v2-2-a16677ea7cea@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 24 Feb 2026 22:30:40 -0800
X-Gm-Features: AaiRm51e2CZwUqzIFBDbMqbi_sIUxJY_UyGodA_Qhpkt_frnps0K-W2qDHbOVCI
Message-ID: <CAAVpQUA8Bm8mATM+dt1bS5r_+krCfnGxd+Ut4rTxNCbF30HiZw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/net: packetdrill: Verify acceptance
 of FIN packets when RWIN is 0
To: gmbnomis@gmail.com
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:20=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Add a packetdrill test that verifies we accept bare FIN packets when
> the advertised receive window is zero.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
