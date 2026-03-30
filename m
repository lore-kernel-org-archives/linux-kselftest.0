Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C463C6A2B
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871058; cv=none; b=FXzzdN75TickzF8b0/lohsLJSTgwZMQhamXrlJp8H6OsuHyFsxQ3ectet0dh9RCaGNGzbEPh/AzOogq6CzLsXKV8E42iZ3lp544Toi+mEgXIMP0R4yz7vwlyIlFbfS1CKqAK0PbeUSA7BWiFUmUUy4l+iJdhQfKW2hTNW+yJnAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871058; c=relaxed/simple;
	bh=QNxeWPuNGI2eSY+5Z9RiWVoDWCQtoqxeBXkIfDy5SO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj0RTDphjAAo7E5jwlepFa1TGdRfygzIf/ciCyDAMD0UJRw6QUNaQWddjduYV+HMJysDUhmOPnr7ofF5mpxxTsD2+qNA5iGx6S54miI2JPeaRng8NIm8V6z5tLLuAuFCZrYTN4ixM5MAvfE5PSUjh/ywP4mlnkYBcxlOCIBd+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYyvaqbP; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYyvaqbP"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-126ea4e9694so676091c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774871056; x=1775475856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+Q88Kl0GUitZCzEyHgGQvEVgC1GtxxYgxFmpIs5N6Y=;
        b=XYyvaqbP5g62AM+ODyQkx/AGROye8iJuKUsMn0qSmvZ+oGvo5QsfVF4T9pyMT+028L
         hLIO5BOFGb7eAKb6KW/KyQ8AAPRocLPrV84sB1v+h10w4iio2usnEO8Sy0zapaWuuYJS
         0ZvBl8f0J3dLLk0uD5JHqUGY5XH1wgVik7WliQv1pDyKN4UHXu+12ZqmLqECGGUx+VJ4
         qz0XYkeMSV+GAWFcJWwd9WvOar3U7L3ABR9U8HvwWIL/4fss++njroFUGWWcPeLjo+bq
         DdrgnJAtXJ0bkhAuwKYtf7YcVQcLebywiYa6AiC2ZmHX9lhYg507F5X+4z6/HONMXEwW
         LwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871056; x=1775475856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+Q88Kl0GUitZCzEyHgGQvEVgC1GtxxYgxFmpIs5N6Y=;
        b=krc7Y8aSCWPDRTAesu+vLvLTT1cYsqjzcACVMDNQ3GgCP81dW9/NslgGtibva6/OLT
         PrD+tx7O5vYgBq12EexlElmmGzAysdbsK2ImwJ7Wb1r+QSRqsFe7fioxyBXGcPpXLyQZ
         NwxN0nEqRufkVtx21ft2rx5FQfAfDHmYji09F9xoDKmRv/qspVgJDMauMAPDuRvvebOf
         ph3nXc1QUkZSaxTWKVKo2pwdQKbS2NozAhFmUCa6HB14A0AlMHXRONQx5XPKgVfkFT3v
         5XNIjUh9VHQWKdCxWE3gxIuOV4Dhc9o44uUlSwfDADUkoix2KuEuHKobdbCaHEOUnX47
         HtDA==
X-Forwarded-Encrypted: i=1; AJvYcCWdtkC8YeneQap6ffm65XcghZwGUFqC98PGC9mMFH7N+Z+GHE7SJsvFyvGZ1XBrZDcZ7E4cF10EOUhZZdxKMT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bn5L1UzHKpcOxm1cVhsd6XBWzrNKaGfteShfqnMbgvWkXhDK
	NTkRDoCijoyaNnPuqDpRx8CscbImYrgT67cPrROvYtA8ws1gWUGHC+wa
X-Gm-Gg: ATEYQzyjf8rlnSpet2l/POgF2x75J7v76vsQ1R4iprfsA6aRxTKdlKDudBqatU1ub4G
	3DIIEXXgLN/vF9ei6tHOe8+DVtF/sDeDPOnQEVP5AzxE3y4Yqj3rrone0o4lWpmG2SAffkW98b6
	UpazFBh0a0nU3zsvVaahpns2+H1eEaUSJC4VXThDIXMfaGdFay62gOLk+SX3WXcfnU0BsWJbePp
	4EpgzKusANUQG5HHtyTK8+8mE3E6xK5NX4nmh/svTEj1yGRVmLiSdWTG2sChYgFb7maJBPMn/gl
	G4ChoUQ7iWboe3fQHJae5PuNtUrFvG6qdw9LwT+Bd3BtE/68VGQUhFCX2rBVmBQiIBH/1hK2xwo
	T12u9dU1+HS6orD6yma1nm4IucKpDaoF1+AHSa69b2rtr4SeoPiydXPKYAU3r9whs0irjyB9iVm
	Z1jQhsbizUwMp6CWjrhz2qjB8nROQfJlR4ZDs=
X-Received: by 2002:a05:7022:f005:b0:128:cf5c:5362 with SMTP id a92af1059eb24-12ab2884d8fmr7157614c88.12.1774871056408;
        Mon, 30 Mar 2026 04:44:16 -0700 (PDT)
Received: from localhost.localdomain ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97ca83bsm7083511c88.2.2026.03.30.04.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:44:16 -0700 (PDT)
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
Subject: Re: [PATCH 01/15] sched/isolation: Support dynamic allocation for housekeeping masks
Date: Mon, 30 Mar 2026 19:43:21 +0800
Message-ID: <20260330114348.102265-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325135707.GZ3738786@noisy.programming.kicks-ass.net>
References: <20260325135707.GZ3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Hi Peter,

On Wed, Mar 25, 2026 at 02:57:07PM +0100, Peter Zijlstra wrote:
> I think I asked this a while ago; why do we have more than one mask? 
> What is the actual purpose of being able to separate RCU from Timers?

That's a fair point. For the vast majority of use cases (like NOHZ_FULL), 
these masks are indeed identical and should be updated as a single unit. 

The original motivation for separation was to allow extreme fine-tuning in 
HFT environments—for example, offloading RCU callbacks to keep a core 
mostly clean but allowing pinned timers for specific localized 
telemetry/monitoring. 

However, I acknowledge this adds significant complexity. In V13, I will 
unify these into a single "Global Housekeeping Mask" by default to 
simplify the configuration space, while keeping the underlying notifier 
infrastructure flexible enough for future specialized needs.
