Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280B36E476
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941219; cv=none; b=unoqsAuWAzzm1gQzHdxmrsmdKarIbk4Av+7VhF7vmoOzFk0nytQkGXtRMr+XHQ322jdVqLZcOQR5hKB/2t/V0dpxBDP7FRJa5deqU7RG63Pc+OtJgC/DKl5MIK0g2GOUZVdRLou0iKofpQE/h3HFmKM5/Nvzm/ej6wMlwvFlbKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941219; c=relaxed/simple;
	bh=Yv/2exuFbjycT8McSC6kXVK/q9ZltovbR1xv0MC8Lcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLXz7TpooYehpKPrMYtsnUdLdYah+MZI513Ba06F5Zq2QtVpOsPi+UkkYIE5Lrcd0lmvV7fCGIPBrGSI6bBGNAhCQT9/3eMoqC2cq38LKh2c3yNZ9kL6euJLQZAqxjvhCsk/2ZDtWNym9zgQC1nh1JOxDBrmChClHHFu2k1IeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YUzq448/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HlCg1h5l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YUzq448/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HlCg1h5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774941217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHJZFHs0FUFKH1nrgiAFz2Owaw80mef2K1q51SyxNfY=;
	b=YUzq448/f0fGRevRn662kdIpVO2CQUd2N+Oh00l0EW1q66LRnJFCKUP2/m4K/HYKB8xyaj
	HooYnSMmrQvtfo9KJpjcPUabiGistvVXrWZj2yTGwkng7vWXgvrrmz/o6LWvLB2kc7GGIE
	IeG1FnILwVzR3aJW6j9zBwGbiZQHro4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-5CUaWUFbMYaXTi1qZZAdpA-1; Tue, 31 Mar 2026 03:13:31 -0400
X-MC-Unique: 5CUaWUFbMYaXTi1qZZAdpA-1
X-Mimecast-MFC-AGG-ID: 5CUaWUFbMYaXTi1qZZAdpA_1774941211
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6963636a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 00:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774941211; x=1775546011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHJZFHs0FUFKH1nrgiAFz2Owaw80mef2K1q51SyxNfY=;
        b=HlCg1h5lYbl7MvFTRsgqSPpTPmNeFbmIJ95hjd4NW7/lxXYu60mLcbrGVBBTHtrRBj
         Nm9xW2PFG9RAI8SjIB/TcU2Z5WEvsGg6oW99MohwJfjwRe4lDQi53RSzWM2gIjw1qnq4
         pqRrgQCHaXiOdyM67Mzmk/onteqTMy6uEpHf/ZC4JCxuOagnV5uBf64N9JIyc3LgFpty
         h9/QvODNfI8lC3olmPpVxjiZJe8BN4/+5KCE+j2M8hR/mdQEQ3s4zrpmNQBF2pai4El0
         DHK5D1737j5ofIRSIPcQ5ql8ElJDcpakiHeATpqAxIERfUpUb09XK4VhZwifw75e1qac
         Yopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941211; x=1775546011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHJZFHs0FUFKH1nrgiAFz2Owaw80mef2K1q51SyxNfY=;
        b=XewaQs9aod3Hf0T3gnVl9r4IkYdJgTZRQajL9HIyVwT6BeJQb619/A9H41zGcyhEuK
         XN1uJ69l9yRa2tZjBEnS0bpnfGBcRDqyg1ucEthpTQOrTplrZsF/q3QeRaFVwWvGvMDN
         +co0Pyr4lzCEQfVbWTZzDc68mzR2EYog2lRAKRJKfvFfgJBBQjsjVdt+pJPZN2wV3gbN
         AhFlGK7QJWy36rnVULkyzO9/TsGFPJ2tR3zvmCadToj+ARm3i2SdXwsp2advHzYIP1w6
         EWRMEQtVPfCYXT5QelwSoQPBGUcthne//R/1tD2cgafP7xpaBE8svU9+VZfGxXnGcI0s
         WHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdxLe49BXqdDoXSAh2FAycJbkwVUMVJ9o5Gnynkpd0XDi0sWYQ8SATVr1tdGC4OYz0vlkTKqDogvamd2RK6XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEM85XEywoHFXFwtH+wzhwlpHBUyLD6o84A/+jR0Llk7Hwecfh
	oPchHXI5hBcUwxBMj4YHCL/JHXstHuSJHDGtzSZkS6BvK7RlWZm2b9nsf9wItk1ltpYVSx+Dnhn
	yGM1trsYtS6AUkuZU2cmIvPhLVeWmikLik4JehHEPy+SPgqenst4cB5bjE4VCLWEbjJBZZQ==
