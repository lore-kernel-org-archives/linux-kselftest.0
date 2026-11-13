Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559054;
	b=0O2Pm1MMeBY5UmnU46Ex0BJsMcvdgtoat1D3Kwr/3GQvS2VhF9Qsvd4EJp6GbfeGAzMo
	 +Vs+FZ3UfSHK+O3WOPUHvk4twiyMEtR2R5FIejnRr3sOa6mH8X0vfwFnyGWgPdLskSX/v
	 yEadxAnMyHSb1Eej7+Y5RYP8Axn8TxfB2WfLLtpaaCE2pZMq0pQHNdylBR/ZmJGAOo/Sl
	 MCr0K0aQzbWrexWT6ohXX4ZeG5CBdeE4VqiF52Wd5eZNkRvP4yAIcS6Gf67Ct2OmQLwEk
	 mAk1xDhOyzGLNRxbqjRa52DQu+aJN//b/QsVuVwjLG3GZ8lUxhuiweiR5B5IXmsPawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
	b=Mmu0GqgDd4U3WiW5QrjbvA2+h72HJsJTdj3X9LGL56M8dPtyvRCCdMPNV+iEJSsK79Q1
	 nfq3TidVSdlSjWQF+Ss7WAd6lmRVxUPTlpbNx4YubcPS1ztca9iOX54ZNFtkuSK1Nn1wG
	 ogisMgCIJDsfqCP8BUF4TjEH3yKCqXEvjf2l6W67PXoGuqjm2g9EsAWp+vqeiE0UnGxw9
	 vIvFXR0OrzVyiGvKbOJZ58WRH4zRwoDbQ8PZZrEGvyEuLch0Ad0mRkifRncXS5txTQcO7
	 VG1GYNZ5Ngo3bltieyf44fALYrK3IWXqqVnk7MLVZR4HQSNXjDmVk2MYxGTrDhUyZ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3421C60A5BDC
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3421C60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9ae391a05so3618945ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559053; x=1795163853; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=mLALE3hD0yOFh5RAN/jg1xLgT0bpSd2jsokmAxPWJwdtWtNzJUJKHU8ZSCDP+t0Son
         fWbCv113pOpx4EpYvH0tfNYXl0bSPzFTvxf4T+Cwn2jFeJ0Q6iQAPTRusHye8tA95AIw
         V3dDJFkUeKTBVoT9GYH9LXXDXMfZ+c6qqfyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559053; x=1795163853;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=dA/g9tuuRMNnPNhXdcZvsG1uGqUpkqDWXiTfRSP+N0jrRwUaQDAJQPlWi4JQd4M9XR
         EwZd6dKo7ZM9jJES76o8fx2T5vsOf/U0VIrlftTb7CrSVU3CL56uUz3CbQJoA8yMxt/4
         65/rNGJRm0eOi0YXKklxq6bbpTt5LMmZu7eaZroXhhCjZRO3bKlqETxX/U3HvFwL/6Jh
         /MAeWSv4tM3sUvIvO/nMa6UbBdNYS3ibgSr7QDgO9dfEEk5sNxm4ZUZmYn4DXDF8ybKx
         y9LX2QAVHbC60hEVmhOoMYhJC+vIzhX4L7HAd6/wjrrVjDwOAOh8X8ygkUmLn4nH8NxX
         XeGQ==
X-Forwarded-Encrypted: i=1; AL+hErGusnBnwVmQZKT30fnnWV5tQQwjHM1a+iA3z8RMOXvttJ1ZUBphyit3Vw/ia0g1CyjH9Qfu5agaKn0otWL5QjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X5EYI/VNNH7i5qXuYNxAW9GzUxxZa640AW3UE5UYVo5YeKPtl
	7M89idnakGsDrqRMcVjZifu1Sa0rG0BW8vAVi98eFxOYdnB/1olYPgS8MJVHG+Oemzk=
X-Gm-Gg: AYBFou03ZHWr4AKsbf6wP5A6xgPPlgTq5ck9h0TKbkV3CmgXqpkGo5K9T42HsURAOgA
	v319gtGSzHoCz0ID1flT53hYI/lIufkhYuKVPsulfPgyZAX8bVHp8lLQ53uIhjqgU+4nfXPWTxa
	BiRM4BNCmB3Ttpk0IgTmDCUIJxrkZ0+q9HWNWYlA0XPBH9JEvOX4H6rdV3WI1bgDtMBcNDaiDo+
	y+1bxjQ3aip15y3Pr8dBY5ElfdaY6Sw26YEzi4CYC7uxrrnpRqkSpctor3vOkl2tzFRmVqIQttl
	uRZkbKR7CZd/ukbXyeHD5ueboQcmHtSWAP9XIJtVumc0Xp66IXlMtZLfBwapxUepri4L2RymqsV
	k/pA2ZUX69mHFCXr0duyMq+QeknjuhHo0OyYoz8+wbin4MRpwl++/8/1oY7OMvvVtGu2b2cPAKa
	VpG7p2U9XoTFZLz0Dfg4bhP5uBrX2vnEWeDLSmFbQ7DhRY9/ZeHscbWcMHFmn3HVAahOPl0k08L
	wakBsDec+6lCfe0iC3CHuF//gviFR1/LgTMZsitplwCJ3Sk3qx3C4X2VZtCsJOCfk+gYZMki/zB
	dJ43ZRhfUkIGhupLi0lubu6ZYN79eepOtPc42hv/fv3JRF77EV1GerD4IwdxKPybNiYqZQNuIWs
	uZMkrfu6jcd9JIo5XjXlcVsFx0DFHGO1/UqNnaIBnjvQsTsCgkCNe8CMLjfIUwu4l2GiGujNlTM
	wO9gqttpHTDuZyM9KRihmVmgMSzRconbnN0Kw9JJXt/KUNZPXUHibOxzcXKr1gqp4BQ0yUZONdV
	Z6vB2SB
X-Received: by 2002:a17:903:3c6e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2edf1ed6cdemr37400075ad.16.1794559053599;
        Fri, 13 Nov 2026 00:37:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75ebbcsm6475845ad.26.2026.11.13.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:32 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003731.5754ed6732d351dc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Randy,

Randy Dunlap writes:
>This error branch should return 1 since it handled the command
>line parameter -- it just didn't like the "value."
>
>Returning 0 causes the option string to be added to init's
>environment, which is not wanted in this case.

Good catch. I've fixed that for v2.

Thanks!

Chris
