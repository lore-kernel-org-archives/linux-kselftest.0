Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CA58E2C6
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175765; cv=none; b=KilSQSrEZlhp43RqGtCMZyXy1JVGt4XS5sGAB8jM/dYzktbk3Ba2HbWUZFg0bcA+J9kPOydX0XXePOmtRgeCYW7lYGvAAkWKgpcO06bqLuexrWSUU007d9NVwLk6y+qypStpmUPCX9h5bnG9fLbxAvD2tFP7V58th34b4DaCtos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175765; c=relaxed/simple;
	bh=UHI1RhtYGQef+Hnl8xvao754eLHDmAqBl8wOTDDyFUs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=BTpiI/9Pfjwr9MmW93peFV9z6ffNRPWohb4sdLlF9AlZVwcwqI4w4AYPnhOSbIg43znc5qbsJ5bQdTM7z7A51mMLZ1D8mcuV6DVn0OzsqWqf5j6Z9s/XdStEPlzjab9RPuf5QQTQCjr/CUm7GHtr9MLSbyMXKXt9WzQAssgL1Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNL1YHMD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNL1YHMD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8246b13cbso1128615ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175761; x=1792780561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nuY2v1ppZTu7OOAjxLm6de5JB+RdUhZ3i5YpRxbk/IU=;
        b=WNL1YHMDqZSSoB6FTDaeffGOoLegOzvuoshVOf7Fih39HoK1VZn7ly8WKXaEfxLyln
         nIWCv38psi1lim/p/0D0OJMcn2Wj67sscL0Vk6B7m9FW7Jtm3yV8f/atNxlcbn33ZQel
         DIrRz1FxCQtgf1OfCG9YRgxfpr/MRkXXzZ2Fml7uL1k+uH7WQP98gmfnP9YkMYP1rwGu
         sIwdfpl0X71N3Cgtx2+KFPzquH5f4eV/WHiY+EF/ive7PjBFK/DHIbM1+W071C7XLaOy
         dZ/p0+FJTJeAPhTgLQx9cuV3aNWG6CJVCZ0a4WV5+1Sz2FHc8S8ljPgAxd+drHPa0MpW
         jtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175761; x=1792780561;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuY2v1ppZTu7OOAjxLm6de5JB+RdUhZ3i5YpRxbk/IU=;
        b=l/XKkcMMTs08jSpwSub+zm3sF7ou9eU6PHoBElf5cbREzIQgHAv11sb2uCgfN3JnAU
         reqgvP+ltbmOzcgYXCsoar+ponJCjraMPZWhlem3+GO7KmObel3MXCx/YFj640wWUEPG
         L95NXnA/RbVvV+a+7bOHzVIIDj4kwhpECfV9Fx33hZoQEkGrwwVfF+LuPpEHGf7h+Nme
         p8J5JEsocBkonhw/KzujLJupsbYudiXuhs5iLdafUDd3RJQgQ2CeAggZBA2FBeyC9Ycb
         HwjX6HkFpFngcPzFFUNmIw1IanGznFGM5kmCg/6o/RoSwOQ1+UXYYgKYwS4zmceQFwTV
         el0A==
X-Forwarded-Encrypted: i=1; AKwUvBzoJE8Wps15hrClh9OdeUYMiybzE/x1G0uScwp/euDUZHhMGPqWGiztFVNn8Dr4XqamlUvxmPHQAsMeqMKF4hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYILTPHCXUMgBZElaNDCbMa0X19YI8hgzmkmfIr4x+U3orZoZAFf
	FooOMyov+c2BuKpYOxQYVQYFdMAePRa49QIHN1He/KxRC+tvKlxGSSH/
X-Gm-Gg: AYBFou0JvJ7edrZCIpHk0n+88Trnuu8NMfmR6vT9YPqHK+clkZSJpu9ew3VsSmw4xlV
	7W9ELYsacZAdCegq+XQQsNWmVbN8AR8BaOazwrND6uSAsBvc3XnaaX+pqzq5dsedOq/t56NhT9k
	aeTrvGQ7dJiqZ+NDpEngbN7EfrWmR8pj5PCF2JtKwHuGmsi4NcAuP8iF0P4DYek9wvLDMwJfXp4
	eMgKkffJimd/1dfb+96wcRwkp7+mIdmiA3HuFHbqKEzI6btQc7JK9y9iip1D8hRlSK4CVO5USJj
	JVNIQxBJaUaGVll2NfPLtRlqxE80m6wKoaxtZi3MSiByhERTXDYvhbXScnWA9wImf91dHnbcHxU
	+Hc8H7kGi6WqVLtZfjYrOyD6+lD189hdqIZKKOC8H4zLqn6+xW39WTE9wZ1EBx5p3G2kioPoBDR
	/sLNZwjDK+c6grs98tigyX56bIxQbXkEBJOLZBweMtobt/+mOBl5hfGXgT/DK/Eh/4rwoIDI6jX
	r0hPLZWIq8ES1mc+sjQzXZvaizqt8jF8y9e61pDlfvZAQHjp1z1mMNwe5PrIaNrNb6czYnUjMBs
	LYA=
X-Received: by 2002:a17:902:db07:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2e9a69f8df8mr7920485ad.26.1792175761184;
        Fri, 16 Oct 2026 11:36:01 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d51a6sm14945295ad.12.2026.10.16.11.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:36:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:35:59 +0000
Message-Id: <DM6HAA1FCDCO.1V38UFFVZNV16@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Run the enable_stats program
 with BPF_PROG_TEST_RUN
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com>
References: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 10:04 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> them. As a single run can be shorter than the resolution of the clock,
> run it until its run time shows, unless its runs aren't counted at all.

Did v1 fail anywhere?
It passed BPF CI on x86, arm64 and s390.

> +	do {
> +		err = bpf_prog_test_run_opts(prog_fd, &topts);
> +		if (err)
> +			break;
> +
> +		memset(&info, 0, info_len);
> +		err = bpf_prog_get_info_by_fd(prog_fd, &info, &info_len);
> +	} while (!err && info.run_cnt && !info.run_time_ns);

If the kernel counts the runs, but not the time, this loop never ends.
That's the bug this test is for.
check_stats_enabled below can fire only when run_cnt is zero.
The watchdog of test_progs won't help.
It does pthread_kill(SIGSEGV) once. crash_handler() prints
the backtrace and returns. Both bpf() calls don't block,
so there is no EINTR and the loop keeps going.
The test has to fail instead of hang.

Run the prog 1000 times in a for loop and keep get_info as it was in v1.
Then no need for the comment, and check_run_cnt_valid compares
1000 with 1000 instead of 1 with 1.

Also pls don't respin in 12 hours only because a bot said something. Wait for people to reply.

pw-bot: cr
