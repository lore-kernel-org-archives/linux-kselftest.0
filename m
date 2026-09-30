Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2BB4F7CBF
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788144; cv=none; b=JPAIosNkjDCqG5Lauvki21IMfZAhHgLX0IPCfWDyFeCPp987Gcb2iTijBUG8AgR0ZxJ852/gZsC0+aLxGI2NloYNkaN0gIpUUCmV668GiL3Db6v92BpzDgyR9xJnKb8hndSPHFI5FdJRHDRbr6WDJL6yG2s1aqyXeh3W3I/sHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788144; c=relaxed/simple;
	bh=ktfBIjCa0CIvknEpl0ZQy+RUTPio7skXi7Noh7PuGm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9x98FA63m1DR+To2m5+8ehu46vdg8VcBlv2v2sFpOXQ/p9EBCE+7EhUHLGBToVZ7c1uk9nAYWXkd7RhtbkQPmVgX3+mt1UsIABFLQSkaQXwqt6Sn3a2IbL1COghXbcVvrcWKyjgWdPVwogXlJcszDvSxiBy1yBduoBnxbA+zIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Ys77FQGQ; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Ys77FQGQ"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-887c067c816so255820b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790788141; x=1791392941; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6oCiS1uRC3fuq7qwf3HrQZfaTBzywLk4ZFO46jPFa8=;
        b=Ys77FQGQ3zkjzjgLDJIQVf7ow6K4HY/PD29wz4z5n1NBOVMXKEDSkbEUKkZfrLabEd
         NsyXrmFlrWXxVkMdsHe3FGeTMigsde1zhO/k4F1YhUKrnivGOal8Gmw1pX5vsnzEh06e
         LMSCjY/Nmby7PDCdGqnu5UFYlckcbuZ6Pg9q5DIB7Wg6AGEnt9KRavrol1Au0h1HqTRF
         BXC9FXJFI1zf5eM46zEClJ5eYs53UhzTydATJ6lu6HQeoIO1iZ7XkA9H93NC9CoY+Vk4
         TxU+11do906IXflCqyKglWAAbWVHoRgRcj8/ia+hIUYuNJFaf5ARhn0xOouWgzPjPpDE
         uXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788141; x=1791392941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6oCiS1uRC3fuq7qwf3HrQZfaTBzywLk4ZFO46jPFa8=;
        b=eSnMUNHW6D9K+3N6Pbwv1SNQtXyo2DF0wClr1a9jwjI9L9lr8lAr6ZXOgMMwOg3aWJ
         EaNGEymSozRJgBqChGkx0nk6XOoAr1VlBThCDmZ3s6/TlY1j1hFHIjr5B6f1dz2+h9ge
         z5D8VePf0IcEnqX1zfWt05Wq+ONw3OayRPEPZWRTfb+PPVmCp+cm42iSuJ9bpgy9zSAM
         3C7fFOgJahDYFG6ZDHTQjkJqx9lF+csn2TXR2viJF6hjL0YtrJu1HfEhMpsnXHHDNM49
         lLX72ChinEmRhPhbXo2NbuLPP/vVv2W1nvVkA1auLlAAHmdb530qCzDEokRQtcH2Gjle
         y9AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv3uq81N8NJZ7tp/EXqDCHQ+fhaE2edPlMexKAkzMk4yLTbgBY7uaZ+/f0vUcvLGEJ9/jciFo6bedark1yb2c=@vger.kernel.org
X-Gm-Message-State: AFuF++nlaEJNq6hzCVM3YmRFtwt0w5a2G5BNM2unvrKJYAQhv9EVGZmJ
	sP9Bg/5xuHr84Pypb7irRj9GX9vIUI355xlJ8gsTbEty47omXJX+EKNwBlRLYTHUjGk=
X-Gm-Gg: AYBFou1Nq9MZaufmfM3mPW2IbLCgZmOG5+M0/JczTroYDl5rQh4HhKQ2sBGTuVT7xlI
	K5B7gSKWfzpYCHwznLkZ3yzLcESXaK1FrT7WnLrSxHTAwEyBwPOQCOGoAQWPr1Cd/pJywDHQZkv
	4dswO2atfkfA+a7KbRf6PtD+E3epROwq7l8E0wFkfdjtLQ+zGZ+mQKfZ2r4X+Nii34RP3KIjHkh
	iWWbceUVJqT6ua8T11Effuljs7bcarkDMbqol16dnRMwEopO3HB7JZuSLu4Paxuu6C0MZ0okXBg
	zRrotJ+jyFuip7HsINM3qKdeMFI+8ywIyb2+SPHtJ1zqTvnIcAwqvmWZ428DxHxOU4fuaBMrlUe
	++lSdIYTpmwakNcD+H0eLi1LGhEGCqpWBW4LI3kK26hUV1Evzj4D7UTVwKW6C44EO7xtU3sizhF
	NLTIGHB/7FMpiC3ghZDM0wXD5WPs3CNChSyYU0LdaqbaxoEj/OeTQNM97ytTX5L5OLWWBYpprt5
	VvZHNCh
X-Received: by 2002:a05:6a00:1415:b0:880:849d:c07c with SMTP id d2e1a72fcca58-8874b065cfdmr1588192b3a.25.1790788140806;
        Wed, 30 Sep 2026 10:09:00 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63827sm1236665b3a.33.2026.09.30.10.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:09:00 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:08:59 -0700
From: Joe Damato <joe@dama.to>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v4 2/5] fbnic: Track BDQ device-page geometry
 per ring
Message-ID: <ar1CKy+jFZiD9Haf@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
References: <20260925104417.2325213-1-bjorn@kernel.org>
 <20260925104417.2325213-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925104417.2325213-3-bjorn@kernel.org>

On Fri, Sep 25, 2026 at 12:44:09PM +0200, Björn Töpel wrote:
> fbnic derives the BDQ buffer layout from PAGE_SIZE. That decides at
> build time how a posted page is split into 4 KiB device pages, and
> uses the same completion decoding for HPQ and PPQ. That is wrong once
> the queues use different posted-page sizes; completions must be
> decoded with the geometry of the queue that produced them.
> 
> Keep PAGE_SIZE as the posted-page size for both queues in this change,
> so the descriptor format and runtime behavior stay unchanged.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/ethernet/meta/fbnic/fbnic_csr.h   | 34 ++------
>  .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |  5 +-
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 83 ++++++++++++-------
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |  6 ++
>  4 files changed, 72 insertions(+), 56 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
