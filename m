Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B166029BD91
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174779; cv=none; b=oKNjLNLNr5vF2rQtUmx5WaxZpn1WEBpv/VK6HyjSUGQ2WkZqCkTS86p1Yf/G+TQ6xpcMyhal8wwHZsARJ4o2NnFnYXoNSwRS9frc7vYWn9HJxa2iQUMqRijjYEyXCu+gATusxlujwG3zDDTSx4swxCSpAf+4WiZab/hZYeEDoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174779; c=relaxed/simple;
	bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7XQ4D2b7DsAl2AjonYFsnAryveYZ+c3m16WOpsa22P8YHqX6UIOWiopnhPtgDKtTamofRapouhfhHjm0fTbc2vkqi7mNJkNjbIz8RtxpzyAk6xueSIucQCq0lgquhLOWUfiNDIJ3lWUUAzRTu31ExO/8i1qq2LcuwdnD8MtG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtHmTyli; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtHmTyli"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so86243a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789174777; x=1789779577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
        b=KtHmTyliSUk8JyM5npU4YUgxuNqtQ+hKntmtAMNgMjq6qhbleRyXdCEK/EJKLVebdt
         4ZtOHWjQOyNLzuMMVBIFedgCsTVZ3iPLAg68MDdH/p9STPZXu6m+0YsJdKc/r5nYkbLV
         vjD/Kpe9vMykGj/e3TJ2iqUe4tE0W5nWRYajpyqAEwE6ZQNKLSTLgg33IUNGXcGEhNdU
         64lwOXLlvXrvIBk9HyOgJbdMsFaLihup4KbX2Qhwzp3CoN+oztd8aF7TKsd3EMWD11Jf
         rH+nkK18lEcdkAzuGUHaiYTvhsRJtzbWVRo5hghSkFyqnNtt7z6RLRG8I4KT5r7qGWfL
         4jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789174777; x=1789779577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
        b=iCj2Yn+2Yp+6qO2XDp9Cf0jPL0x0nRiV3wtwB9XZS2301SNPZnmy0DdjEgtw5jswk4
         jE3Epshis8GqSnG5btPo4OS4v4S0KwWbm1zWPcrtMDHiEIWOoYKSrlxLLq+J3/YVNLz2
         nTGbT6LrS3S7bw+bvtVJ4VNATTOosJVVIe2INrGbrAu3osyN/vkPGO9FmH7tO3eCSSY+
         x3XswLESB8iGdNGWKZptmoYLmCEmheXBF0zopmCRR+cXqmZ7alyl2gfYxkP67M0nJ2fQ
         FcrQUk2iTcEK3SWGXRl5JIIG2NdJ9XUy4g0StXFogMCjTGrTsLMA4qXG7i3Yl9eJwFHM
         gDoA==
X-Forwarded-Encrypted: i=1; AKwUvBxAQaGDMaR6XmCumIiip5MkC+qSoQpU+CdmX+vlRniU+fdFQFEFWk8ekivog/3tx/6ildMKJ0gj1NKkVs/5itA=@vger.kernel.org
X-Gm-Message-State: AFuF++kOBwqOpIflomqUYLFRoLVc4EwYzJL8Q2opROHvD0xR/OtyNm0Q
	SJ7mdFMZMD9k5DIVGeLjloKBbgILpPWtioqM/lhwvd4TCR8NbnXbXt81
X-Gm-Gg: AYBFou2AhU253MO+CBHkwFjSpR7BU/g++wB+ZlR1L8D56h+fLSMeGAojRJO85TkkLIE
	l2i+oeeLHLz6nSwxrcTHdhDIN6drfJECV184ev2nNYOxtefGMXp9kRtSiQ5r0hppCEIsK7aoi7t
	ZfVYAWshvmu3zFFl0pczssEMDRjOcdsJaVaEwtR07UkR+ruREhniX3J34DFr7l6J/TG/HKnFKUl
	Een+zylvSSrsBoa1d1Sjhab38dqwiIhY+XwWowl4BughlycHrTW6KJvk8bWf4Wwk5Aj8pLJXGe+
	Mo58XNcVEiLWNm14ZNW4a6g1gblAz2RS0gEuqrKM1bTJJ5XYqE1ic4Bjv8fWJ4U6D/rQKGOtJ6g
	gqbypwL6bC1OeauDLqjKWe+OY8PG+arM6Q4VKYJKgD/q39WvNQ7+ZF96/WYwvOI5vdFipKMU920
	FRXneblsybpr+WujB9rwoURKnagkMelR0UXz4UpVZoyJjeeXGI8F0dZk9dox0cY6OxvHaCC5dT7
	U1Ms3vkSKD+tEKpPhsMZ2M82O44JHDvHFr6p36eCJ30JRLeKXWXAKncPhziKqYzAX3VRX5Tr3jy
X-Received: by 2002:a17:90b:1a92:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39dbc6f0686mr1143950a91.23.1789174777016;
        Fri, 11 Sep 2026 17:59:37 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm233719a91.0.2026.09.11.17.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:59:36 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	=?UTF-8?q?Ricardo=20B=20=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Mykola Lysenko <nickolay.lysenko@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton failures under BPF_STRICT_BUILD=0
Date: Sat, 12 Sep 2026 09:59:30 +0900
Message-ID: <20260912005930.2080724-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
References: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-11 at 13:24 -0700, Eduard Zingerman wrote:

> Why is this change necessary?
> The whole PERMISSIVE thing is quite ugly and I regret not being
> involved in it's review.

I hit it building selftests against the distro kernel's BTF rather than
one from the tree. On Ubuntu 6.17 that vmlinux.h has 5 __ksym
declarations against 269 from a tree-built kernel, and all six libarena
sources fail on undeclared bpf_preempt_disable, bpf_preempt_enable and
bpf_stream_vprintk. BPF_STRICT_BUILD=0 looked like the switch for that,
and the build still stopped at libarena while every other skeleton was
skipped.

The patch only makes the three libarena rules consistent with the other
skeleton rules. I don't have a strong opinion on PERMISSIVE itself, so if
it is going away or being reworked, please drop this rather than take it.

HyeongJun
