Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541014;
	b=AiPC1aQxF7WW1IwnaKpr1c/Zh9IyMFQskILpBlkL2AXmt7zb21v49e1rfjwLD/5m9/kx
	 5P2fHT0B1P/ti3X0lonnOHWH6QvkQhiapHg1xnUlxQoeQ2+KdApvf5T0fxva7ICj5k0yA
	 5A7jAuHPA1j8qMVLXZ16b2iUlLrpcvtCIm67druV1Gb170FvQ45fo3cMfu3bIFjLL5Hlj
	 b6vU8uAQJSEVivvlbm+GPo96+c71P4KrrQh8ABr5+iXDQHP7ErxLpyQvUQvjdEaIpQnMv
	 jRU67PVShEZx2d3Q200ztqsO9Ai8lEEYTISUOh36y8c8zkUaY1XkpUoBq29xEwCVt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
	b=vtb96n5QWHWXk6RFy3J6BqsUDLJf3sKeXKuBaqIySwcnNfLoyAQf8yHk3IvcvwNN8xBp
	 9ZsLe1egpzNSYvxRnA/wJ692MCdigUe0mwbK1E/lBACD4k/akQ0s+qKIH02DO8Mx/ZwwE
	 ryloeIav8Q6TLc1pqfyurVAQcsMtvjELXq/1MA74b//2b0oS60iGQetbaREr/z0rx2rUu
	 q3XDyRdtvgZpK4PYR0hfRCf3fHUU9PK1qDIqugIJ7gVBA928BkNa3ehLHmosOQG9rd/Vl
	 qDid3z/baGNNO5zEhgWLwppsc2sfYTKmNBOBQI2GCJpcSFD3mihcr3whcfw4+iVPtAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZMEt/2it";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB46606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZMEt/2it
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso56496b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541014; x=1793145814; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
        b=ZMEt/2it0rDxDHMN5+p0lAcKOC93Y08ECZcMWhaG3jaszhSDde1PHD/V62CPimWNa8
         u6LCqvl9cxTgr89VJ78O4MkdrFayQRO6Rsat7NW1yW548f15+aJOVqBID5rSSGsj8Hwx
         OW0nw708LIH0SJAb2Uq44DqS29Tu5JK8gmuUM9yWDSqFWqepzcy2OQ1LToPZhZrx76uD
         KXHBo1bZ6o1IU7lhmaJSXSSK6s9VPpbzQo69QUYKGzSiGmckzn+fK4jbxUU1SQEPKoQu
         BxJ/QBXELQpORXGFjfUivFIV8UOU98nOUrUIXaVf7pjJ+xuTGkBU9+fHb1ImSnpDEKF9
         XtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541014; x=1793145814;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7cBhNpg0ui+vvenTrI+Qs2agwPMwE+Ym/zTHxHB83I=;
        b=nYFxXDKEbGfwYvR1FULp5CeyH0/TcFMGF5l8YWaoWdwNIj9qxfwe9sazNsBVmVrWFa
         CdpChmyA6uFKdiKjV/ORHUMlUGwOkqXdYkmb7HVmkmh/DL3avxKypaiMH/Mcv2XxOWtf
         Y13RFliYFGWSlKh1WJWQ7bmD57GJfIw12zd8j3Q+cCBDUjl2Tlm0/I8lNvZhCQ9+HiR0
         IwGw/Af3CQpBhTF3N+57PL1taUeDJEEESgJjEyw0NtyODNZ30EmZktrbs5gIQif0j/n4
         VMjjNOuXIZVWFpvDcLCJM9JGDnBo+Qio1zyy1XP1amge4pHmlVEsSfBHauDoDl+ejG5O
         yw0w==
X-Forwarded-Encrypted: i=1; AKwUvBx+inHK/YkiI82s8d+/ergoumpWbOnxn/hfAnx8Gqy0a3hORltY+MRdSqqfeaihkBpSkF5Q5q9WLMHiHKgtoLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiVIhPLqX6WgsfYSz0HbgAuD7eBJALSv/QPsFnWFnXySEjEox1
	SUxS7ErhS6834fg+w4sWrlQUyKEmXwdLYhZo6N18FTHPyCnHH/4008Lj
