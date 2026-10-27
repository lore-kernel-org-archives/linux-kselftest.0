Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082967;
	b=Lt4AlplmAb3bpZ1lpXr96CxtlBOMeksvd3sqtkK3Hj7qGpKnH0qKwo4bZ7hjHeG2C6FG
	 IKSAsMjZPvn7MZpoXBZyAjiCee7M2JDJRIGRirPZ7eqrG22kTAYk3dcFKg/onstro0DGN
	 g/sV/qtNN3PwtkvQWz6MFr1YCSCUNyoF4smV6aqouwsSFdyolCsWG/Sz8s8KvXZZ6oCpQ
	 PFt4sg3wPGH0zvMXtaFEaoeks2VX7ioybp9IsCmACxrOqS47R28EVZ3Lymj8TA14g3JFj
	 Zqv4BBwckc2kxbZuH0h7vMOKLFXOlRRa2yQ6cRp94pHy0FuW/rQ5SjJCfzIHiTWEprA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
	b=gOPUso1ftiwCzE34iJDCDj944uIX/L5jEHtpSqVOZdWICc8O6DAX5F+bihhPJ1+Rfvvh
	 M4qZC3osmUlPOPTUMITlzPuCO9B1ckHUeq/k8hMgKJL3QEzAvdUfhi/khu1h3q8PZP54i
	 jn0iWrkR1YVnYDlw5hmQl+qBFMlgBMxcP5/7l4Yi9pFjf4mo+5VriedG3gcxPfNh88Ceq
	 2Kj6astT84MsCgX6jCNDSuQTiyZd4P879A+lV+vA2KSan/IPdxsO6NgMiAsR7RTcMl2WT
	 b7juOP5P4j8GetJThfsn9m4yo7Yq510i45y47o1Pt9bhue7zgDNAzEq/dW5EF9MwuXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71AE606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 06:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2579652b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082966; x=1793687766; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=AJpFwj+UtsFPy+Kokat7pc9+njX0j70xHPnHt6IOlgPxwhcl/sIWyf05lcL1vxwEkj
         W5AFrM9CsNK7QCyTLFZgK+3GcW/2PFrK2XeJ0mlrHalWoBtHfJY8stH7Cx6nZlIGKVns
         6sknpFBwcs5Rxl1M5nppyMQ6+Rmyt39GI39hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082966; x=1793687766;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=BWzesycA8tDN9MeL0KKecdm3ibNwuCvOz64IriEFHaCY3ueQCQDNpTrS+FuxZjSnsT
         76ZfYPLx9CeXYhlsf0hi4kuG8nZlsmn2CyIO0aEuiP1LHHF1amRN26xk/6g33sSSUudQ
         682xq5PtKoT9nlSDbpXY0qEfaCHojFzMJDcMpuubE7bOUJluKjOVLdiDUhFUAXcr5vcy
         b3sMXc9VIgJ6uut88FbpVWvD70vd+BFroTUGKq6qGuYG8LJTHLjwPDOmzs7Eb4EmRhip
         qm9F9tGShbEMsDq44D8U1rIdtng20GpZQU2PSud92JKniIeVS6dXCFKd/9hqj0skTMOO
         Lg0A==
X-Forwarded-Encrypted: i=1; AKwUvBzblreVFQ+CkjnneOKc5BKZmAzxjwdDLhRBAqr7TjAbMrdxcO0MK/NB5jPjibaBWYGqMJ+3taVHntb2WejsejE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx2z0dU+dLtD64g+Ml5axGGpvakHlQ3kLN2ljqKXgH5lQJN3Ky
	MaMMB9lIrOeDdYr0PO8rnOyG7POKsV79bF4KdpLkvhlDhZJvnn9LAd7xfyHs8YM/xvc=
X-Gm-Gg: AYBFou3ElKfW5+kirogirWX55M2EGkvDL0K4uXxQQcKijq9jOKpX5RLUfBzCMkEdebU
	zbrc/9eOpW/8lAc3I552tPmIHv5c5Z02fqlaizN6qnaJa7wXStAmGvo9WGSp/zNvov2c+Vxo3X4
	k+GPop9FToKNX4kAVADnbMUtE3eMhIU06HullX00Hmpdhg2IGNQHGvC4PFjX24YtMEELqbhSfr5
	7v1lFHxd3e/urL6KmxLu60j/4xmdnmVyERyvSwx+9j1FfD4b04MvvtzqVPubU/8mN8d9GJk40Wt
	u4jBq115J5tljm8gxmPICr8VCukc8fd4LYIORV8hpV/lzbzYQX/P9irwvA2o2F2v3LENab8/cvF
	HdOJauNrxLZI6IXXElMY1OK+FhP9mTYqwrUEqV1gOnff82ORrUBWABUVEbri+br/3/PtocOTMUj
	Av9/zMATpf7UuGQyJ6sCCcLDPnr4SiXI8iDVJJtns1fS3CBbOIwBTizBYCQtBRpjsk27ByIv2dm
	LHCc+JqHPVLf77HDokRFPn6wTsULCmP5oxu3UBSRxIRS6fWlnCOqqlvPWXAQsY0y/Stpm1I2/NI
	PEqdTqUhK5hhlkkZIEVBoc9+8TCLCG1mhQ0fOeMiPPVpx9Q7MUcXxTw4cenls+40/UZYeSh2P6o
	Oe8AlZvpgNBcsN6t7SEfP6+g=
X-Received: by 2002:a05:6a00:21d5:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a367a39106mr7234616b3a.18.1793082966170;
        Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2004475b3a.7.2026.10.26.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] Make the scheduler stack end check selectable at boot
Message-ID: <cover.1793082868.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

Chris Down (3):
  sched/core: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 4 files changed, 57 insertions(+), 6 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.54.0

