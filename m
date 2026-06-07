Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2878F2B
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840175; cv=none; b=QnGKhAVnrCwBKLAgWZ2qTHl/TglSFPuEF6BOfFORmp79IqwCTTvoo5S9xk9blG4yLXiiB6tzzlPXLPj6ZvvshbYvztnzts4x93eTkdGpCSTIOI4Zi6pg+tHxshP6IH8cgwGgeGwXMrurICVKd8O5ZtLQR7YQ+zc5BkEHYcUzDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840175; c=relaxed/simple;
	bh=XEmC8cTzKQpgszHArxiOjIai4otMc07eukOUPay4pQU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=j85tTysheSyb72d2O2bxTEdsWLVCFz1wT11ReVOKDO+5APxuuLP0mJDvxyRDkO3JFyrJr2FtM6vYZtNP0B8MwxpPQGQY30eVnUcUsWr0ESPCVhmXpsWmJzZjDSEGtq45l39Q6c4L2eQgtqUubMUtNvSfWhRqP/fgWiCkoYXDBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuK4OqAW; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuK4OqAW"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6603246b66dso3421717d50.1
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780840172; x=1781444972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93wINgt7Upt+lx98SvFQMNbQYg0vszE9BajcG6iLDZI=;
        b=ZuK4OqAWIGLGiIbJbySOub/GRfPbfZyoMJNaKDCCQNI0RoBCX5gHQ/1j7REZGhUmBN
         PyxXZxB3RDOTKRA8wWeFgTy+UZ7rm5IbYhLKCuY7k0QGhOREDvbUSNZK/AhVDj3jMNiL
         K6Xs/T0tIyE+YjE0JP8ju5XadGOSZRthpiNr0aYvlLsqiv3NaSBMcGCFFbDRnMPeXWKL
         l3GPyiK9RXBJCXWZRwi7/AkqZsJGOANUlp7rrHi9hGnB5FYnKTQheyHnS1QU2cW12b8l
         LO8YLKYXn5XF6JdCPDmxAd6wPGzXj4ScZSAz2Jbdq+XO3Wal1+nDImpTVjHc6K8cPISB
         cA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840172; x=1781444972;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93wINgt7Upt+lx98SvFQMNbQYg0vszE9BajcG6iLDZI=;
        b=GWEAJiuGC7medil76XccLzcX/3uYGyeST694m1TXsOMxQdKKoKRqHZT3/p7ZVa0aD3
         mAluebJBpuC+NA1gD+diUmicONf8UWIxefSMMjZlcwZo+qqqP93CRh+3WXizEZh2UoT9
         BibNYJdx0FfS/R28Nov1agJ7ikcfAOhB/pi39vyczzvM4cf6yA8ArVF7BfD14cKBY/H+
         W/lv73828Rz20FG5khdWcn5jzowt6Tp3+W6K1GKLj7S0E/VhMNiXtvyk9ZXH6IxJA9Gv
         21rQeznC3pipXl08agY3ibrsJ8dr630TrU2Dqsjch+g8zYV4uNmWP83B5K5BW71q3GIK
         czPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FegwnEiCUyMfh21tdY5xZPcersEv3L0fBcq0sAWndKK16fVWh7O1bEETFA471YA3ZKamDiF78Y3xbPQJ37SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsKt2thuUgL2VQgT1HG9y7voM66oYm8KMaf+2eLtPUQCS/5B6
	2D50GpmltXN1f49f4qCDvIumYqQLgkBSDf2FqaDF3qJo8EPefLo0oiYx
X-Gm-Gg: Acq92OGDiaDGkMDucXDcdsQOBbsPb6pbWg2esK9atqeuhuJl1+DKdsl2n8aROB+dRsU
	YJ+CHaq3I36/2mdKElDo82GnG0/CX2SB3MuPEReB+aKS10XAEEg8sHG8tQF9sW97lwQjEmu6eJq
	9ykqS4KbF6f/f3KK7mGS69ux6r80ecMeBFumsjfVrDJmzUVztF86SzxJd0aIhBPz5jxZYi/oRNp
	UrhX7b0kgGjXEMtY/W6PIHF59DC7O1fjfhe0BbBlSgnbQU67SzeUFcuB6R7G3CWE2WfJM5HwU8+
	I6JTdNpqzfavDtM3mRnmxomwANeHslkoB5OiOm0DMximwGBYO5GZN50+kIZDeH+xIzd3xbru3Pj
	SFuVv2qwrWR0UaBTWgFZlV/DOmlqYrWSjRlqr+/8fitCpLeprhMGCCn9KTaE2eDL810UZ/0SU8U
	uIvUC7/YDiDCGYEVAr0xN738N14R9/xSd+fs0+ByL2nTEsYG9zfRJ60K+854x7SisrczgwTa1dm
	YYrmERuA8r/Dbbslw==
X-Received: by 2002:a05:690e:191c:b0:651:d430:7832 with SMTP id 956f58d0204a3-66106dceef5mr10363870d50.10.1780840172574;
        Sun, 07 Jun 2026 06:49:32 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d5f441f8sm8081424d50.3.2026.06.07.06.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:49:31 -0700 (PDT)
Date: Sun, 07 Jun 2026 09:49:31 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 shuah@kernel.org, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.ee6597e4f7af@gmail.com>
In-Reply-To: <20260607002401.212976-1-kuba@kernel.org>
References: <20260607002401.212976-1-kuba@kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: gro: signal over-coalescing
 more reliably
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> GRO test is very timing-sensitive, packets may be delayed
> by the network or just sent slowly. Because of this we retry
> each test case up to 6 times.
> 
> This makes perfect sense for positive cases, in which we want
> to see coalescing. Negative test cases, which modify headers
> and expect no coalescing should have opposite treatment.
> We should really try 6 times and make sure that each time
> the test failed. This would, however, require that we annotate
> each test to indicate whether its positive or negative.
> Let's start with a simpler improvement. Do not allow
> retries if we detected over-coalescing. Previously the negative
> case would have to get lucky at least once in 6 tries to pass.
> Now the first failure breaks the retry loop.
> 
> For background - NICs tend to ignore the contents of the TCP
> timestamp option, so that test case commonly fails. In NIPA
> having 6 attempts, however, was enough for some NICs to get
> multiple successful runs in a row, getting the test cases
> auto-classified as expected to pass, even tho the NIC does
> not comply with the expectations.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
