Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292513;
	b=ln3oGBjYpPpy3v5/8dr7QROPchU9DEeZzimJR4b302zE/ttmUWUkADHZId1W5+d2C/ze
	 MJdKx23E1QEZy8ixhzNNvfbBqc+QvaDphgfIEV2a7OmXmojHzvfm3ZvSwkPi2ttYk+2VO
	 9sfdSMtqIYMwMhU9EHM83Q5neprrx6GFP/WtkDUZL1AXpcx6TFAtZ+kM287P0bc3qIEYe
	 4UkXgx7tMYmVbb3eXDqegEAfonI/APMsi2p/7pedQ2pdhw3wIMk6jmx1Na+Z6sCBlXIZR
	 WY+xf707JsJMKb2lY54fXQYjpUtG4xB8NuaErZaj7V5nwRlP4P37KVP3/ihvGaGapuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
	b=K8QHzo5+kc+1SF+J67Cd4VICOK5ySl5DiOAY0bRh0JLFlNN5bko+gCtxL8Rm7nra7+gH
	 oxtu0MbAwK9YjFDGG2Nn7pDoSyHruwbg8UCKJM5jBqmag3jO2bH3SJCoM97GtuwfKIGQ9
	 GfJngBxe/j+YciF1c9+/5uK6mX53OFqIbx4wdvu1TpF5IWZJ/OQ4KvQo2mJXDsrpCPhg5
	 5+WsTtb1rAuxYNXdIgPcRxOJtR6OBkD5ox9nHNNOWaCC6AVo215XjEoEyxUJZQlV+uz7k
	 XsIKANWBj93zx71j/EUKf5EeIceSyjsKWEgdttdSuLoh37g2sRug4Utp+pQ3lxr6nHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvZh9KkF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D52F60A2601
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D52F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvZh9KkF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso1120910f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 22:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794292511; x=1794897311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=KvZh9KkFCB0l/6Bmr8nRlFNiNAYwTuU4bAbREFGDiprWKCca1D9gjGF60eGJA+3F1m
         /bv5d5Tc5eWM5D865wZT1/xR3NEMOOdRqy4g1KkEy4dNN0ai3E7ZEOXBKCO9AA5jrZON
         81noRzABdcThsTx/uPfWP2XKO8tbYcZNnqcldty/UzrmzSJt6LP+9II6IP/t+90m35A4
         cHdS20nAQY6nLpp4JCwaxwmfEkKJkszzwHAQ0RkC24pcwIC8g2itd/wYEPWH0RU5LloK
         +jxZ0egu/5nUvtzeuP+y0T3PHWti68rhJPt30aoXkp9b4h0G+AWEqtc8wek4WNU9qfaJ
         cryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292511; x=1794897311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=m3EXaovcoZFrC7PHskBcxzGC30uvp6iwN/ONAMVow0kfvOytrGaQ7b8XcRunbVKRYX
         /3OT6jwCK7/AXKS4YJN3ZVqPPs8Zp0OKDzdz0WBCNsbXWjTRdGV3EbdY9WoyBxUwXEdL
         aDH4ewacBYwBLiIZHKYG6KospnksXfDkYVlqow8CCdMDRv+uZjootIH5UcHMAtafiW0t
         Bn+e7iKR8ShVxlTrQ+yU+N/4WltyTTupieKZ/Hi4TmjT/YrjMBHi6qwUepQcNTCnFDtI
         yBpGJCXaTkmVZ3Voo2AnuDcMNvtcBUku2lB7nmdwxTD4SEDOMtmGsvS1AkuP7B6j5oF/
         DHqA==
X-Forwarded-Encrypted: i=1; AL+hErGRTxDKn5D4gwwhymExMsvLo+nnoln/ZV1G07BYHMgAUQNVA8G2x5z47oH5xDFoE321blydQu6gjin4YDj3kuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BZ/JswVqF0WolTR9Qa41LOa5/FpWKZ3s0lH8drdw9P9H+zR2H
	wGRyzBB+fQArKJg+hkEjzW8i93/Z+mrkUwmFYZ1n9azubZUbKVVbuLzx
