Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6658E2D0
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 20:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158284; cv=none; b=ZBvAuOkQ7rtU9lKnTsXRXxGCRi2X3+S43z7WyDi7mRIDq8+hbHYMVJWlwvK/QWpQqXEnyCSLWFzzLPPPzCHzponSk920Ses/b4FW0WTM1Nh2e31ON8MnX40kyPsULK/9byiG67Q6F4J4ZLwPZq7hDCOOK9AvYDWon4P9WohPuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158284; c=relaxed/simple;
	bh=opXDhzhWx3YuSpYKdsgNd3wA8vkj4Z2GqyoqGFGWi1Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tIQz6w/c6uAGBWY6tnedXiuw+Y1Ms2JA4zDLGL8pLX4zsf7UfZf0cWFOR/I0cnao4iL9NbyPnH6d3cbgdRiAYCh5Z2ciBQbl71n09ouwbvqT7+PLeKkauSXh2186GoAF+qUxjQVq247G55B2aNg4aggj+7A7vH2KT9sRx8IVgvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq/FB693; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq/FB693"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1092413a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158273; x=1789763073; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gyg4bhi0HgrKIi3/MhUwMNUrXcSsaRWq3czyD7XoEJ0=;
        b=Aq/FB693XIjPIhBFes51/Q7azMW4l6RGugBM39OYr5dpNoLxBXzRniN8pcjC+SHPfv
         9V9H1+LZFr3fYoz6qGZodLcSxkCQFxLx7m3GDnopXSmiSuiG9w1Bb5n7tkqLceoogTTv
         z6V2C/5eFdujE/S9oKEmQxDy6FT88CU2k6AiqsL9FVyB1vXs3OluwdixIP+3i62P7zY/
         6z2sfZ+yXDs51Lb6GYFmcIacaUmRoAmVxuZit6UyiMSgAKIPP7sctZGIp7KL9QHL5NV5
         JL5QHAAKhCqYGZNpZrda6+jK0c3fXkSMGyuSeAzvi8BRH/j6M+p43yKsXgdglY5jTQuB
         2cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158273; x=1789763073;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyg4bhi0HgrKIi3/MhUwMNUrXcSsaRWq3czyD7XoEJ0=;
        b=W6sgXJE6pAc4JFjDGRwUubw+SoFUtUvvhsfabnuI8ICJzaPdf4lyL+7q+DTbmXCd3x
         PhcQphZ1OXAnbrvy0TzPFhYZM989S+/ppjiJS86lF7AEg2J3wXUntTmFh3WfCj0xx32g
         K5ubsfXbiLQduSABcdjMsuKMzGSGoQV2VVmshfYq+m9zLJwYurMfniU7W6h2JihQ+UNb
         YVb7b9253YtdFVeSWmj8msIMlIJvEaWdf9JFrsueliPrQxsPe/TGqQvUUSS/SQp4fWom
         mGeKWnpQWq+v9cVhxPeN5MzGTRjLvXdXFOvBmKYTWKFFaM+M8ziEo/J17AAzf9RWIM1+
         soUg==
X-Forwarded-Encrypted: i=1; AKwUvBwwc8DxYUKB7lMqfzexgiE03WCBnHZWPZGqS0jHApL+usEqKDUntDNdcizE5uMSvImHLxRaeoPM1b6UlAVFkto=@vger.kernel.org
X-Gm-Message-State: AFuF++k4L5tqplDMTpsnSwHQA1c7xeyy7gf0CgNxkXpx8LlXClO4MFtw
	g/Ce+7GqB/VeFa6JYKUfGADEjK2nFdapWRAGHxYdb1nIAeFmGZI9l8V4
X-Gm-Gg: AYBFou2B95Y1DMw3CaBbZNy6zWDgVg0tZM/0GY9Eqxf2bWg3prpM+eg369+Hb+m9ypk
	hcuEaSyqS9QFnDM7x6b7SOWUVTIH1ElOv/MYyGI30wn4K2+5dqJNRBsF51pGJka08AmuM4yIVtV
	zmpfEn1q5LhrKxo4C/7VSzxzEuBeIqaM6vZa4Yz/FbmXoA8yUaHnZHpwvqQ8rsm29KLdzWzs/7a
	KqsRc4Y9qOI9DjY9ODtbp/XESEuMglAVG5jOggODiOtV3P3nsnTEmTL3QE9RHsqzt3aPASHeAwi
	cYsMG+InLKeJZTJGUqBDVVGSEsDdIEkR/2vM3bVrYOX9nexRN2K4jmFVrxhD/Y3QxpamSC0jUyf
	uYKEBnN7Dd//ZEswUQeXIhLCxNqOEWgQ4UjS7UH+kl4rwXMzjqq2efL1VSHV/TKHxxUgnJvhf6q
	gZvJFVolVrL3dsgtdxNdrUA/JqHkpqbFc9XULFhY/C9s4k+nA0Uz99vHYa2Qp3laBV+wAC7uw5l
	0ecCqKEZ3hay+Q58MdsLP4EG32q1wtbVetkZ760qSa+eBV9OZh6UlriLg==
X-Received: by 2002:a05:6a21:113:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3daed31b875mr11656343637.17.1789158272624;
        Fri, 11 Sep 2026 13:24:32 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c52f:3686:673c:704a? ([2620:10d:c090:500::4:b9a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm8706794eec.22.2026.09.11.13.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:24:32 -0700 (PDT)
Message-ID: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton
 failures under BPF_STRICT_BUILD=0
From: Eduard Zingerman <eddyz87@gmail.com>
To: HyeongJun An <sammiee5311@gmail.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, "Ricardo B ." =?ISO-8859-1?Q?Marli=E8re?=	
 <rbm@suse.com>, Emil Tsalapatis <emil@etsalapatis.com>, Mykola Lysenko	
 <nickolay.lysenko@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 13:24:30 -0700
In-Reply-To: <20260911141621.1944900-1-sammiee5311@gmail.com>
References: <20260911141621.1944900-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 23:16 +0900, HyeongJun An wrote:
> The Makefile documents BPF_STRICT_BUILD=3D0 as tolerating any BPF object,
> skeleton, test object or benchmark failure so that the remaining tests
> still build.  Every skeleton rule honours that through
> $(if $(PERMISSIVE),...), except the three that build the libarena
> skeletons.  Those invoke a sub-make with no guard, so a libarena failure
> is fatal even in permissive mode.
>=20
> With a libarena source that fails to compile, BPF_STRICT_BUILD=3D0 stops =
at
>=20
>   make: *** [libarena/libarena.skel.h] Error 2
>=20
> while an ordinary program failing the same way prints SKIP-BPF and the
> build carries on.
>=20
> Guard the three sub-makes the way the other skeleton rules are guarded.
> The build then prints SKIP-SKEL and continues, and test_progs,
> test_progs-no_alu32, test_progs-cpuv4 and bench all link.  Nothing
> downstream needs a change, because the missing skeleton drops out through
> the existing permissive paths and libarena.test.o is reported as
> SKIP-TEST.  The default BPF_STRICT_BUILD=3D1 still fails on the same inpu=
t.
>=20
> Fixes: a6850fa388f6 ("selftests/bpf: Add BPF_STRICT_BUILD toggle")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---

Why is this change necessary?
The whole PERMISSIVE thing is quite ugly and I regret not being
involved in it's review.

...
