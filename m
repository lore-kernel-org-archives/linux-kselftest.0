Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA93D669A
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 03:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776916620; cv=none; b=VuT6JmA039Tde7UTfq8jKYeC+7CpUgAwl5RaQp6nTVSShXRPmVlalMhpGFiWiimIKGBd4Z9M9iQWkCr1Q9Whngt2/AT2Peo9mmfkbkFc0iK3pdD3PdZIrYYHqmDFPA9dT1LLeItz6eRDIeXqR6SGSg0e5Hm5JlBhQB99XbURmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776916620; c=relaxed/simple;
	bh=a9AoCeQw2JwtXkhCFyTFgM24eWJEujRL6v97BzFui6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAZ9DZZu/8BSeNTE1fX0gxFCagdwnF5WXDjGA7U5NXUZ2qbcfdFKKFhw9+vwnJ1XUbUXUmV8q9P3UImSxR0vrLUQa+km6sYrk7D1xDiyFrVKLauG47TqjmJ1c3yFPon1uOizKPpsZ4VWKMuNas9yv6fg81+p2TbDR5QwlsVJz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdE5LQiC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdE5LQiC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so57009705e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 20:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776916616; x=1777521416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vq5oECfG3mPxzGMQdru72u3Y1jtdks29q83CtSo0t+k=;
        b=UdE5LQiCVZ1bY8DcbaInSSHfZpfozE6WK2id6KGhqLJEgWel/M/W6JHmQ90OC37tM3
         B+bitCzYblo6sIAWmm29q/PjG+jsD2lW0G6KBCvUmp+gcjjzNUn8zdVDQFqiKmccumus
         uRU4CrDlS7+7nFTPK1zMTv/G/gn/rnbZm2r1BgtkecTNF4EUCLsKoVxZXAViIXnNO25D
         Hwssju1qIwhOY+kNyiTo8BGLxsbG77F296Gle6Rpdrdp8V9CKwZnwsefipFkwOgSl5r+
         rqKNEceYrfibh9R5yBdB3xczXGszo32Valq5yaE4OhidSXNBC4xqCqDx8mNEZj8O+kGh
         cKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776916616; x=1777521416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq5oECfG3mPxzGMQdru72u3Y1jtdks29q83CtSo0t+k=;
        b=TWAz+NcclNEG7g1uVauEzOD9SEmQdlqkf9yqMz9ddUC8XtIZ1ERBhhnBN4o6QKK8Gh
         J/uxqghDPEg2FlT79/h6VTrwuxzPkCrQXNSMvkhzWTZmsZt/0ZfJFkBSsiIzX5gVNygL
         1cW78IRlfoSnNogLUeUAyTja5U7WYELD4NFAOGVhru+6taurSDTUYMxdMmYLnqFF7lSG
         vaTiboV+tolnNDUzbLVL1T7tkihw7+FSLTn8MlgdBE5YTKjaIhBUHLoCYmiYQr64Gys4
         xDTnHiePU/64O0wAVVjksjItxc0hHjOH1LeoMJYkQPjMaz/vwdw1qLoFxcEbyBTvaKxB
         DM0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9EWXwxQ/zwV7o++ri945fYGArMfMI3SwSFON8vbU93NUc6ycL7LP/4vT6xJED/3UqRksP8fIinu4ncXMRTlQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx240otyMiukixhekEcKNXfRnaqnhqfiYEoq+oQA7bFC7PSm5OU
	F/YPtM8YgztvALd9quspxhtOvlIzGRAgAYIeo+0ZmAEp8DXCYZKNLsHZ
X-Gm-Gg: AeBDieug9+0P3AUFu7DRGVD0scljQPwJ8cCje7EDSdB7LiPEN3uz8fsCrlbCgSIOahC
	iYVG+cHygzarmqb66Z1y/5Bix3M9Yu9SXUnJPA/bi1kIwibrqoZWZq0+17jgXnZVs4Y6ytSOloO
	kQhjQEN/5ZgOG9fT1qqHFU7lJSnxyvQhydjvprLYw5VG1R+vGZv9oWMq3BDCEGKHZtr+ADNX3eT
	z80h6mAJN6t4FGSyrOefXpBuYMI8rQ9qfcgBzNo4CxC4Tj4Tlu6k1BqPyv94vxSSn5Esz2OPJIu
	jCwvisNX+KolW1206UYLN0BPeMgnZiZz1SPetrYypvxJuz2/crjhWFTiO2EljmeYePYglquJ34i
	+gH+PJbNVbBXLlfmpspnxXaFTKrbUxYFOuqKKk+QfsI2gyrfgi5GNnkTUiztSA4teOPlWfNrfEd
	6Fwz3ENqDTXJmAsdAIpSj4sWhDJQd0Qy3yFqkQ0Dta1vRkQvDqDpX0D9mkJOkvDQYtTre0bYpRY
	kX0M+GvhDSXOoSLNYc=
X-Received: by 2002:a05:600c:548c:b0:48a:568f:ae6b with SMTP id 5b1f17b1804b1-48a568fafcbmr131049955e9.7.1776916616367;
        Wed, 22 Apr 2026 20:56:56 -0700 (PDT)
Received: from fedora (185-147-214-8.mad.as62651.net. [185.147.214.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5c24d82asm38256265e9.7.2026.04.22.20.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 20:56:55 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:56:49 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests: ublk: remove unused argument to _cleanup
Message-ID: <aemYgUX2B1z4Prbf@fedora>
References: <20260421200901.1528842-1-csander@purestorage.com>
 <20260421200901.1528842-2-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421200901.1528842-2-csander@purestorage.com>

On Tue, Apr 21, 2026 at 02:08:59PM -0600, Caleb Sander Mateos wrote:
> The _cleanup helper function doesn't take any arguments, so drop them
> from its callers.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
