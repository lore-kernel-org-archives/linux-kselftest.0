Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A9331A6E
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 21:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298517; cv=none; b=cdrPsJbl2SC+AahPJLC9PGZ2Nva8xj3k+L/955TYNisf6KS+n4p0xk079Qb5OKaLcJqk6bYS/I9G3ZcJwfF08h/wjp4oCQFcgav8iJt7V4jUP6Fi1eLaPCQKhSxAJdFE3cyK2w8mfQNjVIZad4EfazkF6PZ3TveXMqkvULJnXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298517; c=relaxed/simple;
	bh=iSLp1IrSeiNNeBsrOLPLaCfMKFD7rzEjvmdP6CIih2A=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=SG7IZoWLH7w7gALIm2zgpCLdskyi+u4+IkfZ6zAO4k8LBVRHjAuKzpVF0wt93Dd9Wbwe+MO4TfaZgujfc/fz0CXQ6k4z0du6+BJU/fGcjH7XRBlUfucbUPe+i7Agat6qHfZ1OreSHKrhI+76Guw57VI/Ukf2fxI4oDJhWRvz9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SXjBgpHk; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SXjBgpHk"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52f9fc510e1so16422941cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788298515; x=1788903315; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE2LqMY6NUtGXuk1qbc18CY6EeLLZzRewObQtxCrnzU=;
        b=SXjBgpHk0N2+jZwhGyhH/DweP9fsFDBsGihousgoKG1dxDF/JDAHCfvh4HbB45OO4W
         +i3XMQlrNdNf49sCwmrwtPFP9G+blHuYebX6EPLXAdHUtk0HBsm6ldQkr8bZPPUE6Jpw
         qvku+97mbMMYv0pc6nSIdoDJBOLmkkq1vb/108mpf91FscvJXvYNghUvf9gSZ1Y0YWvy
         4vwH5RHoUBE5wmnOit6ydDNP5RdZvHcuKdzdJdAxBs5xAmijmA1xYvlGHCPJ5UgSVp19
         qcRj1bTEdrkf/aTZ0T3odBKBVR8URnGSXnIrXU4XyLaB0MQncp1jgKfi3MWimZHx4OTo
         E0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298515; x=1788903315;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE2LqMY6NUtGXuk1qbc18CY6EeLLZzRewObQtxCrnzU=;
        b=J+vv2kSomdIM1ySIQJwuFA7D0sc100kOLZMHsmj93M+p2pAp2sEBBtOXOV5V48Khk2
         dI+XEB1riKL38Od/mB2jrsCPim0iloWbF7hl02JOzWPg8PmWbjx5aHRAOjUiz3WQb0V1
         AWtkJDXT2hoRXQReLDddNbp9H9V/auEX6bfEQTw2dTHeGDIyhHdUxDtvx+q7eMQezGJz
         Jzoshnz8VKZVeFEWh7Y3mSg31FWz7iIALjYyiVbAEYLkx9J/ApHYxbYb+ROXdXjhu94m
         E1qDHRjvlcBHpCI4OXG6NCvq4YKhXpDpmcxbz9iusAnYBmh9l+44F/DiejMtv/2hqryA
         pssQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqqOEYWlDG4Py/MrpCfQHn3ouYibfn6pnWEelUjtpoEtUepchlMEy3tUGVvYtmYsuXbSRVTzN/8QGsmSzJZ0g=@vger.kernel.org
X-Gm-Message-State: AFuF++k1s4cnbP6jh/UVm8uLCvHRWXsuM6RbLuDIIBO29vVeZHFxZcQT
	Z8wTxAwigG63HzfhM09d/ZlnTp+McvKi3EEFRJMP/+fO/LQCqFWlzH0EI+JYSys6zg==
X-Gm-Gg: AR+sD12y/hNSSv0IS05NtUFhLvmRq0CwpeRtDm29EwvwYgCTIrDNLL5HpDq7uyqamJu
	7/JeIVu2l4EHb/TCWJfsrqO8fI1asWLmjFf0zGengWUrFL4fXAVE4lVnf+O5mBwUZ2qPB5evYkT
	xlN4TwU+izfSAyQJuWqwBshB0M9e2eo/IIt4W0f8itDAj2sfecTrDKJlkTZHPpd/r/cuWWZqN5B
	4vyw201oxKGUp/J09UkiiUWPaNpcXeJ5LIaFLJ96aVOj154Xw+sS1SH+r4vbJoCRB6InVBP5aHL
	smZ+nX3OFHR5FWuNt94zVRZ0zMXDXyCzf+r/CMK324A1GOLp2HwtjLix5BPzrlAq1YzOZxnfCJF
	YxA+S1BdYChwDXncTWDdI12zTVIG53eGgxd6vc94S8qkMjXB2FRVM+qeuWw5IMzV3CMb6W1ThOJ
	30cml9lAcngcpgZ3yitcsijmMsCaPzWt4yfBIG/H1GVNFkDhosTLSy43fRTSrWNnqXeHE4FZVKf
	JrVnXQC+qGBr++IctByYwiin6+EY6lEeHbWq/ShfTol
X-Received: by 2002:a05:622a:2305:b0:517:c65c:4987 with SMTP id d75a77b69052e-5302543895emr138218971cf.22.1788298514613;
        Tue, 01 Sep 2026 14:35:14 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm5772091cf.2.2026.09.01.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:35:13 -0700 (PDT)
Date: Tue, 01 Sep 2026 17:35:12 -0400
Message-ID: <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260901_1121/pstg-lib:20260901_1604/pstg-pwork:20260901_1121
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>, Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/audit: Add syscall overhead benchmark
References: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>
In-Reply-To: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>

On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> Add a microbenchmark which repeatedly invokes getpid(2) and reports the
> per-operation latency across multiple repetitions. The workload avoids
> filesystem and other syscall-specific work so the fixed audit syscall
> overhead remains visible.
> 
> The benchmark deliberately leaves audit policy management to the caller.
> This permits comparisons with increasing numbers of unrelated exit rules
> and with automatically removed watch or tree rules without modifying an
> existing policy unexpectedly.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  MAINTAINERS                                 |   1 +
>  tools/testing/selftests/Makefile            |   1 +
>  tools/testing/selftests/audit/.gitignore    |   2 +
>  tools/testing/selftests/audit/Makefile      |   9 ++
>  tools/testing/selftests/audit/README        |  30 ++++
>  tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
>  6 files changed, 270 insertions(+)

Thanks for this Stanislav, but I'm not certain that we want to merge this
into the kernel and have this become the defacto standard for audit
performance.  It's a simple, easy to understand test, but I worry that it
might be too simplistic to properly characterize audit performance.

... and no, I'm sorry, but I don't have a better suggestion off the top
of my head :)

However, audit_bench might be useful as part of the manual_tests in the
audit-testsuite?

 https://github.com/linux-audit/audit-testsuite

--
paul-moore.com
