Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795893736;
	b=roaezhs/I6XQlfMofpOb+GDrlghltg8/2DrMtC20Z3/mZ0/1goLeu4ALd+MMwNkbFUxI
	 uLot2N5JYlrflGXXYOKvP0W6jX9FpS1XXtSWseLZmZ/zVzhYahzGy2E7HW0XRCgpwW10X
	 Q/w51e3FUpUNL8cVkiXbwq4eWpztQfUO1iIg/U7EK90TQ/vhfjjBCU0QnjrgQIxTRv+RP
	 2tKcvREwjgBZhebDABGLpP/Vqvt+J2paVdga89acpzvHj/BxRb0imOU5xMJfXvJ3ugbXu
	 8ULAS3QSYp96d2Yy72XwIYR0uDuW8JiJJTELIKQVD9Qe8W0E4hlwyZgni791iw0PMRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795893736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JETgnnuy/TYspCBqj3YJA1BqZ7//3+jC5nTRA+HallU=;
	b=ChrpGLrmqGvGfUJ0ZrdrpOwcZKfARSnmKq/x6SuJRfYTpBi3CB3be3C3iVoHdKwg5cDa
	 FiiAHkXapgQF989G5B1YsRDqwpN4+JSkkdQmOspjFWOjz63W7Hc5+sqzb2+7QRq4Jz2qe
	 44SYQ+aWmFMMuH7wpXCFn7VM4+35r0x/orShTptj/VDbcwshjR2BsAr7gul58/5VmVHkr
	 R8aHFptRx0jCBZdXYUmvzVtfbiC2XrnJkoMXnEaDiHQqszRenn8Uj4LTfnTZS6hPlLpHT
	 ll7Q5uTYtn5bJLfTcarUyic2n8ujw7cZw8Cmc3qvqtZKbSy+gpSmVKAu3awy8SmArJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uog8XOqc;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52651606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 19:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52651606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uog8XOqc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so93545905e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 11:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795893735; x=1796498535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JETgnnuy/TYspCBqj3YJA1BqZ7//3+jC5nTRA+HallU=;
        b=Uog8XOqcz158wukYhNWwjr2zbGyiL/VjBleWF+EndfTzntvCUctd0cbOTjmj6hYgs4
         7vymrlzuJp1whUHoHOUFX9J8qLboUD++D5AwAlF7l5G66a4mgklqNm3FCip90lLs09s/
         w+I/KzzOtgazC5ZMrukhvRyX2x6hFkIqC+Qe/I9EqVt5W/GVPFerYbslEPgmqkxB8ZiI
         KeSkbFPXUQddbmNUv772lR7OaF/Hc9XeoNiFndq6Pe6bToNfwfQ4hFVgZogHRyCCAvht
         cUUuNbW0/+6B37oW7G2YEFzsOm49gvixfDygxaV7m8L+Tm59hU5Vcrpi8XeNA55stt4y
         TbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795893735; x=1796498535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JETgnnuy/TYspCBqj3YJA1BqZ7//3+jC5nTRA+HallU=;
        b=EPeAe0GK6Hlf+ytTcAXcNz57TtKuUROl9SLm7bMO7OiRbQlwp9iSffG9CEz/8dlcAS
         P3ZQ8mjzlhccN0wbb1MMU6nTYRC26BuBvdid/8ogjLvz06invLWygJzSQNtg6A1NgyoY
         frKERqF2dZiddTeuKbdAg6mpjt1c81wrnlb74r+bRsmXmRzFg+qUFrJMnayOgoz2j2Fv
         YTLW9rzULgjVCz+pezkMm8Oikm2T82IfZanJBtGOfjqe/zoNzOb164aLlxZGulS7Gld/
         5zi9aealDgg6B3SzQXLiRTejV8K2/KBaX9DM0HARCoAkiZIhWn16mAobN5OrYJDf4RnT
         VFkg==
X-Forwarded-Encrypted: i=1; AL+hErE4XNRzWcYbnge+2Vgpq6zV8jO29emoYQpm6qC+xp+DFBECUG9Cb77fQXnNTKLRRvuwAyQNHhq8wLgg/b+vfNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gYJjCYJi1RwAl1WfWqz8gPaSLXkAP9Qy4CcvnO1cGhHpdU82U
	0twkW3eJ4uVndeOhB9n1QW2odDDQD8C3c16/hTsqkwSmjE6ErOXorXiW
