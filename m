Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D3421EE6
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820064; cv=none; b=LP8oH8QvmOoGS67OUg8fKgaXIH1tXm079+JBNUzCVUJa1SlqWHtsCmQ4L0wdJXpjyJRQiQjhBEAFjajaKyKrMn/MfqgaPDAyPIPR5zHr4P7ecZokETy1t7XufQJaqlkXHu/0Pkti9+lsGnC2pVVuMf/tA0vjelfNWikVNXkBC4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820064; c=relaxed/simple;
	bh=qnEyiN5u94/41O9QO9WxqSZ7r8D6BDUT3NnBsTYeLmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuyxRmA8dCz/o4XARjUdGcwdosczHJH9k6cO0n02aevUvL+Z8pIQhd/3NM3JRPTYtwBAIcbdNrx5KvJL6t9V4owPpbLhPkI1008uhiu/dMTkmgWc57o63swX2V62D/Jtw951N2hx6SZXucIEVdv8zDxMvCqV3PQmvyfvPJ6E7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44c350a5b87so6488760f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820060; x=1780424860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Xjm65d4RA9kC6fH+CTvtbYudzgt6xtf0Gx9rb/6JI=;
        b=jrfr66Gy/9Zga0VFqD7nkCTEW4FuWCVG2gzocvGcF5cRcQyKKg6gkCwxp2iIPEL6Jo
         4siVMlORxKP1ni+g1d2kXsU/pSjhVTfMMKuy6Tsgr37fcwdOeVo9m7ua0IYZt1kSpQpz
         oOYc5+IXHD9zrzYL6SSS/KfFxh1jkrpItlOf6PobehmVKQEUbD/sWS8GQXGRMhkFPq9r
         vudG7QkiU5xewFJQwbjhB//YKAnDZj3o1jvTwLruJaW6M3u9+YGpIrATjt1Su6xL7roU
         remRGQJOgBCByoWRKyR6lJxMkFiXPaShVEFHodEx4Jpi/XYQk02yEX466WznjwKl0oYA
         y+lA==
X-Forwarded-Encrypted: i=1; AFNElJ99JC9xV7x6PWjYEnm7t4pnIX9pdiQ1PnDBFdk4x9bxBDzVqH82GfLqfrULrynd28i10BIMzHPfzdgLmV96OiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytouW4zPkOXuzEBIC9JgpFg631G6jjYygw7IPZtJ+lbZIi4sy6
	pyZItiYqtP8p28Ullz9o2ApHw+mHV1CvBycE1E2niZnefIFiXzLGybZG
X-Gm-Gg: Acq92OHBw/4kIUm4wJqTrmDhdssQwIV5+EAuKIsqWbNAHvLZ9l/eWbvgTul1WX72ys/
	cxCK3cdS7sZPJCeB8L/V3aLbDj87FhGjH2BjCmpa+BMEi8KyPorWAs9i6e6E/f6Unkm4yXdRzh0
	bMPa3nGxMgZ9NTnVDsANqQP0m00lkmHXUH8YmTv7Xu/I8v+tIkZAgJGbWciRDIiym8+R9iZoH/s
	QeYGeL+w5/YQcOPZoWMv6ZCLqnKm+gHLEF7Be9yIHh++G2S+lyZlZjipEAvFdBgBj/9E9UQb+x8
	ZP7+AfTkIxH73Jq3TUbmqN5vaRRfT2ihmnhyh54nnxKwDPUeQiiLQcuw3CSGlF+W+QByXB8SQ5X
	XUmhPtzSto8fkjY1XvFmSl4Hr2lR8I2K4rpfE+IaaCC+9Gpm++JLKT0BX7qtcN1O6oX3AS+lMU+
	KgGAJlPNDyit/V+kw3td2pdE8T9b8Ia/eckpnB
X-Received: by 2002:a05:6000:470a:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-45eb367fb4dmr26397188f8f.7.1779820060171;
        Tue, 26 May 2026 11:27:40 -0700 (PDT)
Received: from gmail.com ([62.197.47.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm91361f8f.12.2026.05.26.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:27:39 -0700 (PDT)
Date: Tue, 26 May 2026 19:27:39 +0100
From: Breno Leitao <leitao@debian.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	David Heidelberg <david+nfc@ixit.cz>, Samuel Ortiz <sameo@linux.intel.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH net v2 0/2] nfc: llcp: two fixes for nfc_llcp_getsockopt()
Message-ID: <ahXlNRH6Bzv_4_gq@gmail.com>
References: <20260521-fix_llc-v2-0-ab44cc09179c@debian.org>
 <20260526173351.GB2256768@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526173351.GB2256768@horms.kernel.org>

Hello Simon,

On Tue, May 26, 2026 at 06:33:51PM +0000, Simon Horman wrote:
> > Changes in v2:
> > - Guard the length check against negative optlen (Simon Horman / sashiko).
> > - Add patch 2: move llcp_sock->local read inside lock_sock(sk) to close
> >   a UAF race with llcp_sock_bind() (Simon Horman / sashiko).
> > - Link to v1: https://patch.msgid.link/20260513-fix_llc-v1-1-33c76f931ff6@debian.org
> 
> Thanks for the update.
> 
> There is an AI-generated review of this patch on sashiko.dev.
> It looks like it flags pre-existing issue that doesn't directly
> impact the intent of this patch-set. So I don't believe it should delay
> progress of this patch-set.

Agree, and looking at what sashiko raised, it seems reasonable, I would
say the state check in llcp_sock_connect() is incomplete, and
llcp_sock_connect() should refuse non-LLCP_CLOSED states.

I will send an independent patch later, if we don't hear any concern
from anyone else.

Thanks for the review,
--breno
