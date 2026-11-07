Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030013;
	b=uKAoJgaqq3UMwxJ0ZmDQSz8h4SncnLdLBIcHoYej+tTb8foFEB2OEXvGAiaFBJTr20j8
	 SZIyza4plm+ExQv0rgYG1qcVgsnbibWmEN9lCdmPIfOwm92s3PYSihHjPVe8DoWq6pFiq
	 EGlSPGyEUhqHLZ4yg8tQIAPy4RBtLs2HLA5BSJsmAOOf2tub2Vd03K6Q3PSeA1xKnhHIv
	 BqgNk7d99z+6obatd1zvYeNCgrXMUXmblLf0jO/m8ma1BXrmGQbBD/suwSkQ4MI2bOOF0
	 0+fC7ZdJCJI6x+rlx/1pm52WRwsbT4Eeuh/DjeuT8VWPcKjhCgmPHxMu4+zKmCDaVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
	b=vpho+W7F1AiBkDw0y1+d6nW1/E/vtUk2j1LVTmzIBkX4iWhXRQpPWHdKu0WA/Yeqj2nT
	 ZYF0BZQzqY0umz9YMh/0gHNHZ5a5GAlxSdQ/o+YcmTB6ppStZMRsqnB+usbOEnI7sDBL/
	 u8deAY2BPd+QVVpZVqvMKx8icqm6A4YPDHfQzcIy9NDEpXE8V6KHLkxlrS/V/RPXsVNtK
	 qOA9jMvenD2Op0n1JNn+Nu4AfM+1Y5m+fsmAXv7wq2zgRTU2cuQPEFDQcD1wSG93Naaq7
	 q6FezNMMCn/tT35v/wwEUvyeR3tVPYwZIsMuEnBWAtoDrIZgr31U0BIwpHRHrp3435A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6948606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 05:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6948606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed08b07213so5194025ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 21:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030012; x=1794634812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=sJWcWfELjWnmPKnlNLqGiGA9IT8I/5hSE/TtEHyDveF88BOLxQWRKZTy+XmrZwfOVj
         6SHdPkiKpJxyGVajxyZXDAJNOLm1YneO0Wsmw76rvTlCP6JpJq7kIh7hKUE8w9LH3wcl
         oiErSBdoBO2Z0m57+3+ugZtOv8Eo+fy7TevfteP2bg7wzCKQnsvYP3pvod1iTxvMPx1P
         HxrsvidioOJJzf9bQmkzf42dLqQuhAluXTAhswCBjZtCamyB8Kk0e1sbbH926CpEeIvi
         vwIM8rzJ+O0LXNtL77KfGuuh4KESAx+F6yC9WSpVYk4BA6x5+H5UmkRE3gmN4tTO2vGc
         pYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030012; x=1794634812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=n5vowNDJCmLigsUXbDioK81uvDu+h5OH6Ogw7Wt6PbnLr0Id+VJyLr3tWBSqdnJbQG
         ZCpVHSJgQuDjmx8qiay8TVVgI1o9lvePtkH1mqncrVu+d0FGjhpqVIbnxTqkkx64X+Iq
         X6xFPy1OAh3avLTCd5nV4rqJoEbgLJcrqlhftnd3uh+9XeWIuQMR4vv6P/fsITC+Av6g
         3JRr86gpKGn0BIqImuf3E/UHy8SU4C6STyrJaktK0pJqX9YYoTypRmeYybLrpFIBmOOi
         KSxqZsIY69rcsOdRsB44p9O0uNdkOaGjlJ8Fvuz4PFZxaCxnvHwLaBoNZxI8mciGDFMn
         v7QQ==
X-Forwarded-Encrypted: i=1; AL+hErFRl9BcSNfztDPi0pTFugDZwc6XfETO8su3Qv34yib7L9nQ/YZ/dfAyrXUpbbRQc2ZapxJwYb/zsd1tX5WEb7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NM4ARPjhgOlRjylJotBNr6FnH3HsJNvL82ZRq/7uj7/UJkBfX
	nfRSFoRnKr7l+41c5nEmqxTAJiFIPb+xc22YllU29RQVOIaXQD9r4esY
X-Gm-Gg: AYBFou3UAIG7ZHK0zj8QPMgIb874hlkWNOP9srX53GN2RI9VSM+xYZd6nPP1UNlfsV+
	eakGjb2G57IV+te+n4y1wrhRIFHmOEHyf1+fXWT0/KcM+L6jAbrF57vQ0klFljs9kqOVlfBthMj
	Ir8424XhM66Dhmu+6YJC3nCBQ2dQ6xzdGJ5sfjmW4zbyTVmyfs5bbKUKUmMY/QiS6hkYcY8WT1K
	EOe9EyG7g9Foiyc5SpxE5DDkjdttLYgb7P8l6mih8U7/CoVtTkAn7J96kI6iwoKcTQULBuRg3Dg
	tFM1Nbk6Tm2OL6V9m9jMw2wD7xU+3cz/IRiqg3P9AVQ+ruYGUcuCjpKUNPhxeGIq0PegnDYTclM
	dVjrYUUfi8VK3TDmjbS9kCkPvSCL05rGfFEH53XJ6PyycCbYpCX7P7Y5+hd69FSDKmG6xZLzh1s
	iNutSYTatVjYBLLhuFBFhHcM9LybzsJOdp7tnMGLysFqyihN8n8iEPKdjR9nR+iNtf2zRdFtg7m
	eJL5kGL99WRzNbkvHaThus8aVT4XX9PwI+PdEtlpFYmTt/YMYbOgeDss2kvdLaWyKC1xdZSYT/B
	cf0EqKn4HSZ7hrlgnl8ZvD8K28waTGJhELc+Kn1CcRntzk00oFi3rFmpw8wpggQ/TKQ/Kg==
X-Received: by 2002:a17:903:13cf:b0:2ea:19bc:2fe2 with SMTP id d9443c01a7336-2ed404dd277mr59480405ad.10.1794030012078;
        Fri, 06 Nov 2026 21:40:12 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da11afsm10992515ad.72.2026.11.06.21.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:11 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 01/10] trace: add lock-free stackmap for stack trace deduplication
Date: Sat,  7 Nov 2026 13:39:54 +0800
Message-Id: <20261107053954.3075147-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103174905.701e078a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-2-lipengfei28@xiaomi.com> <20261103174905.701e078a@gandalf.local.home>
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

On Tue, 3 Nov 2026 17:49:05 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Let's get rid of using rcu_tasks_rude. If RCU isn't watching, then we
> simply discard the stack trace. We do not want to add any more code that
> relies on it. If an architecture wants this feature, then it needs to
> update to not allow tracing without RCU watching.

OK. v8 checks rcu_is_watching() before it loads the map and only uses
synchronize_rcu() for reset and free. When RCU is not watching, the
stack is discarded.

> There's no reason to use a rw semaphore here. Just use a mutex. It's
> serializing the reads of the stackmaps from user space right? There's no
> reason to have more than one reader at a time.

Yes. v8 uses a mutex.

> Instead of duplicating the open coded free in ftrace_stackmap_create(),
> move this ftrace_stackmap_destroy() above that function and call it on fail.

Done in v8.

> The above paragraph is unnecessary here. If you want to add it to kernel
> docs where it is user visible, then fine. (I haven't looked yet if you
> already did).

The docs cover it, so the paragraph goes.

Thanks,
Pengfei Li
