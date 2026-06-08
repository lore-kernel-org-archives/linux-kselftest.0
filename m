Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCD13E3C73
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944268; cv=none; b=uJ01GMwl01JqVjL1slh3vOspjMVgGX70gA2rkWjB35E3BI+Jns90EuQK21S3sYq1hZBHz/6cpTH8vaiCTuANbGysb6Xc88Vc1K7SJ+ZipWCimEEDM5kZEWPA/AeWfT4fPxradwQXCDHApdd9LzMPKo1CnK9oqVBDrbEdIVsJHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944268; c=relaxed/simple;
	bh=XR7M+k8AyohEgX2Awc+rok3FKQJEWRdH3Mqrk0t1ESg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q/1FX1WKvqZ5KFxs9+f4qFgKgBukWaBWxLHHJvcjh6l+bIVO9ioTTc7QqMJqsi9RtsjdtvxyBQVkkHOVrXRpshy07s7FhG1EffJb4qWja7m7J8f/C4+byG1g7IVLHDIxajitZ9AN0aBI3qydjz5ExsQwqM5yiywqCf4JWyqGLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KlnADuuo; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlnADuuo"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-68f9f08cfcaso4391881a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780944266; x=1781549066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kzWlN/HIpnAONZ7obvDJpbmfDuKvpPMm7rzEezOti8=;
        b=KlnADuuoAe/3uQQMpSOrdlftHc7sbFN99LQVx6iy0HNZqfASAb7F90yTY4vQ9HjQI/
         j+82gZMt7UQw/Nq1JrCFLUyhLOiFTicc7CovmXnCFyFs4YgJtrAMq7VygTWyd3yJNARR
         5iX58fwk1EW3mgoZKdHy7YYQ00kyD2yjib0efpTf/Mt0ic4Km2CsZJecblkE+TZd7v3+
         g626vOwENH/NRNIQLmp5AQrL1P/jSqRxYSTS82fHvHgJTAaktT1FTS6ijboFIMaj6Fh8
         1cL1CzMn+XHXr3VTndqjKUu5lS6I09esh7f28FGe5HTuCE56m0orCwbp4t/quRW81W7U
         2OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780944266; x=1781549066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kzWlN/HIpnAONZ7obvDJpbmfDuKvpPMm7rzEezOti8=;
        b=kw6L/uilaPZxNzwpBKZZl5Hb2XCd9DugNNW+tM1A1u0QsKsqk1VLaJ6QKIwF2HxElz
         vvy2hnxlVWsXamC77brJ4K7A3wWsVEL/9sfwOz5tw8h8RJWAa4lOvi4YflzqBdiEdPjX
         HPilYuliz0KPvODOQRTpk9H8YsPjG/WzD63LMEWOMf/K6bHP9K4LR4F+HeFD3mXpRfUF
         oeoQPedLm+evcBRfyWHGo3pljGC37PBKh8Jxt6/Eyv8LFTHYQO0xwtI2J8RX+0uJdNdW
         h3qwzqDGxqmAvYif8DQTw5tSX3VooauOaMPGKnUMDGSHDGLHEjSS89KEiQfQvUXGiRpp
         AvsQ==
X-Forwarded-Encrypted: i=1; AFNElJ89yXymKUkYC/rwqsV4LGtVb7Equ/Tb97lcxSSHESkZFn0+hruyanbwvoURY3a9CqQhSJzQ8sb5MVWpuyfoUqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzb9RtjglV6vLrF3eCh7xNZ0YRfF9/L0o8JFOhRrKTRzeZkP0Y
	7nFDgRWoZw8Rr8y/BxzTzx/p/Gl20gs19m1TadCJQ3hQOlJPwM9OvT3WILKhy3r9hkyEZGPoDfn
	lA4VppbVhOiUXDnhJcg==
X-Received: from edyf26.prod.google.com ([2002:a05:6402:69a:b0:691:b0e3:5c51])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4595:b0:691:acfc:54bf with SMTP id 4fb4d7f45d1cf-691acfc5784mr3195303a12.21.1780944265680;
 Mon, 08 Jun 2026 11:44:25 -0700 (PDT)
Date: Mon, 08 Jun 2026 18:44:24 +0000
In-Reply-To: <2vxzjys9t84m.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511201155.1488670-1-vipinsh@google.com> <20260511201155.1488670-3-vipinsh@google.com>
 <9huzy0hh3qhe.fsf@tarunix.c.googlers.com> <20260518170124.GA3352871.vipinsh@google.com>
 <2vxzjys9t84m.fsf@kernel.org>
Message-ID: <9huzse6wzxbr.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>, Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
	shuah@kernel.org, dmatlack@google.com, skhawaja@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Pratyush Yadav <pratyush@kernel.org> writes:

>>> > +	return 0;
>>> > +}
>>> > +
>>> > +int luo_session_retrieve_fd(int session_fd, __u64 token)
>>> nit: Can add a comment that, once it is failed, retrieved status is saved,
>>> So it is permanent failure.
>>
>> I think appropriate place will be the official documentation which is
>> here include/uapi/linux/liveupdate.h
>>
>> I don't see it is mentioned in the documentation (yes, code does what
>> you have said), I will refrain from adding that comment here.
>
> Would be a good addition to the LUO docs I think. Patches welcome :-)

Added here:
https://lore.kernel.org/all/074445fc4964961f12171ea129f2a7690322a78a.1780944056.git.tarunsahu@google.com/

>
> [...]
>
> -- 
> Regards,
> Pratyush Yadav
