Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689A3F99F3
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003063; cv=none; b=P2DDB4Rn+MKrEPO1CwPFt7GtgIWoqzZFeemR9gjKK8PuDnQ0mVFUZICxLcHTXfqKBKLx0NXhn4ILlY8gzIR9TLr2tzbNcmvt9BIXe88lr+9jip+9GDkurATe0527FPCFvCw6M20JNGty9KZueIE4BEUJ4IuFMZgvEFeip7QDyEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003063; c=relaxed/simple;
	bh=m7GUmmN6TsaD2WekpATDGc8I7GOU+6aD4TPHY8OsMko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2YSmUYgDt1zTad2H30gkjmcEVNOdAvmBOvntSGA2e576Uth6JkvV4NOKuJSbbio5HMu3SMsSgcG5x9mmPR5170nB7ZO6A5SA+nUgbejwdmbyHDR5EHJWnu2DJCmHj7qLwiaO1/0sdcLaP8+S3hQUwX5AsPhfsHpuwXRUMX7M1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N11oh+hB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N11oh+hB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so59517145e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781003060; x=1781607860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qMZ+ugQTvKt1SoEeguI61AFpJPgRZUBObKRt06EYOjg=;
        b=N11oh+hBS5EsiVPwSqkrRDOFeko6YqsbNH5XFlOxPFLNHbgGVZ/lSdVzEp52EOftQR
         pMyFQznlPMRdYMo7o+VA18mlonJOwjlqjV7t+1QrHTIRfn6lIitnamEBZiHOJaV2uNts
         CJuXIfmXPwV7rZmFM69yztpk9dhMca6AlIEZs/sjOjLiO+Re9X9+fiMrLfYoAwpGMgW4
         WYuRxjMM0hcs37v8cPOo3ZLh1s9yBvMSRRDnnv7PyXR6NJCKhiDWNumEm9ZLGpy512G6
         kzBqEFkwnhUK9xy/BOx17kcP9QU17JDRDoHzj1Xgx2Kr1kfs50ACGUvP27lxB4tktBs5
         4rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003060; x=1781607860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMZ+ugQTvKt1SoEeguI61AFpJPgRZUBObKRt06EYOjg=;
        b=maFZQ0C8ZOLO4qdwJIJfV2CpcJqQCkX7sL/Q2OwRZMztsACzOBGA9pxrTW6VRflaFX
         EPWkS9apLvjvkfYB2bPZ1+mSesY9udg9wzFQLq5Vk7raxNH/MeURmHHAufYuNHT8ow2b
         H2O6lfrAB9gsQSVDI0gHsyIp4ET/HOYHb1hyfHL5Y5tH+OCl7GRXPyauRyy6pdqzv9Q0
         gPNQuqTLODgDuvKzjkayF6UUd95ZCncqgfYtfqaLa0LMdJFIc6ds+IcKPUWyu5kVH52i
         b1BDHYawESgNeio9ojcI2BBuhXQ/F9Jtv/kphra6iyJaIZdrn+hfgjFkxAy5Y8QGavsq
         c50A==
X-Forwarded-Encrypted: i=1; AFNElJ+/g6IvBSZQQdIfaK3LrLRj1WxdHsb6ukkB3v5CddTrvj+yU9uuJfr1T0LQNJnpLy9vTfx+fHwoaeDuGX38oYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HLjPdSze5IuqSPZk3VrNdaDuk1DxnwnkBX468zZlDgPg4RBF
	sCTJnupRMtx8fzI3obDByExk3OVRNhEOBj9Q8/aaoqobZ2otKAKXyAjBUymscETHym4=
X-Gm-Gg: Acq92OHmtryanipzGgohYGmNDiG4AdJzythArKVTwrV7DnZL6CUfsv3mc1gaLEBSYBR
	AOPbePVdA7rKae5CWapt/hOl7bVGn7EeQwh9g5WzSGKFTp93q3l884NU2T2+eGZoBhts/FfCIGn
	BuYNfQxkiMtHj+8VJiNAyI/3V2SfV0GOMhjb+wuA984gDIE3zggzBSqrXCTYJJSeS1fgPgC3zcq
	4GPaPx5BQo46B8mT5FBcPr4SGmTHEUNWjcA/yVh+sg6K0K6RDLaTK0tlZV76ToES6lKlTNIl+Yh
	col28Hs3JBxOYUWcIdMA+qiGf2f6rAvP4jKcnAkGXZsvVoAb81misjjGDvT7QKKEVDLvY+DCTXQ
	mvQu8tbpsL7hLBoW2JjgMNC+YFwjbulxlYSZuodNgX/Pp+DWvo4zDgOAkvHjDpAfdbbg+XwEOVw
	oY4ak9iw/853LDKiWLxy8gRijoMBAHbBOYJM58
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr343342815e9.21.1781003060505;
        Tue, 09 Jun 2026 04:04:20 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm451185945e9.10.2026.06.09.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:04:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:04:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: mbenes@suse.cz, jpoimboe@kernel.org, jikos@kernel.org,
	joe.lawrence@redhat.com, shuah@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/livepatch: fix resource leak in
 test_klp_syscall init error path
Message-ID: <aifzMRdL0zPttD0w@pathway.suse.cz>
References: <20260602124509.365996-1-qirui.001@bytedance.com>
 <20260604083208.1071428-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083208.1071428-1-qirui.001@bytedance.com>

On Thu 2026-06-04 16:32:08, Rui Qi wrote:
> In livepatch_init(), if klp_enable_patch() fails, the previously
> created kobject and sysfs file are never cleaned up, causing a
> resource leak. Capture the return value and add proper cleanup
> on the error path.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

JFYI, the patch has been committed into livepatching.git,
branch for-7.2-selftests.

Best Regards,
Petr
