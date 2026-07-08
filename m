Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81B3DAC02
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493591; cv=none; b=DvcM9aod7ZkNHps5GXcC3zdIJHok0i7yWLz3UQkvoKlIexHr4DdEpWoit0X/P9NdofLG3/YfvVckIexYCnoSvWt4Im//lF9JwphTfHUvbJDoiAGEmC1qbpfOIaFVsQSBrGfnruUDNzMaIBQ4RGfG68uHfjjNWxg3dvqe7IUxHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493591; c=relaxed/simple;
	bh=YTZC1tr0nF6mz4Z+4cqem9+KX4IQ0CP2cybl++qADNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjZ2Q9cgynl3Ngm/3YqW7PXdOzHJ0HslQcsZkp3n+hFld04i/wpEqYR2ZvOW5VkC+Xc+cX5bcShnv4zPmZUcRGa1KFcdvzgcXXs3ruAmCFFjrjEI28nJu3X2KXnJiNW2nbPCx6OSOSm2HtYlAguHlvH3aAHDevlZM0J+W5hX3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np8YW2Hn; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np8YW2Hn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96cb024ee0so198968a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783493582; x=1784098382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTZC1tr0nF6mz4Z+4cqem9+KX4IQ0CP2cybl++qADNQ=;
        b=Np8YW2HnkALw/xRrFfngFUj8otJKmcYuTIIN/db4lY5ISBdJricV67NiABm5y2FS+f
         MPNQ+HoPRztd7y+Ga/tm3kJIrHR4wGJ4znD153WbviAguRHlgblZ00A5KCNF6gtR2ZSI
         kgorU6o2TvE6HG+SYBXCvA8x4AxyqEt5hU6OimI3DBoYFJJrybgCWpScUIrT+l72fOgK
         le0WYDAlvjXSWGszj4tfOc6rlc69HhIKYPoADVM3i5hfxZQX4/DrciTD4S+lUGy6g+ZS
         J514ayb6O2x99c5Z6x7mQ0UzYvBm4zrdAfVckr4i+3+0XR6FHaBixcyULUQ5skgqJFRO
         1tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783493582; x=1784098382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTZC1tr0nF6mz4Z+4cqem9+KX4IQ0CP2cybl++qADNQ=;
        b=D8FuCn/5craLrdRuP24ziy4JuB71+JSr0q8poOfGbWVI438jN8PmFYmN5I4WkZjppx
         +wE8+oFH7sA5DUYcVCZVEngUTr1PFdAzMB8ke/tTT+8gHxhoTiBb0kc41nuKklg3MrHi
         Te36kS5zqkhR8SKWmOMSTyMK3eUurEKPJkbVqFekgITub3iIFp2a9rbzpPllz68XT037
         hLXn6RtAOB3cC8ZmFLONvSEv/JlHDws9XlE0A2w5JxSgcGcRmeKXC0RWI9CiV9qVLNPb
         XFCuQTTTjS2jZLOMSmEkGgxeqYJjoO4P0ACX70FE/9a7M3yBhO6twryAIKYX03nEV9nu
         vX0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6XrSLp8d/5QQ9EuhIG+/clEolOZq0gbTJn9Dp6ch0MD6GANhKAnjOn0sDIAErl618QMkli7hLiDx1UP+iI/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YytItRXmhfLrMHy5O0E9RPMPbhjNABciHPCCG2Ls0VtAtdd0alv
	6goB1vm9CttKkpaBqfTTK8cDsAfBLkTzsbwArEL4SAQ2NuNfoMtP+TrT
X-Gm-Gg: AfdE7cm6xgGnJQ3QphcZWkDcFnVKv8vY/5jK/9fnN87D0ZIsxYeB3Ob7UA8lyoGbc0a
	a7AmkPc/11qWMvZTCgf7jbA/FICa0+7QBGt+lIehqxq3B/K6+xJ/WQpWEF0K1YGXL8hWr/erolt
	1mVxLjPCInqiur+KKpWd4V0uh+k1zsJ7yKLAVBK7mkaNxVoazAcFULD69s+PPISzr0CKgFHedhb
	2i4iRfiG0++C0al8ik4vrxITdr2gdfP5kfw2EUo6+WvGLivNDEXP3b30kR0oBsm7S1y+7gB9z0+
	YKos+Ud0yvpaDExNsfMOFKMIc7t4nRo+Zc6QVVvwWlmo7r73CR5Rlr1+C6v0bY36Nr7YOLYAU+I
	BNX2s5F+hAGkx607/L/lqyLehYWhUf/jYv+/EleWBAMyFTfLt6BTIv6CoDSjgVPrLlc2UbWaHnU
	fkOUrQGUppV/SOJ12W+9HnhvE1B2/nsW/Irs9tlfi18l3G+GBM4PFsKYewRspe
X-Received: by 2002:a05:6a20:258b:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c0bceb6c9fmr1504879637.19.1783493582085;
        Tue, 07 Jul 2026 23:53:02 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm18477898c88.8.2026.07.07.23.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:53:01 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: emil@etsalapatis.com,
	andrii@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net
Cc: a.s.protopopov@gmail.com,
	ameryhung@gmail.com,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	eddyz87@gmail.com,
	edumazet@google.com,
	eyal.birger@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	kuba@kernel.org,
	leon.hwang@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rongtao@cestc.cn,
	sdf@fomichev.me,
	shuah@kernel.org,
	song@kernel.org,
	toke@redhat.com,
	yatsenko@meta.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH bpf-next v6 3/3] selftests/bpf: Add bpf_fib_lookup() VLAN flag tests
Date: Wed,  8 Jul 2026 12:22:50 +0530
Message-ID: <20260708065250.707983-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DJSKN0TVIESF.1RVIJ8SRZRRBE@etsalapatis.com>
References: <20260704092159.1256823-1-avinash.duduskar@gmail.com> <20260704092159.1256823-4-avinash.duduskar@gmail.com> <DJSKN0TVIESF.1RVIJ8SRZRRBE@etsalapatis.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Here we add a bunch of shorthands for the topology we're setting up,
> but not for all interfaces/IPs. E.g.,
[...]
> The IPs are hardcoded here (and in the rest of the code below). AFAICT the
> logic is that the defines are to make it more obvious as to what the test
> is about. Is there a logic of this kind behind the naming convention?

Yes, the rule is inherited from the file: a value gets a define when
setup_netns() and the assertion table both use it, so the two sites
cannot drift and a table arm names what it targets (.daddr =
IPV4_VLAN_GW reads as intent). The new defines follow that.

The hardcoded addresses are in the netns and live-frames subtests,
which build their own single-function topologies the table never
references, so there is no second site to keep in sync. The bare
"veth1"/"veth2" strings predate this series; I left them alone rather
than churn lines the series does not otherwise touch.

The netns subtest does repeat its 10.66.0.x addresses a few times,
though, so I will give those a local define in v7 to keep the new code
consistent with itself.

Thanks for the reviews!

Avi
