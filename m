Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912A3C7DEB
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871181; cv=none; b=R4Sujm7hPQKUITIBL1Q6RGlugLRZKZuanVQMKCEOW667PT9nN532ng5CCme5rDVahfJOSLKKiOc74xO/6T1RamSQ8HrHv1rRBnQzubGuDilcirgMmiSIzJ7NzBOlAuZ0xH7bHIqqQxjOfwxwzjfFHJiR+X+duxL0vnJfchDRldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871181; c=relaxed/simple;
	bh=qTmtyABsMZxVL7dEpA9F+DSHfsWRV7AZpPMrHUVPxZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYggFLUiZbN2ZGJdPmZlwDaNAUvOV1D6ea1cd4Gh4PPvrYLRSqAV9LyzHKw77gnhb2w/KSl2QVoCgpg7KX1E6MeBpmjVGn15LurkzlQNBZeA1BrrD5CDim6KIF8Hr6aUgsvIHvPkkoE0Ownqi6Hkrj05IRbEzTHKiT14fuoeM+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQjTBw80; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQjTBw80"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so377715c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774871180; x=1775475980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88r4nrovufv2sJYIOMDGEaf/zyrN4LEqGmAEdjsIQK0=;
        b=oQjTBw80G6CPbV3xb9k8mHMMY66IwAMSWDkSUVihulzz4295Y2owI2WWIbWYbEYf7J
         8l5zspwZvwaZdE2B33Q9sljA5SQvXuRWRLvf7ZNEJuDVyGDszJ8V0nZDlTWWIliaxD7w
         I3STYj8BCUXAW+GgN0aKo/crTBlkkH0MpufaDThuc8MV0/qwvjuOaxSHizaZYmLpvn4o
         0mIfsL/6SkCYJtHrin0XJogiSfOT5oBLGJieUnU7hVhc8wYWf045jWgjvjS8/OijfcBT
         pxF3U92ZF9BtGwpfvlZlPaVT8tch9ocb+2ECdesrqPUclcn7wMB3f3hmPA/PkxnLGETK
         CeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871180; x=1775475980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88r4nrovufv2sJYIOMDGEaf/zyrN4LEqGmAEdjsIQK0=;
        b=OzGCSDtgHZ0T2DFdnNvakvgR3IZ+KNz27nXhoM5jEFrOv5+kaAHVPbzSRToPWr9T7E
         YBPF/JZL6FWY+JMGeAoXKfGmGFXttKUTycPsSAwczAVWTFOavMJf1icWxSOJ0WFhNiY+
         +G2pXAMO5r1p/d3akQ7Xg7wtMu9VfITyUbS7TC3AZYX1vW3OckP0VvBIcGYE9CxrzG6s
         +E1GSNtxwTTZgh67u3c+zBiUpUPFT9xMKuoQU1IhbCfHzVUSW4ma4ZmuFN5EJUoD8KiI
         ujOt25RV/fYZkQiG9R2405lpNMwJfGRmpIguWJb3ARBgfLOD/0yyvsEUZBkrnHqwja6k
         +HZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFsz7pk/pBIJpXEjAvwku0ws3IiXrQsrm/3WYd85yknN9aRfPMjCShCA49nXefUx2rp/ykf3pBwBvtseeM92w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5psRqngBzpcoXiczuMFW0++BeRdAVgwxaMrWGjtN6K+WJkVA
	YNE/fGi17bikcXZPiA63LjhGr71XK4Id0JQYkOAUbL2ybWD1ByyOzIQ2
X-Gm-Gg: ATEYQzxtE1kVUHX36hslVGeJsDzjntE8EqDpErGs79ayWFurwjLNMGMQx7hMrk8/+La
	8d9ht3DmdMiZEoRm70+qv07WOahmOfUwYQyXgHyTaPm07c1dm/0Lry7+RJ5uRQvbQx9hbug6zwX
	9/JgMHuvFa0nLi1Vt5L5fY9PJgRfZglBP612OzfQy+NDYdfKuVKyg7LmTq8LKykdUng7763s/Xk
	+/t63WENqkvdVtI5mRjV/zjdTWd7TL4n5gzE0TavVJR69yUbfITUA1pP2j6EVaA7jwwiPM8UA5Z
	p/VJl3Q9mPHkr2j90kEQUtZlVRYAMDF06BzaDZEyUdoX3w+byhxHsLY6oFOnVYMEarCoolX7drZ
	f6rbDGeO39iP5oUal2yS9ZVEY3Fmo9ZP6tFeeJbFAuJrPtuBMvA0BYZCakSN37SNmvZZO0MecKn
	YSBctV/xeZzzPDu7gaBKuaYsTlnKTEMUcf3O0=
X-Received: by 2002:a05:7301:3d06:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2c6cdc30b84mr964511eec.28.1774871179502;
        Mon, 30 Mar 2026 04:46:19 -0700 (PDT)
Received: from localhost.localdomain ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm6703832eec.21.2026.03.30.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:46:19 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
To: peterz@infradead.org
Cc: longman@redhat.com,
	cgroups@vger.kernel.org,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	boqun.feng@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	hannes@cmpxchg.org,
	jackmanb@google.com,
	jiangshanlai@gmail.com,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mathieu.desnoyers@efficios.com,
	mgorman@suse.de,
	mhocko@suse.com,
	mingo@kernel.org,
	mingo@redhat.com,
	neeraj.upadhyay@kernel.org,
	paulmck@kernel.org,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	realwujing@gmail.com,
	rostedt@goodmis.org,
	shuah@kernel.org,
	surenb@google.com,
	tglx@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	vbabka@suse.cz,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	ziy@nvidia.com
Subject: Re: [PATCH 07/15] watchdog: Allow runtime toggle of lockup detector affinity
Date: Mon, 30 Mar 2026 19:45:46 +0800
Message-ID: <20260330114546.103726-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325140324.GD3738786@noisy.programming.kicks-ass.net>
References: <20260325140324.GD3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Mar 25, 2026 at 03:03:24PM +0100, Peter Zijlstra wrote:
> Why would we want to toggle the watchdog? It's linked to the 
> TIMER housekeeping type anyway, right?

Yes, it is. The original patch had an independent toggle that felt 
redundant to you, and I agree. The watchdog affinity follows the 
timer housekeeping state.

I'll simplify this by removing the custom toggle and making it a 
guaranteed side-effect of the global housekeeping state update. 
This keeps the configuration simple while still achieving the goal 
of keeping the isolated cores completely clean during dynamic changes.
