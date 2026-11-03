Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793741313;
	b=w3oApfgnQuHAUokx2e/6fdTIztcBF0+jcov1avxt3ug6CzkPyg805Uv0CStibOXI0jFA
	 W/aS9x5pgcVE+q+iW8BDlAVAIn4aFM6ACwaRvYco6UNMRoHZlUaS+sNNZM3yEakf9Rc7v
	 xb7JtU65sQc8Zy8R9lqaRBS2wg+zjD7SMeczstNCseSUp8DeFImZZxf8RKqcY3iEbgWrD
	 w3RPP4s60Fw1b+jPmW8UF63RDVCdS1bAxiFC4ArUBi2wfI6tNmJnj3WxqNLX/LOugJca+
	 DQOHc0HAkXJFHAHqN8JP6oevHG2greeA5dr2KzXuf0i5nN/mchkUPLbE22fYqtFpUSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
	b=NQvYkIY/7e0+yxDP0m94oc8RPwmS2j5g/+mRVf1KsoiwVTR894rR6yiV9kfFGEgbWR1T
	 vthPBVHu51ySP1knwR8tVxY1DJG3p9jKPY8+imX/KJj6ieOh/4k5PbGJ7XTZzVWU2B1t/
	 AEcfWxLovlw2DTyDBXdSSNMl0pkhtUAvnyUq7WTVkk10j6C+Y2h2TVG5wISlI0oZAsEuW
	 Nusvt0skYOTCkI4cS5qAw98QOAYDx6F1F2xyO9xdPT+SoqNDzch5lDIVyS4gZtiwJXBvP
	 bS1jIc8ChSsJ+m+y1lOMvg0pV/HSGY/TuCc29Tax32pTzihWdNFx3EWNhxgJivQorbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=RDzHdzJM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B723606A324
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 21:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B723606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=RDzHdzJM
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd63b18598dso1327a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 13:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793741312; cv=none;
        d=google.com; s=arc-20260327;
        b=oJS1ifYOlP1KabQxOlt8QxiaxehZzFAj+A7TILy/EHaOSwq8qFXnsiYThAFyhURXku
         z3lRuphuY7MXCz8enZyA3z4T68T6HlEqadkXB3MfvGjEgPyq9Ig6oiQUV6WavBJtJXB0
         x8CZPRYxTtdY7Cp6OtxlDWS/HV5tPON9mAUmz8LgkphkcP68goZNQW5N9MnEYzMCOVs7
         uJ4hBYQWeqXRgm8RILExC3CEP2oQJr/XVS44cq+UV3/LeqhE7Jt9WEhtrKTG99dSRcnL
         JTLIXFnbnzIxjpVAhybM4OvGMFpGodeye1W7AbYjAf9u9QU9nIjAOsoZXvlnRIHmFwEt
         Z3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        fh=81OSf8KmczpET3abm9imQ6HhehgdcJJ/tDtcupQWdwA=;
        b=DEx/yjZ66uB49aHCWK7s2p1WOAQSxSyAUGUIniCx+iO4TFbibLCjikwLwu656SfK0p
         yVGAqeMt5jqgoYAm7g0ue/lAh4Ns2kOjLfKBnnJmjw1tqhiPX5rk4BYuEXQCvUANjL8+
         3SIGmPZyUxj5ihTaos+Lre6PqdTmdNw1LWbBEh4qOwESbT8aOWJyJ+Ze8YIZP4hEf8pg
         KCs6NJNnq9MALdxcRUEF6rFj/OTV17NteQF/Qq24sPS+EtT0DVFH2fmc5XNDkfx1K4gv
         iVu89hk2ERwgDtEASrwaZFz9bMfU1f8JFhyKUio2Gs6VLL0AvZIr8NgGB3yrJ7JkXKkY
         7EOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793741312; x=1794346112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        b=RDzHdzJMeUfiUq9G/7lFmj/hNY8UMX6ikh9NfglyTlaT4ewEuBKX4XrY3AvxwgX9zO
         iUmqR+LBXrg8omLshdjCH+2hnkExL+Dl7U5QlSCKcN+DJOyfyKHkMGLOIS9AEWM/DNfn
         jck57X8KgP61dTHGpxXglashRzCrboGRhKywwO1xQn3xbVDLf3cqF1JCAL4VFjOkr6hJ
         STlWyl3PH6WF9liLzVJVT0VpCF1Q0FjzLZ64fBNcUV9Le2G94K7Dz1F/mpeQWcC2ZQL9
         Y4WEN4MfiIOvX89YDWCDxeOiRPuaUnD1TUTRspdmv8tJ0gX+CxJv8P7OUr+URmWZ8z47
         kbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793741312; x=1794346112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        b=aS7QTcA9NobyJvknho0svbVuuVCVrlN6O2TO33OHc9mayMv6m09SlvWJ/Zo6EJpCvb
         79fLZFBMibjiZJKyGImfR9EpGMTpNcWvl/Bc1y6GI15S3IaqBNLG8AVKx0mCLdYC5jXG
         jSsKTPdeGo0Y3ryzOOLLTIqv2Qd0s85dWm2VDmJCm31WC/QCyiXfUiVEydTTrXUqsBf7
         dQawbsOn+aLFdR1oRXBosFjNeeDwsYP1CBzfg560Sg5PKcepniZBUcVh4Mr4dQawkoPI
         KmqM9ECaFxxfLmClCb+ARiJjBKS8KbxxjODcgaLYbCNP+rtpiIUK/EeizLFtRl4ruzLJ
         xSNw==
