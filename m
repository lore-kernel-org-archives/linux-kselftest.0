Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795282062;
	b=edpC+wUoEhR6MzcVKWDvHeJQxoLLR0awDIbDG9EXyNiIvFyXr8nyd9bG/3kDu1ZzeRHi
	 aS5bEgIca7fiKlh8jLPPQqvMkrqmEoVwLXwYkkfc8dEUhNfJecPSqThoAJVUORw4Dv7Vp
	 4NzIThEojcC11UMnTOg1eIzIAdBCWmAlVuc8fsuIsK3K9V+dK6huvl60Wag1I6l+fsiWV
	 j0PMlB4ps2cZow01nDvzbMrjUxI9Xev8lMmnn6mu5LMIAX+qel98mj0Ek/STTTYSFY+Z/
	 3dXq7MiaAr6aaLCiUuunpXhL0gcRohwrbiXCFnBhxxt2GX7AK7J7RIR7IITG0V02UdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ktBKIek4EMk6enUgNGM8Irq1UakO1dTw/0fxPeN+ZzU=;
	b=imGIS2wbEC2vTAQEjb/DDDSgUCrAG3S7EPDXK2eaVhZbob4tDxTbZe9Wu3y7W3cmh9Mq
	 Rk55QPfWc4yvQ2D5sORUHAhE3m6e+3y4GPPMjUli0MyyJeF1DQSvlCVKLd2v2VCH617PI
	 Q23/Nawiznwrc12nsqrrkQxfSgDWr5KzLIDUV+X9NaHsO5W7iVaMooCc6SbsoFgrvL6Ce
	 60Odb/Em9Zq+PUyxWZ+HfQQI9WC6RyUgvH9MsmIdCB5oKus2+4B+zlYjU24hOmilrtexS
	 TwvhiC9cfipMX0GUuQrLsIhv7Csaikaeyb5dXWGlpHRNEPOHzS0i0SmqBZmfgevQruQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=northecho.dev;
	spf=none smtp.mailfrom=northecho.dev;
	dkim=pass header.d=northecho-dev.20260707.gappssmtp.com header.i=@northecho-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hVkSObN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D99606A32A
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 17:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=northecho-dev.20260707.gappssmtp.com header.i=@northecho-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hVkSObN0
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716f259f52eso43061eaf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 09:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795282060; cv=none;
        d=google.com; s=arc-20260327;
        b=WF314Svzo+Olwk2Vs/hIr2118k8dBH4fKzXghNLuFOqUWTN+qy2109cB5I3SliqGVn
         x+7AzjjfjuA4kz1vlbWCxdpb013LO8nv3U2+bc10/hZIWJpWCOoxLRADHVNZ7epB4sj8
         PlIaHY1QStyexcThhOn3tI8MosLJcKefKkEAMXi23ML744Qv+EeCcuhnQg2LRSHYHiUq
         vcLVQPfHLO8xr/WU0Xzr2uIg3pTfo6FqS6Z2Asyp01fDZWMxPlcEvpjTyot/yGu2Bei6
         o6EprOxSjWJFylDCxLG30hB1JE8Jiy2u6CKw4oyvKLOXDEMVTMx1zgfXUDTOTeoqmau1
         dXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktBKIek4EMk6enUgNGM8Irq1UakO1dTw/0fxPeN+ZzU=;
        fh=AdmEMRzk58n2baO0bIKoefgm8hlunnTeiSvcDUb7wcU=;
        b=JD0Y0LUPs84zU68NDVd1/eRvHigxh0ueXqtWq018YLYaIc4zTojxgrqlHuzm0EwdwP
         Ihuf7Zjk6D1YM5cbT/5bpuULmDLedmMMOH3c1vZFAoo3p8A+wy0lUlgDieU8fpmx6DKF
         d0cK5eK/s7hLWn2wcK2MfEjA/HpyWMz7BEVWWz1Xz2j7t8cu+6QkxCut2KzXKkxqqy3O
         Q529mwihT2gg0FnWgO5/sCenWQPg6E4yB7WbbQxCT4YmrOf1Xed7yIVvpwQ3pw/QlpMA
         BB0p6F6rv3JTyUHtDuRC+P5my2G68KmDVtt2o4KNlQg9l1y+HJB4hNpsCoVYJv7DvRCF
         LZLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20260707.gappssmtp.com; s=20260707; t=1795282060; x=1795886860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktBKIek4EMk6enUgNGM8Irq1UakO1dTw/0fxPeN+ZzU=;
        b=hVkSObN0rdMle4xWlrloNKlZ+tPLJhlyNiJ750y4bBrNo2nvb0wfhDdW7IVPCM4C2Q
         NptodQkOkNTHcNfbS2iZHysFUP/bVIT6vuRS9JfEkVduHlDKT0dIM8uBzHDYnHiTe1Y6
         oAMUKBaWV2BrWvzQQ5gqPKRzWuMn+oAQMgz/Zf23OnyhxtwqG3XiJ1vVWXB7f/f3nR5J
         bVHn+cHuJDH+s+6UsHU7+mSGMBvtpBm/ASA14c9asxyKXKK2BpmTGZwj64sCCKU4jCjy
         c/RI86xCw+18lYMXHLmqZShhzCrQVw6InOqCyCZs6yY7H4U+rSoMUbWi2oR/9VD1MJBX
         9Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282060; x=1795886860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktBKIek4EMk6enUgNGM8Irq1UakO1dTw/0fxPeN+ZzU=;
        b=IxJBmgRRNLr6kAQZK5vD8ZP2GdsAcZFTl/vQ0hWhG4v3ZAe1DWj6uiB6fi0W4mo5Pw
         PqsA4RALn5ZZ8Wyr5GXrqo3jzbNCFsFwlD2q2p5Dq41u6UTabxm6c3YQu5Oz0Gfed20C
         pI+pAvEbr/jUfu1NaD/ibLecdLKthXfzgrzVBZsfYBnl40YL/TJd5scDtQuLFkGo/awE
         4sPb4LMM+ojrKusR6tQJ/ROh+dvvE2gZ9XL7qSLWKvNjGHsI1Xcn3+DduLkVoe32a1yo
         jWJWos5Gu23mhWm2pCnO4JQVOb8Y7OzLdmbWV9OmLdPow0OgmxyJfstyHH2dNOa7j3LW
         r2+A==