X-Gm-Gg: ATEYQzwtWAwB1S+smXoXKElBfkNYrI7AjjF14qjO2JoS+L6h8SER/NWpOOT9plfbFl9
	66ItWcQPYeda5yQLmBEYvMWzTNCAsl/im2poaOhesNxqMPzefeL37cAJ//Hh8XgmPcZ3Uk05CyW
	XVZE1tCYl4tKXDo96hejwwisPyRg5ENpA6iRcRZcOmlh1qCijLKack9yGgzSqZfvbmHhfYi6I9I
	JA7bzCqnr8hHZUlUi6MfC+uWPJar5tADBYg4HEXZO3YruLwA3E+73ihu76R/AEYvnq3rRlis73F
	BCHHuuHqAwmo9ln8AkxSmWzaeIX5/8CASO6OonJcj8QcMDqUIedeKA18SM0dRDnv6uZ5Fg/t57f
	2qnvOFVnLt0mL7rokaw==
X-Received: by 2002:a17:902:e78e:b0:2b0:61f8:9f01 with SMTP id d9443c01a7336-2b0cdd21fd8mr172318305ad.44.1774941210813;
        Tue, 31 Mar 2026 00:13:30 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2b0:61f8:9f01 with SMTP id d9443c01a7336-2b0cdd21fd8mr172318145ad.44.1774941210399;
        Tue, 31 Mar 2026 00:13:30 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm105451085ad.59.2026.03.31.00.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:13:29 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:13:27 +0800
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] selftests/mm: fix cow/gup_longterm link failures
 when liburing flags are missing
Message-ID: <act0F2KTpXFFxmdf@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
 <20260331040156.119158-4-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331040156.119158-4-liwang@redhat.com>

> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -10,6 +10,11 @@ LOCAL_HDRS += $(selfdir)/mm/mseal_helpers.h
>  
>  include local_config.mk
>  
> +PKG_CONFIG ?= pkg-config
> +ifeq ($(IOURING_EXTRA_LIBS),)
> +IOURING_EXTRA_LIBS := $(shell $(PKG_CONFIG) --libs liburing 2>/dev/null)
> +endif
> +
>  ifeq ($(ARCH),)
>  
>  ifeq ($(CROSS_COMPILE),)
> @@ -55,10 +60,12 @@ else
>  PAGE_FRAG_WARNING = "missing Module.symvers, please have the kernel built first"
>  endif
>  
> -TEST_GEN_FILES = cow
> -TEST_GEN_FILES += compaction_test
> -TEST_GEN_FILES += gup_longterm
> +TEST_GEN_FILES = compaction_test
>  TEST_GEN_FILES += gup_test
> +ifneq ($(IOURING_EXTRA_LIBS),)
> +TEST_GEN_FILES += cow
> +TEST_GEN_FILES += gup_longterm
> +endif

Please ignore this one, as Sashiko points:

  "The io_uring specific test cases within them are already isolated via
  #ifdef LOCAL_CONFIG_HAVE_LIBURING and do not require liburing to compile the
  rest of the tests."

I overlooked that two tests can be built without liburing-devel pkg.
Sashiko is correct here, we don't need define IOURING_EXTRA_LIBS.

The compiling error comes from a temp file in check_config.sh, and I
am not sure whether we should hide the error:

/tmp/tmp.kIIOIqwe3n.c:2:10: fatal error: liburing.h: No such file or directory
    2 | #include <liburing.h>
      |          ^~~~~~~~~~~~


-- 
Regards,
Li Wang

