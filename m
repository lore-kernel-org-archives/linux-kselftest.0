Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908323;
	b=VpGDRBeRJg8szDjfZqijGW1XWL6CtZHQZxsFOHHLIOLJM+eH06+GP0bfYphqOTCf/VPU
	 h7vitfbz5fmp/GUdyGH64soC3rM01oPMYgySBPXCe3PvUsduEorJOQU5uqap7MWSOgAA7
	 kNcJOq2UHwXDhJVuckDLD4f6PgQKCoqmI6a5m2U8o8ld0TzzmAlaXcZLYpWyzXRDW3vyL
	 fExijb19kTOksl+rf//Ovdv1b8zSsJ186BRiXuKvGyCU+iUmHR04CcUBbzpnyYd3fxP4g
	 1O3tPAhQ88qJvWe6e22Jk8nkkpT8zCPkXjiCH75xjjv9jHBukhT746rnMfIqy93+pOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
	b=RuSjGrUyZhn7EJFWLaqRT2d+38B8WIn1qYJhP+1RRbMFCPcQkgGAj2hxlljgXPAv2XdF
	 jfZC9QpWkNDWPA9ViuuFybYQfAIoW23PnLvD8/p1WKrrGU851A6M9F8H0KzXtbJRp44HR
	 n4UwRK5jwloIC/5gZ//GcMohSqJp+FZAtCc5Tot3Yly8IoM+tlGbBA8YPgzSJ/aBSrBiG
	 EK8Vao9gNukbeGJvNuQqWCVpew77eHjt8fdWuuDhfenwc1ZR2Esjy2IGWI07lxiCjPyHB
	 e8KkR6YPOc8kzy9MgE31u01kVWcdrOua6Ljwm9Km6EA+rKgDow01TddqfglzNKe5vCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvJMfIQH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FB606A32F
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 19:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9FB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvJMfIQH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2766285e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908322; x=1794513122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
        b=PvJMfIQHklp/6lrIJDb4DxHqeo8UgGdpsAu9dqQBOFpKyjqnOfM/bLgV3jxURH5B6C
         peftRdY9+W+wmrPZ3XDgPPzndrl8XFrtQKEW2KmejcJyjMbVQytxJ4wYg+NEdbJ+kAMb
         YgbG8/TLr5IdJxT9UkKKgf0QtKgOPlH9VIMBTFgRway+YkJj8wMlFpeYvfN9mFDljH81
         vt3JkDpxF4pVmCMAJhLHG6iLtEDLCGbY1lXGeo7kO/Y4waQ5E6rMiaH6J0bxlSA1sBx7
         SFfRyAQSlHD9i6J8DHV2lrf6bpl0GeOeyt6r6SCkSKRHbjY58i3VmbMTDSjXjjNcp9Ik
         h2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908322; x=1794513122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
        b=hb81+erxeOqnc2yII/9IJI9HjBlAD1ZlfMkFQtrHF/Ki7TecjYkzoyaUfYhOgOmFGe
         k0g5uav9Gnm4Ck8PAVoh78HRdKFo912cwnDi0TEEkXnAKh2ArMb5n75pfy8SzEymACz7
         lC0dUDrSb607Rfm+7amxFgGGSlRaYOls7PWLf0gjpbztXqY6OXw5osQmX7O1Zby53THe
         ucPkBz//hufozVeofWAqnzHbXUqr6JCKWk6hoESciAi5ZGutu87xvPkXMoqJRLjqpN+D
         qHKcDWwn+uAfmgh2BCWGSduj4FoDheHnYrAL4YgDcTkyZ4NqplQp4d+3mOcTNZD72O8L
         /SSw==
X-Forwarded-Encrypted: i=1; AKwUvBz03cnGTcm1qPYmyhV85AbaIsvvUmlq9RQFLXyS1vvJ+EGMDO0pXPQ+Gw2gxp/W8GMQSlFw4mXQA7AwDhrr7mI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fkpsua4bXzJ46F5R+cMVDZOZUGFel3xesWl5W+EGWs8egUoek
	zEhH1ml5c//ONhYjGFrYPi3cPForvgw/O0HtkEvIR2NnAxk/K3/p8sCw
X-Gm-Gg: AYBFou1Cw6KWWUxY5LD0rPrimU3J5ndYPYaLxECKBGluWRhsyA+O/MRCdd7P+k2SWyg
	da6Y/OMr5w8D4wT40SHPEczuCG99fSppnhqMnzKaZMXA2umBU0RSqFp+zcJU0S3R9pgMj1DL57r
	ZMy+aux3DUrmew5VIfYu4Jx+TnnLIV1o0pXsP1tZsJ9It0kgokwZKzRS04IWwr4LqOnHOOvDsrv
	s3mV+K3ACl0gPe1W2zg+Yu0wkv0mgfA9inZqPPkUpeQyIWR1B++YwTGYBe02v4hD3N+mXERrHtv
	NJ0pFAvMiNUS++N/UII7uQW8iVDBcTc3t7ufEfgxxtbXuiTPOp5JvSzJ8mh6iRK9++RC3ekj8ck
	v1106K6Ifu8WLiJGyxnv9XM5wOtMZJka2OMT5CRty1QJqlUv2A18U0zyjL2hxk8S7PKrVvh5qpz
	/FTxbpX7Y4FCEW1y7KOqGu+WrL0xziUszL1jPtu6R9Z+D5DvVoPZ6ExauEfEYSkSOPx0H8egje5
	DJF6JaMrT1jHdEQupUYB1KRn5hjKnKs+baEzTl87+e2KFlVDxVN2iI3mZRRVFRZizm9rhoahAEr
	KapVyjHGw5wNZxQyL15o0xZ2Va12ueL0MerKAGXjssl1W92o/w==
X-Received: by 2002:a05:600c:6d8f:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4b6d82b2c85mr3060825e9.0.1793908321669;
        Thu, 05 Nov 2026 11:52:01 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d676sm2497515e9.7.2026.11.05.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:52:01 -0800 (PST)
Date: Thu, 5 Nov 2026 22:51:57 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: juri.lelli@redhat.com, peterz@infradead.org, mingo@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it, mathieu.poirier@linaro.org, 
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	parri.andrea@gmail.com, m.szyprowski@samsung.com, weihengqiuu@gmail.com, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 01/24] sched: Fix cpuset_mutex double unlock in
 __sched_setscheduler()
Message-ID: <auzdzi_ZIqmYFV-Z@scheduler.schedules>
References: <20261105193359.1450487-1-mathieu.desnoyers@efficios.com>
 <20261105193359.1450487-2-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105193359.1450487-2-mathieu.desnoyers@efficios.com>

On Thu, Nov 05, 2026 at 02:33:36PM -0500, Mathieu Desnoyers wrote:
> From: Andrea Parri <parri.andrea@gmail.com>

> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

You gotta add your own SoB, no?


Cheers,

Kayra
