Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207333;
	b=compTWswAteIgFEWJx6AZ/gIw8fgfE7SKZ1cfSLuMP4fqkHjxdmi73dYjjZDJx+1CHSf
	 349d8Qu5fDyqnIvgKYdK7N4q01tI76oooro1sxmY25tBTcqtil+TRCG/p05DzJYkm4rgb
	 bLrX+rdOiR5p81mCCYUon7++VKn2yoYtbWChPFun4obI40oSGZcLY2Ay2hpm+ZUdMV8mK
	 BJ2UkTzzPUySm7CzKUecHFwGjTT8PooOKclRN0MeM2P5ynbP9kr4MqQmefbxYqlvxDB1t
	 SdDc2LzsFlYGMRXJzrhgQY5ohSYVqhn6G9YKCvBiyZAkXCwQ/OF+k3nOSb9cCuF5XCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207333;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=shmJAbGA1MISsC+6N7az7V5nNrP0Lt5U/4QpgbvguTg=;
	b=TqH0CZVCERM6n+vv4LietwVlZwvoiLI9Nii0fdf/lTJf+mIT2z05S83lobqZDPrrbbkE
	 f6QLSdO/AdrEt8vFCC+kiJr25PWSt/ToPLO83hubsceQMYhCxdaf7XO1dgxxre24dCLls
	 3Z9+UDTCjViG3ZbYaz0sOuLCJ8K+4XcvDYBwWJ/WtvKelVNQAi4as0UTE3hlQSxjkDFOO
	 N09vspjD6X8rQ+ECnaF7oAoyk5c32nrolHuuyBLjRRzOguiqitG94VkyPFJwxt6b5rit7
	 D65IFTY2VHbR3/1Txc3wrd/S6d2JPmGGm1JBvfzf0fewHyMyeB94+4yEpxuLkFfQwsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B438606A6E6
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B438606A6E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f20b304c0so124862285a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207332; x=1795812132;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shmJAbGA1MISsC+6N7az7V5nNrP0Lt5U/4QpgbvguTg=;
        b=qiNsR5gu6sVzIDGX/CJkOXpoldMYKwJkT4gqZHg4YW9crlVLGKW6hibr0N44wwWEky
         NKbICDksQGBsxt+FWlAGkrVc4+U0huY27OHfpHt4ZD1fB1VEItmW2VMiz4TibBlclCR7
         95/Rd43zerY+f8HFxkyie7n1JPNkp4Cn4/19Xy4d9HpljWZ2wl0FY91zj/XZCUkgw23e
         cvpUexQ8yQGQJ8JuW7YA21+8Lm96YYb7POpH4Xq+AHkWrdlcKy4EYdKWYgK+YOCChFjQ
         ygwMRB9UTxPGq4qpDbpYJjon8viqmN5oMI0pmKSEQmW2k314Ry6JyMIwDp7QOsyLQfLC
         WEPg==
X-Forwarded-Encrypted: i=1; AL+hErFYsSK0koe3vS8ZOMG+Ckg/J+y1az/+VukotLIBDkWgFF3XHiIzod7lvCi7wcRSvw+MVuxT4ZUEgyyn11s9yYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HF8cAJo3TGsIbpH5Hoh/m4tWdLp1EMZZMaEXD8HP/p0tIYyv0
	AWE+kWjYelCS0t3/kGDQA2boiNtuJgbeHyfKlIxWU1cRj6DgPgHjN743
X-Gm-Gg: AYBFou02PUU0xodb8gfBPwGd0XQRBqKfouAHNBjubBSJkeDSuTzUTFRuI/sDtN9P9yK
	VFmOq/ZHyeskL4kbpSMly2vCP/H4nOvKZ5A7g6RJ3BGfaMcPrq4O4Asi5rOr9ANNczOcCNOwyXj
	4GggJkfd8HBEtchY1GmfMIH4KXOOyEMxY4PBRftAuDF/3s4CUX3iQ2Bf8fKX4IZLOqI6h5f/XCC
	MUlaKHR3jKQBUCKUEdKOFXuPEIiMZ1AUtJMBgIpiBRj2aVYhgaVbnYIydD/EV+pU1jH+pFTDpUj
	Sp47PoZnLg2XoWHvL/JXz8Uu7s1gMDppPRGu/HfTTOvMxP8bLEtzuE8eqQUjBSHNKM51Nq8Wi3+
	UUZmGP3UTCZ+gaWoBXneCd3g3WC4hf7B4rrlUJwZONBrFKclLPuSJxQ1Kt/Qh9SrgpuU8pM82BA
	ZmdHcy58/JF5ky0HjH7NgsrK+5LUSkftJzlw8x8GKwgtvX8WWGDysANHKcj1cl3ebqyzM0kOens
	UdrI/b9uZap/wacLxTMTg4Xu39o2YH/LBuunbWNLFLdgaGcCyaiF8RiXtSHyuJCeM3VOeg2y6PQ
	WgvGI2EurhpRaOoPKkc+dT2ZQvDxvvr8n1aMJZRqhuW6nsQ610Ra9WseENUHexedNk2rgDkgVLt
	gHk7BVEC2l5B3QgIPXh0mbDPxPhy+zvD45RmLLZR3MLBmrdn9P9ny
X-Received: by 2002:a05:620a:17a2:b0:949:6e15:e1ca with SMTP id af79cd13be357-949ba965b33mr726231885a.19.1795207331941;
        Fri, 20 Nov 2026 12:42:11 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm158988185a.0.2026.11.20.12.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:11 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>
Subject: Re: [PATCH bpf 2/6] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711424.18576.15326586614235160874@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJAWPR7RA9VX.2LHJ0V3EVGR7S@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-2-e623481cb724@kernel.org> <DJAWPR7RA9VX.2LHJ0V3EVGR7S@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Can we just prevent a ring from being added with a NULL sample_cb?

The NULL-callback fix was merged as c0628a0659b6, so it is omitted from
v3.

V3 adds a caller-owned iterator that returns records without invoking a
callback. Rejecting NULL at construction would prevent iterator-only
registration. The constructors therefore continue accepting NULL;
callback consumption rejects it.
