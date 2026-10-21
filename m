Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540873;
	b=ft+lUctpT6e+lvYU7pjhAHg9efGJFag9gya0LlhtGEewJcVjSm1dfUN/1tgSo/DCUh/M
	 G0OIb+a3KzFUOB2QdTJX6Pc9FRRxGAfoYOCj1Ymzr3/Vyk9phbz42r6hXHDVxKbU30P1J
	 +qL/xf4dDC0Lk1Yd/UfTMNlo90WDqamRz4LBBg+DgT4rCVjTBEhQv0USf/Sr15t3D7SbY
	 xlqYEh4oUXnO+i7V1hlMj/yEQ8YHIpQEtuhF+t+NmZIxlBQaU8kxNNrao+qf97SxwQFw8
	 A3tLBHU+Om+eljkOLYsd5r/Rb8XofbVNAxjkN2Njf4bN1MBnwRV7M5y3CCDmvmVPuPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
	b=mpcKJkiImGIGjCn1gRmP93YHXv11qaWDVkrP8OrqHRr27AgCOBFAPWbsnQFmYLC6qtQ7
	 KqPHIR8msvGinMa8XASLj7eM3cspHkFDPnev4C3z6R0is9kBhwq6J0gR/PiyCZsvCDCo1
	 SB+CnBZXZYovuCBllIYxMM5OrdyjcxV9r5/bM05ikQd72hgJE1o1QEzkwR034vlPOL+PY
	 /qbPaLN8Eaw43h04G56Ex6147CPpULvvtlbwlSLBiN+N07k1Bn+9IEPmiEr9dF27IiaQI
	 IPsF7C2qyQTkA0o5s6jcTqhKU8ILPYwEXZBL1ENPzam1VpMX6QQU+8Utd0IEN3XPnBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4qmef56;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91640606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91640606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4qmef56
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so101734a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540873; x=1793145673; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
        b=X4qmef56mV1cGDB+s8rxjvMjWgK79wD0teCYvWaCvGWcBsW9tn7OKw/eFYtriNtvdR
         HKc0+D0iRvbEum79CeELLv2i66rh4M1mHINIpveCbd4D6xZVVoeMFr+EI3CqjQi20KYe
         +Vwll+GwtZL5zEuusqxNLqLR5a8ZbFreBlwDmo25kL8DotyYDjR0nye+wTHO9oyR96lR
         +SLVbCk8XUPB4wTaWgjsVBkhk1kBtyQzhwBCJWi2oB6XDlYJGOHH3S3PtgdcWYgcWq2k
         v3NOx76kt1gqlC6ElSLHjsAn2tK5fx72EjQ1DMUtwCDbHZ5t3Qzjvnn2UQ1MtT6NOj53
         LdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540873; x=1793145673;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
        b=jT8YrGt4Z4c1iXzqHXQ1+xVOznciMPXzJ2IHhaGsursU/fPd6eYHAyN1SFYbJYHPzf
         64L14fz9pRKwYhV4ZlHc6NjDBPftH9y/D2/n154GVtp2MPxb7cNw1r6IFhDELWWGQPWa
         PC5N2OQ8hn7QibVPExx0dpjb757TdEihbJVjt5agTbobeUIELdM5wce4C2bw8wEtUI6W
         tDOMTDajDPBDK9i4ZVtJ8SqFPQm/lLKrv5EtqRJ1xe0V2r3+mQjQrI9dchFiI/o2oIuM
         gDWHFP3cYUF5wtcyEFHsdW2aPlFjHjUsISHr04M1d++5bbwxWIpkE2fjcB/rNV3uc16Q
         Se4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQjmp/Y8iZYgupQC2Ig7KwoBNTG8Q1VDWTi4bLQ+dfajb2x5+vkw+KJXH5jjuFlmbT6UI2Y1x5nQ/YSuPLPRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkumeZaOplUojWlOFteM0AttbkE/YkOjJfzNS3jsfpe3eqSAsr
	5M0EfpDC/d+GOu/bHPkcZXgF0QJz0GKyUfQ8TS4nI4ir7CpxxeUsGyQi
X-Gm-Gg: AYBFou2IWLCDvN7T6USHaCDRCtgzSfRTFgUV3+mjy8lXhurnM4MbgsiRzu8ZaHohwwg
	QqNRbqLBPIm72ylZDwwsnX2bcYAc7NczHC62lYKa/h9CrMjNmi+DIM+MCdHvrGhQCkBSNurx5cR
	8ZC6xUqRj6AAostSboXRXGAdvNSC6tBqolg/+lxb3C4EXCtP5HUL5l+FLgNp9Czv7OnblrQOtMO
	40mh//TmIgC4317hE+i5widhxehc8lWv2qKxZ8pXIhTPfjixAobSwF9SR+GwJSikdF8xwZETtma
	GTg18f4EvhTS1RsEkvwm/msTbaCUO+7WOGd4PpHdwtTQ1/jzrp67F3A1qU6cZ2NYbw3VClsLmNO
	TJyyNsG1qyScGKnGxdYgSw8igGyy4HW/XcjiQSArL9CBByZ70/0V3mbRTCUhfFzAS8VtXBrSbzF
	7BFte+A+Z0n9oTv8k1HvuIeOxGYhjD3JjLO+qJ/uFcHeV+As1AnOpviO6U9TvO7VbN8l6uhwy3C
	yC9DpjlzJPFLqnk+ux32XFbsRUC7Hdk+5e6ZXJ+K29JWUqSwWvBQoaUXQhPQWTCFnF3kEQ9Z2Rp
	lZRCyMhUsuOoxg==
X-Received: by 2002:a17:90b:5310:b0:3a0:c3d4:f3b2 with SMTP id 98e67ed59e1d1-3ad86cc126cmr434607a91.56.1792540872776;
        Tue, 20 Oct 2026 17:01:12 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1536060a91.8.2026.10.20.17.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:01:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:01:07 +0000
Message-Id: <DMA2PE5NZ5HP.3DYHQ3DIKG0OG@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v5 0/4] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Amery Hung" <ameryhung@gmail.com>
In-Reply-To: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
References: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
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

On Sun, Oct 18, 2026 at 07:27 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:

doesn't apply anymore
