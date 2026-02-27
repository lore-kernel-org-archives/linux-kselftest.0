Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B73876BA
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219424; cv=none; b=DFHXiCAy7FWAfOTBBAmD4cDng4AP3+djRlWEU0KuSiHHRm+ijBQTJNphtiwjb5ekoy/q2IIUt+cfWq9pxkf0J63DEyV/0ax8xcp3GwFTEAjcvi2ImUNx30bgOGHLIAqJqenfpzQqD6MjyY5ZPC0MEe5aSFLTUa4j23J5EiTA4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219424; c=relaxed/simple;
	bh=wRsz6sFYCEWGluPn6aUYpGD4Zes6VntrFKWbRAHPmTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJVoowFs2/4yVmQos15QvMQmh0GJONTInJGfPJjmltl5Pty+rrlNLQvauRNkyTH4boghe8D5F3vcW8rKCDa7lzqdVv1eD+54jGNGZhtOiLxfKG1BbcuWTfG/zz8AYT8SmCPxd0srpJqaLWDkWGtKqnvUTUImVilIGT+7IZ9geOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=VUUmes+J; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="VUUmes+J"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so26349825ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 11:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1772219422; x=1772824222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X43j2DUGdIFSq3q1jZJ01eH8jaKKw5456FRtyKFHSA=;
        b=VUUmes+JdnB8m/B9DbzwHPxu+PKW9jT27j8IHUrKviSvkOnvPLUNFvswy7RiwtUPoj
         zx49BBGV3GYRDmgdYhadpT6DdPRJopqfCaVAmtPU2i4+mLTO1u6nnJIgkNXmLvSMxCe0
         TfYFYW6ZrYvOqckATrwaducMTKkrlPopnn6Hc3xAKmSP0XTBX84Leij2TegqtnBaBKFG
         RZGQQohwhspjEF/FNGRxZo3CtDM8hqjbbl3UVfkgKhP0fGo1/dWeoJP2ftgpFL/mSdGH
         BLF6FV11IX/LsSiNYD1v1VVwiPY5P5TI1gJ3b1h4j/pKc6S4TX+Cq3WWztkKpLUHBxrn
         OvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219422; x=1772824222;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5X43j2DUGdIFSq3q1jZJ01eH8jaKKw5456FRtyKFHSA=;
        b=YgeQD4eUWIcHaa1pdd/ANFq1wsHJgt1AXt7hto+INLa6ZSlfP7LrrgkNR8ct1tp9dF
         y/fzYKUwVg3shlBpwZQptdMPtHMcrPxEGityME7jZMX9n09GY93pB5433xrvO7hYcTQr
         UYGCzBDZ2CJdn7nr4kNVDRxdEAH70esiwsf9riM4PLXJI2/wac6TPmTTxAiKaqxZkuWS
         phprpnAgRt0+GShbCd0xrZfg8IdnvJxDps+7k1F+WpH5CAHXwvBfdsXkjXPVekrBX+lT
         tCqJY8wSEk/AAPDo3FgE8XmhpPhZE2J4fvuz7Hu9MgnOiEWoNNtJRHsLAuf6G7BRuX/q
         03+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiKpPFpV42/0jP7umrDXwL+yGvET7QBI9VsrmqEoQZIF74+Z1sEGwsv2R0ekW8xOl0SXMLl54QXY7QgLYFG/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKO5CdxGh1iwHnk5J4v1tpAF4/olEvgl2TUxSM2an7CIV1s+BX
	ddiTmmalPlpTElc+mkdxpdXvT9xCgrKslOAucU5X86yIl7qA9uOSb99cInkFh6OCZFU=
X-Gm-Gg: ATEYQzyy0Sh25Iky/jGlTP9xpHmkZQUJKNZ9/qK3etG/oeVNtzZdZnBnJDPPIMnw9GJ
	77mwGL9VuH2LNLnZwkMaxjAhtTEfrrI1J1zxGeKAgiw+24RZhjOCE/Y3sOdN31ltOMT7YsRCWIP
	nfLEYNA1pG0skL6bIUtyr6gwtRJln9SyDnPX1+rtgidU5tHO+fLTnTaNCMCU3VlOqOAViZ8zcAG
	hbvko009kYRtBygJ80Knjngue43TwaH8xyaEkgnlZuyJencf/aIJ/QB/SjGms2Oi+3/VmGCD7lh
	AihV2jnTY4QtWca2gu0FVb0P9jOfl6aanQ0U18Ak5WeusLBWwqOr8Rrn4ukTSGOrmITtdgDgkGo
	vVYjHVD11XTzQG8LUitaKQFgOxscbt/565TNs7tGR6ZFVrn0pd/nZikkFNvo+cujR/yFPxl3pxA
	BAMEF1EG2F/kPCzCQ=
X-Received: by 2002:a17:902:cf0f:b0:2ad:bd4c:a6 with SMTP id d9443c01a7336-2ae2e4e2373mr39407325ad.49.1772219421803;
        Fri, 27 Feb 2026 11:10:21 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5e1174sm64053165ad.41.2026.02.27.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:10:21 -0800 (PST)
Date: Fri, 27 Feb 2026 11:10:20 -0800
From: Joe Damato <joe@dama.to>
To: Chris J Arges <carges@cloudflare.com>
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] selftests: net: move common xdp.py
 functions into lib
Message-ID: <aaHsHJYss1lgxmcg@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Chris J Arges <carges@cloudflare.com>, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
References: <cover.1772211065.git.carges@cloudflare.com>
 <632dde7417fc23bbcaf48bdc2e947f2695463e53.1772211065.git.carges@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <632dde7417fc23bbcaf48bdc2e947f2695463e53.1772211065.git.carges@cloudflare.com>

On Fri, Feb 27, 2026 at 11:40:19AM -0600, Chris J Arges wrote:
> This moves a few functions which can be useful to other python programs
> that manipulate XDP programs. This also refactors xdp.py to use the
> refactored functions.
> 
> Signed-off-by: Chris J Arges <carges@cloudflare.com>
> ---
>  .../selftests/drivers/net/lib/py/__init__.py  |  2 +
>  tools/testing/selftests/drivers/net/xdp.py    | 95 +++++--------------
>  .../testing/selftests/net/lib/py/__init__.py  |  2 +
>  tools/testing/selftests/net/lib/py/bpf.py     | 68 +++++++++++++
>  4 files changed, 95 insertions(+), 72 deletions(-)
>  create mode 100644 tools/testing/selftests/net/lib/py/bpf.py

Reviewed-by: Joe Damato <joe@dama.to>
