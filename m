Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235730;
	b=qw4OvsjqarQ0V1jTemTcqH/vKSEA5wF64NoDZuDhlOgsd2lFBegOMrf14JrM2FK/WTGC
	 X+c/KeDJd70e89uudnUnYkKG+eRz++tVeP9aj9R7own5zrpWTvTRz/BYGnxwrjGCsNcyO
	 qm4U2U0HmVbqCahYc1zQ6P5H11w/iRwZU30u13Wj4lOjAVztxJY147+0YvudigXxQpK04
	 J9Kv2+IrvFmePzrJgVM/nrFxAr8DQw49q9ALT4lOLPpEafz68CXYFPT/hF9W0GDL3DrAj
	 9h0GnOcqLXSqlsSRGCwjYvH5wFlpb/OBFJEtVDX44HrNqCB68WuIV4QNGIrMhHavv8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
	b=VTqVXUzhSHdm637V8zGEPAijXOo89Omi3GxGhG3p4JgV/duupGY+VgbQ7k5ABoxenRVU
	 Fasj3AegW3bfZGRSZl7YTHDkL5TaFOhuL9NSRChgM+vilNuMhaNh9nVYD5HvjNYs6G2de
	 F3YGbl8lffjtob1n7BEZF+da1zZrWE4Gpk7dvTNvPdvb5rFewAJHBGTSI1dA5wS4w76no
	 qsRQKWp4nLQm5q2pT78o7GhiaAS2nQY2TeeKIikeod1M4IADqTNyYR8a0Z7CmbcicbKmD
	 /MaTbLX77WZOntP2l7cYQNpjXfYrHgZ/RAf6Ngfri5Lam+Ep/PMuybKrlXoiJ8m2q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98260A2600
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C98260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49a92144733so802878f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795235728; x=1795840528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=rJ0c2FQaY85mIEKE24XBYeYjXwakqGKvCspyEqc+nGoiqY9yc0PAHhZJRYpl2fKHn2
         O50f1TU4idsNGR07JZbjcZU0laQtv6liqd+7rrLCV+8p6QmcHXK/IVrFnt3vTLbQie85
         3woJ9AHBJldjrKS+CSpG61enN7z2T8GquENXxfXDL7z6l0JP7DLMBsLx9HByvehXn1AH
         g1ts1UUBeoOhhEcjHszVysVxjIwWNKF3IwPiB3N3AX7UxwtVD3UGs50Gq/00NVq6a9uR
         N7vGunDQWZxzaArUXcroPjo4CKWW+yILZSW7N/gIWXLga+QzSNAgq9FwAwNexgFdkHdS
         wxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235728; x=1795840528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=nJZdkO3KFsoybCCQqfwAjMzsgpJ0HH1nL1DnCI2hM58Z7c/+XbF0JZdvzMAeXgqPDc
         9UMvW8Xdrizk63RmyyeM46QyyN9/RguASXECttK/trOJoCxN3bygg/4ClJ7oq5H2zjk0
         aWaYqYwurYQ2YEU2DW5oqSdgrXsMfdy+mcV12yHSiDGZGGM9k6FfW8ZdrO0vE7KHzcXW
         6lKU+xuPnPYK8z9rQyVCPlK8ks1hIgZTbxmjqoXYQFFakVs42EhTh7/CkjJKj7+Szi4Q
         hBKaRv82HQw+USa6MR4fularjcMCpUFua46ZMnS3QIm0te/OjTheAddufKQ1vAT3KI+X
         zB7w==
X-Forwarded-Encrypted: i=1; AL+hErE3Zi+pLr1Q41vET+dRwanwT0KT2rzpepwWi1H08ScUf5PeD3gGj8v7xe3gtspkILdCeugJFjyIy9U1sjo0dbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I5N8PTFxpOT8ctbe2Zs5Qea/ojbaVxbEP/nRpnG4+ptR6jIOk
	IiZjfamlonzRcCa0nd0DWoKRSquUYyse/zgmKtjsf/zUgQwlFcdmUuso
X-Gm-Gg: AZFdTZfk+sPHguEP3fb6ROPUHsP8Q7g5XZxV/PFPg6HRsqZ2ZTddIEBuPNNh2UxXb8o
	fcem8z5BQmM8g9jr4DnZKnraGp8dzI8n6ota5fzrs3zO8HCDBxQ5ngV6AqIDqWqq5lKJ/GhUd7w
	JqAH4V3X0Mq4GDPfM0RPwbp/c4zjl9f6BFRR9/yxWVWS90i+PLnRfci0Uue85FCJaCMbfbCYdvZ
	tEbJQhG2g1v+oSP2IPb2iaz9dgLlVsYF6GpJx1BxQHfSOTk5Wg6u9t3S+P3K5cEVRk8TQNz0UhJ
	IqKkOGScz0ZRdLec1rvNX72A6YfKO8bfR4wWRvRTxLVGNZiAevu5a8laqGFNBx5VfPnh7K3Z6tv
	ulmFx6E7KWJ9tI1QVoLFxDZraqtl7zBkF0ojJFJ5n7bWUdQs5B0wr/PUHu9V7zgENG3xFMuV/YE
	qI99wMraW6zsukcQrJzsOPgjoUYHGR9zd+uAWefvp3334MB3rlZXZq3B6Op7WsmhUwFoQk3taqq
	RX3VjiDsi9AgcJldgQVza5VOVPfzADLcQZRpoCHkjDDFpzwtEpI42TnATBY0PP4Vycfd2zPYJrY
	ldZZZohq+TTfG5zDH27ShrYbPZYutGnnDuqsX8r0PDYyKGudQDkXUCG29YuoG9UTVslvjsXK7cS
	fdovTEAI2QJna6Humnp59clBSjECg7ZL6Hn9xuV1hCvuChJSwcq9oHfNU2ArHxzhmfrFZTTW8jI
	YA8i3Fvmj/mXSgwUl9L2HqqE9fqYz/GSxi
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr111271405e9.3.1795235727586;
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm214023515e9.0.2026.11.20.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on RT
Date: Sat, 21 Nov 2026 05:35:13 +0100
Message-Id: <20261121043513.20538-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020152708.3atPlnSl@linutronix.de>
References: <20261005070625.8871-1-kmehltretter@gmail.com> <20261020152708.3atPlnSl@linutronix.de>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 05:27:08PM +0200, Sebastian Andrzej Siewior wrote:
> What is it that you try to achieve and why. Why is !PREEMPT_RT not
> affected? Half of the problems origin from PI-boosst.
> Why has the nolock an rmutex-backed allocator.

The bug still reproduces on v7.4-rc3. 

GDB caught n->list_lock's unlock re-entering try_to_wake_up() under p->pi_lock.
kmalloc_nolock() uses normal SLUB locks. On RT they are rtmutex-backed, unlike
!RT.

> can_spin_trylock() skips hardirq and NMI. There is a trylock on the
> local_lock_t.
> Why do we have this mess and couldn't we avoid having it?

This was IRQ-disabled task context, so the check passed.

> I looked at the patches and there something about hardirq-atomic waiter.
> Wen don't have this. I don't think we want.

OK, I am dropping it.

I plan two patches: move range-tree allocation before arena->spinlock, then
restore the RT check that rejects non-preemptible callers. Does that sound like
the right split?

Thanks,
Karl