X-Gm-Gg: AZFdTZdVVyS+Llro2TVgx8MrSgG90lcyTVksmob++sL4aX5/G2fd3Nlysvocu/Q1Oj0
	kRkww9CUy3gJvCLRtWKc9JZi+2FepiQ6TjcuDFwNffsEzu1e8V6p+NRfbLSckU3YJ+Lrc0SwJtx
	XOue1Cuz2NkknefggaptKKtICqZa3hFMmTQ2vQ8qL8TXQ5+5aEdAnb4pS05P0vCmfZfDP2z8Cga
	Y/O1gKR+DC6Sf1waZcmD1lXaxTB/QJrld9j2u8cRM8hpPZoU+HIm2vqTytNYkFxSqIsdBDCZTld
	QzNt6l9n5U0nN46XHbenlrPsAVbakRgXY10XnyOsf31uwkBMQB5utCbptZSsXWTOsV+APqbaYEf
	cBzbm25wZv7bbktPRP6oSYoecd9qThAoNzObsT+DAR07R/andqJscPsKtxA+9IBHyONc+fK8Caz
	9UrZIXSxpKAkNYk8FwTe1zhIa6FCDUXL9e21cixQEjED2hXs1cXChCPctzLFoXBnKoYqi4EUgX0
	BBAZvmpzVuXxQqMiQTn9Y9xPuXrPsc6ZESENncKPxvBoC5JYOg2ofT/zT2dttMTyEKqMCDL86vg
	K+EGpiDcpRv+yGqvG6yErf0sxgWlVarbJK6wYeIK4aN83yt77qnGtxGL21NI6xbfIuJXCTnylEy
	esEiC9nBfhT3205D2tm7OaGPEpYxl2ejcoxj7SMcrBf5AproMwg72iz1nwUMmcTd9HlQBGiKykN
	9J+nbaIYL/b2ExFvAETyQ9BcR/ptA44n/Mh6+SoQ==
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr536768845e9.30.1795893734417;
        Sat, 28 Nov 2026 11:22:14 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9a0-e301-d19e-76f1-f69d-bf77.310.pool.telefonica.de. [2a02:3100:a9a0:e301:d19e:76f1:f69d:bf77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm779630445e9.5.2026.11.28.11.22.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 11:22:13 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	paulmck@kernel.org,
	boqun@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	oleg@redhat.com,
	bestswngs@gmail.com,
	xmei5@asu.edu,
	xujiakai24@mails.ucas.ac.cn,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dominik Maier <dmnk@google.com>
Subject: Re: [PATCH 00/17] sched/mmcid: fixes for execve, mode switches and affinity
Date: Sat, 28 Nov 2026 20:22:02 +0100
Message-Id: <20261128192202.93895-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <87bj79s11m.ffs@fw13>
References: <cover.1794932121.git.mathieu.desnoyers@efficios.com> <87bj79s11m.ffs@fw13>
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

On Sat, 28 Nov 2026 11:28:05 +0100, Thomas Gleixner wrote:
> +	/*
> +	 * Reactivating MM CID is only required for the success case. The
> +	 * exec()'ing task deactivates MM CID after bprm->point_of_no_return has
> +	 * been set true, so any failure after that point will prevent the task
> +	 * from going back to user space.
> +	 */
>  	sched_mm_cid_after_execve(current);

That doesn't hold under ptrace.

bprm_execve() uses force_fatal_sig(SIGSEGV), so a tracer can suppress the
SIGSEGV with PTRACE_CONT(pid, 0) and let the task return to user space with
mm_cid.active == 0 and mm_cid == MM_CID_UNSET.

I reproduced this on tip/sched/core (arm64 KVM, RT and !RT). A traced
child unregisters its rseq area and calls execve() on a static ELF with
an invalid e_entry, which fails in load_elf_binary() after
begin_new_exec() has already run. 

The tracer catches SIGSEGV, sets PC to the mapped _start, and continues with
signal 0. The child then registers a new rseq area and reads mm_cid:

  baseline (RT and !RT):    rseq_rc=0, mm_cid=0x00000000
  your patch (RT and !RT):  rseq_rc=0, mm_cid=0x80000000

I also ran Mathieu's tests on the same kernels (2 and 4 vCPUs, RT and !RT,
PROVE_LOCKING=y):

- execve_test case 1 (07/17): fails on baseline (0x80000000), passes on
  all four configs with your patch.
- execve_test case 2 (08/17): fails on 2 vCPUs (mm_cid 1 on CPU 1).
- execve_test case 3 (17/17): fails on !RT baseline, skips on all four
  configs with your patch.
- exec_affinity_test case 2 (12/17): still fails on 4 vCPUs.

Thanks,
Karl
