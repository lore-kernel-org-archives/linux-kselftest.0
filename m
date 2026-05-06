Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8932571D
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070398; cv=none; b=kDkKNHspG/HYS56bE6heIUP6rWyc4Kw27Brrq7ydTWLtHoJcL0b8dwAPoeOWyUEQlFsdln9Ob06CD1+9qNWb/T8d+YIvTrUsvc930GmrjX3q7CLHFmew9M1lcljLdSj6EkPdonjRGOVUpFcSFiEmaso+wN+1HBxlSPoYHaVmufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070398; c=relaxed/simple;
	bh=BcXorbEfsFAx6QbQO57Jq1tR7UjL6pcjEAnnjG+0zeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rew7ufhjxWSeOG8NBlZ3yXhgA1qBENyY8h7ntO+n6EFLIlSnzYeESYMX7QyaHNErRlNEFJaxSop1ZjLFgl7HUg8LbLHKTDjuRTXMpO9oH8QbWkrVXUIIe0hhO58T2gPkBtjAKtzg8SsRmMKpQVkMVwiII+fn6E5WntU7SF4Otpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C3as7VWl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C3as7VWl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5127985f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778070396; x=1778675196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMpHPIoDyk7lQF2tr26c7noerDTVIrKkAUCsthGLLgs=;
        b=C3as7VWlBk+FyhT8KrKijDUU2JWE4VzczrgG1KllX2i4NIB5E6BgG8VdnYDbP3icpl
         7pWVuczN6ryiy57YmVn3J39qzLxyK+mO8OEWoPfLN7oUUAroudMb1iSfUNDM/F7k1MGz
         hHa9ioYD2TN9vo/SdsjZ3goZDyQo0ikZ92nTxKXus6g6+lCKsxLCahT1+RwTnVC4mMhx
         LahgoPqOCLg1htaSxGJgKZSHeS2AFYuPYuaY0YtAK/ocMcQnKRTksoBSpTW7YvefRN59
         COaOBhCaSALND8mnxDVcMPTONBK0NRaT3mdy45BZWTJZeIpWviOMV8j8v03c+L2wUWyT
         l58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070396; x=1778675196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMpHPIoDyk7lQF2tr26c7noerDTVIrKkAUCsthGLLgs=;
        b=Cn3+E0BfGIBY7yXtUGfWvmctUu6Flw3jpSf8JFal6Km7tL7BbwI9nsIMBENKyJr3EY
         YIB/lrRa+uYOZOOgNNr05vTGzLd8UaOYiFr2pWr/2Bg/2x/iQaHFYtN6+MfstdCB7aYJ
         xgSz99QqOAAjU1uFI+wHpWWCarwCPtKqDtmP9Jp8mAcB6XyxW8lAbEigXKYF1b86a0rM
         0+om4EnGecdvZvWMSerHurCjMMH8vzvJEc/oFr1qcN0T4cCe0WcU7pMIssFbmRJmruZy
         jRdtkEe8Ln4sPdeTa9mUeqfg/7UnAKFX6ikyIRONi9yHWm0fPM6+om2I1CD81slUwBdl
         3u1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aSQqBaAEUQ1X6dZpxlVcbbi1t9ddJMpz4XsKcTnseb68eX5HNRAsHW4+Xv6XcvbHZKm/X1NhdOrLoy7tsXDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/+lJT6HLBBgKXLb5wx3l8IKdkp7ul9CN2i4ZWJJIhSEVjRZW
	4bBJD93WC8n+XX02GnfFwCHEorBBPz9ZFuvcxP7HxFjznpzDZzq2LdFvPcW/YjARYvM=
X-Gm-Gg: AeBDiessZ3QQV+Qgdu3Vkotv8gE+CzyKZcuzEPHbm5H8mliMz3anTq+VxAB5UQ7sE+G
	BpLY4tslFEzt0P/Vq1pIW9wjX60XLed4HrAiMk3+bCXOLXI/iq5uR/JPU1JjnfJfDlrugm+ezX5
	TKV6+l1QeN2SvAlppzA9ovxDP8el+w8dQCgw33QUGXxO+NJpEw4Y1aIX7xLXPJ/3SzfSWD7T6BR
	B0V/sVqUJ09CkYmsGWZo6MnxNn/2iyIFK1P49Hze9xZrnyyQhH345dywmE8vNcAoLp4ZUBES74r
	FHPjuD3vpG0MSzs2K0zA+mFkQ1o7r9bK+WG9kjuEg/ahsFL4auaOSntEa9W3IqaIAOj3o6+SHN5
	MKPltZIQ+hCzMB3y6ZDE/8U06rKrwM95QotvvGC1ZKsZu/4VYuYnwTnMsyo6ybDDjF4aFMGT+vS
	qyoZORlZPJJFZvLyiGtn+bIptO8geDERHvQWAZ
X-Received: by 2002:a05:6000:280c:b0:451:6760:fc2d with SMTP id ffacd0b85a97d-4516760fc6bmr3489346f8f.0.1778070395548;
        Wed, 06 May 2026 05:26:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12077299f8f.12.2026.05.06.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:26:35 -0700 (PDT)
Date: Wed, 6 May 2026 14:26:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcos@mpdesouza.com
Subject: Re: [PATCH v5 0/6] kselftests: livepatch: Adapt tests to be executed
 on 4.12 kernels
Message-ID: <afszeCkeSBvn_ePB@pathway.suse.cz>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>

On Mon 2026-05-04 15:34:41, Marcos Paulo de Souza wrote:
> This is the fifth version of the patchset, which fixes the last Sashiko
> comment, about overwriting MOD_LIVEPATCH global variable and using a
> local variable to avoid module load clashing when an older kernel
> don't support some sysfs attributes.
> 
> Original cover-letter:
> These patches don't really change how the patches are run, just skip
> some tests on kernels that don't support a feature (like kprobe and
> livepatched living together) or when a livepatch sysfs attribute is
> missing.
> 
> These patches are based on printk/for-next branch.
> 
> Please review! Thanks!
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
> Changes in v5:
> - Edit the last three patches to avoid overwriting MOD_LIVEPATCH
>   variable, using a local variable. This fixed the last Sashiko report.
> - Link to v4: https://patch.msgid.link/20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com

JFYI, the patchset has been pushed into livepatch.git,
branch for-7.2-selftests.

Best Regards,
Petr
