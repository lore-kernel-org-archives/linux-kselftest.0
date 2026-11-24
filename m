Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541969;
	b=gqRScqRtOV/tP5Ycj4O+rg0gO9wLIagxb8jI/YVv4u3ZvhKpsswGMRFdcl7Q75EqE354
	 dpMtjeO49UZvGmqfl1EijC3u8vCLFvjTSRF6Frmgg9KkCUi8dTbrXqFqdtQASiNu3JthE
	 vB7eYpHYsxiOzRjkRBlTJZCLOh3MeVWHJWt0UZmJ+6IaiV+ZxXYuh3PJrgSiqeSOU1qME
	 xcppZzrICGznYnDoC8THlLfnA1D/8k2lHXT1iNdXwxzCfbA48n/U3YBzRefGscOztSomt
	 zQzdesqeoQPmo6Ra9eZktTqgz3Odc363uHfuFwiVIL1wo9rM8TRcWg09WiSWqEaSu0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541969;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wEVUsPXL+/9WghyRMIFhi+HChMwXmmXY3YDSRyt6xMQ=;
	b=sT6h5LpL1VufR/x27elwjaffPWuflR29F78f9VMb4W7HG6maB1zjBQkJH3vVRlNAof2U
	 LRcCqBcDbapB4jRrxOJRkifolX/E/PP9VHE4CDsF1QtMchQa8xD9PEtQz73WJvhnI8V3A
	 +3laa0mV3R92OZArafFOP41LgdsH3k+iUfwKL6PlJ3WFeSznoCU119c909cIGYUQrrhYi
	 d/xSxAiBLn3+Y24aHz1SjBQCEitnXoRKi06WFR8h8469WK4kFZZM1Ex5KKEat3zgLEwp8
	 3aBFqHg1b+bT0basCPBgEneEjTeXdsDl2UaimLTQTlN5Kp1viJhaOo7V43/O/siJ/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01B606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC01B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9213fddb596so60580866d6.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541967; x=1796146767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEVUsPXL+/9WghyRMIFhi+HChMwXmmXY3YDSRyt6xMQ=;
        b=G8+A9oyU6qwFXF/RVo4ZIlv7RSnoxFieJJ15ocD1Eeb3l81mePDPyln4ZKl8iUjMxG
         cWr9zLw5cQhBHhqDDMg+4zGRqFyqZhElHCQ6+JkCzRZgqmRr7LqXQeS8yxvg4dyTQf0+
         QytuEN8f5bPeQkwRw0oyek683YkC3q70TzwlTcaiBtopbpDhPLV6qwjjQvNdbRm6VxaT
         waWhCpL4UxmqKp2kFs4Sud5jLJ4qBgY5BmQkNcFG0BZ/RfcT7o2s37NBEoPww7yb+t8Z
         FxTwEGDxqtYsPPLVEmoAp5BdazeNPTXWjr7lPsRBXkUxzefz0aqzWeIxwhZBEqDKv+vh
         oE+Q==
X-Forwarded-Encrypted: i=1; AL+hErFIsoGAbLG9zT1br1fuXu/5tykXE0k3q406WEyaFOHy0taqtJBZ+BCY59lf3HwJaPeFhKuIvmQqZMpaZoTCW38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m0NSZNqOQ/bBMv56bZhuFqdb5jxsRvcpLtQuFrlg05B0xnn+q
	oI3Zne6Yp4OSgdQFm5TZYGt3SzVs/YdoHOEV2EeB0manfzfWwW3P4Ewysh2bCJ/d
X-Gm-Gg: AZFdTZfjR5YvHo6j1cccgwaQicVIDCnDyf8IcokFeR/NPbV9ma8EZeBigE1/Kxziudv
	R1Ox4JVtaX9AB3DOJIZ6OKJam/qL/mviIxydpsZTJHyd8bNHwNlvHRGGZQBAMpTzZF4JwfqJlbk
	sGS8EM7FCBe02Z+LmEbKUpPX1VSZ4wwydYPTgvrrVO8vU444bkyhkQ26YfEdSvunvyfDgTxyehp
	MbiFA3xL0EA9eaqPNlt4/52d2f7VOWKHXeQZ7R+ewabQbbfFiMqwm/ZkMvRg5B59xBorwJGx5hr
	Uf3HDhQkzi1ijx21eEGOmGz14SYBO1Sa1PXsmVYLzcyGRJaDPhXrFJqi7Wu1USzm4cSKRlOnrWP
	JlpIQHvu7O9+z/q707QNrwc0+zwl4Tg4NbCAFN1adWc9h+Tm2VOAu66c7r9ahaAiX4rbwG44Yfy
	Jxp4Cp4SQDKkAjIkevX9KbsuJCpTB3yJSs2j3V1X9BoyC1f6xQFf5/KMTzZ902TFrRgiTyeOsd3
	yLgZy10xqYdrBDsr1we+rf2zcCRw7jls6Ba6k9GAapR51CdfE9g+ZYgvE3C9aaFgmQG+Fgp9OJi
	7SmKECXPQPvIsh3d5FSGYxoZSndTBgdknKKr7gbMwNoxlxl0DkhAbnbdaJzvz/QVRq2+u+gCm2q
	57DSPVANXOY45aMKxNB4HbGJtffzqb1IGy3z0agYJilmsU3cShetC
X-Received: by 2002:a05:6214:1247:b0:91f:355d:d7f4 with SMTP id 6a1803df08f44-92134a7a7c0mr274698866d6.18.1795541967504;
        Tue, 24 Nov 2026 09:39:27 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm141160046d6.32.2026.11.24.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:39:26 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Tue, 24 Nov 2026 12:31:21 -0500
Message-ID: <179554148179.68173.17534252990255417064@kernel.org>
In-Reply-To: <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org> <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> We can compare notes on the API design and decide on the path forward here.

I'll drop the iterator proposal from v4 and keep the fixes and their
tests. Your series can build on that; it leaves callback consumption
unchanged, so the callback wakeup fix is still needed.

I've reviewed your series and will send comments separately.
