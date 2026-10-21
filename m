Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540980;
	b=yyD6AjrOV8tCk9wYTLUfK9ZsvIrMaRAZceAXNXjQrEiK/IdsFbMa7tM2RRRObkQRIRwv
	 UikY89jTMUvs4iHxsuQGH4bFsjOkOH8pHfh0lem9qruyKbzrtgpUP2aa/c7/lX46mrTAc
	 n0symsj2W4JDUdz4COBBo/AozURalxUmBa4pV35GrJKN2EYr0EUo3HN9dXKPwHFp57nMo
	 dxBQI3VeXMkf28miW6Fk4LlgrIL3V0ctHnhnJwGj1oMFjZHTdaGUve0B0v+qMuVTSEN55
	 KDlJqbttt5Sw9IxtboG5gM0i9YsJMmjMonK30iMSdIumRu3i4BqGLsaQN7swk028rRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
	b=4AJ41Jg4xAzGJkXWooDUoqv/4zdMSgh+nOi/NLHu5GwvsKFB+vsTPbyR/nGeu8TgN3/P
	 OhHZx7YhjxtkrmssznvJSZ5XprpAmnD1U9PJ9Du4H+EfLtN434+kXhcb8sm8VHg733tW1
	 vtzovwzASpf4slsQAbOCID7cCgg0t0BI5WulO8U9KH/G3/XUeQ+PsFF5VcAdID0pDx/hG
	 t+yVxLuFRPjd0okZYrrME9LXAHQY2YCiMj4yY8+aKHwdlUq01fYmipBxQvj8TVmfve/7K
	 1fHfrtTiDjt4tIha1eO6H6qqd5TgIpG78mlcXquYRBc1joWavXsuX0x94gfHincbDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RgAF5g69;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D9606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RgAF5g69
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so140507a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540980; x=1793145780; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
        b=RgAF5g69icJGlvHbD3mcZZXrpzRYBuNDgAgE1YGBHzfV8HVTIcmBfgDNOnAOI/KKxa
         mqpwhFNZk9+nkR6JGkbVD1hQfLVZMGztuaEDZewo8nUn1TCTnZFUyvOpcce1BUXQVG2c
         ETjK62f7ofcKqKqpE+Q6/hC/nvpbGr1DwjF7ftwk16v5eUC1QD4WWPh58qQinI90jhjt
         VEepNPAu3BOAjH6zRApL5EqkMw0Elk/yqJF9sOkuut4R0Gwp3bEqLNiivkEiVjNF4PIz
         YjJRzpab/n0QR8qKFnMxKDWaBTdLTO0Sme/D1KkNRIla+1291rl+s0Kemw5Dpiy+STgV
         SY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540980; x=1793145780;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
        b=yktjPCZImHejR6hwa5mrJGMHLuPUz5yiocWBwLN7PWtJ6W4f7A26gHlnNVRTNoaXxg
         L8+soiRhCDHxHCH0JR6kyEBC8wSO/89TspOkvbc6ozyPKtCUwoX9k8Vea+RtEGjORwQR
         n2Sa0Qwjv1eZT+Lq9UoamHMYNQSWgCFR9aQFSeFrj0VgRzTFFn+kIqxVQvSm7kY6lIDe
         ApWXFooq7AU79LInNwcY+exrrtVHtlK8g4QksGUETgVj6lli9coQqkW/ZbxZ9G0eZ4eL
         bbFmRKQs3vS1DIuq5t8zxkeC5SnHdYZYk+9Y/3eMN5jNOXu8atKSzQ4C4/uN/U+MUVS9
         TT/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4DoKacIcj6Xi+ooDFUMSWY+7fVUvCljz3CRkySL3S+5VAOiHb6h8lbW+K/h+ikzrt7W5R0ewXxkpLmT1VAnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+CEGIvoHk67ZNOgzZoqMPkCKROukgvCPLOGrzMy/7NJ+T25r0
	bFje+UZieOclX9PHCENYoku2hhSa5Z8mPznskw6kXwCVjB75AFOuQjKZ
