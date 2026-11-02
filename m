Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600115;
	b=rkyURigjCnI7qPYprGO6USemXa873CV74RnKxbvKAKjiIf+NtVqjfZ4KboqecU9e6FhQ
	 rq67sQ7OFsDJtTRB3etOBKZZaTKjnjOrpe15NarTgbkUBw2Oig0Omny0FudCL8LT+yQ8i
	 y1FXwXKKUoryJUH4EwAJuASRkikEN1CqqSQthoX4nlOSXq0qfxoSEaYOe2dFGfzMkr0gn
	 g8u33W2+HVsNHUpwF5SPxFTMbYWhewoF4oxNVhBuyMR8ftu1vxfN8nwJN/roXUMucTjlf
	 iuXIIwf9xqisccViK08RafAe/mU1vWyxwZYZS46y9f+EsddzMBixJsNBOTcAneamHKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
	b=tx3/82wry2hzNbxK+JyycwNz7ktqcQ32v4x3yKEw4k9b/40JlGDg8q2iWZbAaoBxSre8
	 fG8yHjBhJpWHwSHg/cqR38enFo9MuOYKYp9oJUegmlm5V1rvK7wcMzi0n/2MdE1PGt0mV
	 5vhcyOrZRF0qoFATXYb3gNkvFp0/gIVJe4cs1KkZcGhxfEUUsTNeoztWzcW9uRVkC+t2L
	 Q52opTT0lEjV62152syzLjdSqeFsNn07YyzFMuzM4KekaOoNDickCjZ85FsW7qQJY2FJ0
	 vhNuCjztW32dcOIW7Vxm3YmKit9Hdus7KjGUYqgyJqCxpDmz/aT0mZsnc11BQKP3Ckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4zjSubf;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D81606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 06:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D81606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4zjSubf
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso731674a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 22:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600114; x=1794204914; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
        b=f4zjSubff7t65yc9TzSFbWKzjEAU6ddyIxf7Rl1tmnjRJRePp4qnIdD6CFk1rIzsf9
         RKB8I39qlVFwEAJ2BouHPHj5aImJHb2nRDs/6Z1bqSTKoflIHa/vXKhQIQe4FdUVOMr9
         dwCaKBwj6Dx8Cm5Q85FpOHauS9FTuxWOs748MtKdp4H7SKrtrV7wPHk6vIOOEhSo+ArD
         GsmT4WQ8X3l9VGF7paEw2Dz762JpqwtLjzZyPl2/yyP8AhwYX0t6+1Sps3UbQgLEM3Z1
         C8fN8KrfjH+6Tafp/j/Hy7W4O1OIUVxT92pNORqRWsX+KFeYR1aIiEV445G4AtfYj34P
         fm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600114; x=1794204914;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
        b=wKjsp7ywI6YDFy/XvmIt9b5zP5dybCpZrRV8h+XWKl2xVPzEKv5nzNIJPOo/uizxdE
         N8eYshmNFga9VZ3UrlTxc9jz+YxJhrOwJSVOHqPf58h7vZiYqwyOEc/YyckEOHKLWqkX
         1Gu+1PqNVGjP6FZOAPLx/izOwRAtiygVkL5jNoP6kWUcmIU29f3GhJqN6KdjyYJpwEEr
         N/yDxE3hGKRr8wCjM5FOqCop671sXz5uotC8kd04WSr2JxCPeEYC711bxxdBjGLYUsYo
         7I94jy+mFXCritBQxZtjyza9jW+ddMTo5UHdXS+11EyR2bhKylKnpOaDVyf/Bb6PFXVb
         86gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm5gbUNtgi2UghIWB7al7XoJJ7KKtwZwC1ExwtKgELQ30jgmJ+BCoOkYqcLQKDOSe6ySzYcQhpzYOMs/21zt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R2UwsDPI+OzzZZ63j3x/wFZYN87k09HoezhY+FWang4hxFu8q
	EQ6S5wkRGTPWrvSwKUpyAgSqZ6wU4c9HFUzsvArgRMPWSk65+SKV1vp+
