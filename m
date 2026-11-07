Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032950;
	b=I4phMoMDw/Acfr/e60K3Gro6iti5cYfs2IywBPYhMKz37AZ0wtM4l1JnLG2HbC12F+Fl
	 o2o3mUpy/xF6PsSygItnOPC8F8cqQr4IdFL1g5I1m3szYIaeCt82okW74a9eekcM1buVc
	 nTas70JzKCYDgx+yrdjuqDuHdnJxljOOcZq4/Yi/4nb+kOb1T9b7sIHRkorit7cpdzW4f
	 aft4Cjc4beZVdd32NnVhY7OS+sTm/wezNKq21oJtszFNHTp1Jqe4N/xyuxztn5Hppmp2K
	 aoZDH3edIjC0yg5ED0I3jxUHmtqxwfMF2h3R1Q1PRKUw+0iZCLL7vs/s2MWyHH7YmNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
	b=v2zTptqaxe+f4sObc9qo+6LiXfBD0YJnC27MJD2l8DixeE15HVU7brNKfmE1vVQXIKVK
	 yL44TGwkWxrHA9CcEgn5b6aeEFL6hjwkHRHM0gIaE7xRxmNmPnCX4pynSxW8tyfH4KgyL
	 s8rooicpksmsdoGwaIH5yWMTWBOQ9B1+GJcihpfObiNmv6lQvaL//2CLYNPet13F7rEFX
	 Fd20fVqK9g7DUvTPsArJt98mY9pujgiZTPbHitJVVDWTqSF3/AIz9QkQoRux17/UX8u/X
	 SX47hQwK/L62GGesV76WcUiQgLyqDuvrtiw3JRtQHuxj4gXWfGSxRSbmEvnRmGgMaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47997606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47997606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1121097a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032949; x=1794637749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=zYaIXDeD/ZWt27eZTb/FXR1Ei54NEXBrfYk0lGFzIrK04hqXvJbt4RY/udaYZwsuRF
         pMyL/ZYTBPrqyXZl0w51+VFcTtZ7uZpQXL/b1ngiI/AoXN62k2G2D4uwv/4WozQ5OREN
         uMUaMC/JE6irPYbMNmnLX/LBYefPbWV9imrAw7tL2WDIdrjnQM/gQRovFQUfj3D5AWRT
         PrAPoKzlbCKwQtN7ic3//ml8lfhdnvvt5VJJr/aMLo2YwyuB/glDtPWfRS/irwaFqocl
         7K4+eq4WN+t8Ve16MInu8F8YDxxrJRXhmShoMOifWYu6yg8Lee/oeY94kvUKfax0iZh1
         hIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032949; x=1794637749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=1ArqGFRTT6Rf57CevGU9Ia9CoBwPZhy9VgEpCnN8xY2aCQgFF1zPsVSDZFVdAKo9pd
         ReXmYbZgWayjBKci5qZLr8om4LGzdmFJpUhrIXDt3RSTB7YiVbIVFbOrMG0VUDrn402o
         4Z3BEZLwzbDRydn2Pa2Rfq0mUUIREri61PyT+gzhD0DN2VSHXKxsGpTLKQfeDo4GB3sK
         RTxWGv+reI9Lh0ayETLpjnWZxFbj7408yG5pd5DD0w73UetTHlSzlLWncA/4E/ijyg3D
         V69cnX3ixKXtE6TDi6Y7hVeIAzAqPVSlj/MZk0vTe/0UZoZDtAaLE6yhc0KWHjQlIzaU
         ZieQ==
X-Forwarded-Encrypted: i=1; AL+hErFI/7y2tyfS6Bx/i/yt0mMBy1/KK+U1sRh6wuKeVRb23B4rguBIaCgv7yueKO20nohY3Xd/jxC5G3M9xI2GjP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UWSPfy1CgiJQcQxQiTSxvOyMIKRUsEBS1nFwKONIOfotlt0f9
	jhQNcYq8QUH2+jnxLp7mESkflyyg6qIX+zgieHnwzX4niHmyRJ+RCJtP
X-Gm-Gg: AYBFou0mN5AzhsW5VaUj6KVWtfCOXAdWEFHA1v3HKi8PwoIYB5uNt4y60o0OaYGLCf3
	rE16fFCBINY7mEQNWesKJr96XxWy1Z5pizyM79WIz4eFEidnAbM/RcDc20eW4CdwhDCuhQtmWoT
	uV3Mjzsw+OjSmPTu6ZPQtiA0OBap9YU+jSv/itUQezJaW6Sx6zAXG1Wi2yUOdVvaEfdzOcmaRTQ
	sbZ6TKK5ZuNYrNRRxi80WazO8rvbu4MdLy1VNErW0DhFn65I/LeNP39Fe/IO6snC5Z1+YULzqZW
	40iUKg7mFY/6J4JthRtoxs8lfPSM1xMd+rmHaMX8sHVXRUBCSZSRc7zOe/IdJILVSVbguvR6YVu
	TlsSRcdWguZ05Hk8Dnqj7Ej1SeLKzBvy67dcURWmehDFRwoccsDos/547qh9oKGQLcpWP7QVYQu
	bGNcizpdzdpAWzeLTYe6S2bLf6Gi14Q4Pie7pS4j2kpKPDVrfnrjhMS27DxQ4eNIBDpQt7ZUewF
	OwDMC9NK6wL/8n4ACKl2GOVXRTDympet17wbuq2gs9Vkoud9mapEi+N/KhmHkSPM0Evcr8cr5X+
	Nl8nN5e2nijzjucUncz7st43gh+5OJ4IhIY6ELcCOtgoYNE8OIx6Oh45+BQuRnmOLpq5RgY=
X-Received: by 2002:a17:90b:4a89:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b0db6fbf17mr4900373a91.53.1794032949623;
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105854fa9sm2307453a91.15.2026.11.06.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 5/5] selftests/ftrace: Add a stackmap basic functionality test
Date: Sat,  7 Nov 2026 14:28:51 +0800
Message-Id: <20261107062851.3367923-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202648@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-6-lipengfei28@xiaomi.com> <sashiko-outbox-202648@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Sat, 07 Nov 2026 06:07:50 +0000, sashiko-bot@kernel.org wrote:

> Can clear_trace race with the resumed worker and leave the trace ring
> buffer empty when max_ref reaches 2?

Yes. Hits recorded between enable_tracing and clear_trace raise ref but
their cookies are cleared. The worker switches every 10 ms, so in
practice more events follow before tracing is disabled, but the test
should not depend on that. The next version clears the trace while the
worker is stopped and tracing is off, before resuming it on the last
iteration.

Thanks,
Pengfei Li
