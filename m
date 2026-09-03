Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A693F4DE2
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469987; cv=none; b=aadpGTKdrIzFU+YSl+0q8fiIzxIMPchnhO0NRG2+2GMQFyGS1iJdNThlWiaoWDLRAnlmJnhS8Hc13fJ1c31uUSzsIItayRR9CSZ0wK5RZopRfKyWRi8s2zXJGVfA6VXjYytbJ87LD6mL+yogx9UNdgT0P0SnwREMV8VbhqeE7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469987; c=relaxed/simple;
	bh=/SXNaYAzOtG1exBAfYMsRpUkcMovgrlxcT5oK0UNJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwNLVLYm14K+PevpXGz6R6OlKYYcEdD9teFMufKPwfFvKRa3JBWXnjDJa9w3M88W5RCnUm1BrtSoaXeaqMWm6UwykZk0rRHZMX5z6sh++sT+66MnreeluXaovvsPAAP9xo5alb1Y/Lwt5SN3MWblEm1KUO32GSC96EsNapFsTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H30SvNco; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H30SvNco"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8525efa7274so219625b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469986; x=1789074786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/mj3IVRmoCFRi1EC9+dVyk39SNMUGyb4URbFkvdpey0=;
        b=H30SvNcoJr0RF6gresCkpTwoVVzuNC0pjaGGpreHTSKfprQVVizSNpBk7PIJPoyGBr
         y3ER69pQ4v1MFrHU3rL3JcMni/gf0wGTkGc8yQR9PlMvAWPg3voccltIbSSdrFBl0jqV
         +ocsF0mphFV2DpehV1Cnvx7lNUHHfFmntxNrTUbKtnbWuGeXq/sJR8QEGIHcovlLh9Gz
         GXMymmZo8C/RBUln+VbkpQszrTrTphj+5jD8gV2noZLFBymR1gu79WBMbiElzH1AuPTQ
         EtisAgESzDsz1Uhs9Ahu6A+6XoGR6rwALRphtoqzuhCaK81fQwR+WEVnUUkygDJlbIbF
         zSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469986; x=1789074786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mj3IVRmoCFRi1EC9+dVyk39SNMUGyb4URbFkvdpey0=;
        b=qmGruWrnVGzl6PDyyEZA4lmVOMBnqbyWtveq5N+H7/sAaP5eIdKIQwNd6FfB0VrhEm
         yRER4QUL7PY5x2Sl2A2R4rXmfI2XKzml77/0CO7d8B6/TNkpSWOr+AscW2M69LxVx0aO
         pnX3J9DcveGbfbqnyJiOOleAtbEnYdvZefZb4xI2Cun4sabyMlCTkti9mGHeZWUkNlkJ
         konArq8K0vaDlhZdWPwi4v5+OgVthmPZHwI99BrNS3BeH0Ar47SeMHiYAtV3c6/mpqCc
         ya4oFkCb7coNhr2mgy4A37tn/cHT1PMsXibBwd8mbvsLylFthFn56VF4AQl9+l/uDK2R
         /Dww==
X-Forwarded-Encrypted: i=1; AKwUvBxID9LTpFJqbjoldsDrYbHGEX/uNG+e8UUVsMKTtjl5KFfApshxu5GUj+uQHEBzCIiCKia5/d73u9cSW/+arcs=@vger.kernel.org
X-Gm-Message-State: AFuF++k6U1XHDi6oib5zTDVpn4gmjqKJgYrqsIgmbDN2v14Sl2tWHIbB
	viPyo8y6WVXNo17tN2oxwrO9Hkoad++tSjKT2OMQkbkqTFPrheF35qIa
X-Gm-Gg: AYBFou3GPid5afHyOgVQ4bqR7KBmBIUV+FXeH201yYjuS30kwGztQG3CdBD5H34ijyF
	b5gSr4YPeCeorY0/eTVA/Wbzlmp52xrBQodbOojM+/UkJVXS51lO6u1qnuyYdC7HL6N/wNTEJwz
	W7qBzfl4N92mmSIcr09W4hYVW8we1Stmw8evff9Nlko8bTwHCC41Stz0TepmixTGmXUibPMhZgP
	z44EXoQY4NeyYCTU/aL+9Wlh01wxacIBWOVomlY16WBJF3hMk1OuQVVuqhOjuwQDw5KUssKoNMW
	ifgQ6TufMoTVxW9opN7CegNdVBtMw+jBHQuI5u/ZNwOTOHaePi5dQfzBlPERtlcXALg28z+Gr5b
	zb7AQdq/FtgHlImwHgREKhCskYqxtt2PT+/u06CXqbjwgLNinvRHihuKIo9AgafI1vhFP56Euk7
	vmqqrinNMiXiYWBIeEqUvAQ3QFmkLAktzR+O01iRdM2ldze5gS+uhINTeT3GaCTpv/YY18AeG6q
	D9OK1d4Hy9IWqXuMFMNXhnclV3VtU/5Z0E7p9dv/lRxoLciPLKAwrA=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr1956509a91.25.1788469985477;
        Thu, 03 Sep 2026 14:13:05 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae633be61sm3479083a91.1.2026.09.03.14.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:13:04 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:13:02 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>,
	Frank Hofmann <hofmann@deshaw.com>,
	Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/audit: Add syscall overhead benchmark
Message-ID: <apni3p2JBQmc5IZQ@skinsburskii>
References: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>
 <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>

On Tue, Sep 01, 2026 at 05:35:12PM -0400, Paul Moore wrote:
> On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > 
> > Add a microbenchmark which repeatedly invokes getpid(2) and reports the
> > per-operation latency across multiple repetitions. The workload avoids
> > filesystem and other syscall-specific work so the fixed audit syscall
> > overhead remains visible.
> > 
> > The benchmark deliberately leaves audit policy management to the caller.
> > This permits comparisons with increasing numbers of unrelated exit rules
> > and with automatically removed watch or tree rules without modifying an
> > existing policy unexpectedly.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  tools/testing/selftests/Makefile            |   1 +
> >  tools/testing/selftests/audit/.gitignore    |   2 +
> >  tools/testing/selftests/audit/Makefile      |   9 ++
> >  tools/testing/selftests/audit/README        |  30 ++++
> >  tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
> >  6 files changed, 270 insertions(+)
> 
> Thanks for this Stanislav, but I'm not certain that we want to merge this
> into the kernel and have this become the defacto standard for audit
> performance.  It's a simple, easy to understand test, but I worry that it
> might be too simplistic to properly characterize audit performance.
> 
> ... and no, I'm sorry, but I don't have a better suggestion off the top
> of my head :)
> 
> However, audit_bench might be useful as part of the manual_tests in the
> audit-testsuite?
> 
>  https://github.com/linux-audit/audit-testsuite
> 

Sure, here is a PR: https://github.com/linux-audit/audit-testsuite/pull/129

Thanks,
Stanislav

> --
> paul-moore.com
