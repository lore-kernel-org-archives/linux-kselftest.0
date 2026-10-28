Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206506;
	b=WphRip7XYs6wwSrJJuAtxNtKgT9FhpWMxlI3siy/TnoDgw7F80MjN3zni8qRJhyxsoAh
	 QgbQ4i+z0uqQGhuKMopJbC5v8ealGD/Vb9LAfi9FIVdfA3LN1A0OLCpxW9fqCKvx4Ruuv
	 aUHrVODDE7gW3tVKYd3emYYboNVRoY6+ZTkUWI+1Pb3iG9X9yxh89F+hLTed4wiDwr6Wr
	 tNZqxJeHUvDMneCEA3fhfedDwIfqkqApYGJS9DDQsxuuRiJPPhSewdvz6ReYD+2xquW3F
	 ErMTvxQzPkFOjg/VZ8vsUNJcXHpliVdRZI1EOKtQc6T2gv2YFCqOaMY8kz2j1XJSa7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
	b=xbBVY9GvqUSyMATU/MkRPsFyGFa8AETt/K22YSOZn4H5uV8kbCe8xjIIzmO24gagiMg6
	 PZFbF9lxbI4ud9Y4XtCVi0H05PvhbfER0pq8kh5XyYcn8gBOIJILhLz7LRNkUpZDkQPjm
	 xgQ32wEVtrtO5MuSV2merV9wjiPuM75wgqt0J2pzOKzNorJcm/5UH+4m1ik6eIr9Al5qR
	 rJRoh7GBNKicHVRG05bGq0MQul13+yKQEoiIhsabsLAUlja0SMm5/ty5V9lB2TxiBulbB
	 oqWwOQwoeR8I14SrN8051q9nzSdtZ+4BQjVVxwtdA/kI2LLT5kTC5X7VbMVgJYLyFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c5vSMU4O;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A506606A331
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 16:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A506606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c5vSMU4O
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2122341eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1793206503; x=1793811303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
        b=c5vSMU4OlFpJofx8pyh53OYoKfiY201bp+bkEJXfqn7e+hktJysWEkZucR6HjEPfBB
         LDhg+3CBKTEqrpKe0VQPdo4WxW4U+n39wNy2ru5bquFNadzoWRfv182qfvJWGxU/OvIZ
         Vlhp2/P2q8Ljb/HU5UwFLFl4gmfZ5zEcABDGS/p0ws+ULgk7GO4NX4vn8H2AYSvd29Zs
         NXpI+6s24H6auqF5CJaqN32/AbZ4vmJcySvMQndnUHPoouAxBLXAs6QwEua6iarUbB3v
         XK+zJ3YN9uqzQhZVCkV798LASYaWoLBTboPr79DJqitpYzdW9NJx5kIyyZ8lqwjqNQtz
         VogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206503; x=1793811303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
        b=FpPo6aTs5PujY3w68ayZ0flZn7ZQ0BvGfuvriypyKzYRt+SobRWLccclVk5ebbE7Gy
         FjAksjTDxI1SE40LN4zZ7eMc2q7jGLqfaoEL5rtUOXsGaRodX5dslYEEivJXBWcJ87/0
         pYk+vwVZPOJ6VQAu0yaZPxy7WPynOS6dsYzf9Sf248UFIbfM6syDzBzqeX2uLvQPCzmG
         38asQdQ1f1jmCDbOyd272iuOy08VZ5MJNlvqY4hnlmESWfZJXopliS4qWhnSx73h2GAS
         s+cmB9Rqe2u8ZVehgH4ZW0QVNvzsQWNmdtHrZnwg9In9EAiA8AZQd2XAfJX6gjZEnYEt
         uMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/eFF0byydQh83GSNeNJLCF2osQeAy3l+dOEIEcc0M3281FOlZzEui4sKWvv000XxqlWXKFWbnYNQAvr2BM68=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjvcLwpValLKtEitY0Z2ROt2QEBZbggYVSA+39+DNnMsOeUv5j
	NomC64c0zioeGddT1hlpvlG4M7OV5Dp+BS5zt5BPPZMhtcuQtnI4o3749eNfNLTji/3460UpsD8
	Y96D+lwiJns5TV+IW8whubmd6E2xZ7oBdbA2VUcwaXFfdcSoJGacsRgj8hpX7aqw=
