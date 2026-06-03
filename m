Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA3481228
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492390; cv=none; b=uSzgiHyfwH83I9aRHgidhHp8ZR6U+KxUMJvLj6KuADKYoPy3Alo91NIokiXor5alWlILjG/HCPYlI0OCM6eSJsYR4Is7ZWz5ofTOYmlzkzZ+nvc8Sd51fIw9dnSHixHsmEAW2G36pmi+tvneQyowEFoynWX/bhGPhkf1gswC1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492390; c=relaxed/simple;
	bh=WW2wDfU3rnVBaaI+fGCSWfTRuMYvZQ+UdYJSw/wuQp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVjbwTAq3es3FrDbb3dseaAjR5UOse0lHTJ2x8wXU3Mlr0DH0COYFjrtszu9qKYVLWswKfCNAGuyDJHx9zBnqOW+2Hjml/gTODDYR4lcvfLPesD8CjTzZNz/4z0CVVQ52LfNqnF9bam+8j64MKu2N9aIZD6b6PyEPZ/KCSny/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZdXcDzDK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZdXcDzDK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46013161068so1776240f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780492382; x=1781097182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yq2UHVEOUzdIFU3R/Oloopokibw3ZVQerM+BGv9opQE=;
        b=ZdXcDzDK6y1ROvv/Q38nRZ8CLfk7VwWDD0kC+i0is9zpz7+NNg41V9WaMr4ytE/whJ
         4B7EnptelKcQ8y4nJRhyNz9nVFTOgo5RaNvWC4513zeqC731hIauD7UWLZZOAE0I5AoM
         6s0bHF3FYpDs7/akHsfZrNbTwV4EXX5Itra2q+0R+GGNG4Seqsz8kuvm10mPAFk+Sy5+
         /wvZdl6B6b/iVPVnvrcTqqo5UvkuMAirEsBWRSnRID7tOFVfCSjjcn9OUxMj2fet4xTS
         rzB+/h51A84BV5lMTQc1koFjR99niBLfFDxWJxTLQXHHKc3bZeRhVmhx2ndb5wsgzBMX
         X1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492382; x=1781097182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yq2UHVEOUzdIFU3R/Oloopokibw3ZVQerM+BGv9opQE=;
        b=mQPWigH7TEk9E/ahCQyhqCJvomlUV1eMxgPldgPcfgbG/1IQOp0uLSjAq2Gn7ciru1
         rqvCpPvPwSzoGUnhfC41FQ4wHf8t3obQJ2eOQraV8MfGleNAw7f9BXxVfvV6shuOxyTp
         tXvsUkKi3qA1PA1yvn/tcXCdBqzMTmUgPNbKfDFWeToDP2eKl+Wwy/MDAdg26ux6X9Jb
         bEYVCO9w6T6i7dESoeCuudvkb9AneDTG2upMgKXlAcSSW1KkCWIXMRlFwZm4Gt8UwtNl
         75e5iftmnS3c2WPSoCRl1c1V5YxiM2YkBbRpALgNE71agIYz+Nhc2Mkes2pcgZZA3KYz
         JD4w==
X-Forwarded-Encrypted: i=1; AFNElJ+Thlg8kpBFGJiYJLPI31j0drqaXNWr5ubk4Iov7BMLuJXspA6vrI5UmgEEMHGhEiPjygSXyOCL7HdxjyqjfYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sXpM/CPXozGbXQkGfkE01bsu7jTqlzB0jN7jCm+2PHcKEdK6
	YHxIsWyk7j5uDTPKfjX598f6lM71L4M8cPGjf0dS1c9y4ud9qKkj/l2JlISKN/0rT+M=
X-Gm-Gg: Acq92OFPgTBEywBULCJ17lfR/IpWQ60YTtW+y5NffSGXi6BCgp6gk1XGeksaYPj5ee4
	xfum2hss3K2v8CXMD6ChkKGtj9uSOasLOHZ6KR8htrh4MReH+Vt/j4ypVqM4lvGW+qP7GBvaIjk
	VUB2QuRRbWoSDjRyBvC0vPuuak9vrTE1RcVtJJrD/hDOUOoGj3oKEEyW24pqBh1FbD8T8+aL6Ex
	3RNg3syWzU5nD7TvdNUIdEGqYtuMgvSWDEZK7NzDtS4ovVrRJD+Q/gzWmjq0acMoSCu1JPnZE2b
	zFStyFWOU0/R6vgHA5hspTG3i3yFi7BfktpT0mswnqnlz3L3PWUlkQpHpDFGbbPtzRMSnJolPqy
	dQ+R2/MSjw/Nei2oioWEIg9hlCYPCJLsxTmZ0W9OQGiHFb8xYmMIwq3jzC19XZP4AnhrlaQXHDs
	J0hrgnxec8uxi/ZmwD6/MiVXrf8VflFDdH0NZKU0ztu5V4WBU=
X-Received: by 2002:a5d:44d2:0:b0:45e:9431:ee3c with SMTP id ffacd0b85a97d-46021792538mr3739740f8f.10.1780492382374;
        Wed, 03 Jun 2026 06:13:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm7479703f8f.26.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:12:59 +0200
From: Petr Mladek <pmladek@suse.com>
To: Qiang Ma <maqianga@uniontech.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: set LC_ALL=C to fix
 locale-dependent test failure
Message-ID: <aiAoW4bdorRlWZs9@pathway.suse.cz>
References: <20260527095929.1504032-1-maqianga@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527095929.1504032-1-maqianga@uniontech.com>

On Wed 2026-05-27 17:59:29, Qiang Ma wrote:
> When executing the command
> "make -C tools/testing/selftests TARGETS=livepatch run_tests",
> the following error message was reported.
> 
> TEST: livepatch interaction with ftrace_enabled sysctl ... not ok
> ...
> livepatch: sysctlo
> : setting key "kernel.ftrace_enabled": Device or resource busy
> livepatch: sysctl: setting key "kernel.ftrace_enabled": 设备或资源忙
> ...
> ERROR: livepatch kselftest(s) failed
> not ok 5 selftests: livepatch: test-ftrace.sh # exit=1
> 
> To fix it, set LC_ALL=C.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

JFYI, the patch has been committed into livepatching.git,
branch for-7.2-selftests.

Best Regards,
Petr
