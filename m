Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795059331;
	b=hU4z3vUp8mLL2zlmUyD2ri0wCKwyjPmZAWX1vBqosftj5UHtV05/B4VTf3MfJ+PcSl7D
	 6w8uPTg4DvN5K1YUVLkPf2VGji8ZOXc00ztNvYkgEcH4mwZ/Fr5wgdjvfaUM6bMV0FqqJ
	 0syOiDknr6Nlm+x+i7KODb6tqArAuWsakYnM/QbAj6nWpju/2UBr1Aiv6dAxV1XCDD0w8
	 Gay3vH9L16sKaAESKGD9ea6/8mrP3UhJdBGNblCVhZ2C15cXCBkmlHwJa3q+kvDatw940
	 /X2ReVptJtxIkoNCabL5N+jTqscFJjDuN0cgn32ECKEvsySENrQzaS2aWdKWnpAdPXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
	b=dmehnDQTk4XtIHsVdKecSw+5n+pVMSZpQBGrR6QHon+D5sRXLedZ/jUz7CTAzHDqtjOt
	 oJAqZ8BcoZXX33H4LzdQ10+y0ttWJgoTEHJg55rfkBNwSAvyNvt2l1sTRRu1/CAqn6lkk
	 4mA+DksaS7rYKDqj/VVXAafkiTxXVWCescsomgHk9+/I4srZUXrVN8b92l3Isv42iFrBM
	 3qh1QZ6hTxEyjhLHHjJ0Fo2n2aDQttfSQT5oj/xgS5w/Ed7uoVfLMgnob75GvYdEvFx6n
	 CmFifKg1QD5XKifco6Qe60f5rqwGCltVhUwKmq7Xp4dSRm6gog5sdMxWTXpLDB0bLKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5q8k2MG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AB606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 03:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5q8k2MG
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b2d14968c9so16793047b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 19:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795059330; cv=none;
        d=google.com; s=arc-20260327;
        b=Mcj45i5KzrcvrRazpLN6Dwbl5jRNfUruNoe0T/jBxumY0SFDjzmbex0qOOiCF4txi/
         fvG9P8EtEUi3N1Hd/NWn7N6/h0TfV3ug58D3UOfSHhSS7guYJ82mmaKfudj7Rk1AFBLz
         L4Eq5qYqTJUmFXCVyY9a4Uwe3jd9aTWWgXacHmy6LPc/I6Fh7ObITqxz12htnYq6lVJE
         qrPGbVWGOY1EsWoBc5/LVYSoDfb89y1sBJ9iFs+a/i4jy4aFxTVn5jOF2SS4FdFhI3GD
         GDHuhVuvjlHzsf4iEJY3YH/NTrmlZtO/vguBImeoCpsJtJ6RIQ2AFrJuxPYC4j93iU7b
         SOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        fh=4GTj0WOszw0h82PcSXq39MxjEYcJpof+veneNJykKPs=;
        b=szXIjbkg0cruCpY1joWZl/uiMWHdiOwFSgU+pmLVh8GLVyutexisDJLXJCvQ60RExy
         z+UfYYv2qkQTLH75dUsDGtuNzeBEE4TmpUFbkovUSMNWi8MhOlqrkUqhA2x/JM4nNVeJ
         i6NmmMSR1r9NlH5XBZjGSl2Y/tgGlrs5kxuvt52iAL5IGzGlAlWCT+K3T45OtgKt6i2K
         bIZozBuoWBU+1uc/MdBcZJVxJO9/+7I7cYTlhxKZQ1pn5B5QSwoPGcs0n0IZtix46/eJ
         z6lDQK+w9+RHY/xACN5Ni71Trth9jXZyKIXDfq7+yOYZ7kYWlcnaZ3j8Y6VzwKL/haqw
         ZW5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795059330; x=1795664130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        b=p5q8k2MGUuOpnGEfJtZuofAX15eghfaDILRuOeZkucAaOsg+vRtDAJ2izx3UD9/Pfs
         D4ac6oVbUepQrfGqPpSPWFAp/vQnnE5FqLShnB4NQs3Ba2MAj7aRm53o1PKjTOgS6l5+
         dsD3vJx4Nba2Tppke8XNi8TWF1AJLi5NiSWJjzQj3pX9shQf/Fe8khddbTCxOLNhZObN
         Rxc28mSwtkcL65i9/ZzADsOmDtxJ1DuH3gKD5bvH+kjHeYEUNlt5I4/hoM/QwEPC3OI7
         ViOp9VvclE2wzJI/M5cTh2P66NYDRkOQcZdh5eGNMtSuBaWHQamo9uGXZo5Nc4z9N827
         vO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059330; x=1795664130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dTwcKDHMNVZfmdNV5lW/CAgV1zVqOVJlSSJv03x7V3c=;
        b=YDDFGuvXuyWIAJE3FN9Rsbs3LddHxDIxcpyLLhaboQA2xd+WGd0ETMxmikpvtcEdXr
         BYht+mB+XXk6rMT+7rA9NopE/FjkQCd4ckc6ibBL9T/wxn/o9kDP71pJd1EfOBxbrJ7H
         ebIbPK669ayV3ecqe/K6A1PdR4G6T3KZwg0p3vOLai4Ax/ecT3PGfS7yMQvdgyfvHXrU
         dkvYelJ3yMBlIfJfptvkav+Q4LGHV9h1E+jV80ABTXOIoc3SXZr7Q/++gXWnbrxtEvHV
         jMUGCLoAkTbd+wzlQQNUaYGA6QGTmGnAX3Eyv4aVYgCt/9e/Ts/uBuDHGDJyTSiXDDVr
         kdQQ==
