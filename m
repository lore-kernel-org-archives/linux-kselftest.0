Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60620413220
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475304; cv=none; b=iRBVfbPNP/phcDhyJQ5oTH4RaxftY8XCpzZ55xGoKUkWZHUFmPH2G2CEgjdnEVxjsC4MoKhz+s2Q+7Q4cwX0I2IWH8zIEI+G0CH+UxbXutsI49ZJh5QtmrfR3JfVaUwZ25TVyRggIqUbz7PxlbeimLAdxiEk3hAYRhn2flKTTns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475304; c=relaxed/simple;
	bh=/vvfHDSLABQ+E5JmDpAswFhQgvfDtgjcru5f/Fsb5uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln+Wt4lm467KvDk/eJJ4yZ6btEwoCEIvVZMs8QPXbF+akD19lxAu2251VxUJMNGRmAM5MEy7dMUZ6kbVn5qHCsY56dwIyUx7bYvuqnYkofU8I7BGlhxLiPAQLpOozepQIKpmJAIgqHgnwwPqbHudxJMvb5IZcMbS/+9I2NiXrF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/F12xdA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/F12xdA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b915ded5so2547395e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475300; x=1781080100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbxFhf/whaY2/lpRVxDROPHQUt8kRLkmb/44SJOLV3A=;
        b=D/F12xdAGI0DADzU79YJQNMoe6+paTIVQbGzrTZynVhDH0El8pRljk/kE1lqfh4a+x
         GS/M9Nv/Nd2ETNlbGZsXK8a4i91uQw4cosY+Y3AgH7luzoolN3A5Wt1ggUCLRdnZmeS/
         GBob9fke0a/Bx90xbSiZ/0d8BKEBznWhcvc9/u9s6P83RhlyDWFa42V+UStPGeCICHiI
         gPpCDWcjvI+oxqu1s3i+D5MVBEYhQi6SMOEUMjwV4VogQLqDuh9y/JSCMV5Vp4f3K5Im
         o3lWgbdUHUIVQPAJYFISqAZtI+0rVWW8imsgRlT3kalrKNF7Sz8cwDN4D7fd6udddkan
         8t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475300; x=1781080100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbxFhf/whaY2/lpRVxDROPHQUt8kRLkmb/44SJOLV3A=;
        b=Ne+dZ6eOzCHDaSeh+Rz/FkNyuU3Zcvdn0cruE0qF6BEFq7Roawl4NSTBOaInMnT0Xm
         YSBLW0X/WLWEB4VdwDyrc/BkkqMvKAnq+ZC2yUh2DtqPgXX2bGOCKyjOgVVmFtU2XSur
         AEM/7bpUQhEmIHwR5RcNwvSeDsDrAFpZ+nZZkxe917vUJNdvTRT2YRtEQH3ibSXGQZAo
         oQ4qcEhBka7r71hESBp6L9/xMRAyGPBEpmvtoV6T7l2iHPR0XV0/JT1clqGl6cW/83h1
         pY1qviZAKwQR9kvcYpsH27GQ2oh2rxsWOXm7FIxBMeOBsi6BvGh3WohUrc8dyyvjqeOc
         27hw==
X-Forwarded-Encrypted: i=1; AFNElJ+8/255EWPh2OfsZeX7HsGu+IwsJctDNjFbNjK2CjdZe529IFMVb1r1ui7bVVVegZ1H8bPqYvt/hDpDOs5f+Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzybvRuGlisFPUL1O65e/OKrWH7iWokmxvZm2fNnG5nkt/ci4QW
	xRZNJ0JpFkvT5zPOp64rlNRSXjriLENmK7qmkfm8MzQX2B4woakKADj+
