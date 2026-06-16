Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D8A3DA5C4
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589736; cv=none; b=cbbHWzRcTzbX4FgxtSDHrrrNHHGDjwwdzyEuyfsfZGpYm5T+pORtPEd/4xc3FLMYskhrudCQasaS3YSvOKIcI0GDa61e9BIZujWnbZ6857tC117LsPM/kvHFaEg12SbXVJfICjvMQbLGCjoiQ0gB7LYpoR/08AHzsbXEYElZ3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589736; c=relaxed/simple;
	bh=70HVzoXgBf9xx4KP/aPDIabbIQagBnvWfiUYl/XUnfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af6iEKT0gxnyWhTHyh/BKdmneHKY49EWKpdXP88IPHICC7ImsMQX0uPhUG5NyJ0w2WoJuD3ndgL2k5/U8VC+r8Q9n9azuYSVn6oCNqZmjYeaIGJnCNVndo6Atb6pn6vXebXtk+9ugRdqImvlViDNWRbXdgJ8qywXwbN/8+YvjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFluq+23; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFluq+23"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30807ba471bso11688973eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589734; x=1782194534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=BFluq+23cj9Yym5RSM07lnEdhFpFhNcEgV54UGAgICjgSFNUeTGFIhlEhSkzd7hpuO
         u5bTilgsZQ1wdLlYLm5HOD9xytna11XlnYt7DqHvzCFGmMXDbPGJLTwIvvCEcG814W7k
         n7azhY1+iww3TzPMXz0TSTS3TmJbNNkzJJyewmzUH7iJUaxaAQQue6phkcEZXh+UQPHf
         NaQ+JVieyFdoWD58mKWTDGb2VNTl2Y9PZmdHdjZdBV4J5bFQ1naC+oZDdwfZ8DjbsSTn
         kejXlQryo2zK0EWYm2I6JEv/LvT3XKKblJDK0Dxpqa6WTmBZf6dyBQRQix6bJIoXua5p
         vnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589734; x=1782194534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pI5rWxtEe50KjcsP0jF926SZexIl8kuuOKapFR5YRg=;
        b=B8+mU+pPpFN2ghvgK5w4m/C9fUIHlpZZ/YpOdI4szqWchQF8a/B2mjpxl/TT19sMgc
         zFihAp7wMiK2UBsJ5rhUY9BAq1cwircl328SCd2NUJ25uc8vElWARrTxxGX4HecWCJ2J
         AyI9RK5MzFFG/xnd1+brm4KfjA447feennCfhBRnLM66OUK/QxwSIGHRxy5tiPf98zWG
         7sMqsKe2WR9UIA267T9KgYS++A3qayPFyYB+zvQ4oKnFZ6I2d5NJX0fSU77mYREBeVit
         CaaFg9keAENWeN/5lhPZaEuqcomiQJGWf3EHzt1lVl/Ym8G3BZwkyLxRGXy4oDXTL56b
         Dxhw==
X-Forwarded-Encrypted: i=1; AFNElJ9vDYZvUqeL844N/BD9hg4z8sDZ6cQqvUEtvD30H1xZCv2IxmHZtuLQ2tjUxsfSfwq26zU7PXEC1NB+WYI2tyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwORpmeF3hedMg30WqdxxrFF1EyImPhtbvymCf5QaMwY3u2SjCo
	1lo0wQ8ht9hGPdRqc1PyFfZJWl3lpY5RKgTnpw/3E9tk5HECDkCDbST2
X-Gm-Gg: Acq92OGar0eOb9J4fTV77CR32zfYjDV1kZng2kvgJMmza14X//l0LgftSk4UPxG5Lnl
	he4ZYOIJFkBxFpDg0vdeYiHawV+8m8hi0Sjcv65iVA6sA0EaYsw88K47URn+CwWUV7F7uOiT5uP
	+iHmzrkKbHM6NcmQ/rtPZutjWwASSiwD4yfiSvPjok1KP9nckcrtHA6zaeZDfSAPbECG6FSbJcK
	lFeX+K3BJFieuAR/5vlF4lOzkCGJQsw0K91BRARkCkd2QJVIo7FKqCcBSfmiQhBF+Lwb3TUPsAh
	5pCaDp1nAoQPKSfu4WptYw33fiL95zh6dDONnAwUV94tRnFmYJt9IGKbaDYUTlkAImaYR1u2tHp
	NVEF0u8acaAwmBihBAGWsdN2rbzVu8skXpUm59jPA2yZOKKOW1pG+W+RyFsGWfdV6uIqzTj1YbL
	WxATDPTJMDOnQ=
X-Received: by 2002:a05:7300:e882:b0:304:e2a5:689e with SMTP id 5a478bee46e88-30ba5989923mr1369233eec.2.1781589734142;
        Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0357sm16552304eec.11.2026.06.15.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:02:13 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:02:11 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/16] riscv: kgdb: Use generated instruction headers
Message-ID: <ajDm49ucbj6mVRo9@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
 <87pl1xehi4.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl1xehi4.fsf@yellow.woof>

On Thu, Jun 11, 2026 at 08:08:35AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > +#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
> > +	({                                                                      \
> > +		unsigned long _ret;                                             \
> > +		if ((type)riscv_insn_reg_get_val(                               \
> > +			    regs_ptr,                                           \
> > +			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
> > +			    _comparison(type) riscv_insn_reg_get_val(           \
> > +				    regs_ptr,                                   \
> > +				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
> > +			_ret = riscv_insn_##_insn##_extract_imm(_opcode);       \
> 
> Should be
> 		_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode);

Hmm I am surprised my test cases didn't catch that. Thank you!

- Charlie

> 
> > +		else                                                            \
> > +			_ret = _pc + 4;                                         \
> > +		_ret;                                                           \
> > +	})
> > +
