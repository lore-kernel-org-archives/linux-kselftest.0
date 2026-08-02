Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C31318EC5
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696583; cv=none; b=mmCIz2ZurvA/+kcGhPkZ+7EV8m3R0ShNInHbInduGmYgTSXJQrIfyYdCknTLEvDqIIdsyyewVKiqe3NDcbSUjQucwAufI6B+VYZ5JnHxRJ/W3V4BNN1postkkXsBN1vpkQi+xDZJdItlsM6KNgODD1XiaIR/cgnvsra/x4eYqnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696583; c=relaxed/simple;
	bh=FItujQTaL37fnHyc36dq92juCbwZqjbsZ66OaWR5SlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I743YVLygLevlfx2XGoxAsm1FLFQ5Sl3Ye0iPNIYptw3hStvNIauxmKDEdz6vh8xmMNLtHdiadiyVru+FYE1Hinl/oZ0hKPxpfdUroOq7vRS6q3nD07gKRKCGRvRJe8VXl/y6/BwJO//jRPGN3slFZo3ML4oJNaTOnE7a3+KGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSiG9w1I; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSiG9w1I"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6682259cb3dso4585655d50.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785696580; x=1786301380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QI6mRtOQUFw0EJeFqBwofkcyAca+4a6EqqEAU0Swdws=;
        b=JSiG9w1IFzYaBbSLjg98eoYHxDuBID4YfVTnQBpDbakQf1/2YEo3FRQ5mWyElteGHD
         TnfgIsGAOg71Mq7xFl/77B9d1AqjAu6fXx0fhsRDAHl6DjoT7CygCfUe5Mp4IOzoAKeU
         6XMRQETlFqDgYzwmMaBQ8jt4JE/XoECyaah8QS23ZRTltTodBxdv7pzWb/XdmiGlGzQB
         U3bnzMeKLvdR6EA5eA3dyB7+OIxC1q6VHvFXOADQ96m2ONAeBNhuxPfDuu/iduQe8YO1
         zlxmoU6dBBMj55azqAglnU/pSHqxQeNAaQIkxV+kqt4w9NlXXZdpQ+rHU3qtBQPrMS4U
         VC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785696580; x=1786301380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QI6mRtOQUFw0EJeFqBwofkcyAca+4a6EqqEAU0Swdws=;
        b=UOWVanmCKE1juvCuiQR4j//t7/I3mQftHKVyc41RblHwTq6dsXttzbuYQJ5nYjgsDw
         EAHmKYJNT0v1IJALrzfGUHphWOU+PAeHVIfxDhQBUdnrItqS81HmR54VlQ2DNE5nzotm
         QWd3Xt33W/Wuxz5RmFyTaq98xUGfFgCatyIxbqBZZkw1R4R6NTlMTEqfKBjqwu9mP+Dg
         Cz53tDrwbV4DovyDvMerAwzclFbMoe5J9pkZm8b03iHX9ftMfEpfyTQT8fpNNAE9gB8E
         rG5x4ErmoSPjhvNpNdf4wBS3v8BlYRD4c95Hg38PXt2rpfhvyHFJXi7yVZQyX7TGYSIs
         XGmw==
X-Forwarded-Encrypted: i=1; AHgh+RrIW5T6fZlOwMp1aTh+G3OzEu3SZpg+GmnykEuixrTLlkCgaUmfy5bhLmYyW9nyEYxLImm1NMavfic828YkwjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMIyumjCy+JKzS501VNShJbzkfVauKGX8mloNYM5BFfSsVlkU
	EozGx3pXTocTLCut7S/MKe4bVBFIHaKnk/77fxOE6lijV/mmGjtQUZxMHA0+4g==
X-Gm-Gg: AR+sD12S7kPWSEeJ1hiOxrQ/SH+zDUbTvT2nK4aScwf6xINSLU8I8DguFoNun2YUVwa
	V2hzltOAwUeZetIczmLKPdSTZxOcDRMAaoN8vK0ejTHEVp+9ht9ueukPAf3QUgeZ5hT72/UENoH
	HdeSoHUrTEIc8vB0UcDG0Qzgpac5c0BuJEB2SZY/iAlwkIVyTkhDZmDXwl80mOS16X73o154XW5
	u0+FSIuZDbaTOYEVmbu01mkzL2bDSjG54dWslDieqojxRmqx/je3IKq9nIOiAPXp08PEzncVIel
	MeNSOeOZaXJg21V+JmaRu5/Xz3CRy1Eor0fj8TsK+x0OybEFa8lSmlq7a53jQ6bru8j4l/h5aYu
	LQIlwVvbaFx5u8/A/1gUg/06JADP2PSG7mkSElQTRuyjQWVqzzcq9xkjKp1iNeZI7liUaYg8u3O
	DJ7KdpbkbmgV6kNmEFX09pMtlUVphhKpd/X2ILdzE9honLkJ5mJlNfijBrBs5dopFplg6WAXZBg
	lsvDOs=
X-Received: by 2002:a05:690e:4808:b0:664:c5f8:e342 with SMTP id 956f58d0204a3-6694f84c666mr6818553d50.3.1785696579807;
        Sun, 02 Aug 2026 11:49:39 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6e:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6695ea8f0dasm2190358d50.12.2026.08.02.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 11:49:38 -0700 (PDT)
Date: Sun, 2 Aug 2026 11:49:36 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 1/2] ptp: reject frequency adjustments that
 overflow scaled_ppm_to_ppb()
Message-ID: <am-RQKdxY0_S0kgn@hoboy.vegasvil.org>
References: <20260801222923.39017-1-deepshah146@gmail.com>
 <20260801222923.39017-2-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801222923.39017-2-deepshah146@gmail.com>

On Sat, Aug 01, 2026 at 10:29:22PM +0000, Deep Shah wrote:
> ptp_clock_adjtime() validates an ADJ_FREQUENCY request by converting the
> requested scaled ppm to ppb and comparing it against ops->max_adj:
> 
> 	long ppb = scaled_ppm_to_ppb(tx->freq);
> 	if (ppb > ops->max_adj || ppb < -ops->max_adj)
> 		return -ERANGE;
> 
> scaled_ppm_to_ppb() computes (1 + ppm) * 125 >> 13 in s64.  For a
> sufficiently large tx->freq the multiplication overflows s64 and wraps,
> so the resulting ppb can fall back within [-max_adj, max_adj] and pass
> the check.  The unclamped tx->freq is then handed to ->adjfine(), where
> drivers scale it again (e.g. scaled_ppm * 762939453125 in ptp_idt82p33)
> and program a bogus frequency word.
> 
> For example tx->freq = 147573952589676412 makes (1 + ppm) * 125 equal
> 2^64 + 9, which wraps to ppb == 0 and is accepted.
> 
> The caller already has write access to the PHC, so this hardens the
> max_adj sanity check rather than crossing a privilege boundary, and
> well-behaved user space (e.g. ptp4l) never requests such values.  It is
> a follow-up to commit 475b92f93216 ("ptp: improve max_adj check against
> unreasonable values"), which handled the analogous s32 narrowing but not
> this multiplication overflow.
> 
> Detect the overflow with check_*_overflow() and reject the request in
> ptp_clock_adjtime() instead of acting on the wrapped value.
> 
> Signed-off-by: Deep Shah <deepshah146@gmail.com>
> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

Acked-by: Richard Cochran <richardcochran@gmail.com>