X-Gm-Gg: AYBFou0ma9gRHKv7eklQYfrh2D2dLFsSv6U8tHSW6nBIaXlVq7+96Y7G0jkv2BUF1wh
	mxbzwTeCrepQKo1vRHrMJCmY4JKOPIFL5Uk3nBCelfJzvjX/jgnfqn38DBQJFcbT688vZUaO1lS
	SZ6h8Bi6acVWLJdH0SLkVE8zgAJ+mPJFf0w0XiHoeaEKgYVtEeRHrzmn7D+IXR0LEis2LkALEQa
	hvhltG1JxKGWzDpZdlrPRX6OAjCXBH0IsyIHJiQBKQby1E638teuQYDSl28tYMG3+PsM7sirrZX
	UwY0TrD+vMYbvC9sGr/IQB6Vk0/UkRpPOkvD3Ktzstr+YURHjubdCwBoqpSUAdBku8ovrAcEYxq
	odtyZtYDqwe3+LN+BuVBYr5elO7DW1Y3CntzpVl6KAfpRER5ETsZEmJjQXas2ymA0AOB/l38xX4
	J814hZxi0y+5FzMbsKUuFBKrxcfvxZ5g7Ye+f2m36y6ZUat+QvVbMoMX4vDzenKXRLbgMkYaK/y
	Qy/+I7I5StkI8U3rfPy8qnqD8ECY28V8o6WXMicCUVO96j/4TWcopkAjuc0t7oaQD9pYUla57tY
	B46UVqs3dkxrbfRWM5ySLyHPGS9h9eDJO/ozOoYLbjk=
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4102794eec.17.1793206502537;
        Wed, 28 Oct 2026 09:55:02 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238d9a21sm8603125eec.4.2026.10.28.09.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:55:01 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Yingjie Wang <x-professor@outlook.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: preserve rps_default_mask on failed writes
Date: Thu, 29 Oct 2026 00:54:40 +0800
Message-ID: <20261028165440.1093223-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
References: <cover.1793199118.git.x-professor@outlook.com> <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
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

On Wed, 28 Oct 2026 14:52:09 +0000 Yingjie Wang wrote:
> rps_default_mask_sysctl() passes the live per-netns mask to
> cpumask_parse(). bitmap_parse() stores chunks as it scans from right to
> left, so a later error can leave lower chunks changed.
> rps_cpumask_housekeeping() also intersects its input in place before
> returning -EINVAL when no housekeeping CPUs remain.
>
> Consequently, a failed write changes both the value read from the sysctl
> and the default copied to RX queues created later. On a four-CPU VM,
> after setting the mask to 1, writing zz,00000003 failed with EOVERFLOW
> but changed the mask to 3. Writing a mask containing only isolated CPUs
> failed with EINVAL but changed it to 0. No kernel modification or error
> injection was needed to reproduce either case.
>
> Parse and validate a temporary mask, then replace the live pointer only
> after both steps succeed. Readers access and consume the pointer while
> holding the same mutex, so the replaced mask can be freed after dropping
> the mutex.
>
> The rps_default_mask selftest failed on the base kernel and passed with
> the fix. The fixed kernel also kept the mask at 1 for the overflow and
> housekeeping failure cases, while valid writes of 2 and 0 still
> succeeded.
>
> The issue was found while fuzzing sysctl write error paths.
>
> Fixes: 605cfa1b1090 ("net: introduce default_rps_mask netns attribute")
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Reviewed-by: Wang Zhan <wang.zhan@smartx.com>
Tested-by: Wang Zhan <wang.zhan@smartx.com>
