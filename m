Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EC3AAF58
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786537; cv=none; b=llx8ofUob5AFuilsRMpt8+h+skZE5oeVTMdB7jIBC1gAwd2yoErnqfkAkRqfdA+jSIT/9bITKW7mmkWZws/NHwUm0cgFJHtTXP/KztzUo5XYkeQRSmfNEOmNtXz6QCVjX6f6yCk8v+XAT/Am6LvEWzJpGRvAsj9ewJmDoi6qYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786537; c=relaxed/simple;
	bh=OoOCXYnmsHcXFceRPA+Lk0L4+MHLwRINzS1Fo7C+b3c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAnfLAFl9fZ6TLcq+0dINU4I6r5H2Pcyi+cvBjyVZwYCd8VzIi0RjGFnEAgceVvom8+/LQvjdXZ33raHaVF4y1KWlWORyoWwd4eAIZk2rUC5WzZJjmP1/Mo4V2TX1EZ80UbsxTT00LgmKV7m+NVHuC/bj7ThEONMIkbK/dof6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3YA9x6u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3YA9x6u"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso26963775e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786534; x=1786391334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWuva+yS1TaIijzyC+2mlVwhJ1Wvxg7k7qqP6DARP2A=;
        b=I3YA9x6uL28zj06QjtahBOECo36Oca+mdGaCzgKA9EUCB1DG205kdyJqS8NsaJU9ri
         /JoXqTv/a0l7c53j3ZYxZ53sTbY6QvDcc7RCBukrgWZifN2O3MTDkJqrKgxpniQhQ2/O
         sOWYFw1PL2H2ZiukkHKlch1g1TNFk2Gnjr9RXd+FF/8VrDRyGovoKf4WYrsjErrCDsQI
         01faLSvsMe0SwFWc4175ZtTVcFKLhoUM76poajN/mccccWJUShhJq3Rn2RiAd5lGWZGU
         RLY9f7eyVChY2W9DWdETl446N668VG6fTgXDluW/cXPck15VK6hJLaoLWkjBssG8kYr9
         EQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786535; x=1786391335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWuva+yS1TaIijzyC+2mlVwhJ1Wvxg7k7qqP6DARP2A=;
        b=RvA29J2VF1w9gNOJ96kxqiGkUeJxwbcpT/mHIya8MbRK+LXul5Ck3HbyYv6LkQinpj
         Nmo2j3r/0s/lQiDQcd7ce0XBE3Tge4k93HT5lEks9ICwN+EgUUrnHv9Hh9gp154+h9TI
         jlY81YInnRYhlqNC2UP8r+0SMxszV+rVRiYKU7CS+i+StQLAYVKLDqKbKe1ehG/nQIIL
         cB247FQgEyyMlFbQlsiNNAp3fHRA/rWj6V/aVivUTyw6V9stqDc04jdpmA6JqxXMfVlZ
         t/ejoEQ08DEKb1+tv2zofFcdJTmOEOI83Q8e8Fd11koouW4fcITb4d/vbbrR5Rt4MJ8i
         oVgw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6wW5dSYmngZQxJSL01NRp3Vk7KZK6s5cQjE1dPUE8Jzqyx7hTC6pUnc/sOAnR+OOKAddvMli7iRyBabGKKaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw508wNHaG2jmb9yL12RMRTci45J0wmSWtoY1Gc3rH6OrLHlEFm
	ZHcaildQc/vucAxlj3jzEqjVnozJ973deaIfltn9U3Uv6TZh7G9c0UBG
X-Gm-Gg: AR+sD12vCqhbjzsL7xbarAk+84e9+b5KcvDrtAzmFOmG91+/kvZ16FMWWWGPy8aAAkB
	vEaTqT2sC5tlNCUA0QVgSUjXGzqHPn2gj3dD34f/K9MeFO0p3Rr4/FJaNMkjj/yYUC6V+RETN7C
	GoPgWY9Z57dm6PmuSwqvysRNw2noD8d4vAWdeu8lRSfDQvx+WBQjP7l+VnM3AkYlnS27ErwMm/M
	/uxtyfHEfilCFcL58bGKyFY7obZxkR/vaF/9qNrPcGt3AAbhhHWJTKLIMnhw1DMsAT1J5TNlJ3I
	wMJeAmVYXwZBJRBWsZulGlBuOxw5RmlJL5yi09Wjm9GjGcN5Nb5H58ftsnWQRXiD/quh7nwNwOQ
	5m4+oxpVcJADuhJyFJXlUfRsYWL/Pu7Lta5xO5yctlq5cigYna4gIp2QJW6ns1KeegwViFXy6GK
	sWBe7g9CAa/plEMR2OgHTZfPwtOS7ykCkpTyuOFT7lVzKPAm9R
X-Received: by 2002:a05:600c:840f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4980c6071c5mr221995145e9.0.1785786534376;
        Mon, 03 Aug 2026 12:48:54 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm33538389f8f.3.2026.08.03.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:48:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 3 Aug 2026 21:48:51 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
Message-ID: <anDwo-qXH6_W0_3n@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
 <amsuU7eXuoziObdh@krava>
 <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev>
 <am-sK_buCVI3khJv@krava>
 <6af761df-9abc-4854-971d-ca6e4ed7a2b7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6af761df-9abc-4854-971d-ca6e4ed7a2b7@linux.dev>

On Mon, Aug 03, 2026 at 09:32:14AM +0800, Leon Hwang wrote:
> On 3/8/26 04:44, Jiri Olsa wrote:
> > On Fri, Jul 31, 2026 at 10:30:37AM +0800, Leon Hwang wrote:
> >> On 30/7/26 18:58, Jiri Olsa wrote:
> 
> [...]
> 
> >>
> >> Right.
> >>
> >> Pls see the sibling thread with Ihor. With in-range BPF trampoline
> >> allocation, the slow-path regression should mostly disappear.
> >>
> >> Let's continue the discussion in that thread.
> > 
> > please paste the link/subject for that thread
> > 
> 
> The link is
> https://lore.kernel.org/all/77edc25d-a521-4f65-84ed-dbb016593902@linux.dev/.

ugh I see, somehow I did not receive Ihor's email.. :\

thanks,
jirka