X-Gm-Gg: AYBFou0lma3oHB2kHj3QqxKs6/lXPRsW43n7/bkKE/1uQ5ob/yiBAgpsex85IadCL1u
	vUXLwNWlQ5ohB4PzVtSL/PwBlkjTZx0m16wy3bMj3qcEnHTDIjTIwenMHpmEGvWFH9ssJNGtnf4
	io47k+pW65yr2wBaV8aL0eUldroUbT3GNdPadmsFPRnFD3VQnrk3SSIg1oXiQCtMT5p2xUKQZdL
	f29YOdWS7yaOKnk6vMDSV7l7sSW7QAXNBcjXHSPuidyXcWwKxXCe+RJV+Tth6CpXc1152oXSDFh
	cowPqOQIiNioAaIZvZi19LrV9rPIVwan5/nh/E4RSDB/fn94bZm8d9o5I1X9kONJth8MuqfmSvU
	Tg9aCShe0D7YVtLvEXaL2r2UjOb9/oo50K4ArfeoGOKtEif4JBJWkYYaakSUH6FF5/EWCOG7BpS
	bJ0t+dTYuj3V7GD+UUaoh4EGbSEFdVoVnzhzoDNa/LeHJIjC6obslLwjhjwOEavGLNGokL9Vedu
	b5M1JG9TJc9ioL/mhlsmsNooZaplUVokYyKsrO6fgr3MbKJlRyLwgzSx1XS2gqpcYXIN/daQmPB
	TQjf5FihyFrsMD1y0DcFbeG/0c8g4NRTUSwVDrH1kUoI5ZY49+QLFFFKB8xkPOmQDP57meBzixa
	BFPS53C1LVgafZyiTcg4JcAOKOdCnB+4I0Q==
X-Received: by 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr7444865a91.66.1793600113727;
        Sun, 01 Nov 2026 22:15:13 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm17118903a91.13.2026.11.01.22.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 22:15:12 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 06:15:11 +0000
Message-Id: <DMKI6C7FPCCV.2Y4YLRGWNSKW1@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Mykyta Yatsenko" <yatsenko@meta.com>,
 <qikeyu2017@gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Wait for wq callback before
 checking ok_sleepable
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <thamrinjonathan@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261102-wq-poll-fix-v2-1-48b7d12815b8@gmail.com>
References: <20261102-wq-poll-fix-v2-1-48b7d12815b8@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:36 PM Jonathan Bastari Thamrin via B4 Relay <devnull+thamrinjonathan.gmail.com@kernel.org> wrote:
>  	ASSERT_OK(err, "test_run");
>  	ASSERT_EQ(topts.retval, 0, "test_run");
>
> -	usleep(50); /* 10 usecs should be enough, but give it extra */
> -
> +	/* wait for wq callback to finish */
> +	while (!READ_ONCE(wq_skel->bss->wq_cb_run))
> +		sched_yield();

This loop can spin forever.
The two ASSERTs above it don't stop the test. When retval != 0 nothing
starts the wq and wq_cb_run stays 0.

  what goes wrong                  today   with the patch
  -------------------------------  ------  --------------
  test_run fails or retval != 0    FAIL    hang
  the callback doesn't run         FAIL    hang
  the callback gets a wrong key    FAIL    FAIL

The second row is what this test is for.
The watchdog doesn't help. watchdog_timer_func() sends one SIGSEGV.
crash_handler() prints the stack and returns. The loop goes on.

Waiting for the callback is right. Waiting forever is not.
Keep the loop bounded, like prog_tests/ksock_wq.c.
Then there is no need for wq_cb_run and for the changes in progs/wq.c.

Something like this (not even compile tested):

diff --git a/tools/testing/selftests/bpf/prog_tests/wq.c b/tools/testing/selftests/bpf/prog_tests/wq.c
index 97926e3..c4de70b 100644
--- a/tools/testing/selftests/bpf/prog_tests/wq.c
+++ b/tools/testing/selftests/bpf/prog_tests/wq.c
@@ -7,7 +7,7 @@
 void serial_test_wq(void)
 {
 	struct wq *wq_skel = NULL;
-	int err, prog_fd;
+	int err, prog_fd, i;

 	LIBBPF_OPTS(bpf_test_run_opts, topts);

@@ -25,11 +25,13 @@ void serial_test_wq(void)

 	prog_fd = bpf_program__fd(wq_skel->progs.test_syscall_array_sleepable);
 	err = bpf_prog_test_run_opts(prog_fd, &topts);
-	ASSERT_OK(err, "test_run");
-	ASSERT_EQ(topts.retval, 0, "test_run");
-
-	usleep(50); /* 10 usecs should be enough, but give it extra */
+	if (!ASSERT_OK(err, "test_run") ||
+	    !ASSERT_EQ(topts.retval, 0, "test_run"))
+		goto clean_up;

+	/* The callback runs in a kworker. Fail instead of a hang if it doesn't. */
+	for (i = 0; i < 10000 && !READ_ONCE(wq_skel->bss->ok_sleepable); i++)
+		usleep(1000);
 	ASSERT_EQ(wq_skel->bss->ok_sleepable, (1 << 1), "ok_sleepable");
 clean_up:
 	wq__destroy(wq_skel);

pw-bot: cr
