Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967C3C870C
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871118; cv=none; b=uS9MRNmClgMw8meW1Yd+I2mDrvruWSMkzZdOpE8pniGrA/P0RXE6+QbWy58bsTLnem3RCTNvnH3diVzpKBhbAZXlTp4Q8bGRi1fTfwW/ySsqT1HEvBHGjlGejerNyWVsjTuiFJEi+CyEdv5yC5wrTNbV2Dszi9ZrlhINdZKAca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871118; c=relaxed/simple;
	bh=kycga9i6Vn45DHzFTlgg9Oku8LYokhcIRIuU+jvkYqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTby4/D9EyGbIeCl5AWUTM/wiD5DpMnf/erFdI3LJBFEK0KJBAaOItCwNMDCqR27HK9slnVA2Njb3oranw3uFvTOUv02fRQgnf4vJ/hMpM4pc3HFsJ0leJqMqcbWUX89hDkCQ98LgDD5G7k7rDCGIyyhw3WPUS10MElCOtE77/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9hIlR57; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9hIlR57"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0c955a481so723461eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774871116; x=1775475916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTACHKzRTTQTHv2BeEVVc+PV7wXJkipQOVm/vndnvSM=;
        b=Q9hIlR57opwLzxLoGOaNh4LiKBiKNdV44IqEoRdMuyK9MmIv58Tlbr8fxcoXZA8KHk
         cTh5YniRvEhyEhHgtyetXW+QyAoOGRvX6pTJ66pgIhshkYwyM86yke5foR6ecdMuDCOE
         CnkSMQnOn4wg9+pgvJg5hoc01+1FtDML7C+9gssrI/vEYkrM8Y30byoq0Z4mBIoMOsnX
         KtXHRLTwQS7PtLIaa2QGsuOSof5hQ4boXtV5QP/wXRfo6URzKh1oWugkvJ9QzILD4RzM
         FnZa7hBMLLfI3YUmk6MBfAKXNC0jE6j/VWK/mb9uky91MnvZRPuAP+T9Kk31xczm18ao
         hZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871116; x=1775475916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTACHKzRTTQTHv2BeEVVc+PV7wXJkipQOVm/vndnvSM=;
        b=RRwfuyZjfBEtYn3F2iHk/xy+VOIpb0tr/Fe16E4AQafis6Gxp1ewK+YUhnK+XWr0Kd
         /rFvO+/C+NqYsowRqZi40zTh29XLFDo+EkSp223M+LyXXhxHTekXI89VrGyPszy9j3Ld
         EuCQpTaUL8O3FYbYZzizLeQpYIV+0cQ79jWH7zJ4nZPmyCQ1bWL2P1sOiju434OXJOzu
         98IxA0std9NlDQ+3vWgDQeQzKnD4v40TK0D9I/ywxapH1DJVnYAMX+sACTDz+S3eRoy0
         Q4d4pga42zDAteVSPz6NzEm1trlZdaExo4Um5V5uFlc1EX0c+3ZNl1zs7o3JqzmhS8Fd
         IGrA==
X-Forwarded-Encrypted: i=1; AJvYcCXw93K7NuR3UTp4DhVwAc9JR+kBcwRfX5HrL+CIOtZM+VTdxSSO0r6CqHFq0dg5cdVCHieABusVcxEyo3dfBc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmemocEcQGtWAhY/Y946WyZvYuT7IUHm8rCRs5lwwwpoI0xED
	SRxF7FiKD5RnLwxV0UWaoLblGIGegIWWwYipYf5/Su9mGZ5eG6iXhldv
X-Gm-Gg: ATEYQzzbNRSuUkGWaJ3ZQ/CUVuNcDtpvO4B1z3l/EaIhp26KgTqYJCR75tsXH3Nn85i
	/2h+v5y1Y1LYcw3N9MGt88Fu4YaQ0OBmWL9OJbqRrIXwUkOWTtE0E4c6RvY03XypobkoEA8ctAd
	aitIFStOKBwX4Kl5BzO5iZ4ESDBpM1Ug5Sn/feUydpJRrGWBGr/CpA0Ucski0/NehYaRfqPk/tO
	AxeKj8OgfftDXKGLmUbeCLz9qoEW4lD30g491CpdwMPXVBLZuUBOU2H4RnhuV8ETzXTjfYxZegD
	Qfdwa5ns4C9E7wkC5VdfZ18P9KQK6SJLxBxsBfzHArcpN9R5jv8JsIaeOKHWNg74p8lioAocBFw
	cf+UJEB1y9Ec4udj77LWw77kp8OR2kspbNYM1+vzqkGWcV56nYONwlG/Rk8T6imthObF/YlM2Z4
	7OTAyixDuybrgyrUJApHC1Qe27lgFyDVXNVEI=
X-Received: by 2002:a05:7300:dc90:b0:2c5:a6ce:e534 with SMTP id 5a478bee46e88-2c5a6cef339mr2202718eec.8.1774871115888;
        Mon, 30 Mar 2026 04:45:15 -0700 (PDT)
Received: from localhost.localdomain ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c41c1513sm7056897eec.8.2026.03.30.04.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:45:15 -0700 (PDT)
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
Subject: Re: [PATCH 03/15] sched/isolation: Separate housekeeping types in enum hk_type
Date: Mon, 30 Mar 2026 19:44:48 +0800
Message-ID: <20260330114448.103086-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325135904.GB3738786@noisy.programming.kicks-ass.net>
References: <20260325135904.GB3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Mar 25, 2026 at 02:59:04PM +0100, Peter Zijlstra wrote:
> What the hell for?

Direct and to the point. The original intent was to allow for asymmetric 
isolation (e.g. offloading RCU callbacks while keeping specific timers 
local for very specialized real-time monitoring).

However, I agree that for 99% of use cases, this is unnecessary 
complexity. In V13, I will consolidate these independent enum types 
into a unified housekeeping mask to simplify the configuration and 
reduce the "insane configuration space" you mentioned earlier.