X-Gm-Gg: Acq92OEr3foTLqJRifMLjzitWNDRU6FKU1h/Jhr31rw65EW0Y1LGDgUx/M0GcqgQKYG
	T0SUyJ3uF17SyweLWJKCVcw5Zafx7X70AZBfNV+pmZ5HvWlBMG4o5bVmX0rK1KpyVWooIrNnZCG
	Pnp2V73I72+co0ZjCa8pGfd9apdlnnCoTFX1A1lJ30EcfwHlRFxZiPoi7+i6jV7aLhKHNom+Xu4
	tFE6JWxgnOfdPGJwD5YRblFyOywIr3c3BaIqZ2NN7ZecjQcL1tEFX/k3hG0BBe36dnWTAcVDz2d
	ojTo6Vs4X7wMENsab/HvHMW+PGyS0ih9rt5658yA7WzsUN/46UTAt+VyLwBpdxJQc2wDutSmL41
	IWvIbGCR0Zf4XH3O8KHfpPaCgcYApcFEFOMl+s0XtX1+fTysJGYxMl9GRiSWOUvR/udQ+06jpMO
	4wxgMcVBJ0PhZuqWYFWfPfaLJMcqYHs2rP5WI=
X-Received: by 2002:a05:600c:3b10:b0:490:b1df:de4 with SMTP id 5b1f17b1804b1-490b60eca9fmr32057675e9.22.1780475299613;
        Wed, 03 Jun 2026 01:28:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::d167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm9083431f8f.29.2026.06.03.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:28:19 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>,
	Alban Crequy <alban.crequy@gmail.com>
Subject: Re: [PATCH v5 1/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Wed,  3 Jun 2026 10:27:07 +0200
Message-ID: <20260603082707.3831525-1-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260602100917.3641359-2-alban.crequy@gmail.com>
References: <20260602100917.3641359-1-alban.crequy@gmail.com> <20260602100917.3641359-2-alban.crequy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko raised a question about pidfd_get_task() and PIDFD_THREAD [1],
so I ran some tests to understand the behavior.
[1] https://sashiko.dev/#/patchset/20260602100917.3641359-1-alban.crequy@gmail.com

pidfd_get_task() always resolves pidfds using PIDTYPE_TGID (kernel/pid.c
line 640), regardless of whether the pidfd was created with PIDFD_THREAD.
This means:

 - A PIDFD_THREAD pidfd for a non-leader thread fails with ESRCH.
 - A regular pidfd for a process whose leader has exited (pthread_exit
   in main, secondary thread still alive) also fails with ESRCH.

This is not specific to my patch: process_madvise() uses pidfd_get_task()
in the same way and has the same behavior. I wrote a test program
confirming this:

  https://github.com/alban/tests/tree/alban_pvm_flags/pvm_flags/pidfd_thread_test

Results summary:

  All threads alive:
    pidfd_open(pid, 0)              + process_vm_readv: OK
    pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: OK (leader tid)
    pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: ESRCH (non-leader)

  Leader thread exited (secondary still alive):
    pidfd_open(pid, 0)              + process_vm_readv: ESRCH
    pidfd_open(pid, PIDFD_THREAD)   + process_vm_readv: ESRCH
    pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: ESRCH (non-leader)
    process_vm_readv(tid, flags=0)                    : OK (plain TID path)

  process_madvise() behaves identically in all cases above.

For the non-leader thread case when all threads are alive, this is fine in
practice: all threads share the same mm_struct, so profilers just use a regular
pidfd for the thread-group leader.

However, the exited-leader case is a real limitation for profilers.
OpenTelemetry eBPF Profiler wants to profile a process where the main thread
has exited but secondary threads are still running [2].
[2] https://github.com/open-telemetry/opentelemetry-ebpf-profiler/pull/376

Using plain TIDs (flags=0) would work, but it means users cannot use
PROCESS_VM_PIDFD in this scenario.

What do you think this patch should do? I see two options:
 - Address this limitation in a separate future patch that fixes
   pidfd_get_task() to use PIDTYPE_PID when PIDFD_THREAD is detected in
   f_flags, benefiting all callers (process_vm_readv, process_madvise,
   and any future users).
 - Address it in this patch series.
