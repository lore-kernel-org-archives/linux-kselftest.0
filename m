Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444959;
	b=xY3GokWj9yXbFDi2+oC7d8K5fdeMXGIWk1lsUhQKJ6yfnW9zO5fTFo0JlDUuIJovFXEX
	 gEyLDhF0xRfQM/RM+lYzDYKo+T0I2xls7yv8uG1OWfrGiC6T1MkfQvlws/ViOz5DvKZXy
	 OLwM5uAPfUfpy/uErAK0uHn0YZ9Nddg8XbXhKHRbus9XwHQmm7DrNBAkHMaIIsF2uNmDF
	 QXuU8Zpow6hHMFAgSLy3/zSRmWcy5JtkFWXKgLZWkbtWXiFUDqBXCW7V+zG4QvVjWtV6e
	 eoSeq0ZQsqoY+gi7vY6bqFtKTjI2iwt2CRvHA/JUx3lD2u5hJflCAVmLzzE+Tw7WA0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
	b=jLqztunGluA4aIkFwiWslLQ4nKIgJaw/zO57myRAS6GyrErIIFaWGBTaZsaNEg+PWZld
	 YzfAeDnYacFM55BfwyydLN25poTsl9vFpfXQ+jWqg33921XRZM3d28UzRJSUJDy1OpPga
	 7bvZrw5bdBmsOyBMN6V5W3dZ+dq2Iz06DKdJmrhc93jE4LsbgPrmW/+6hmVAO1gAOs8zV
	 6KHGdS3DoGk+fP2ahuFirW5BO5jJeQcf6kvJzCQvR/rk3i9f83GZPcdmtOfdPp1LQW/pW
	 +WnB+gEIYNQKef/yhNTVBVjjae7d8cSc7DKKa22R6klqMMOhxncY4fIzlduFBC/BuQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=perfloop.ai;
	spf=pass smtp.mailfrom=perfloop.ai;
	dkim=pass header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=qkxUeQ4p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61F606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF61F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=qkxUeQ4p
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f48d91ba7dso2052617b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444958; cv=none;
        d=google.com; s=arc-20260327;
        b=JuqGh+LGbmX90AUv/c9EA4MlBYkQbMAEafJOZqHfuoAnw8PyjgeskXqXxYVB1JcNTT
         JCYJBALHjYAG/lzLtnXPbDHCbZE0XBMwTeciRbM8EO9lqMsZcI5BEDnEqY75ghie9ycr
         nXmKDZvwnfglsfZFoI3K1FcDedMdxE0/NFmJZh+944Bb50pywbWd10ls1je8oDc4an8X
         FTHYJcj8ODtkaKuCu4IMvzvUddoKhMKLFuFpOmuDOTqXBydEQERqEWTnXdYmttZNRcCq
         19N0XWtR+FUVaGde51WzfHGUAnahWfnveMAybbeJTerGI1oQdSmKJxjwmyE/52eKGpTG
         +Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        fh=5BTr7OF/LtqGte3x+FO9w364QU2930WA+vphddYoTog=;
        b=V2xvIR5X7aiIWM24k+fhTkPi2rL5T1IC6vguQgz1vIWnNkx3M9U7hDptf2KjUE3iF0
         6P1fc0yk+469Sb+o2W3jUoV5lJUfTpOgIEawHKzie8xNX2nnnfZvrJUyu1WONTSyYFRl
         eJxljhchzVZpZ4nRXpJ+UpankRgrWlP/DOGZz1EXrX5va1MEAJav6OjxfZf+yYf/Qo5H
         Z2oiooYotbdUd5K31YIXgldiDQS0/uI7n+v12FCfB9sS1wsyeSAg8mXSI09r/rqkX+qf
         gOCoVVnZ3wELp9i/qCBDJZ0J3VPX2c3Dd3iwO6YUJBVZLfbggvIbEjZw6VJZ+uclvFTa
         wv3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perfloop.ai; s=google; t=1794444958; x=1795049758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        b=qkxUeQ4pu+NEnEHiGqyXQxSiaV4qsKZk9ImyHB44v5FFuxwAH2jJ+hIOBK/H+kP1qd
         00Dbpsz2RQbcvxCwzCos65a2WzJCwXTVO08vDnphO2pnkru+hm+NeqWSv59xG3LWMI3i
         m0SLjJcV0TJ0nK9gJNi+UkdJ0mTf+JV54W4TzQ1+sSpWHIXLqQxK7LrrUKVmlkBABe4O
         yp+LMPuQOp0UCKBLX6gBpIgVBlXtpuywxr7E+Ntt4RBsr2eJJZNAWHrqht3gxWl1lx5c
         hg4PRMQMoe79m6un5YadjVWy/7vX27Y1jNoY8IiydKhkGul/QTt305NwdT2IPygqVz/l
         ADkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444958; x=1795049758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        b=RCXkIIY5jGAgzVGlYEdlygS0ZOp4NA9IXNmVnLLYrbwUJWWzbD0C+FruCz+o6Ylxpr
         IjW+i2i6o85/PwPS6iZgG937uNlt/sA1+ndSnYdCtBULLVVJbIJCMTTTqeYkqmlOmMFJ
         isyG87XafBsjtQMH0t/ZCCmSTeitO1J/aUevvB+uOzAKtBoW7/OykugO2LH4SmoujqOs
         js6YdZqldTlZuF7/F4Zna0wRQlgIh/OD15/CcEnYb2pBDZuGPgiEaUIefdkqA9Za/+2y
         2RierQgJbHpyZ0gUkXfD5DgJrEu0rhCvMBIvpOFTNKFKZO7umI6WXbWSmwVPxg0sVFip
         /jCg==