X-Gm-Gg: AYBFou2l5UFtBPBfTXRLxTZ1Do5fy70RSBPxJb5mgSjgUayaJwzMoShfDUXFabDOWVh
	rIuU+Y31YR6lhHu30x/DWUXv5AsyaKthJtzpa4NdKmnbAt0w8mWJpnZcqHJ6dMLPO525QdaYTwT
	Ga1ZqJplbIz8bY6hvNL/MBDc/I85uu5O8aSL/pKyET+P7mJ1pHVS1O401sWJKEWkLb837wvaoG8
	RUkjEIqXYJ068FrkNYJbqK8gUnkNDr0VmOZ4t+Kc938p8LiYrvyvkaZVn0YZlLATa5NyFX/lQnJ
	D4tULB11BY0zWQ3YsowrMkLYC5DPtVNWWU0fSTtsS1z6+nXCueXbTzabxrWJcvetfMb2rIKL7GZ
	kuW8i+vrWK+sRH2IMkxBQLEQi+Z3X8573s90Em42KHnNHITTsmJEzLb4+I7Keji6YA24aDNiGxR
	IZkuGjVC8durROuMfwM5Zsbql9wMMFTvrahp6nhzYELpX3wxLtOFYpziOAHqT79HLB21MAmMbRf
	YpHp5EI3iE0rRmNOivwA7zTOA2q3DuhHK9Pm3P7dmuU8zXSMMSZPG5DoHj/b5fso+QALadd5nQV
	tvPaaYRuXdJESjSGmS+zORQpIwqghwYDjrbMM+JcAQepf1E+dqJKgTTC0H7lW8LpOmYv0cI5xY4
	BEhSVlGLEKgKamxqVncf8Gis77ms8hrNF01/T6RI1XIGVRXHWPFhiF5kN5fDUKaKPmFC/I/xhMC
	M+paDRcI27NsCIRBJ2MROLlKrqemzip/g=
X-Received: by 2002:a05:6000:288f:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-498306d02e3mr2957082f8f.40.1794292510590;
        Mon, 09 Nov 2026 22:35:10 -0800 (PST)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a0e9-dc01-c402-36c1-c306-953c.310.pool.telefonica.de. [2a02:3100:a0e9:dc01:c402:36c1:c306:953c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm3241156f8f.48.2026.11.09.22.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:35:09 -0800 (PST)
Date: Tue, 10 Nov 2026 07:35:07 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, oleg@redhat.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, 
	pmladek@suse.com, joe.lawrence@redhat.com, shuah@kernel.org, mpdesouza@suse.com, 
	martin@kaiser.cx, oliver.yang@linux.alibaba.com, zhuo.song@linux.alibaba.com, 
	jkchen@linux.alibaba.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 00/10] riscv: Add reliable stack unwinding for
 livepatch
Message-ID: <avK6oydgmtsa_Sjg@gmail.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>

On Tue, Nov 10, 2026 at 09:37:40AM +0100, Shuai Xue wrote:
> Changes since v6:
> 
> * Rebase onto the current riscv/for-next (based on 7.4-rc1).
> 
> * Fold in Karl Mehltretter's two patches [1] as 1/10 and 2/10. Patch
>   1/10 stops arch_stack_walk() from reporting the walker's own frame as
>   the first entry, which corrupts the skip-frame accounting of
>   stack_trace_save() users (page_owner, perf), and adjusts
>   return_address() level accounting accordingly. Patch 2/10 adds a KUnit
>   test for the start frames. Both patches keep their original authorship;
>   I added my Reviewed-by/Tested-by and sign-off. I asked Karl on
>   3 November whether he would like to see his patches folded into this
>   series; he has not replied so far. Since 8/10 reuses the walker
>   extraction from 1/10 for its !CONFIG_FRAME_POINTER fallback, his
>   patches are included here to keep the series self-contained.
> 

Thank you for folding those patches in. I'm fine with that.

Regards,
Karl
