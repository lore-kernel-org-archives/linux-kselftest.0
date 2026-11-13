Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584990;
	b=rS7tK1BSFP2ueiMG9Y9/mUeIb07A93svhSjT7SFleaga4JNJ2Shr8fjEfrOgfvL698Pi
	 hJiqJwvEPVMv7Y99QIifn14jlE7edlaa8dxFJlUVrokAxv2YnT4gmqithJt7VirqMygTT
	 dJz2zvnv0kpVmpnvHQRvV7W/GFBqVTVi5EWQd0F+Ea5NCYrYnoq3psgQ/UFXG3M7nEDYB
	 YtPrluVTJpn1d8+9l9PHrZKbJ/AoIbXK4KHiAXthrhj8aW4Yh2KxqnX4tCu2aFbTPUPgJ
	 +NMtjUNb5a1bPisv4iR5XCrmSGVJHzAjd9jc1zaVrqM0x3f9eULIkDsELBKsaZXnLbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
	b=MqTia0Uw+F8rnYujipJat8NkBKlYb7kjZYbmadDlogdk+7AI4KKUAJnbu1Fd9qtWnuYq
	 9dB5u99F63t2RdbIeLsmIUQ/05PqUXGWAZ2nJjzbO1/dELpPFTC/plNuKNWzxzfhi5orH
	 ZuT9yDnfTJg6CEhgkdznII9R8KWaYEPrHkUGBsS/VTonFnmkB7KQdX7o63HP9GETR5VDF
	 K466fshiL+/SV9/bT5nzgsFrXk401hAMm65IHvwJ2p9gs3Dy5oOPvhPKmnQmbb6e9b1ep
	 WOPbBc4kpeYPCy3Tzlb22M38fKRLzQ8z3F5jeXYhNmniXoVIvy64YFLySFTmzQkupJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt6PRoTj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C5606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329C5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt6PRoTj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48fd2e38825so797249f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584989; x=1795189789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
        b=gt6PRoTjK9ushlCFmi0ZnyNwfS/RFssMXZcQGe2pK8ReE6W1cTJq9QVXKDgbsK7I/u
         QLCMljabk098avfl3K3IKbEHTrqIYq/AXSVFB8HFvwXiRgwuyPlUahqfKNnMoEHeWNhY
         M2X37MoMwgmAp9EJ0/2KidunymAnbPVB/RfOfz6vOoMoK5qp61eGjdqgAqsrjikxAQ9g
         VOSArufYGvu8H5cOCLxjsC78AuSgMVvDEJSKrB+upnCPCmd2dfiRfNqp2vhbKW5FbpPK
         9ovQ/9GGKfOYZbuRQ3U45LSKN9r42DvPuu/0zHggVTglptLhHgJaueP7ItMzfSE6n+Da
         5p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584989; x=1795189789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
        b=HC5wFDtFJ/ZknTyhqPjNyaR++LEmi5hvwYkrInT/4g9NbWqVYjB11DPwOyyG7V0/Pb
         CFAI/qevrNizPxKzkGZz2Suq3pcpJabygLdDNEIMlqEHEVPmJMcav2mTeevGBzeFbNB3
         dV/907gfQbfY2h6mGjkTc4+jUuUzNFE4xHpstpt7OTOMjeTnVYT1bnkvJfsRSrvbs2yV
         j+WG6M5Zbreg3GddRX/AprWtyq/dCryruAJY9dfsbyYHpa9X18Ugj/1hG6xyEmfelRJC
         Z6ZWZdJ80gbEhQhLgolnXDSITxeIceOvbqOGIZfkFaX++NLELk1zDhLr72zWn/iOGWUG
         tGdg==
X-Forwarded-Encrypted: i=1; AL+hErG2Bv4tLdaKKAxrfqt8YutkKv8sL6mQrUDLotG+CxQNgrxo2cW+1jHiJ/SANY+WJMxlzXVtTEnyrR2L2DzqKRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vRMZR+R2oCP9gQP0dynE5PWi27K0T5arpXh8ILHXGNvPTcSSD
	SM3XqXAJU8RjehD/UD0jfeflmzTQRHS5tvqg5nYEVyjvgHIBifWcvoRY
X-Gm-Gg: AYBFou0wYERR2UZ9pBVNyCXopdixVE2obG7YrQhKd6ulLHaXd/dznvc2ih0jlFdjLQV
	xUHbxGEeIyzogJxZNwHfuuzBg3S/47CuLNUXSGtNDxDabrUKQlSsmWp9VavJ4S6NpjWJCHGw120
	hgeZBDdvcL6UUS9B2EYEg93x2tSejav2qLGFwvMfHu8ZJjBYJalC+fN5b0ixtgSWW2rKkkl9D8e
	xQorAW1j9B3RTSNFieX5c6bSDtxk2ookfqpvAGvretdbVcoOMl0K20oz3CRHqRgkvqGTLikJr5z
	NBpF/wchEEWQx+tMCa5UFUEMTO2CS+UPE6Vj6L9lLFqNj004KUn5tQMDGbhneqf1jf8H7UTMsYl
	GolOuCa+CHsDHxxqdLtxo5/UxGBljEQY8fHjd1txJZUXSbDhwy5Z4w82qeBuS7Op3mENvpOBfTD
	4iN9AaLbeD5+8iJVhlF86pnR6HgJxTAqwccQiPQSLcUrSqvK9bzVDwzxfI98CiIj/SN2NTk1ygA
	LX92Bd4Gop3QfVYUDiScEu01WvxY1UNu4I1G/xFubTvASCfWs24Q24LwcQMsU8f/fxkY0/AN1VR
	Ebal+xDAzSPFYAkqPpslcFXoTknWp6h23uYFQb8YGVd+d0FNwnzvM4V0S+XRXWg5SqqvgXCde6i
	n1w==
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr6770868f8f.21.1794584988524;
        Fri, 13 Nov 2026 07:49:48 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm6797151f8f.1.2026.11.13.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:49:48 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	will@kernel.org,
	boqun@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	m.szyprowski@samsung.com,
	kayracizmeci@gmail.com,
	weihengqiuu@gmail.com,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only where room was made
Date: Fri, 13 Nov 2026 16:49:43 +0100
Message-ID: <20261113154943.14429-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <818f0461-4635-464c-be20-461cd4cd8341@efficios.com>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com> <20261108185406.1549770-19-mathieu.desnoyers@efficios.com> <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb> <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com> <20261113150438.9119-1-parri.andrea@gmail.com> <818f0461-4635-464c-be20-461cd4cd8341@efficios.com>
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

On Fri, Nov 13, 2026 at 10:20:16AM -0500, Mathieu Desnoyers wrote:

[...]

> Neither is needed. I propose to carry your patch in the next version,
> unchanged, right before this one. I already carry your cpuset_mutex
> fix that way. I rebase my patches on top of it. Then one series fixes
> the order of the two, and the selftests run on both.
>
> Tell me if you agree, or if you prefer to keep it separate. If your
> patch is picked up on its own first, I rebase on it instead.

Sounds good, thanks.  Please carry it unchanged, with Sebastian's
Reviewed-by [1].

[1] https://lore.kernel.org/20261113153549.Z8XPohWU@linutronix.de/

Thanks,
  Andrea