X-Forwarded-Encrypted: i=1; AL+hErFNfPNZQnHd7xav0nfZGwTDR62NNsUFFeLcKrhSiBAcdHP7xGQ9B4mzD5bUr5nMtFlgsq8paPLdEbxu9ZyESKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZslDE4lP7p9FMSnryLhynVjA0T1RtU08SIEogLrTJVstWlMD
	1BQIWmmnXCvfZKD92OzlncKrjRrTAz3auQNdKfeO94ofwN6GZk2iU8bWmtFItjDUkykOJK2MP/d
	hM3oc1Ep+swRPNzVXs/ZIAZSW0gigB9ppsij0cEmSmyg=
X-Gm-Gg: AYBFou0qSGDtw/7S5Bm0VHkbvpwhtvEkcjSIkIAz/XGEtG5WXRvo0dM3BSP9+uYiVOM
	rYM7PuizXbPHLZz7wsiucaeeKGTuNaJO3SmKtZCOn/rnGdQepUyFLAR508MqzLSWbQccUbQ3JS3
	T4NDlVL0YR7TLPG9xBflsjM4lWqX6fMTJUBTGUHkHU/04Cdy/8hmlHcIGa+ffmdntVLeIf+ener
	Tj0yA/erI9dsPQPPcnXgNYvJTMXbXGdNk3S+uw+JyK9GVsbj/1CWiA9/fnxQip6/NtgqVHuc7X3
	N85qQc2kXHv1x+jLaib3X4XkKffZjsE/zooOsqsrsrYyGLP6/puBw9FGX1VF4qPcXRDKQJPQl9T
	jm9cyF/fk6aWai7LYex7YCjDaodcwlsoONQ4UtwQrf5SqzNVwhjTIT0SFDx6MyTwaapJvmOxgBV
	AMzQ7MBxuLcheElKD6ZakJPRBFboUgq8yJGcvlHynuOO/a7mAGW2erCVUpIR2lOrkYryfAZ5Ud/
	ZYwGGSRQB+ymAAYX/d72m+Sjb+nitRoHDXYGqc+tWiaU/bdmLgXFa56v1jjA1s8n8K+4DsolLfo
	2a9xpDB29uJuXPGOiMY=
X-Received: by 2002:a05:6808:1a02:b0:564:22ae:a68c with SMTP id
 5614622812f47-56b968c7f46mr3958629b6e.13.1794444957543; Wed, 11 Nov 2026
 16:55:57 -0800 (PST)
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Nov 2026 16:55:56 -0800
From: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
In-Reply-To: <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com>
References: <20261112-zswap-zero-limit-v1-1-19f33081b09e@perfloop.ai> <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 16:55:56 -0800
X-Gm-Features: AclHuK8o7gpgV7y1WpVmcJ6YTUQp2s3lnYXN5gQ-xE1Y6TctG_9wPrkhGrG_MY4
Message-ID: <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: honor zero cgroup limits after successful reclaim
To: yosry@kernel.org
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	roman.gushchin@linux.dev, tj@kernel.org, chengming.zhou@linux.dev, 
	mkoutny@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@kernel.org, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cerasuolodomenico@gmail.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:28 AM Yosry Ahmed <yosry@kernel.org> wrote:
> Why is that a problem? Setting memory.zswap.max to 0 while the cgroup
> has active swapping processes is naturally racy. The limit can be set
> to 0 right after we check it again anyway?

Agreed on the race, this doesn't try to fix it.

The case here is different: with the limit already at 0, every store
writes back an old entry and then stores the new page anyway, until
the pool drains. It's bounded, so if it's not worth a special case,
happy to drop it.

Tom=C3=A1s
