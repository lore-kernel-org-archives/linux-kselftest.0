Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207383;
	b=d6cPrFZi1M15kg8NJTZUuX0fxQZhKzw1RjrLtYKCdolFsQm2m+3lv6RacBPUBA4C4BKr
	 H23xoAv059ArhKDM/6TtzxhLICcY4Yh3BTk+XxosvS+/g1Wvbkr5WolHsS/AQNFQGfHB3
	 reJe2zcx4dA13wfjzWMgCstuXb0Ur4BCe7oeIPNWx1Xp4bC9DotC8sZl91sV69yRFQBpC
	 wnGTF5TNDBNw1EDBRLYBl5DGzJ/o30xwzDIOyK7+mX6ETV5Q7nForyIvN22mXxkwIE+zq
	 ls/uo+olM2DtXEfA56fRaYeuyYeOL0cqWMXmZI5pFE/THZhe3KtAQrJheiIgAvl+n0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=G8fdWfQoKSFg5MeXLSdTNeJQWSm1UpjIDHyYt8X2axY=;
	b=4c5t92I4y9j6UdleFVOG2MeGhF83IdAVtYpeUX7G2bFhBcXTLRf4TppVWvQCdQQ2qFay
	 i1OWiTgBf8jKVMPIPfh5SJROqmKfrxwKXguarFN+b2ufshp0DBbQOLkyj6mKbhs32EFFe
	 uhj62JFGwuTPleEXZV3uJqzQDQRuFo6jm5wLqgDxfQf3VayHwkxvVtrkkztaKFoURRxDF
	 GnRToLbmghCIKW3iy4HSl/c1d3n56K8B/wd0+STQXTH+VVEW4KUFt5agD2JNtw67N8ZJh
	 38U+NhBnmCg/RkgPWSuo2m7H+NIz58iyL5bBzx1nSHjqPUoTZy+b5ZiigRVfrVFzogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E660A6F59
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799E660A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9495e8ae23aso112752285a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207382; x=1795812182;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8fdWfQoKSFg5MeXLSdTNeJQWSm1UpjIDHyYt8X2axY=;
        b=uL+vAIXEoAFsGa9ncFosnLn/UlEGGXEPC3G17H2RDLzyNqlKQXU9GK8AHh9T7BI3Ux
         1bfEFrpplF2uN8W4vds/aOiaLBuMQS45g0x0VKos6Tee+VXISebs7ooWYqgJwOL5gp3r
         GYxJNkQ2dIySqKIMWqS2o6ZtARgPtvHLhcGXJVfhxiZ1/M6vQgA5vDnprXxGz7Tm8OOq
         76y30A5/gXv+ma7YNqVLQNDSjKyrZpVQOV+97/yd5SyQhOvxZ3jn2kodZfqoxMfLbH4v
         vbdWYtU07dKny8bKnKfDB6CmFydsJBmWPpEH3zyIEUAqqp0uXBzyLhIHaVFfwVPLpZ2g
         5n1A==
X-Forwarded-Encrypted: i=1; AL+hErEQ2QqVFvK2H7XjN+S6wKzybVkVp22TPZFyY4YMPG2PxKpuA2WWjNhJXbgwyEuO10vskBhiGJCbrjqd8GCY5dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W+8g1SHV8dt24wE4Zb2VHNL9opJFEdKnjKmEGMR85PAIsRdbG
	G5l4iqVzOkR27vPLGBiwKFMCG3z0I+0z4JGHZmRwciLIea1NUzeXxD/d
X-Gm-Gg: AYBFou136efCLpXIk4aJhrMp3g484a4smfmtY2v9ZVqMWt6PRWOH/1LQkwHP+5spcpv
	ks6Q3XGHuaRveFntxqg6wfhsZ53oWKonBOkkhXhtwx+stmwadt3MDrEqZxcqDOxRDqmzq5v9FhY
	0cBLajhzSiGvjR5lteXP/qSBq6X8OX2Q7kX+Z/h+aCPcRDsF9E5pGU++7kEJK2Nspop3mae2DTq
	F69UeO0SxHSEBNN5Euh5CEps1weTZafNBGZSuZvx4kpmiCKYNTzdKJCyXtSdP8XMe747ffvCCJ6
	R12TiEPiKMRHJI6bW/nWkaIqiEs++lygd01Wij/yKioBNWYebxi5hW5tHgv54ku/IrS5/b/SRHk
	BhvuhP1cojyWQtJkn1aeYRS9pWQf5FT862kI/z91ZhwUg/38nOTgFec3vmJIOlWV7gov4s2j7ev
	hYZZLCh6dJXf61bgOvDP52SkdiGGPMaBCUxJUbzUdV1R8Da7CvK3VXxGGe8xj5giERtyqJA1BSD
	vjXT95PRgKFzqs6Ax0s1OJqj6bsHXK8OGLQrZDsWjsvCr6WbqmZZZivV6kBVsBAe0t58Jp7+ZmN
	MhI07m2Ta+Hrah8C6JxPb6dDymrpIo40IxRUIlprCdIpn0ihbQgT4WPTmNCBYo9W0VJ42fngmbE
	Je3V2NVK5wRI6atDsAWp4Hn0M0ffWO3bJKotOpv7a31ZDnsl5H7PI
X-Received: by 2002:a05:620a:6c1a:b0:939:ff85:8067 with SMTP id af79cd13be357-949ba9e9b81mr595306485a.30.1795207382282;
        Fri, 20 Nov 2026 12:43:02 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3cb882sm278211885a.27.2026.11.20.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:43:01 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 7/8] libbpf: ringbuf: Use compiler atomics
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711469.18576.16732977583563940939@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4Bzay6HokFa2CTsoQt2SLQ-3WWC+EUe0b9KpT4Ju2TvBg4A@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-7-33fde039ddf3@kernel.org> <CAEf4Bzay6HokFa2CTsoQt2SLQ-3WWC+EUe0b9KpT4Ju2TvBg4A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> this almost fits 100 characters, I'd keep it as single line

Kept on one line in v3; this store is 102 columns.

> [...]

> this definitely fits 100 characters, let's keep single line for readability

Kept on one line in v3.
