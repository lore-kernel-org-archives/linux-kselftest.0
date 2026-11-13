Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559039;
	b=ET598DTFTbdcmh+3rq9AaJzyXydEgVE5L7ysgexyLBJgNrP8QE9FX1gcTf9l5z4OgLmX
	 GI/LcDDczC8Hb+2OQvapdN8nI1TT/DbHFRqdd7r3Pzvju0yVgCiZ2Lk46dXSPuoxkLPCt
	 idmpTRZyg5FQUsKRGFxiFOWFEEh+YmcMr37vYnIWsx1STvDIBB/8i6yYEs6Aw4q89OkM0
	 sCcrYJkSIpwngDaqCGvPvIdSh0PbO/wERaJalTTGnwIjxkGPfaI28tIlxHEx7FNSR7Dws
	 +lRaf5wS2159LIpZOwU61uJS5qwwhl7IkIXS9jHf/TJfQYIfVtrj3fX5IROJxzNWmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
	b=FXTh4m+vPRYQ4Im7StrTuD9TV+VCe2aT3G0UW4aN9jxUahNQrb2D0XcGtf7GQUuQQ6P8
	 ONYu0KL+UTRu1G8M0lO0wI86Dw5IoGHZSuzS8rrWH1ETspvGBBuWXo2XeBO7zrNvZhkZt
	 Y/5h+LSgKjyItO6FGiSaEl5uxtdw2Ba86PjLn1iCOQqeDNlO9qOJaJIF2zAOP3wDBGC/l
	 DLYnMBXwNu2ddW0oVCH6+etGRSKzLz1xGR8ULz5sKXud56c1edkEIiju4Gve+jYle5IpT
	 NqLOVUuuza+5bPcJgmxxvw02deU5zVsEpLSOMT/Iv060EggSpsAvUqOrFGTwffm3KyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FD606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214FD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2eac6e9aed5so2575035ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559038; x=1795163838; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=FUGKdwwy5qp1Qi31MPeEdEjYr98cr/fMoFORoQlH2iwqJ/AXUngqtv1zqJrP4cUvEv
         x/nII5hqIUrGDUUv2cVC5QDADZ6XKn4Aial/KEbbH8VcA9bY9EV8JU6hFge+fBUIsOhE
         BrLuIwU6hb8JiJGDb1/dLkGy5AvjdX2mufF6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559038; x=1795163838;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=X3fk0pxs48H7eixEH8YsU6sX1KhoDGbDGx702+RUMZchnXGZdP2tw7zygVnNeMnN25
         9B31FlgCyVPID7LQjmGpRYRvP5uTypFOeQuDiVkxR6mSFegBsubJ0MGMoBlHMeC9KuLc
         /Z03jwCPyTgQKP6T71mpZlb1NqjQRjM7GREG2m4W0jcK/OgGq77BDCEGPNvxyNGkRBPV
         4Ni0HisHqD2IBCVeflmhgUEWB6p9mDxjnZZWZiBDSwaRVYl+RH2Aq9DLSHd7w+kmSM/6
         ID8d5PiQqcKD6irow0LPgtzp83ehVQ+uzkimP77+AZjrcQXn59819b7szb1washgIYne
         mzPg==
X-Forwarded-Encrypted: i=1; AL+hErGuhYxzI9Hh1smjR+JXw37mz0nFhsGvE4PLZir95Ro0nLZjQxuL8hp+vvHR0/ePSuFd6DNJUoS9z7isSWcUAoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AE45+mxAmWqq2jwr0yKewEFaMxFJp0NXUnscZQ0gJV1uZleNL
	QicckUXCNV4YqQ8iJlhsBPaS6DlB+igJR76ftBltTTZ9ou/cvhB0vrlsPySsH6EtkDPHFf0Rudz
	e/BZLw8zetdSnjHExKw==
X-Gm-Gg: AYBFou0TmEE8XYDn+YutQ7XQoDM0HWS8ET8uv7XrDqxTA0XhRGPFIDJoEG+zn93niOU
	UVdNWvNOyiIDy1hrPztB5UNEmIZ4SeoIeq30nFfEXzRdBGTRaALjkx2K49Jn1EhTKl4CUz2oSB6
	6xyE66rY/pHc5Uwrjwf91jbHyrPHf/ZhwuRCObdgDPkRP4uJZGwpW9t9VUf9qeCZe5OVebQaWoH
	I0kP8c56KVgdvYylolvRpZ+QqLm9Q4tk8dM8dEj4Rjq1bT6us7UuS2JjQ5/Dj4C3p1FZyiDy9Ik
	nhTAVNI8zYWP3w9evJkYlS4n+dnQSPtm3PwKj5gkbFmp0O3F+lCLeuT/Ehq/4KN+95nYTIl8bPN
	qwukg5ex+v5nD0EnmXZu7nxY/ZCJktkTcWuBb+C/YNtcMRJwaig9bR0qhGvZFlr6LIyBUK1+Z+y
	5yrIt5xvaih/GhUAJZa6K2k9LxIqL++899rBRjTH1VD+TMdD04mzUXJIbvc4iRp5fFUO1zUEXkG
	2PoqHiZp8fru/yGLl6ultgBWSeEemiz7tld4DpWd75TiB+OmNS7CO9ow85MuRwLQvus/F2PMy1U
	WBJiJbzsFhirzhXcZWL5+CUg2qZV1XBaPzbNPcNB2cDGRl5w6hoXMwh+6H4P2Qsz8SsIhk/SY+H
	vTW0oobzFIVDfM16n4gHtB97KQslpGJs9wDexIwlXkA6kHLe1f/Tl7S4fs5Gvr5p2gRTiwBOdEz
	3se77BKMY3pvuW3aBW9p7KDJHNehSMX4eaXISYi0YeuokMk8bQYMlX4u6+VrA=
X-Received: by 2002:a17:903:120d:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2ee0dd14181mr18456195ad.41.1794559038435;
        Fri, 13 Nov 2026 00:37:18 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm6731535ad.54.2026.11.13.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:17 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:14 -0800
Message-ID: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/3] Make the scheduler stack end check selectable at boot
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

v2:

- Check scs_is_enabled() inside task_scs_end_corrupted() rather than in
  schedule_debug() (Peter)
- Return 1 when sched_stack_end_check= can't be parsed (Randy)
- Say in the changelog why the other task_stack_end_corrupted() callers
  are left alone (Peter)
- Rebase onto tip/sched/core

v1: https://lore.kernel.org/r/cover.1793082868.git.chris@chrisdown.name

Chris Down (3):
  scs: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 include/linux/scs.h                           | 19 ++++++-----
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 5 files changed, 68 insertions(+), 14 deletions(-)


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.56.1