X-Gm-Gg: AYBFou1QGOxrLwGksmdAUmUyiGmr+VMmd1Dy9zGhjDMo7PlMkXeD5eZwwuEwvzq2KDP
	OhD2LMLdKpEbSw5psf49ELuAMd01FpG6DBrpxNneJHpln7IqcfnkWFhwkyYVJYZshTUMHt+jaoG
	piFCE2zIJ/gOkJSvUtzq/4DgRz8bL0Tyjy9R8t8ovEyL77owUq5VWJ5WYcF3JYW6eXItXuPtwrM
	KAp6tBZkSnFyKj+35spyudE7qje7v6nYGpu++MBezNHjtjUgQI9MF6bdxB6m0aZU1LjvonxfRkK
	ab2UuqMsk6hUNLmSqVilnkTZX3j8qqGcVRk/bMJ+pVpCEckerY4Q1Z6VhifqX8xPw0Wedc/xqSB
	Y5X/frIJ4CqskpeyrLhDto0iuVGgNdbz2hUFJgxiXGom57S8O0ki6WVqz+G2Tdw4Ph+QIgOc7XA
	BuBN5XS7j1/Yyo/KEKSClmkP9lc1OD+m/9sP5Vk72lQQ2blAV/em8LsNcOHNraVemPqRQmNRlpX
	7Q7mzGbHu56aj55GPs+mtE/PaqOzN/wir3INMgAsfKE70x3tUWJRnEcLqlpNhA5Dn5iKCUEH5JJ
	tm4=
X-Received: by 2002:a17:90b:4a90:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3ad86e5ae73mr384944a91.3.1792540979783;
        Tue, 20 Oct 2026 17:02:59 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm1424756a91.1.2026.10.20.17.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:56 +0000
Message-Id: <DMA2QS9N1LRH.OIOET3SWXS1L@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Hou Tao" <houtao1@huawei.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Expect at least one kprobe miss
 in missed/perf_kprobe
In-Reply-To: <20261009-selftests-bpf-missed-perf-kprobe-v1-1-c9d0f75f6f99@gmail.com>
References: <20261009-selftests-bpf-missed-perf-kprobe-v1-1-c9d0f75f6f99@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
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

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> bpf_kfunc_common_test is a kfunc of bpf_testmod that other tests call
> as well. When one of them calls it from another kprobe while test2 is
> attached, the kprobe of test2 counts an extra miss, and the test reads
> 2 instead of 1.

Which test is that?
The only other test that calls bpf_kfunc_common_test() is wq.
wq_callback() runs from a workqueue, not from a kprobe,
and serial_test_wq() doesn't run in parallel with anything.
The extra miss comes from test1 in missed_kprobe.c.
It's a kprobe on bpf_fentry_test1() without pid filter.
fentry_test, fexit_test, kprobe_multi_test and many others are not serial.
Their bpf_prog_test_run() calls bpf_fentry_test1(). That runs test1,
it calls bpf_kfunc_common_test() and the kprobe of test2 counts a miss.
Pls fix the commit log and include the output of the failed run.

> -	ASSERT_EQ(info.perf_event.kprobe.missed, 1, "info.perf_event.kprobe.missed");
> +	ASSERT_GE(info.perf_event.kprobe.missed, 1, "info.perf_event.kprobe.missed");

Yesterday you sent the same change for tp_recursion in the same file:
https://lore.kernel.org/bpf/20261008-selftests-bpf-missed-tp-recursion-v1-1-0dd60471d655@gmail.com/
The cause is the same. test1 there is a kprobe on bpf_fentry_test1() too.
No other kprobe prog with bpf_printk() is involved.
test6 in test_missed_kprobe_recursion() is still ASSERT_EQ 1
and another test bumps it the same way.
Fix all three in one patch.

Also pls send selftest fixes as a series instead of 10 separate mails.

pw-bot: cr
