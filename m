Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553596;
	b=FNfxc41JmUdXW7xk8TYj2d9pHmf9jmUs22M3TUMbqnWiIqdo2NE2YPYouzK57c/m51E+
	 hbuIy+7A0LwdHJ7ah79SiLJ2goFB+0UaI6W6mqbjfPHqZO6OBg8WdfJtUfwSBCNxj1/Ez
	 dDjLDSL+Dr2Q12lxQu1TW98NHmY+0vYhHFqt8hrhKghwazkqqchFDM3qr0HB7K08PKnyA
	 Ld889Q5W7nAlteN7dJ8CIsqxlc2DeiBiiojIlKlDG8z0QJVxbRWSpua+Qif5IzRG2CJ/z
	 wV73GqZn2mYyaKHlG+CzUkUMXMlRAIVHRep2Qm9DS1dnKnb2cl4KAc4hp04xQjXSD5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
	b=0w2Q1GY4NMtUgEb5OsS09ORRQfch7wJtFHq9PsXwzGtahEsHO2dCW0X81BOYFHpGoBOm
	 B/YuCgYDJ217Sep5pCzRtPH5JYXncaRjLzHaXYaYbGMHM7PGOFrZVtyakd+tAiz4u0qfT
	 e3rwtxSsImcIsYnHSD0k+4oduB+50Z+PJV+1/llAq1cBZPkzplspTZ1nVD4N5AeKeWr+y
	 TfJDJ905fsbj0C+5dsDlLHM2eVoEEyHu2Sc4+RyaaafR7/YZgFvijtaK1awMxG5liSf9a
	 NiFjenBVwXEkc53uYDqsoE9O4CCC1xmY/CH2sm/yeg1NRH0dXbZ3WFI0OBk2MI8IIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=X5XibFYs;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5AD606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=X5XibFYs
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6fe4372c5f3so125552eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 20:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792553595; x=1793158395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
        b=X5XibFYsv5I92LrAxuIAIELYc8JWFexebLAbJJ7l0SbZdhwQyds90r9XxKbIeJT38y
         lUtjXHEJpFtgxndozNIty+KNblvj2GWDRpr/pyW3WmPZNz3mLXHMc4OTIuxjngA7D8Ne
         xNgeawx0Ro0KhLEL5tI7Wn5vSucJbfY/gR1Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553595; x=1793158395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrdPTTT8LeuGKw/UCJIAORDOHiF4eOET7WBKgWyq0CA=;
        b=2QRLcSsyhOgAJPi2tpogxrHCFlYNbRHgunugdu4OWRILpgfX8pU+Qqri4Kctgkd96c
         /hxUtPkVYES9nqHHaDoczgWV4gSFE7GyDCHea6nkat0yvSzJTOFhXTQR9h68xOjxy50Y
         qGln5cvC0rJueGr95fS2XaheDHe6N3syKW1QMkK71dDoxd2UVjxDKTkWtlf64ONXiDkD
         fEQKjcqFEoHmFJaf+SFMlhFt/b+VRrY3wndyyY21c28lkLnmskWLPDXlzFRV3FBxodBM
         be0reXFFvdPdhhLPLgY6y4DnhdRxs4pevXDrwuR5/yn+Qy7+NJFGjmY7JE1zJA2BxDXg
         FXYg==
X-Forwarded-Encrypted: i=1; AKwUvBxhR0xKuXugVFTOp231Y6ElbyiQDIzs4FR+6yHGojoeFLsnW3Eet/wpmVvrHfuWcAPaifcp6UVbAsuK2fHcgms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHDOeaEPKDwBjHXJlvD5MCDAhTzCccrl/6BgBKmiN2mwWR2Uyp
	l3azuxXeChE5dKUkjreoFZDp/gseVWp+VVlFIlSBaaSI5MMiqX0ubBm0eQocbM7M2Dc=
X-Gm-Gg: AYBFou0GKCFJZmjC/lH5dWpAbpZ6HCylf85jmMowJh0qLFz5lpJzodSb3HYpLgj01tm
	IfipTWShPQHfcnaOoRWoMsKYtpvyASsg5OeYy2zTexH+wxqP1TK1hsL4ngIwLggUhAe8EnOIV5V
	b7Nd6nrMW88p0+KGp41mY6Mh1V+UnhZYv5C7xyfsJC+FsVMv3nOTJdAKI/v4CxQa/H2CkJFyL8k
	smLXUvubSzoKfKijHmUKfDkes4xHXIf9khrQZ0B5dGixvuJwCAs+JE12dT8jQo6xDBWqRgImTZh
	WP/BAbgmtQdBJ11yIpYOZ1hy6JXN+T4jzUyIlw3w70uXVnCZqMbPpngF/2cNBi9NTcpKmkT0FuE
	4oqSaa0dfkUi/2Z4DkyxeVbejCQmuinrv5/DGRrudMfabMmVs4J7gq7ND4oZQcoYCRHrdwqv9+K
	FTmiMVpdFXisIuhIFzq6zlJYpU18z2uhNKWzb7RxyBIOx1havfbKr/xpS2XpGgtyBGunnUdznTt
	fKHt+Whc5XYRuntG5PAYiurhKpXuo7qS7jyyZtO8feYqRe4EWUFafd/puXZlEsqO8bOGZmipCVp
	+8Vu31Gh3I22WKn5MeIg7KH2/AQ6iFGzZI2amQjbb3Uj4H87chpFQLqb4qTovwqt6+raUW2SLqF
	e9L+xKw==
X-Received: by 2002:a05:6820:1f07:b0:6e0:edfa:9b48 with SMTP id 006d021491bc7-70941830650mr500639eaf.77.1792553595173;
        Tue, 20 Oct 2026 20:33:15 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d2a76sm1333653a34.18.2026.10.20.20.33.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 20:33:14 -0700 (PDT)
From: nramaswamy@openai.com
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell.sw@gmail.com>
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	davem@davemloft.net,
	horms@kernel.org,
	jiayuan.chen@linux.dev,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	ycheng@google.com
Subject: Re: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback after partial undo
Date: Tue, 20 Oct 2026 20:32:19 -0700
Message-ID: <20261021033310.46029-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012012601.27658-1-nramaswamy@openai.com>
References: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com> <20261009171447.291802-1-ncardwell.sw@gmail.com> <20261012012601.27658-1-nramaswamy@openai.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Hi Eric and Neal,

What would be the best next steps here? Happy to give you more time to
review if needed, but I can also 1) send another patch with Neal's
approach or 2) send a patch with my proposal to move lost segments that
meet RACK's criteria to the lost list to make the merge simpler.

I'm still unsure how best to handle the -ENOBUFS case I mentioned. If you
have a preferred approach, I can implement and test it.

Thanks.
