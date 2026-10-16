Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83CC3BB9FC
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 04:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125910; cv=none; b=XzQcyvqQpFXo1MCYJVFKp23oq+JcPt3PmzDE8aIDyZ7vl0NPiWJOw6TRr+xUs3q3dqaOXUfssnRHO6m2FQp06fA3lJWITThE77QbbRHKUeiIqrZ1ypjjiGmNq/+xrrtsmBIVBqLmC9pUa3J//MrI8ID+5O0Uy0q3VnRJtWETX5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125910; c=relaxed/simple;
	bh=82osGwBog73FoyC+XMnxKjbDDJ/fVfR1ZbT8MNVz7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+MJhjj10uq+y9pY+VzEqIaAJadx9TkHFuRtA4kM/Mzco6zHZn6+WGr7qVzYhbvfM8f95AsQWzmuRIKYbczFdnYerE1Y4/PZ9g4reAdvQu+IIU1kW1zvXK5YdMtnDPayD1sYMflR8iN90NrLpogmUlVuZqAWOri62zwVMRuqLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0TnffXD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0TnffXD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so56300995e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125907; x=1792730707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fy2ljKKgDvlM50wAu3F276eIsSv4r7+LxgXEEBPg3w0=;
        b=F0TnffXDMyycjORpIvJe7sAQzSWHHssn/c9JJIkHuzNmfXNUuSY4J/jxj1N7mcZPSy
         bhbfbd2eMCApXcBlZQlp7v8NAsbg3j4aPDeSm15o1jvwTu84Xv1rNwiTalO0iTrSm5cS
         JZ0EzOt78RpyyBVUcoITEcqduh8LWGw6hsQF743aGS+HzR6/a82L5/HbLdHqP0RFy8Ut
         M6lBC24jQwiu1Ahhgwe7Q55O/FpkVXD3XD40P8Ay2OUI6zfJa2cj2RbAQE8+/K5t3HWv
         t/hKVbDJXs55JaQAY47W0rrvCg/Cgvl1ooY7RF4ak/W5q31Tk9DsW17JMSNx9hlOUEPN
         Sr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125907; x=1792730707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy2ljKKgDvlM50wAu3F276eIsSv4r7+LxgXEEBPg3w0=;
        b=yORsh2pp5bswkVc9om31p0feH2jrKviSogg6aF3HscbAHl/FgHWz5hF5pramlSqN9r
         M3Kvpwd7B84W4bPpXJndIdDCBARplagShVvlaLfp6qF/Dh6t4cNB7ubeZb57X63hmCSq
         a5ddc/ZcKSnpXcYue1MEXkbbKUjMRXnKCoxFE2s2q6L6PIF3mcdBirgTMDil1kC5Q+cI
         uYb3jjJs69+A7967662nWL/fMa8If/lhsHqPdHuug5RfvEXU6/t3GloeA5zYNK3SJ2Eh
         BWKc9VEPuptSq0iY8VeNbZEi1LqT0d/YC3mmLohY34o23mQTot3V5SXL3+hTZO0ElVb0
         Avuw==
X-Forwarded-Encrypted: i=1; AKwUvBz50G37dk7274HPDhL9SSjWNaHpHQmpf2Edhauq5iSlcuLHSeCzT9iWRdv4+BO0qnU756Y/XOFx4yJirkYDlwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMnbjoFoUyRnzN5dpTMgH4p2qsWaNThGMEF2LtnOaGp/v2xiZ7
	a9zglHSeWuYk0UNlPNY1nO3vGkKm6CyrcB5UyPhNZwTYuFiGRqJobbNv
X-Gm-Gg: AYBFou2ck0ODdIrqYqnRKLzrOR+WdZo79794uPeKT1C8lMqIdF5NXr+jqRFnnpZj3ao
	WT9Pj7U3hgfIt+LB+8FiS5Uxpqcr/bAaixy3igZ6gps6WoPr4eFptKk4axiAEF+LPDRkvp1qr9V
	Mtaa6nNT3KEuXY8eBs6GlX3i9pXN7uvUjCYlo64pxtuPfWrZT55hDXzn34f1XD+v2FKqyacvkpz
	Pon5RjqswGLqxYqHYhD9ljvO6RbbCCdZWD87Inxw6fzJfSPXl0N3hzFYkVN+U8Xq5uBUi7LmdkQ
	xafRFT5OsC7+OzZS5HxuzGqsNXiEjNSTVjnLhGP7vvFzAF5jDRfeAwjc5OfLcHZruD8B6+iizO4
	+Da4fBsyM+JUOypw+FOkyZdyma8tERDRig6eZC7IZimKbmlBMYLCvnysE6XFdyWspT75c3WGl4W
	8x+pBTNQoXb7m/bsBxwf7sGTs3JvpbvygxvvGSpFRPQEH2FXNfLKBCcx1mBBXkZswskGQOzpVc1
	7REYdyEA6XJufztsoNqN60/pboJMWulb8crw+q1qrbAHJUiq3Ttaqwf/bhRzb24NbP6K6ZcY5hP
	oaBDojgPUdlvXBF8gAze5RzuhtoqXzIvKjY8IkD+RLNaKbjr1FWGlo6U4EmSqz5XCQK1jc69kGU
	=
X-Received: by 2002:a05:600c:138a:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a18e4c85fdmr444490105e9.34.1792125906884;
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm107355835e9.0.2026.10.15.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 06:45:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] kunit: Initialize filter error before disabled
 cleanup
Message-ID: <atGqVhQyKowLGOz5@gmail.com>
References: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
 <20260914025933.9832-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914025933.9832-1-kmehltretter@gmail.com>

On Mon, Sep 14, 2026 at 04:59:33AM +0100, Karl Mehltretter wrote:
> kunit_run_all_tests() jumps to free_out when KUnit execution is disabled.
> If a boot filter is configured, free_out tests err even though
> kunit_filter_suites() was never called to initialize it.
> 
> Clang's -Wconditional-uninitialized diagnoses this path. KMSAN confirms
> the runtime use.
> 
> With CONFIG_KUNIT_DEFAULT_ENABLED=n,
> CONFIG_KUNIT_DEFAULT_FILTER_GLOB="*", CONFIG_INIT_STACK_NONE=y and
> CONFIG_KMSAN=y, KMSAN reports an uninitialized-value use in
> kunit_run_all_tests() and identifies local variable err as its origin.
> 
> Restore the zero initializer. It remains necessary as cleanup state after
> kunit_run_all_tests() was changed to return void.
> 
> Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this fix. It has Thomas's Reviewed-by tag.

I don't see this fix in the KUnit tree or folded into the original
change.

Thanks,
Karl