X-Forwarded-Encrypted: i=1; AL+hErEKnUlqn1wmrEPo3ylNr5VYWATcnUFqyeF9LOMvSMzzvFHLxySLrCg8Rsl9o6zB3dWxwyuer/1eKWOaeXQCrhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+coy1TLqn1o15wNAIzBD1nk9ZBhHWHgUtaT0++OdA4vZctQSlh
	wDw2YCKqQcUKXVksnagkZSkWvTve1RILIzXhxufeac/rwzMgJ0X0nH3HoQeLBmZA0r7NZyNX39L
	FQKJokhigBD3Zfaf9Quw9rqKgDcIf09tUBXgMSX/Q5ez3EnntDtpIIA==
X-Gm-Gg: AZFdTZeYLcg1MniuJwbR2ihEY4UkhVvt71jBQEpwkKLak/AOEp6hoCB6dAsDvY+R+gY
	P8xWf9MOO1mxys29aibb5VP/evW6euMuJC98x4PiOzksJ7BFAxbP7QFfkSk0pINf1X5I5wS9TT9
	x1/vNr0DkxQbGlqkC+SIkNj1wT66iF9oYxGlmpzo6is39jBb4WkT2rLPACi0z2y6txZhgBNRuDb
	HfHpyX1rtmnNgAlDMWA7f/OnqzAFDzcM004T77biTM4YJ3nTMQdXowOC2uARZmgX9H/aJUhdhm2
	tXSXrpaTUO8aHtCpGKW4pa5QotTEYNRFvxu9011m40DPwaDyK49+X9ttEoO+Xxhp80MB2XlYpQL
	S2kr1deLPNBPeaCDvDltLFbpKjM5Fc2lGgJdYhm0+XHl3sGAWV7icxXjjLQiGkdbK+JzYDB25al
	Fcvxc+ReeWPqKLlMTl6XwZ/zhdR+hQR3rn45Cm/te7RZnCh+w8bMeC2YCgxiBlkqzGJq2g
X-Received: by 2002:a05:690c:b85:b0:8b4:d554:3267 with SMTP id
 00721157ae682-8b4fea7b90emr18155827b3.0.1795059329731; Wed, 18 Nov 2026
 19:35:29 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Nov 2026 19:35:27 -0800
In-Reply-To: <20261105030843.3319056-1-wakel@google.com>
References: <20261105030843.3319056-1-wakel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wake Liu <wakel@google.com>
Date: Wed, 18 Nov 2026 19:35:27 -0800
X-Gm-Features: Aa3M54rGVyaPN88KSs8RaBBU3XJWLg8t07Bk5yW9RZ-7pR4m_ECj9go4X8bhqeU
Message-ID: <CAOcRiAF6kacjWRdUq=rETV3bO30yk272_PZV7sQn=t31_4ww9g@mail.gmail.com>
Subject: Re: [PATCH] selftests/memfd: Rename local union semun to avoid bionic clash
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Aristeu Rozanski <aris@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew, Shuah,

Gentle ping on this build fix for memfd_test against bionic:
https://lore.kernel.org/all/20261105030843.3319056-1-wakel@google.com/

Since b24335521de9 went through the mm tree, Andrew, would you mind
picking this up, or should it go via Shuah's kselftest tree?

Thanks,
Wake
