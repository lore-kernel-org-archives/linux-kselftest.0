Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F172BE05E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603893; cv=none; b=CxVBzjD2ncEQkQLp6VD7aj5I3K0/iLivDCFAQ+saYfRzAqSlrX3icafX7TkHCJlk2nnKf5rYjH99vR2wRoOQrxNy0cj51YFA1jfK0yYmE5NBFHU51lBo7HKHC9+T1Zgu4kZCZWfkHmqr0RCSTOnYpy7dB4ClmtkIiM4htCbmZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603893; c=relaxed/simple;
	bh=Ut8bhtlffnJ9/ELCph4aBFL8HoBapcjMEL1zurQQoj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjFzIoAIFk4D51Bn47ibRw/GDFiTatMobKuWvdEGLum/QmN6KO7C3IbHjWBV11rbM0XjQtKrEcE0PqFK83b5bkCb6uDf/w8obnI1XxIK+hZjH15I4jSP2RrDj0dnsBHbm6OfIjM/6iWHDGq2+aVGmHSMkKaC2MVdQxhLUbJE4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cf+37kHs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpKdJo+M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cf+37kHs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpKdJo+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzK7Wx/CjJVGVlD6RLMcxNO3zdlDorGZi/W+knFvfoc=;
	b=cf+37kHs5V9+vnDzStdFexmQEiOjJBeSXuCMm96I+qpoPLaJ7PZ12hIpYUZsThNi+8KvGo
	1LUUxIOkNcf6m202cD2sF1o7jc5LLFCPdod0pbeHa5Qo8UKhHxfE8Uf1ltlYDlQyL5GogN
	hrPp/Bh7dbegduYfMaoGJTdZU1qEZoQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-lfDXHZKbNh-nd3kCkK8R_Q-1; Thu, 09 Jul 2026 09:31:27 -0400
X-MC-Unique: lfDXHZKbNh-nd3kCkK8R_Q-1
X-Mimecast-MFC-AGG-ID: lfDXHZKbNh-nd3kCkK8R_Q_1783603887
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969275401c6so1491148241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783603887; x=1784208687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kzK7Wx/CjJVGVlD6RLMcxNO3zdlDorGZi/W+knFvfoc=;
        b=TpKdJo+Mww8TckRkloqDYI0lVVO6rZGh5+gjJbBvLYnZpTc7D+5r6mUeTsNouOMJ3j
         rVOiM3k3cpvMMIMo3VzTjQX1mRJ36YGHDBmsPypI7pesrafqhdlVJ6/ukwgL6APk5hKY
         frQqXkfuj9ate41NrMElUAv3kuAoDDnK0IEfTzS/5m0EpZYn8JIacsCG72ADYaDePgPw
         2sndtj0E6XpiGU0nFxFrP4GqKL9lg9JV8RcRRZw0r2bhmpN4VnkIPsJfxxJN5P9d40Qj
         gsmaopQ3uXLgiv20eu8vwSbdTCyybDw0FK8sZ2d88RnSQ6Mf1IaZiHgp00unTadh+BHx
         dr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603887; x=1784208687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzK7Wx/CjJVGVlD6RLMcxNO3zdlDorGZi/W+knFvfoc=;
        b=eGgkcftX07KIxgwoT+WOLyBhNiRr/9Xi4KojB1Zo/zydOOlq22Gc2XkR3GuJ1F8q5V
         yHBuQ8S7Ym+D5cYM1r9tlsNR/4bpPvX0r/PhXzS1ybojtwi5T6NXI9WOW/vnCbH0atDP
         JrxXiYEoBHRmiPDIj6rt7OAzidAd6UrI9bYGdaxqAkLYf9Od1MJFLKSoS6+w0X5xdLWJ
         GJ9t1DIOv85OKuMP0Bo66fyNW+nMagmFDq/z/RXg+RgKjLZSgceyJUjwu+Nfj1b1tDpn
         cuknLUaGQWQkyK4PhR+Gcj2T+fiOXy8mOU7c1p0gAkIF6RJ+Ze/OrPQXkvEw8P6pvObM
         VC/g==
X-Forwarded-Encrypted: i=1; AHgh+RqXtwOY8O/hG68Gt8l+TOWEC+DCidZKmqv7DlvN+bBJ7w0WPNq9e1hlnnP3Nls3l1tPkkxTlwDuFvtvR6JilQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2FpzfUr0YEnMBsN5WtDRJ/LvUBaNy2XN1dLbOy166VIs66GB
	gEWWEU3bJKGGeKKMfamTJrqiXjVrx1Lg+NdNqWwSWpSdAwzK+3iP+c4CBMP9EWJRVAvHUePmvDX
	GsvqxY7eFbqn62VuM0UWGOBR8KicG1bmb7GTZF5W+9/uHleHAwP4Fb6LUncTyG7zULqXv9g==
X-Gm-Gg: AfdE7clnnvnyvl657CsP7nMqGnuMpp33U/vgNdORcXKweANcieukKNxN/EoMAPECEyO
	x1lm6kizGUnDC1HdkA4WmZFMXYET+R2mu4vHfQZP3cICV57JhAEKjipwPxEaS2xVcPYhXCtPEPk
	haWqA8jg0XtDtPcN9f3DMIbGB60eoWiojIEkNxy+MMzXOKt1UUrE9q1ExcHYxTx/VqZbsUFFXXs
	lCMJrWBkqmynJRJcFJk98za23L0nEBk791x2XUlmeMFMjvwbze7P+CyyJy5ygsqrRfMKxFrWMaK
	SPgqihJhw34sPwOTLgRD2H4VP9H51COhQXyHg2ogzsTSTuZX7OHVlSPSZk3n6d6blbwpgX9uO9l
	lN0fJWhkUJrm8JM3YtbLIeSOsG6jUoDFdEgB4U3CQWUTUSignN5gLrv8=
X-Received: by 2002:a05:6102:688b:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744e0333f94mr4210927137.21.1783603886797;
        Thu, 09 Jul 2026 06:31:26 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744e0333f94mr4210626137.21.1783603884528;
        Thu, 09 Jul 2026 06:31:24 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm3409363137.3.2026.07.09.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:31:23 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:31:22 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 2/4] selftests: cgroup: Add dmem selftest coverage
Message-ID: <ak-eNHFodrNxMP0w@x1nano>
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-2-6c42c8753468@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-kunit_cgroups-v5-2-6c42c8753468@redhat.com>

On Mon, Jul 06, 2026 at 02:06:41PM +0200, Albert Esteve wrote:
> Currently, tools/testing/selftests/cgroup/ does not include
> a dmem-specific test binary. This leaves dmem charge and
> limit behavior largely unvalidated in kselftest coverage.
> 
> Add test_dmem and wire it into the cgroup selftests Makefile.
> The new test exercises dmem controller behavior through the
> dmem_selftest debugfs interface for the dmem_selftest region.
> 
> The test adds three complementary checks:
> - test_dmem_max creates a nested hierarchy with per-leaf
>   dmem.max values and verifies that over-limit charges
>   fail while in-limit charges succeed in dmem.current.
> - test_dmem_min and test_dmem_low verify that charging
>   from a cgroup with the corresponding protection knob
>   set updates dmem.current as expected.
> - test_dmem_charge_byte_granularity validates accounting
>   bounds for non-page-aligned charge sizes and
>   uncharge-to-zero behavior.
> 
> This provides deterministic userspace coverage for dmem
> accounting and hard-limit enforcement using a test helper
> module, without requiring subsystem-specific production
> drivers.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

