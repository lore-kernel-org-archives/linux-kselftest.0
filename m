Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205328;
	b=hejNlYADXdb/gMLGjcm6iaN3cIjvnTTvHYgJpKmF4i70rledZptXZLZdJE5G5Pq61YzN
	 3ctc0Y+5FrQtPd+CKGeT5xP498KwkxunndpWV0r5INf7IzuVCPRBo/ygmfvFBZcYzODUj
	 8ElPTB4BCRbA206olAOKb3HEKZMylZpkCsLyOTKERVHH4aOzc3j50s5f3sR6XLo1a4l3f
	 T26VPwTJ0WGIqhn6udqLg6QtxWkLhjnUgEWVZ6Ue71zsg2QnLK1tkJaIb0QhxJt0Pu3gs
	 86VRhf2962sVTN0AmtAGVAJvE++p8VEr4zUwvLUpJa6HWKdp8HxP/mXqfa+FXdiWxzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
	b=tXKHeVQI00ZfWfG66s9TStD/OzfWcimp+9D9WvD0hE2MPyW4y6HbiPvNIpoiULPlXTZT
	 NE2bpzq910fbBecBYRY/u45Tqh8rvEg9C0BmfP3rV4jvea408Ch84Mj52374cuRX3joUa
	 2fMdFq1dbdL8BM0gu18Tb5Lf8GZDaqNqhlwWNL2qZ3Vwkv/ue4uD2re9/KWqIote9BQOY
	 PoR9vYDLavSo9xptcA8+kJOoCT7MVZzzur9wj/yH08jRrWyFSCJ+i4EsppMqxxDh2jdCZ
	 IKibxUBhlPWSRb4Q03tNS6+adcgWPd075BxyD0ZeMLMBTHMRikrHfVRPDm93oMcUgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9cheU1;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AE606A6DF
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75AE606A6DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9cheU1
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d86f5328so9433257b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205327; x=1795810127; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
        b=v+9cheU1JvsZwxA9RJaZOvZH7jybPYzhDnqPZ32sx17gamJhfPRCBJvd01pPZnhA42
         xxSpzDJ3vQnMMo2zh97t61lY4G9ZpyGmRKf0ivg7puoCzvlaecfC8IuOtOD0Lt6RgJV/
         nocvtCWZORQPEIYSjCuGj9sHUDg6bPnW9zsuTUy2dBNC/b4788mzyklBVW2Zz/kXgfV2
         I7XfRHtmPptt2ukx8MhfawIHclfsJVrlETZYQD9Cv4AG5U7dkL9oyoNBxhHtRJv3CqhP
         Gf1Nl5QVSQj+6yu7WX/us9YTwRWCdNrkJx8D8NLVpQrEyjzLnhJM1qU6LTMJGlTPeAvF
         DMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205327; x=1795810127;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVW3AyRhK4fLgCzgz0K54jzJnV8Wa8nD6ITOxlNuPow=;
        b=fQWYgDgaOORjakkDov59uLPJAqkaXvaA7ei1hvPjme+dLdTgEEVPEhhDVosYyjB6n1
         y7R1WIfdJQpFarljnBuyno1aPEbwAZLwY4+6nmzcsCnkijVo7kzNJCqE+8xbLag/gOGy
         64eWSuptRjI08TzSSOPgLi0RUO/xScHFMyGLBp99gDGI4K3YJytSHRQhucksXAdlX+Af
         wpSnKH2VHuDJ95JNpUsP6p96jPJ7eekzqNFdxuEpS1Y/pTD+lxKgGGBQ+Dy2bjIZpqw6
         AqHFuMGi5LtYAt8UrTr1+K2VLpdZm/i7ucPfoaefQWPzxL4/eGqqpyGdagCAvOyRYl0Q
         Du2Q==
X-Forwarded-Encrypted: i=1; AL+hErHZVgAULOMPm4S09iutBvuHwyt7FHoKPGaw6PJcDqnH6aYxismzzj73mUdzCvhpG3AHl4lzmEly3/SiUaH7R+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dd4KCdDJij3kwfPccofwR2ie/QH8kDB4wVvXlu6OYg0ibB2jd
	5njHrpOcYz7HOuf0qI391fGMX5FEeuVZVnLz5LAYckrda1S41vxGSF8z
X-Gm-Gg: AZFdTZfwKmcCH6DnHokalucfn+Y4LsdFveOMOi0R4XLGEQ4a3zbR6KSwJboHxzCXbOl
	rMi8RXsUpDCDgD/gkOlgLFlbOol/CYJWltkLNTFRb+lZm8uYSyF9QynpEnKfy65C5p1d+af/ZQV
	ro5D3ItLxH7OiV9HsbPctbOs54ST+AZgCjKZNbD8cUQlAMbkLgo11vlL6PnMLxym7cxwb20ep77
	s0Zvty8Qowy1IH4qMVVDkD3IMYbEfU8+bUOnkXMHGygNBVFgzd0GSpAV6vIYACq7pUXUoEe9Vpb
	x1+YtSGsrL7xYrP9w8sI1zM9yWBsEndVNeluYsNc1M31g9LqkVlkV1S0L4a5x6OUq2ntOWhm1bq
	s5miWBebv5Eb+ksBlYX/jdpPg+2c2b2FxKQY4cyoRJKfR9LHYgqqMZQx1BvTbQZoi/BqVXzc/jf
	pjF/tyBb13Z3g1gt1SNKO+Fkxz4DjUEWG3SD4nZ4PcSskcvLXhhEgwzTWbMR5EWDFFm2qeU7eCY
	ZxxJKbuzulXmDhIU13V4pBHGv3VAgGOkxU2551r5z2RjwjCZLGvv76qu5mcGSovEeneVgg9AlTA
	vR1rWQaQ3GzdKZ1aPUQwLr0MvEzSyENtTQ1c07KjOVE3dpXaoZzX6T7XFhG2e4a8M7X3YmkrRl3
	foqCtzHyf2zvDSI262UhuFYcwg+DvSmeRukMwWJilEYTdNDQE8EYQr18FrwOJk2SKbJqoDhVHGz
	fTSeAq1zGQBfzDaDPIS8NVlQ==
X-Received: by 2002:a05:690c:c96:b0:8b3:3fc5:2be with SMTP id 00721157ae682-8b520443c66mr22255077b3.20.1795205326668;
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
Received: from lab01.myowncloud.network (c-73-207-82-134.hsd1.ga.comcast.net. [73.207.82.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52035bd70sm17687717b3.44.2026.11.20.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/tests: add KUnit tests for the timerqueue
Date: Fri, 20 Nov 2026 15:08:45 -0500
Message-ID: <179520532525.3434626.8560089921289265644@gmail.com>
In-Reply-To: <20261106-kunit-timerqueue-v1-1-1913a0bf2d45@gmail.com>
References: <20261106-kunit-timerqueue-v1-1-1913a0bf2d45@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

On Fri, Nov 06, 2026 at 09:01:48AM -0500, Amit Patole wrote:
> lib/timerqueue.c is the time-ordered queue behind hrtimers, POSIX CPU
> timers and the alarm timers, [...] Neither has unit tests.

Gentle ping on this one. It adds a KUnit suite for lib/timerqueue.c,
covering both the cached rbtree and the linked variant.

If it should go through the timers tree instead of -mm, that's fine
with me, and I'm happy to rework anything.

Thanks,
Amit