X-Forwarded-Encrypted: i=1; AL+hErHwzbPHC4PwYNXoQ5643OzWzKBFGicCZHVKYlNy9P0/OyX4F+8ZObm2oi7Iy18WBHc/Suz+FJtMKcWaOwn7m+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GVlQEKMfBj08eQPhz3U7Ac6DKUc6jCSZjGzhwQvXxZuR6Lkae
	TKm3Hl3w/+lEWg+QwdnNOagbquYC3NPRzIKM5UVO2Mxsa5svMGwNDJ3Wqv8UptNHbRQBl+nQaOZ
	fu7h6LS6JuWcrZBFKSmTjeaq2Vu82pD65Bls0KBg0B94=
X-Gm-Gg: AZFdTZe9a+55jnn5i110kTBecPXVkgNZIbtSNQSSJ5dgqQ/f/i6s6DffVZV77vysrT0
	sQc0I0Jp5kKszF3rC+2zJGMJ+QJl8rW9HmmLgWNFauGGUAFk5EfU2SP51v+4O3dAvquYVoZiZdh
	TB0ARR7CgzP+16dcBsEHzXeQbGssDilrz+WZ6Byo6D8opZ7aiYGwlvrHv8R1vvPaHFS5LQk9BwS
	HwyJWBFEEdREOa5aPFZzRl6GbicRjq1qOb5tlzkiti1HDVU5c3Gq2VoqmUoithGq8PNcNvtoapL
	EJg2z5miYUwT8jbi4g5pjyNwaVFBySEQ/1Ecp0/z9HStuM7RZ71c92WGE1vaQpED4G0lPpgp1BC
	BFEceuACfwEZmngpzj6G7JtnOEy69A+ZqZiFJvabbsrscE/V2OgQ/VSozhXQL0jJZgIk=
X-Received: by 2002:a05:6820:8599:10b0:70d:73e2:ff02 with SMTP id
 006d021491bc7-71b3932ca28mr6441341eaf.1.1795282060643; Sat, 21 Nov 2026
 09:27:40 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923163321.79770-1-clusk@northecho.dev>
In-Reply-To: <20260923163321.79770-1-clusk@northecho.dev>
From: Christopher Lusk <clusk@northecho.dev>
Date: Sat, 21 Nov 2026 12:27:29 -0500
X-Gm-Features: Aa3M54orh1M5O9_qcAUCF6E4VUevGUSAveunaEstDX0bKk1tWEnBw-GosaSS4K4
Message-ID: <CALgo1C_xLcfb_SoEFoJzyE0ff_XHywUDcWrLKZfLE1_fYZ1MYw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] landlock: clarify TTY signal scoping
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micka=C3=ABl,

Just a courtesy ping on this series. G=C3=BCnther reviewed 1/2 on Nov 7; 2/=
2 (the
selftest) hasn't had review yet. If it's easier, 1/2 could go in on its
own while 2/2 waits. I can rework either one if needed.

Thanks,
Christopher
