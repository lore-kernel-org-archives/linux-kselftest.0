Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207354;
	b=dqbHJVMj1c01gs2qrD5PKaw+tY/utOn/sdw9OwyUT6zTLMdkEZ24bL/Im1YhcSEZq9Tu
	 ietSSA8vU+q0cJvR2Bx6O682GWfSnLp2KfghnLu4IXBzg3WB2PpNAKDE8AI4eVRR2t5Uy
	 xGCE6VUZMFiCKnUD6RyPP4koi7eOXtseiitqe8NC6cPi10BRItgPl7aaTU9z0qv4/YDmP
	 kl+c2dLPzv8Ppo8eF48wqk/xUNoZtua75o6LuhSSjL3IXIv34qKqfs5KJ91vSmI3DSqXT
	 msxyRbUU1iAuVUVaK/kThpLtBBDOmirDcpS8Tp+a1c8D6cJ9R+GYD5aGkoKto7bQehQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207354;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zjEa/5UGkvmboDqiKH3vCqUwfyIWNYaswKb2LA9yUPc=;
	b=N7mnMrEoo6YH4KTp+FmZGTB+hphJzSJUgPE8ra5ADSNS2CzwbJNzB2BvyFRhuCsQXAje
	 oPlb+UsVqWQopL3ObB0k32CXV9BdkNKLDy5jny4P39v22N0jACoO/DPNed3uAq3JWHgfI
	 ubQwikD+iWL5EcJwju0x8hNlvnjyDhw7ONdrsIUVAdrwq4Zq0yLSmEv06PcrdDAd0/Bbq
	 ouH/7vUQlJcEnnbow6CIbvcZoJ/RoLDCj0a0GGrjiGmRhMDHZZ/VkpfZ4eiScrW90G5Mq
	 CDQ3IIlxgvqZ6y39TtdXP8K3DjV62FO+3ChRQhGKpZl4NLhxdAI0591FYusU0AP8Cpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD4606A338
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADD4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365f9a04c5so8338491cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207339; x=1795812139;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjEa/5UGkvmboDqiKH3vCqUwfyIWNYaswKb2LA9yUPc=;
        b=l7H/RIXtklAgp7h5xobpO/K2hrwaBv127XNI4gWOnqCAuRjhZq2tiOVBRrso/KahVJ
         3KSo3X08DHg5YGnXek7yY3TWIh8xsjk0RcihEiC24dLdxv/eQN+cKNI2txXz3nJm/Pn1
         FkiiRCl73KPUmFWfvBvApmO8ALPawNku0nuaDrgUdCbCvp0NaILlbZ1hehg6z/PE7MVU
         pjLnK1GMshim8vH3ULeywBzH1huAtCMiG7rOug5gdk55bqC5+yCcvmJYo3iESewx92yE
         rIbVmUXvHKJAUySPFPWPbDdLmA7PV/IWBf3MvyKwFyqsSzPz6kB3SkK5FtUZmWX4E/2o
         WINA==
X-Forwarded-Encrypted: i=1; AL+hErFbnfY9Ef3crdkyvYh3ZbDcGJiFDI+rmCpNgtpBpy7YMIGMRWjLswDscGWQsp03poBMrXcfhr1+IJs8YCjdbmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UzhU54dZ5P2xdtwUc2ud2VEjC3QvnEmRIAIVRYIg2GFUeK5/H
	qs84QA/PYTfBkHfwYW542qLX0+X0H1f0ohwlqt03+kMcNPvonzfFUVvX
X-Gm-Gg: AYBFou1GXduhb88IjKtkR8vmsoTpYHZZfyFyDD0ck5Nf5/PurNZW58d08J7Oh/CpgSK
	wzOx9ifJu56zstk5mVJyuMttRFa98irFa1mFainqluobUlD1qcnZkeA8tgprujlYVnLPCFlFi3a
	8mWgOehhKVjNjMi5T9RtK7Brgx/sHdkC5voDnvsrB4tjIPgtMXuU6yBuu1vHr7VNemornfhx2mO
	tywfRyEgzMstpbvuoBNqGVFByRjpbeSOqkwITEyYwAJbF3qKdSysT9ISqBQzkAQwmKoApfuzbuF
	EBSEEeVvp/ShlO78UF1NnOaVE2PdzrsB6dTYCpjYdELetGVWxXpx7zgIxnPUmSsVNRwMeGkrI3j
	2KpEsFlYLiRl9ccVz2psR+XMmZ0HfllvbSrOaCG+Tx/GrABO47bv1EOKHB+NgYA1sk+EEHvlxv0
	XlG7EujAE7g2KeT55sjMhhTM1hfjEsd2jnzaPy2stxgIHAldegzMtyAFfink1QhKr2eiRi8zY34
	n9D0WzArrJWyWzthsSFPvsc65Z9w9Xmrna6EXGC9Wbv94iM2pB/TDLub4CcVsGPQJGzbgvlzwjs
	wVs/zn7vN5BWF3AVMvBqudebJE/6Wnipt+CFLsuFz3Z7Wd186vVoQvSJDcRziC20071G4h97ddW
	WMhesuF77u3p7n2ey9x7dShbMQek0KFg4BeLH+Zw8tXqiG99wzO6N
X-Received: by 2002:a05:622a:5e16:b0:55c:216f:38bb with SMTP id d75a77b69052e-55d76a5af75mr78983591cf.36.1795207339712;
        Fri, 20 Nov 2026 12:42:19 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm32377681cf.9.2026.11.20.12.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:19 -0800 (PST)
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
Subject: Re: [PATCH bpf 5/6] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711429.18576.6433271673673285138@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJBYY5JF4YBQ.2QJVU2QKJ16N2@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-5-e623481cb724@kernel.org> <DJBYY5JF4YBQ.2QJVU2QKJ16N2@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> let's use regular kernel style

Fixed in v3.

> [...]

> The extra new variable feels overly complicated.

The final iterator uses one loop without got_new_data. It retains one
fenced BUSY retry to avoid missing a commit without spinning indefinitely.

> [...]

> We just add an smp_mb() here.

The tools generic mb() fallback can be only a compiler barrier.
__atomic_thread_fence() supplies the required StoreLoad ordering.

> [...]

> Why __ATOMIC_RELAXED here?

The stop flag publishes no other state. Relaxed atomics suffice;
volatile would leave a C data race.

> [...]

> Label is unnecessary

Removed in v3.
