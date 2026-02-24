Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30CB2BEC43
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920336; cv=pass; b=Y6qnXZacmxMgjONIcfNwSphP4On6fUiEbNsV5x7nZYmAfvx3HqFKRvaZSEaFymsUWU0boyeeAU43VWTG4BC/tyzlZrZ0sE3x9yyYPJBMrwRP5tsB8v4ahysgZoFWSy3ltpTr4K67D7cgDZbHSovqx/q+Il1yIHXF+5UAmcac5GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920336; c=relaxed/simple;
	bh=RiLvPWVE0XGnkXkU6LVU6jQZopUhaTIiyl6ToVdk6m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqMpVipG/Y5AGJlc6vh3It4iNYMPSZKQ/1BVjX3vjaYeq68HIYxWOZInkZpX2mM0QeGYakcUN+alOBarJ2E8as6RV38u2kgQ0TBce8x62q+9Yxdnf+Ml+PE16nkmN3VyCv5wE6PX1woM2VGPTxlDA6H076yFMbRpuBWhycJl3ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUdFB2nP; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUdFB2nP"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9f7576d4so265621d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771920334; cv=none;
        d=google.com; s=arc-20240605;
        b=bicqBGYkpJuqnQVd5+SlJ4jsKLuOtLIldFcPXD8rrGzY18lt/MXWnmM9biITZfhwIV
         lHajgXLLhFRIp8m6pN0OpYDE2AJo1sW0z/LbJmR0ZxNr5X1L9oGEbF0KGqeBUG3hvH4r
         kJW1FPNas+6cFUgZL4vepDXqGwZnrVu834LJwLzDB3rPNuH7MRORTQN7Wcbvs8fMawIv
         2BeU3DmaeCkigdjgGPMtPfTDqmiWjhnMBX1JE8N5QB7hpFHRpVnzL5yyfFz6VMJlIWEW
         1eJa24CxTOiVODfs4tcFpTSvWkzdtSIuIYYQDunrKbHwXcV9Nr3nZthEX6wNXM2dhFQX
         B6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RiLvPWVE0XGnkXkU6LVU6jQZopUhaTIiyl6ToVdk6m0=;
        fh=cPwzveLuJAafnPTt6yLSECV56dZQ0mY9eE0/kK8+e0A=;
        b=NNw6tkjwKC0GIIXvl6PdQYSHlGJgeZ5irDv+87N7MQ3ClUD7Kn5x9YH3ML/ZhNarIT
         98Ue2qypYL7wUMxialO8aediodzCHXi4xyWaqNG/9FkqXuJDFAS0jXXFMjDClPqqHivY
         l25OVfOEJNFAVPAwpZ58B4PgZwBA1mxGXKP0S6D/pZlw5wzP5BgEb8SKL5Rg3NkwPxHh
         4MVf0xnAh8BA/VYK6jxQ8UVc0GgIl+8spBlTo1u88I2vH/yp7kiJRXfj1rZP3sX/gIDk
         2tJzOg5CTnoWL9U+BCVhEpSuGsC1Z57DoWlHYWCT9LVBPmMt2DLvNhEo+sGLmJBLW4A3
         fbmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771920334; x=1772525134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RiLvPWVE0XGnkXkU6LVU6jQZopUhaTIiyl6ToVdk6m0=;
        b=HUdFB2nPPiCS4Q4c2ztYcqHxSvL3NzRiBC0i41G1m1e80eWO58uobcDzNRF23RYpMo
         DypDxIIIdTHJEUahGhoDC99e0Tj619n2Oq4Tr7zwNCk4LTdKUoRVmm9dBPL4Ni6suAen
         OEX/LUFTCRdvEniu0+zsji3yvyrgryYEA3Z1wF9mFDBLhBtUJwDTwP3UzuAa4AP6Dheq
         8YiQbS7C7/bQKBJglxbjEKnCMp1Mt4zKlwSalFZHXW1Amlaxh0ZSCx8oPi9ANO29E3dc
         1vNDIGMDXZ4bEDLKDPviAs6P2Acpd6SK70HKV2+qyVyLgTX0IOQCIxjBBq51ttGssMqP
         gDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920334; x=1772525134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiLvPWVE0XGnkXkU6LVU6jQZopUhaTIiyl6ToVdk6m0=;
        b=w3pIRarlnR9dNqsZJ9mbpmqCxO0Dzku56qfZkZl6QNdg+40B2hNkRp9riOfKg0jFNY
         UVqfcXZkzNnpvy0Mk+qAiMqY3G4B07WAv6BCO3vy+tMWoX7ubFMGGy5mKc3tcPocWR37
         MZpsSj5VJzSiS5/b6CA0NGaoRYTzoYA4KgTjZb7dRxUZht3l7CJRvmWdHdZpOf6Km21B
         /Zih6Y/p8AsuyotIHs5UTX+ZWxIUu8jwnBO49qxfH1qKOsAJHCOCFPa+l4ekefHpvrFU
         tNKBX0qdMKR02Qrw69DP/1UuukvEW4f/09ApyWXV4cfv5XMEpavfJ56MOPkfEnhHTKHR
         YCWw==