X-Gm-Gg: AYBFou2MlsG7mQevU3CeHgFLbyjbhgdj7V2kk2GXFCVpRF05k5Qvc+Hr8T373dtTvYr
	irEqwURx/bxNyGDBHk/Y9BKZJpS8jYIQpxDLd4KB5UxPBN6WS2EcL/0VOkje7f7M9pLymQrsb51
	IVTbHvagy8PWuUpLLDRc6bsT9MZywLA8aDybOwXrADZDLO16uYFiF8/TIBxXN2cjFjyhK4rmWpB
	rMubxrHzZQOZSj+PSFk7Ttos6wZCeiiReMA5285ELcoNouAlUya96RRohTMMrxNUmNn5MFpnzNC
	cwF3Qp1TPcqESgAk48t9Bu+B/dCtdpHSwxXVtdcgR1CwgyitsSi7SIaUyWg0ZwNTojSrkztlEXg
	gSIRyYNIMYxZwlLXlVmGgFMpd8jGGQjzDQ1yC8Oc7CEQt+n8Mfj+9iPbd32JcV5fm5QEJU0JJh0
	kV2mIP8fb4g/eMhjrsTsmaROo13aullFD2c14wPSFo/mWVZI4rOB8wX8GR+pYMt0hDan+cRet6w
	5SxhGi+ASq/Wv9KN599mbXZlunvjLW4glc7jlOGfbNzh6Q+bZicucj0R6vYh1iMH3gkXA1K5wiu
	hgc=
X-Received: by 2002:a05:6a00:2da9:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8a089d21b81mr372682b3a.36.1792541013696;
        Tue, 20 Oct 2026 17:03:33 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c0affsm153415b3a.29.2026.10.20.17.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:03:32 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:03:31 +0000
Message-Id: <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Validate stack arg reads against caller
 state
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Xiang Mei" <xmei5@asu.edu>,
 <co+eada64ce90ecebce@bugs.sh>
In-Reply-To: <20261007174203.37071-1-bestswngs@gmail.com>
References: <20261007174203.37071-1-bestswngs@gmail.com>
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

On Wed, Oct 07, 2026 at 10:42 AM Weiming Shi <bestswngs@gmail.com> wrote:
> then read a slot that the caller never allocated or initialized. Async
> callback verification also starts at curframe zero, so subtracting one
> to find a caller can underflow the frame array.

Sync callbacks are broken too and this patch doesn't help:
  *(u64 *)(r11 - 8) = r6;
  r1 = 1;
  r2 = cb ll;
  ...
  call bpf_loop;
where cb() has 6 args in BTF and does r1 = *(u64 *)(r11 + 8).
The slot is written, so check_outgoing_stack_args() called from
push_callback_call() passes. push_stack() copies stack_arg_regs[]
of the caller and the load in cb() gets the state of r6.
set_loop_callback_state() marks R3-R5 as not init, but stack args
stay readable.
At run-time bpf_loop(), when not inlined, calls cb(i, ctx, 0, 0, 0).
x86 JIT reads arg6 from r9 and arg7 from the stack frame of bpf_loop().
The verifier thinks it's a map value, but it's garbage.

No helper or kfunc passes more than 5 args to a callback.
Reject callbacks with bpf_in_stack_arg_cnt() in push_callback_call().

> +	if (!vstate->curframe) {
> +		verbose(env, "invalid read from stack arg off %d without caller\n", off);
> +		return -EACCES;
> +	}
> +

Only async callback can get here with curframe == 0.
With the above it's rejected earlier. Drop this check.

Add sync and async callback tests to patch 2.

Also mention in the log that
commit 4286f5deee14 ("bpf: Validate outgoing stack args when btf_prepare_func_args fails")
closed this hole for the first call only.

pw-bot: cr
