Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96336655D
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514043; cv=none; b=gkPqPaxIET35coMSnIibUCyY8HzJHEWItPY34t+8LwRCUgpKFQjijfRqeggoIx4BKiXStpH8VIhee72wO/YZBKmKTo0vXFFe2Xda5f03xIzIM6CKPIOV3AdMKAI8d2ZuDHpWzGWnIOX/oZOKBFgkf/PSFPO+jBAvlBDHQszF3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514043; c=relaxed/simple;
	bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4QAXtwVuk36tY9vQKdvdc3li8QmqluH7gHNEDxZXm2ZLKg90kYb7ca/9SzI5Mj5e/JXSguAyo58wMo3HJX0E47ym7o8q5pmUZV8TZzbIzvYkdom+DdhAy3aNwKqq1MGM90kVtSSJRcqgSrUKH6fPJl5Skj4OGLmpleeYygEKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKdey59Q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKdey59Q"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so632527a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788514042; x=1789118842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=fKdey59Qh4FEpmUGSdu5C+eaI1AzPYtvxFxEWVl1Rvc/CB57UD08YGoFmIatSdZWMG
         AB0dStvltuIs9DDHQnjZLPG+/SwhQgHaL82tZFrulKIudL+bxWGCLDlmH2c+kysy9wXm
         4QzbDnQCSUPnbCAtZfg1Eesp5mK6JDljwebqbe9a1ZiXje3tUP1EXAlNZu0EYi51C+59
         mRNUFmuTLXG/rxNcQK9OXD42Z0EOzJ84hzN1FDTezLF7IrM7e8MwKN5ahcBCn4b1rLmp
         Ez1ApjObu34rw2u8cplIpcggSjlcRuwi5sT1YPJp3kYucYwKUp/GPuqFnb6vqVQdGtcO
         1xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514042; x=1789118842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=GDwRKw18Hws+8IyOf/3C/PBQTBRztFjt4YrIZNbrj0h2ttVmDGmCYR/EHuquwQ+Sak
         FlmM/Gr+wirAtfyfC4vlJWBn8JVQoqf1V7Zq+egsuDPTm3zO5R9JJU+JoqKzH0ERjc8X
         4Koi3yqkFZ0JByg1liHVfgzsLGZIY40ulvpnxkLZNGftIJd5p21BZoPigC/yb5q5xNNM
         tqu4+iEscu8U4pyemqREugUynrif7glM07Nz6ujOE3B+Nuo7hFiauUDAdbAWRif9XYjy
         WAfbLWmSVav6fLOn62kwqK0nq5UaRmA5a+/wni9WWhYkZVIAPBZ+n2UKu0dm4o3EQiuL
         1eNg==
X-Forwarded-Encrypted: i=1; AKwUvBxUwx8n1FeMDucEj6N1rt+9RO5Iba0T8PdeHBM+QPksokc+WYs2qI5XkQnBUbA8rf4u624W0W7wt2+qNTXr8x4=@vger.kernel.org
X-Gm-Message-State: AFuF++mobBKGzw2Kwz5MdvUlnEHGPv4TW5GLHSmdkUvYzcrtdfX3G5/0
	Oah+JkOXanflP5Nmj9N61QP4gyHeZjBGQ4ZMgbDRWqn+yovBoIvFFH0=
X-Gm-Gg: AYBFou0zZM7uEYZSvAYZGUmMAfTUzYOLUhKJ1/xGFegjecWnImGVPjaYxWwOGfeOlTa
	sCLIlhfGBTeLm3/78UXguNqY6OUL8USms98QAVIf8VI4T6X8f3/9z7dGNJ+pcnCgtss7tWdhRcl
	xDK+4EsM7KQpHsRDrAedZcU1amZ9u3mNNqWYsnLlKrGPzOMXkcRGlKTcIdCYTOmeDmkoK5WP4Nk
	C3iK55jr6+o6MUtY6LgckEX0WzPN8c32QEePPbc5oEHUtDq311EDeDKcQmC4O/8BIQ0gtpNVdeI
	ap9qoYaYGjnYPicj4pa/H6BJpcKfEAcmwnrYaECti6u15xWPAyuJ4XjfV7UMGBev+x8ukApxLSj
	PPiTl7uTbyEKavpuXNmmDIx7EAvGxwGZWfKNMAePk8AcTYXJXXKZAjvxPJJS97SiDxKYmVv47ZR
	tIIWWpIg3nss7gFpzYrk2trc+ilfYyp8KhQtG9OtYr2gmmubSFe21/4HbDRGizWwurlvrAQFKVA
	qn4IpqkHCByIfA=
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr941098a91.14.1788514041803;
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:646c:494:158f:c4ff:121b:b906])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm3518116a91.10.2026.09.04.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	xukuohai@huawei.com,
	martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH bpf 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Fri,  4 Sep 2026 18:27:12 +0900
Message-ID: <20260904092712.10691-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
References: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com> <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 08:09:36AM +0000, bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but would 'u64' fit the surrounding declarations in this
> file a little better than '__u64' for the three new locals/globals?

Right, the rest of exceptions.c uses u64. I'll switch the three new
declarations. Holding the respin for now in case more feedback comes in.