X-Forwarded-Encrypted: i=1; AJvYcCWmWYQpAtKaLwAVKcHUAM3D03sN4aHmZ7COv37wQxCDqcH4mpbzv6rguIOlmXnhN6fiLy7pykAHtEOonvyHsgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrlmCsS85ah+WX49d9R7UeMq1zV27wjxlEQD/Wgkqbyf/WYS5R
	SPYr0vP10CQvK3FHZrl+E+OgPO3FnUSsqSn9ztW3+r0Ea1NX5ucff1/dyKDQNa6rVzbnjnHhnGF
	VTMBMfZiDuydTzOaU4qnHQfR+uQlLyGI=
X-Gm-Gg: ATEYQzwcfnD0Uh3R1RQKyNEk/OrpTmOtUMd4oFyaLVtRqPvW22v2K84j7+uLZuTJFQJ
	KRtPtVTqZ2eW12BVXk2NZSnDkLpfnglwXN4H8iDvUiatDRce0vw7FYm79YPTHEHzMAM13R2Tqrv
	T7Vas/x3tUYAx55CJHwlPnvXMQvYJ2kbrOv9WCQf3mPJErPaJ/bNoTRHYwTn6ecwhy4mk/hquR1
	K5GbyC6irISXXH5nDyfYjXSI+3pRUeaq61eJNWhMggkucM3LU0w0xcNwuoKdVFTiSnVVLs7vEDB
	c6OhMIFIZ46qsX0=
X-Received: by 2002:a05:690e:c49:b0:64a:e61f:a6f4 with SMTP id
 956f58d0204a3-64c78acccd2mr9210920d50.19.1771920333731; Tue, 24 Feb 2026
 00:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
 <20260223172214.5d8ddaa1@kernel.org> <CABFUUZEuMCYYfi-SapTLT1BhYOWBk1e-OYh+h9fOZcfoSP06fg@mail.gmail.com>
 <20260223185321.0f0581e6@kernel.org> <CABFUUZHb2R_SiiE_K-ixhjPVkvG4WWTjcOygAM-YBGtZ6Cnq_Q@mail.gmail.com>
In-Reply-To: <CABFUUZHb2R_SiiE_K-ixhjPVkvG4WWTjcOygAM-YBGtZ6Cnq_Q@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 24 Feb 2026 16:05:22 +0800
X-Gm-Features: AaiRm518d9zdfiuzmBcE_5_BGm-KYKoZRLq-k7VGJtmRRuohi9TP0r8z4vJYsc0
Message-ID: <CABFUUZGj5=DNsiv__8Tp8WFS8sZ7fTva_bxZ14RrTndsjuQFQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/harness: fix XFAIL_ADD matching when test
 metadata is not initialized
To: Jakub Kicinski <kuba@kernel.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, edumazet@google.com, horms@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Feb 2026 10:43:15 +0800 Jakub Kicinski wrote:
> I thought constructor priorities were specifically created to avoid the
> problem you are seeing. What it is the point of constructor priorities
> if not to order constructors??

Hi Jakub,

You're right. Looking closer at the harness ctor ordering, the NULL comes
from TEST_F() setting _##fixture##_##test##_object inside its constructor
(after the mmap() allocation), while XFAIL_ADD() reads that pointer in its
constructor. If XFAIL_ADD runs first, xfail->test can be NULL.

Using constructor priorities should fix this cleanly by ordering the TEST_F
registration ctor before XFAIL_ADD, without adding new fields or runtime
lookups.

I'll respin a v2 along those lines and drop the fallback approach.

Thanks,
sun jian
