Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E93BB11A
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483316; cv=none; b=Gw2oTfU+9P2qK80QGigE0ifb/TjDGXi1j5OpsbUr3D5KNTSrVP8ueh/MN+hIxaWY8k+A9R9WrbPbebaaguyiNh7mFpsEHR1VdlnquByPX/Hp9/cTmRu3k4ZiJtFn32jK/lXW4cVyIihIAHc+yOtQ8c9HL64vzp1mOFThAVsIJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483316; c=relaxed/simple;
	bh=Fs1q1LuXAYTQ937j0F968WLbSfpvhN7jSqDN7Jd6uBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMcn4u1CuBJbo7bMvJ9latXKIS927JtQwE2OpJR7/llxG6MQcvq0wyIyCBjJJxtgzQGp7jN6HB5HvuqxiRPtMuuhe3/pMtHFe2eYQckp0vVtr4Zv9HDxMVzDKN/x7UIFftWDkz8gDHJb3THg/8uwmX/aQmZ+lJ9hdBPeKfUTrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oCnsIJii; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oCnsIJii"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso7123105ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483314; x=1787088114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgcKeBktnliFILPgH5Yp5qgxA2fPy6McTHeUrYz6elM=;
        b=oCnsIJiiAa+BgmeANSpLE+VLIkqqf6si5TmkXYqWUN7rwWASs+8tCFt8sDy9jf45GE
         dNZQHLhAJuuQ219/ZhzhV9yMo1LlFBPYZo90lR6Vj4S/c1yJ+ncXs7pC37Hibsaol2vM
         OZNpADAY7eNS5dxoHhjOMCAvS7K1rUa3m857YFfWUi19LDam5t19cwLQ8ggmCwBb7idD
         ZASg0IS3qgO7u+iiNRV4wdmUzVJHr9b+vT4jTUDYToVoL50OEPlT5rrc7NsGal0EK96g
         IhYKK4MXhwdw8ywAhnlhd5iEHD7LRmQwUFyXdxmmHfu4S5ktCLUSPmcXp98j9LYuTu/n
         7h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483314; x=1787088114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgcKeBktnliFILPgH5Yp5qgxA2fPy6McTHeUrYz6elM=;
        b=S90tvjxb8u2tfp14PkEB+S5y9b4JgY8/aQkvtqCQsrJkWS2mt52NLTwMD2AO2ZUqWH
         KBgPHcBDlSsYkEULLE/dOlphbLsb7WjEWilviV/YV8VcAACsG0y8GdkpcpEpl7HCFC/b
         BzQooIRDsobEYdkOhih4FEk8wi1W81gSnU06EMUxImawqzRx9O4vO4lrlBmOQbPXNtYw
         rS/twLyRCp/2SuLM8T9JKDGVOwxANZJjm5KpKW9b96ah5l+bNPaYb8YVIi1qxy60h3we
         ZBkgv4ESuu1v0FdQoLMXU8FXYv2q2n2XsPA7JKq/Rbh2lPzLgVzEkZjvwXWO9cOpqkj6
         y2jA==
X-Forwarded-Encrypted: i=1; AHgh+RpfpG2THaOvbhK8ElAuQzxg5/HTE2ZHiXvecurhanfXQrAfPXZR7gGlhMLAfVSedy0wVgNUt34ifsFsJ8txj34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVseec2LxwjZcrStMEAxYeOMCsJgm0+4Dxed0mwWAL+syr0NL1
	QGfem5MheDVokkj569F3BTU/z0XF+KK2kwjLBmKWJHsBUzkzx/R1Ic7O430hgV/VbMkITEOs0Wm
	Vs88wGw==
X-Gm-Gg: AR+sD13c07Ak7Y++SU0qUC1uDWaYAekxuPkwC6+HchG40iwiw3H1tl1FNS5yOgabTi9
	u2Q36lgJIQoD+CacFR584qHDfJN+UFVUzMxWabOcZkL6+AMzpMey0511kk1ZnzKYTNfgKttuZep
	yldqAX++lNFdTDq6EdTCES+q3CNfUX7FDxxUSbcyjbAvNFKhNucjrSl18nNm61iypaFkyTi8NBi
	5CcxXOr2zLracSH5OkUAKKqN3ZX4ebZoQthUyGxegRXX6jcjSMNshkkTKXbxDGkvIY3mws7MGlp
	VTsbspnXBDiZZv4DbqNip/WWUpTq13qGSfNjvhcWB8bChptCiBI2NX4ogpiTlNtHDbwXFEtZJ5S
	s8Q2+DVeLAO7JJFLjlGV6paiggKwLI1Ne5t8FuMXHz0vUcIB4MvfGIeZlsvZtHp8MQNG1cWyRI7
	jk5aqVHWEm60SEh+aelyP31xAvtalmCbVRMM1jPHKdscfL2vTJZFHyjiZSLIEASApDuvyKv6eMb
	6xiW4JXfIb2ZDGH565M8ajyKQiOf9VdZ+U5XSXL
X-Received: by 2002:a17:902:e946:b0:2d0:cc92:f7c2 with SMTP id d9443c01a7336-2d34535651emr6182815ad.1.1786483313141;
        Tue, 11 Aug 2026 14:21:53 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29d82sm12934165ad.20.2026.08.11.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:21:52 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:21:49 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v3 09/11] vfio: selftests: Add mlx5 driver - HW init and
 command interface
Message-ID: <anuSbSEiEfCC2MUR@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <9-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Add an mlx5 ConnectX selftest driver that programs VFs and PFs
> through the command interface. Create the driver skeleton with
> probe(), the command interface, HCA boot sequence, and all resource
> allocation up through ALLOC_PD + CREATE_MKEY.
> 
> The driver implements vfio_pci_driver_ops (probe/init/remove) and
> registers with the VFIO selftest framework.  It matches the same
> mlx5 ConnectX device IDs that the kernel matches.
> 
> init() brings the HCA to a running state:
>   - Command interface setup (two-slot: regular + async pages)
>   - ENABLE_HCA -> SET_ISSI -> QUERY/MANAGE_PAGES -> SET_HCA_CAP ->
>     INIT_HCA
>   - EQ creation (CMD + PAGE_REQUEST events for PF support)
>   - ALLOC_PD, CREATE_MKEY (PA-mode, covers all IOVAs)
>   - Force-loopback capability check
> 
> remove() tears down in reverse order through TEARDOWN_HCA and
> DISABLE_HCA, including async pages slot drain and FW page reclaim.
> 
> The driver region (~18MB) holds all HW-visible DMA buffers (command
> queue, mailboxes, EQ, FW pages) overlaid as a single struct on
> device->driver.region.vaddr.
> 
> Data path ops (memcpy_start/memcpy_wait) are left as stubs for the
> next patch.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