X-Forwarded-Encrypted: i=1; AKwUvBzNXcjySDvoWfxMdezYJ4rzCBztPhn6jRZo2xS8Dw/uxwQYluNUd9cN/iqoWnwR/AEmI2vfgEDkOEg2odBADio=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WEcYyt9rbUbl4HENKnlszgMNJ8zzCGEWjgI7HkC9I9isj0sxV
	f9QIS428Dert3cl8wnT0D1tc8Z50y1fIegY3pZPZKuqIIzQalJZfdpU+2vYNkkXaSSG17+xO17+
	NReCwRfQkEybeA8uMpSwvK2C0TsY6SXAtUNjZQ53gVQ==
X-Gm-Gg: AYBFou3dGZQItStrkwqNxbXXLgZn6znEzFaFHGmjYbf+xCat4CM1+jaO53QlIYZ3Qxl
	6/HxZEMLdEltJpJrAOUzOASsaSBo8raWCWwB7eBp3ZVdfKLRqKVonhizzDGEYpS8BkBhWiCmEWC
	HZ4h2YWIZc3fcDtZj0NgytSrZUCq1VFOWo+/n7s3J1fJjRtzoNlVTJ2q/O7xfaWHTnsjTUQfu+p
	5BPs6N4B7R5aGtayA34GxT5Np/N3srzAkkGwCDoLH20uLXkCXMbRkRuq7bgSEUDUZXc6Xnvub/T
	44xHo6X3VukWMHM+GxgBD5By+Lnc5VzF352UV9FaYkhbEKppq8LX0vW+bL98wdXL+u5lzkDoq2a
	iGAo/CzlmTmsUYKYGoPhoNaeQnwN/LmAt+A==
X-Received: by 2002:a05:6a00:6403:b0:8b0:4ee8:10b7 with SMTP id
 d2e1a72fcca58-8b04ee82e42mr1269223b3a.1.1793741311690; Tue, 03 Nov 2026
 13:28:31 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
 <DML75890DWIX.EYB690LPBM1O@gmail.com>
In-Reply-To: <DML75890DWIX.EYB690LPBM1O@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 3 Nov 2026 23:28:35 +0200
X-Gm-Features: AclHuK-9dIJ91oRBVvYH-QEQPVhpa7EQfrKjcAYWov7WHRhtMGb06DwMyyDhFHk
Message-ID: <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 01:49 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> No. I don't think we can switch to per-task that easily.
> For your use case try fsession. It was added specifically to match entry/exit.

Thanks! fsession does keep entry and exit consistent. It doesn't recover
the skipped runs though. I ran the selftest scenario with an fsession
prog on __set_task_comm (7.0 kernel, lazy preemption, 20 rounds): Task
B's entry and exit runs were both skipped in every round (entry_b=0,
exit_b=0, recursion_misses=40), since each run still goes through
prog->active while Task A is preempted mid-program.

What is the main obstacle to per-task tracking?
And if per-task is not an option, do you have another approach
in mind so that runs of unrelated tasks are not skipped?
