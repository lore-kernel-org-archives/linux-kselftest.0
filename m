Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6D30D411
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670389; cv=none; b=r/0yQ9W80ecKbttfqVPr6Jn0qyR3+ZBcaGC6EUmz4yH7EhS0kkx697UBR2zROvLipaeaHVfEuWDLL+qEGezx2cYvRUFPEdggP8eu8R57GyyJZwKZjPu59PKKpnyH0mR+95YnSM/Cr5fbw0FHlW9khVsg2PkPzUoh7Jd1bLAF36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670389; c=relaxed/simple;
	bh=CM1vQsdGnWWlTXI4I4TAccxaKDUx7kLliDXk79XSviE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SC2sonQ/ZbhNylL8TK/MtMmPzNDjxGtnRYhat8X7eL8KuEe2qeXPD0mGuLF3AyzM87f5bRfCG5BC0NtClSOwm47e8J2KvzcHp332hb3sAMf2w7KghRcA94M8/j9IEsZ8l0w6oCEkSFliV5sgp8Tq6ghQwtnzx4Y1yVDtbN0hu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XLbtp4Sj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XLbtp4Sj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b7866869so23916105e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780670386; x=1781275186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUIZL9i8oUophSbYRoza7KammzJbwhT6WTOvTfjAekM=;
        b=XLbtp4SjwpRkLWFeqglkaSLvhQetXrRPAw1K8NRs86cRsRIhHAoiqBIWX+kYi0H98p
         4gwM2DC2WZgNvA8sM953AHtEBHYiLM3/f/u/UEv7dhIzUWSYKTJy4RU6w8OYEdwlBny1
         39m19wWK1UpABn9goDx3jNvwk4D6PlQNkfNNvDADDL4yqtkEqffLCXcx4x7VpQmyAeU1
         6YbjOUd398vn/D/MqCIvujRfmV36vklqsCFNrJXb4i60Vi2P5bgn8nnAbtv6YTCzr+RO
         OuhCxn9MiSDu7hhT/Bcz1gaditECD/wvUtsPFx69pQktmSWbkCOSeiWTlZRN1ebaUmz/
         /NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670386; x=1781275186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUIZL9i8oUophSbYRoza7KammzJbwhT6WTOvTfjAekM=;
        b=BNx7IgYKL91AEJ+Im9cDey9kNkrL+q2ZcYB9C3ndJBLsZ2TSZEfdaSGQ6W5NIxYe5x
         24k7NTayDP4fBlEhpf7L9vymh6thk5ziy2bntyPrr61dj2w8cGkVorCTovuQGfnJuYef
         82PvKoUXcyAK/TGtE8BvMToJYwfJVos8yPvhEQRj71SXj1mOOrLaPZSIMcOzLBlKFVXr
         78sFytLVa6ncZNt2rL6se9sUYL0pVndKNda0WcrGoxXiRyOVq0OzaSwOwwoWHD3Bh8ld
         wc0xf3dRfzStz3YHaqZYeF+XN63Htlnvbzfdzlhb831CjWioRa8F7hYDMA/6leNFyoDw
         Bcsg==
X-Forwarded-Encrypted: i=1; AFNElJ+BYHRqQ1LOQ3kSOxLvXRNzNl3Qyyfvwy/hXLMTsMWxNqRBPULOSbF5fbDMdVPgEKB23/HtDifH6ILHk6tYfmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiGqU9iecdvNFz/E3PiwL5YYNLxF5AmpcVIdYJvx4nsUmr5tr
	0GGkjtsazB6U4ad9MrCqLGg/iNjJciHT++RtIxy5ud4UhFrauj1ChAgljs0YollNDsQ=
X-Gm-Gg: Acq92OGxmRgqYPARn1IotchDtFSJzx9UfBQGOGQ7ajP9Evs1qBBvnK8zAiJAudN9o8s
	F2xRdjvrGwEwFWhYXeURCcmgRD+V2bKNt/9AT5Kz/QRM5zZb6hEvBW1GNDu78w+X7EFE169FMIu
	yMUJtHfQrJ67AvTiFcOBayJN4JpPMIaq6JSocBEwBA3uHDHXUKSKnCzO74M/ipT8VbIeVxPiV2M
	4u2MFdy151tnXjuGpgwcL9Xl3h00I2kfpn5EcXSEybsMVlISr2SMqFsLZq4Rz/srhdHNwNNxLO3
	RAH/mTriYVBw9CAIyPd96AbgqWV9Aad5M1NHYGYthlsR9cFefJ8eAXvRfYhoLSSGmUnTQRiYW+h
	CEGlOyCKrokfSsdVWA+C8DjIPhMqCUKLLLrHAcQ6RCmXQMXhK4X/rPINhcT2eU2/6OBr8yq1WxG
	g1PejhkUxWfCzcCe5rXxVNmfDPhmCrT6kNxZVUYu5C+WEijGM=
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr46976175e9.12.1780670386590;
        Fri, 05 Jun 2026 07:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm168167005e9.5.2026.06.05.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:39:46 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:39:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: sashiko-reviews@lists.linux.dev, Miroslav Benes <mbenes@suse.cz>,
	Shuah Khan <shuah@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] selftests: livepatch: Adapt mod_target module to
 pass on 4.12 kernels
Message-ID: <aiLfsDBUTgAu4x3s@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-3-7465de7f741d@suse.com>
 <20260525002416.3B3A41F000E9@smtp.kernel.org>
 <0f269520407c8cfc554059ffcba45ef3220ecfea.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f269520407c8cfc554059ffcba45ef3220ecfea.camel@suse.com>

On Fri 2026-06-05 11:05:32, Marcos Paulo de Souza wrote:
> On Mon, 2026-05-25 at 00:24 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> > - [Medium] The `test_klp_mod_target_ops` structure omits the
> > logically required `.set` callback, exposing the kernel to a NULL
> > pointer dereference during module load.
> > --
> > 
> > commit 532c1b8c7438f534fd4e3440716ede6cf83efe1c
> > Author: Marcos Paulo de Souza <mpdesouza@suse.com>
> > 
> > selftests: livepatch: Adapt mod_target module to pass on 4.12 kernels
> > 
> > Use the stable module_param_cb API instead of proc_fs for exposing
> > module
> > state. This approach is compatible with kernel 4.12 and later.
> > 
> > > diff --git
> > > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > index 9643984d24022..1382a266825fb 100644
> > > ---
> > > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > +++
> > > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > @@ -5,31 +5,29 @@
> > [ ... ]
> > > +static const struct kernel_param_ops test_klp_mod_target_ops = {
> > > +	.get = test_klp_mod_target_get,
> > > +};
> > > +
> > > +module_param_cb(klp_mod_arg, &test_klp_mod_target_ops, NULL,
> > > 0444);
> > 
> > [Severity: Medium]
> > Does this code need a .set callback in the kernel_param_ops
> > structure?
> > 
> > When a module parameter is passed during module load, the kernel
> > parses the
> > arguments using parse_args(), which invokes parse_one() in
> > kernel/params.c.
> > Because parse_one() unconditionally executes the .set callback
> > without
> > verifying if it is actually defined, omitting it here leaves the
> > callback
> > implicitly initialized to NULL.
> > 
> > Could this lead to a NULL pointer dereference and a kernel panic if
> > someone
> > attempts to set this parameter during module load?
> 
> Indeed! I'll send a v2 addressing the missing argument. Thanks Sachiko
> for spotting it :)

It should be perfectly fine to use NULL for the .set() callback.
It can't be called because of the given permissions 0444.

We should teach Sashiko about this ;-)

Best Regards,
Petr
