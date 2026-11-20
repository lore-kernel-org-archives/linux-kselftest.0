Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207374;
	b=HpPTI6dYmR4vex8EN5OKWWaGNgKo89NLEPgf4p6zEQccp17NR+CpKywdZK11Qo07EtIo
	 L+kkxMO6kEd+oNlYffNsy5iTFlky4A+AvTdT9KBgHC3YdMP1wHcHGjMjhdQrqbdOxWCzJ
	 nV7IuQlLM/vx7urLuJM6PSFBWARRi04S6tJXdre5qQFx8GRvKCyOzE4uDucsJezbkR7J5
	 vseRqXs24lYkNcsACUjJlM2gTaoRISLDEFYUrdLp9e4N9YwoLytaiMHhHtX4vIR8D9eq4
	 QhYZTeCddhFdwEe0H1BvUG6qlTlxCRBUnpMx5BhATxppNtuB8i6tn0SPPn8uWg8+Dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=tokKV+ZbU+lf/1B8MUnFvi6VmCUJYKTRqvgFuF70WpQ=;
	b=rqYdo+n9dTLG0N4L5i9EkO91jWC4h+xE7p0DNqPFOXoSdBWSQyjwJ2DxMHThDJk32N9G
	 zPeDlbAYKetz8O9hQX6zp0Ds8aT4tbtwn/pau6u5GGuiyrNLBq6TB+4k3QsP2CRmKSHpZ
	 LMVBVm9cylJiHZOBr6JYVCgGGcG8JBwDdS8ciOmtC/QWoSbNkHq0g3e0j1AX/cWPzdBSr
	 ZqL1MMrDT9RI5hBdj/oDBTWbgCMQgM9/TWEPn44RHi20XXt9GJAPZycMjf73AkZGp4ZjP
	 OYCQLbGt3NhgOKR4ejZ7khrh5tIoMPQZebAaP0jLReHsVfIVtKRf29zQAoP+Ig8ySxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A75606A6DB
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A75606A6DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9495e8ae23aso112738685a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207373; x=1795812173;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tokKV+ZbU+lf/1B8MUnFvi6VmCUJYKTRqvgFuF70WpQ=;
        b=KGgH4rt7ATXhWejrqj24BGecnHALjCpcxwjKucC0NihpLLdXpzT7fs4f4uR7GlkH5V
         kHeXf5lg9JsCZA8Yg2ykYr2xZZ7OwAWdVNBm0xAELWFJ1Hg5ZPemGOVydhRLYCWD+Iqx
         KWCvLMC0adj5pJB/eoeE4DYpVRJnGk/k0KrclIb4jpiV7iNL71cb89gctcPSrbm5++N2
         QW7qPYKOd+lDV2SRT+L0j75JPwquhcwO1HJklYqLeSXQwsDBzXc3z4lqyM3poFBO6pDC
         6+JYfxTxnZEcqAJtf7dRSpilc4xc3btAwmNMF6nrm/NPM6fekjGnODBmOyYsgyqgtr0o
         UyVQ==
X-Forwarded-Encrypted: i=1; AL+hErHJdetUAX7E4vvUtO9uwXxYdC63SRHohhnRFNpRw8sR2VZ8HOR/6+lzd+ARbxAUBc1rafHHzafHcCAY72xRdV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uXUJCESae9KNbXqLjSCg2Bot7ZttK6z6687pn5lnAx0JTJD8N
	NOAFjAHrrhzv7BnodcwaPrASI/sb9ODqAmUlDuuttmctoAp2iFFq71+t
X-Gm-Gg: AYBFou0uFOV6GV1Jn54MSyfIwuKom0sPNEstFyrNXUi6KfQcREL/OJrMYpSe6Ue5p04
	nxWS6Up5MUKaBJI+hY+HOEvK7/o7Xw6pxiuIZMCOElEW7FKKto0p5qKPDL8J0AM7U8qYShPepLw
	mFGWU2blE23PtzkAS17Pkuhj0CdfzKke1mYYmLRuSB0xvYboWE/OxpV4FWGsSJD87zkOkOfZXOM
	mbVFlRelCczNuXLIyXfQZ27rUxRKvrY4ET38SQTVhg/1Q2fxqg39gBSnflgbKnIDh0upRNockcd
	d34Y+cH10CuCkmhk4bbuTSd/TiJMEQOzUJGtACP7IHCgQyaQLUVUfwTdwTHKkLtfVNHy7frJ+nC
	HB7ZTMfqGppclT7QWVcFIzkLJ8xEIkoHNyd7PjELR0E5d5XpgmcyHMmLa9RO7X1A7lHJMfmbEO8
	2Nty36J7XtM5il+OFdE48jXUe5Ol+NLbjzSLPumSul7iyp94+jbvs9W8Dp6XQDDStkBgZGjo+Sj
	/Qc5qkYzgCkBJUX5aQ9l9q5LV4kGUgLtg0FB77HMQ5cWWTTptvh78ROaKwugNSLUIusfsQ49gcV
	WfqjBGtimXtvIKJfpsKsoCsOAuYWkAfoyiNROvSF7TwCG1S0i0O2Uvnr/6abmDbzHwDbv8k3FPB
	IRJZheTaEcaegFnOzbJxUL+stwQWXcEklXCUALBA7JQeXhVC54t4z
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr795897085a.26.1795207372569;
        Fri, 20 Nov 2026 12:42:52 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb424fa6sm270598785a.40.2026.11.20.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:52 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711456.18576.9562508567420854149@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <be221942819c7654f054b53907fe9ff2e9526f79.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org> <be221942819c7654f054b53907fe9ff2e9526f79.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Please move the test to a separate commit, I'll review it a bit later.

Done in v3.
