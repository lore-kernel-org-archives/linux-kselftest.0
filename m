Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C123E330
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 07:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851369; cv=none; b=LRFgIR5OcFf8RnXXhH8JDKK/UHAyc2S7s4ifaDzlfm0gPMsItwFFY8mGLrvh72MEj/c8nnBj4EWbXDSX6QeFvOnd9+pOEp+/Z+2gUvnNFbw/8bR4hDDIYnD/AHBbagK3EZptpcRfZ1FZNJlzCf8UvoEZU5eJNgi8GVV7Is7ffYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851369; c=relaxed/simple;
	bh=u+ey/CJS2ARmIQu5wX+w7GU/MrgYt6L2EL87LvMkuBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqJ3hHQm8inRqGuW1KieZdQHDx+SGa6cvja+8o9awBjTRb9L0Q7C20Sh7g7aQT4IbmhPLj04WiM0NTL3bpbGBCWPioxoa9uTgCmXr+wemdUvZHHuKV5Zmycjp/Po0HxT7CxPJv+M4pwW9htk+FQ7GE/ER024hZlWmhc3mPsWqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZYjWVFwi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZYjWVFwi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356257so340703f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788851363; x=1789456163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KaN8ORG6D91TdeVvPbVzs5MI5F+Br3tg7mv89xYjlPA=;
        b=ZYjWVFwi2Cc6OukpxbZKVvjmFZIpkWLZq8M84L4yQphYUd/wNr/quUFeO4G9nSVOjk
         xx5X0AL9RPi02lwvFk00TZvav9Ta+Wv+I1Mul2zLxbUc8nXc+o7GjmMrhFFI0vFSCgbr
         TFsFhkZYnxfgMMppaPt9FPVCOqDSpGXQT7pokxrE87gyPmiPSlS38/Tc3nOh7jpT/jKs
         sBPdgzEkN2p7ic8wwYZxnwy+8MA6ITLR47a8yZtroJfYTzTAx1fAQ2IDA9LUneimxMat
         /Ggfc71n1ILLQUhKOBFQG5KwMxFVvk91IOua8FOvJufVY57FcJy0K9NdMQ2dm+9TLsjk
         naug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851363; x=1789456163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaN8ORG6D91TdeVvPbVzs5MI5F+Br3tg7mv89xYjlPA=;
        b=q/CJzzamTYRn7rjVLeXqDoco8X2Ba6BMTcHRuvuJ1fhq3ma1DIKU7zW9fcWKgRWST+
         XTc9dRQMPwvSMbE6GyxY5hKmsBjXE5VPOnq5c91fprhWSin6JbFOcjnS84/NYnP3HRy9
         e9V2nECOyopPrS7A/ppC3/oZlQ85ocOVzfNaNKHtqF8vDhz0G3Q6RcBl6gc151m8XZeY
         FGt9fSThoAiOq9vu4zqCClQxQ+ay+5kWVvS3don9fOvert0zjCkJ/YY443K4/pnSvCtU
         5QRlpEf3eib5R0D/JMZcPzNWT4CCdf7F7KhG6zZ530uNIryBjf0VQ2nzOwiKYBARVsEC
         p3VA==
X-Forwarded-Encrypted: i=1; AKwUvByimYzoi2dcC/KtnrqzcDM4WwH+xAf0CVbe/U2Q5yEaugMIaC/gM1Kmjkn53Vo2k+2K2VoJ0/Xzs9zFV+PsV1k=@vger.kernel.org
X-Gm-Message-State: AFuF++n75zZZJDzgmKH/eQWu2jLeh1F6JLzvrl6JS6Y6edD69EMqpCdj
	yXRy+gf2tGvG9xVw47Sdlssq4rWwfZDG8kQGzmbTKGtcSe4BtTtQLmjxWDZUBp+NZ06punH8XCt
	leEyuU1E=
X-Gm-Gg: AYBFou1JUCMXP/62cZMQJR8Hu3ZMMXlphUJoCzQaKOc/PbAc7sZo1yMU2760QbPpqBf
	mGBf0RYiCqsVQ6ba7jgJ+DItd+UpFqN4/xKDO2YxD/A2GbpUukFR42fm572/Qk3c/o4uIp5DgT9
	zaavAv7KQWfBQa7Rz9UyzYMyf+SaTokipjYK667uaTJgqN5M5WxdqNcb/+krGNpEXjM7IIPchiy
	nk3CCA/X1MLMS+OjYlbT7wfcPWRs0K65AK51oTv71fECBt2Bnd/kN6ZTMWKSlRoXtohGrP33XCF
	lHGNJWza2weVh5VuLGr2WokZAN+LgRjIWQZLxWei3s3F52oZ9tVzPvQ0s/C7FprR4bpAYChH6uU
	zofEqCyD6rOHmuHH03zZS/iY9L7pUk/8a7cuWr3sW7MYUij5l//IvdiZfaIwJjME3l7urCCgZrH
	K9kfke+OWgzNFkgCpI1TVxvFIzdxwnfb82me5L6hXtGA7fVwlOx+w=
X-Received: by 2002:a05:600c:1908:b0:49c:f13e:e4f with SMTP id 5b1f17b1804b1-49d1757b03dmr45007475e9.12.1788851363346;
        Tue, 08 Sep 2026 00:09:23 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm279962065e9.13.2026.09.08.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:09:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:09:21 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org, song@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/livepatch: Test rejection of aliased symbols
 in one object
Message-ID: <ap-0odfpLVv8k2er@pathway>
References: <20260830173343.52759-1-x90613@gmail.com>
 <20260905155507.273262-1-x90613@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905155507.273262-1-x90613@gmail.com>

On Sat 2026-09-05 23:55:07, Harry Hsu wrote:
> klp_init_object_loaded() now rejects an object whose klp_funcs resolve to
> the same address, because aliased symbols would push two klp_funcs of one
> livepatch onto a single ops->func_stack and leave the redirection
> ambiguous.
> 
> Add a target module providing test_klp_alias_show() together with its
> __alias() sibling, and a livepatch naming both of them.  Two test cases
> cover both callers of klp_init_object_loaded(): the klp_enable_patch()
> path, where the target module is loaded before the livepatch, and the
> klp_module_coming() path, where the livepatch is loaded first and the
> module loader has to refuse the target module.
> 
> Suggested-by: Song Liu <song@kernel.org>
> Signed-off-by: Harry Hsu <x90613@gmail.com>

Looks good to me and seems to work:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

> This is the selftest I promised in the v2 thread [1].
> 
> It applies on top of patch 1/3 of the series [2] and does not touch the
> rest of it.  Petr, since you are going to post v4 of the whole patchset
> anyway, please feel free to fold this in as the last patch.  Otherwise I
> am happy to resend it as a separate follow-up once the series lands --
> whichever is less work for you.

Yup, I am working on v4 and included this patch.

Best Regards,
Petr
