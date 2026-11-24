Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552168;
	b=s/lpwd2GjUn/n8nMLQ4myv/lcE8uyJh1nVc3s6vW46/wPN89/j2Sf/L+HYzXg47fWPzC
	 iMuqBg4sAfxzVl12ZjoJIG4HRPN5lvwoC4ZYgaIyrRrDEupLFLBtCbq32w9JAm0tjL9G7
	 S6pVxIoXtEWjC7NCIYlqHCnL3wqEjTGzPFc2viJmxqbRMMB0W4PGL5gs5+iL7qHixIjgA
	 1CvgC3npVuKxpe60mLjUgk24J5WatZ7f7/F/CTrvZn5qlHjOPYEcs+nw0+p3Ye6Z9kSdc
	 XZw90A3kJ3T4qo5UAadV5c5H6b7CDwC9GcSQF+CpkWMFjgJn97w4KdkknQpYjc3i0Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
	b=mefTfGWiq0HlDsXJPRtUUROJEgVQkRL1O6IKQ9U5vUBZveKtYnX1bCsH7b8wSqbvYLcm
	 Q4iQocwGlVKGNgYU/UBpGZkDidcT0JypyzRWQluYlasJOjJVlDJ2GI+zN0qPh9oUP0aJ2
	 DcDePgPsx12xbyYj0Q+NphXax/gShtmqfkkLTV9XZKy/1AoGkd0n2lzjofdUJIGXOLAgC
	 /i3W7uyTUOUPevITjVFcjTzzFnmTQMpMVYgKiuimUoNGJzYM3FvSQEhQ7Ymcd4FlIE4sR
	 lYReEJbCbd08w/iTTMDQ2TXvFMNd3E/noqL7xug8JmurvOqIb6eEyX3KDjS24yQiMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5P5MBUo;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A20606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 20:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A20606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5P5MBUo
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so1630947a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552167; x=1796156967; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=q5P5MBUoQ2u5uAv2QQKhX4lON/ENs8MT9JMtBOTlmzOwFEg3C2gtuRUGsiJPjuOnmE
         CViVtedEvVbEx3tJhWmvK+Z/13K2IwMxH31Nh/xhtIgVj6UkxstTvE/ZSeNlX/MkACg2
         /KiYW3+8IvV+R+VfvzFVj5119ke2ZO6GqAEPIw087pR/5DnF5sehY6EGmk6vQTr5q2Tx
         Uqy2LhBRlsVWVlBXyRWBf8EDBH98rRIzBGwDBeSPNpD7s3vGntqyjN7JcM4jn501ZdFU
         aGsqCOWDR1ZH/YPz47gglTj0YEO2H5S9bqTnof4aj0NWQM2hvqiwexVaOQswjPA45tQe
         qCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552167; x=1796156967;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=IIDPy2EGIiR1ePlskOiNEwTgmayTAsRUzOzIgOp3zqzAqlZlCC39vBnBDdYE0ZnXom
         6Hdn1qA3gWtKhTQojcSrIp0hHucrsJ9FhZDMLXS6mpjZrAeNTmZUf+ylvrFH8+UFNCsa
         sAO6+6PLpPKsR2Wky+sg/EGC0oHcx7oGttErk787quTaGdemyDwBiILiRCDhgQAdmHRY
         7bZFeZY6e8nw7IQ92boVzj1eiEQfMsHzSwuf6OoS78u4k0yiVTRW1ytuVS6ii1anNcY0
         ZTfPZNzTM6YfuvVtEFtdFVF4U28Xhtm0gPaU8+DJgYGahOBkLucL4Qah2UjsWDx0d5+n
         iu5A==
X-Forwarded-Encrypted: i=1; AL+hErGh4KCTaTR0T9MHLTLdsKq5Q2uN0ym1KMQ1B37Kog85lZi6GtAkj+2glPuXADcjU1Pr12eyor/yXaaM7/nS8Fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oAEtcnRsYpu5d5fxf2l2WsUNrODm9Co2RalI1fWj0NHeG4eex
	DKEeXRBqRgfLnvJ+mFS/vGYeVVBsdBgGso8YIPk5FdUlZ6fX2L5BlTGi
X-Gm-Gg: AZFdTZerxRzntSIXQ/W6ipES55bWKBbOLPFNeOj0wKigUbrbTAl2+QkEWMcXbEqbQUH
	ecE/ZjSO2Cb2IJ9WR15OmtILjH2uelpmbOMIwGwJEOQHwm/q2cS2x/xnn7DUlOpP7PMSQV4tWdy
	5ohev8jAGAFdTMJ5kxsLlnUNwY8OH1alJuCZM9QU2vddr8QYwRi4fXWDrtdURawgpMifdshqtYW
	eXFtn7BtM6HKGHJYcF/nCdLH+84EhfLAOQEsOWrRLmE3JtNqdKFCRBfiurpvrSlErGf+efWinsY
	wQVsPkvWybGvif7025GkvJHyDQSJCTnDhTmlzYeXsfDKRfeYT5W5yHhwFmQ4EiSFGFNoEg72+ug
	r7cptswEZ90EvrLALSB9KiYEZuKGMYwTDR1A4E8CsL6wvTxQmeo0vRhsB6Ih4w5oPcwODteCkzS
	8nhELbb38nBiupYphdmIDPUvUcogbGVTD+YpzYtTJcLyW77oR9F0/MJm7zHR+CyUJBQZOlvC8if
	gNMwbS5Gy3cTNwxbAeYOr18JQy3r/NCD5gPhYElteOexh80uOp6n3UTvwmsSXve6NibJKOm70be
	QWZcdLKFfwURaOHkb/nL3ugT61yITNc2DyOMSaiQgdLDX2LK50A/xfY7QLBjUwCKHgEzPJzRTGK
	RkzndgdRtZyli1dZvfhfWiGQgGfSezWHcYg==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr14406212a91.9.1795552167442;
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm26492190a91.11.2026.11.24.12.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 20:29:26 +0000
Message-Id: <DN3Q4DUI8GEF.PX8U99J6LKA4@gmail.com>
Cc: "Chen Pei" <cp0613@linux.alibaba.com>, <memxor@gmail.com>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <eddyz87@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
 <shuah@kernel.org>, <rgbi3307@gmail.com>, <guoren@kernel.org>,
 <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 bpf-next 0/3] riscv: bpf: Add BPF private stack
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huawei.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>
In-Reply-To: <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com> <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
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

On Sun, Nov 22, 2026 at 11:46 PM Pu Lehui <pulehui@huawei.com> wrote:
> Gentle ping on this series -- it looks good to me and bpf selftests pass
> on RV64. Some upcoming patches will conflict with these changes, so it
> would be helpful to get this applied first.

Sorry for delay,
please rebase and resend.
