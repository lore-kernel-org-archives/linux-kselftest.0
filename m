Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899757;
	b=wZATLMd7YB94YfrZABw6yhmGmzg8XI0//MJc499g0vuCywtZIq6OAbshDFHWePZDv+y5
	 ZxiHx522IJwOfZidXq3B1BtdGP+P6nVamN4WjQGpYwvNI8YQiuex9ezDxJ/0yNnyjnJ59
	 Z0ZH+6BHCBAki1aNJFdUHlJxBSuwUHsnEqt89+sr6OE9XffSZX6RN8ElTlN/8Ib4HGZ8U
	 6cGP5CaBoTU51QgDQ1AFq66/nLbEsuQYBmrqne14iG985JcS4Xil+gZiazpziN768of2A
	 v+khAjHjLDnRqMQqPAFWyPSmTAowZXvwnvE1ebw5vK4XzQpxm6pIvZBkLSS7/hAnsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
	b=YSPiK8I/Yr0fdM54F/h69u5vFGqyFNkpJXQ+bwfEXuZ3XHmcoxqlTcg8e1Ai1giMoCKD
	 pk8mYlBze4H3JHk6RO7pd5o+JknplDdkoALIbYo+69U+H9t7Oh3RcKqNmXXmAWKGGJmR+
	 SYLfLNDYeT0b45dUaMSqlUvIg+Vkx8cBdC0wi52yzCicZLhzcKfRGZJcszNL0QYIvIkNC
	 aGalD+J2wohKrJs6CoF4QPjVfuvei8Bcyq+v+0InEUpCwkF4QsWqLsAQWDG8XlgkAI70f
	 i3yWHVcS1oshKkPiw6DbJX/TPdQXSCv8jFizARXIMavnqlxSJZ07DzrQ3heKZVka+MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiicqOKo;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEE606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 17:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAEE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiicqOKo
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16029575e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899755; x=1794504555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
        b=AiicqOKoHaR/wnplxh7tZic5GCFf0bJjuSByayhefFdUTwR3Y4+QtRcQt6KpCMS/4F
         li9JeUxeq92jDKHOKaByhLGOHb1g+x6GxI7jIE3Ld6cTNtguk41MNsSf9O6sXIe2b4j8
         pzeMdtVlRx2lZK3VoCHpgOHelRygmREIl4RVFF2aitFAf9dTDgTNgbZK3cTW8y2L9O89
         X2/eeBAyFe06+RK/MH+eSrAx/z2TBiYpsRZ7WaEbsK2RcG+gJqwmdK5TPPwaiosgYniL
         3ignaZsdRrO8jGFuqekY57xrHNTp6XvHtyWUO18DnsVw1ArJf29ytn121FYVbbwtOPHS
         tJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899755; x=1794504555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OnqzRsvitQ4MyI4f27p0X1rJF88pgVycPeFzHfgJT8=;
        b=z6Jn/yM10mjQjEocvIb9ZJE/7Pkic2Gx55eNVrXPAwOfSuWhBt7NUWkR4OMPNWzJLa
         97Il4IbwP3nFGpZ2ApPDkmtS1ix6xORY22/1OpEhr6cJ+gMVVQAJfaO7OLhAVh4TlxPn
         U+UhYH0C4E6br/G0ntR0DvSXeGbFR6y2YcTZG81h1yRuWESdPCzRwdAClRdpytOXDnkd
         V0J5XTI9uzS9CDPl3G8hO1e/GKx+mpGjfDmd6D0mLn1ceHXDdpptY/e8s90+Ld6y2QUO
         9h9wL5VJ8P6Qr7XMorwob4x6ecFQHgcm/hIY9nRk7zoogY7XIvdcYoBX/iSXeG5IIjP/
         NDyw==
X-Forwarded-Encrypted: i=1; AKwUvBwXwtA6qAAty1M12pPuL20n47jo5V6uwji1IhJCj2UxXElKzGc56ZIq+krYGDWaSaIUKBQgmlkxyrSmV6Sobss=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pe0OuxvXVGJQsTjf/uNvvwxuwTm4j7/1/QRgskgo+y5KlUb80
	4x0bhYdMqK4H8GE2aqIZAV+Qu4gpIvtpN7Mxl0IXfTn6b5Mz+0pcYIQr
X-Gm-Gg: AYBFou08yNp+6gA7TTVDJjzkWaSWegG7IbmTTuCXuO100ONy0lN9/iHSgt3m5zhiDW0
	hblt/WXwc8qV5ED8nI0KfnB4dtbqVNS0xU9dx+gaiAn0Ws6cvw0qlHe1vEgMmt8HUpuwGSGsMp2
	7zEbh/6C10hPPkp3pTF63eCy/2+Zut8SIp8HtTON5Lj6PYFmuD/VrZWATlZh4O4Uryx/GL7pXnT
	YpmfG9I+9EdXG0dYZ/GSMf4I2Q9f0kusfO+55+xfT5n1PmayBc1MaovdTaXmAlStOqA925pjpR6
	IUB6WdWxSq8oClGaB0Pw2aqHYmTzL5QJygV2ZcIUJRn3Tc+MINPyZxv94wmv08Ipgd0nkGTqE7F
	UYBX/LltNwc0bwBDzuyeGwUrCaL6wankc3JfaJewBiMj8LnEBqg8Ie4cKHfUJvWBKrR5hIkj/DM
	JWqlfSVzijBdBh6ltLRBTLf0WUS606Ms28lfpJechBPAm9xoaxYqecPM/LgLdKOhm3J2/2r51vN
	GopUup6dhV4sd0p+YivwtZyYJ7KMnsAwWy3dCAs+2XFPP3TWHjBASF+Mf9TsqMqmr9Z7U/uHPQR
	4wXifI0bh+MLbqY9VxrzIaL7M3p5dXN63+rd8RGymm8lIrmnbVWowYtqVayISmbrMJmkPk6ltIW
	cCHdmf9U=
X-Received: by 2002:a05:600c:3b29:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ac17d19aeamr401115205e9.21.1793899755121;
        Thu, 05 Nov 2026 09:29:15 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm131080675e9.3.2026.11.05.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:29:14 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 19/21] sched: Clear cpuset_locked where the policy check retries
Date: Thu,  5 Nov 2026 18:28:58 +0100
Message-ID: <20261105172900.38029-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a63396b0-9b0c-4d4b-9754-f503cdb84098@efficios.com>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com> <20261104211207.1392343-20-mathieu.desnoyers@efficios.com> <20261105164356.28913-1-parri.andrea@gmail.com> <a63396b0-9b0c-4d4b-9754-f503cdb84098@efficios.com>
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

On Thu, Nov 05, 2026 at 12:08:50PM -0500, Mathieu Desnoyers wrote:

[...]

> Thanks for pointing this out! I'll pick the preexisting patch into my
> series instead for v3 if that's OK. Then maintainers can feel free to
> pick it up from whatever route they prefer.

Fine with me, thanks.  Please keep it unchanged, with its tags, and
ahead of dl_accounting_unlock() if you can, so it still backports
cleanly.

Thanks,
  Andrea
