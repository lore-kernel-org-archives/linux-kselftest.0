Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616C2D12EC
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248954; cv=pass; b=bbUbkPxXlMo5L584dB4XLypgzTxXhBUgUBCv3R/iA3NqbW3eM+7oOKIlOuu72E4pMb2u0i/YlHaZISeP3jzPScmHPmE8dIJcct35K4ZT7OmU+7/DDST9PgIea8w0dyfMwgIyfkhlAsb3cbuPXCM1l6D3mjvWPThkWnz9R1WOybg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248954; c=relaxed/simple;
	bh=FQPZMOJ4kPISPNG5soX6XJknF05kL4vWkbTpQ6PZ6YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp3tpysTtXTEelrAUPQeyRzsnkrLW8xviLYdupZKppA2QTNjQm96auS3vG04VHchHZU2dn0F1OF19ZmrubRsPF78LlT/fewCey8e4uEKGZE+T3RWv76U+wtdlRNk04ED3ETroFJk2uMV+068c8RnCXQh+LbYZrwttqN2g3F52fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD1zBwY6; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD1zBwY6"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so2067926e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 18:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248950; cv=none;
        d=google.com; s=arc-20260327;
        b=Zp2LPF2/ydTk4uXnzNMbdLgJ7PAjEnFTaP4Bhl2WjTlJNBOqsqJqTipcj6Rj0rS+S+
         iUc6fYwmJPTXKusw4IHemugP8psJMM40UE0Cc0YW6dheUTKqu7iroMPlTBkSwAKZw59y
         ZVk+U+HcL0RTaCFwjs1392tPjI1KL2cMr4id0w+NlAOdb4jLUriezRt7n48e+9Mvo+3t
         8nVWa8A4uglJ14xDWLqqjGYnYTHJS6e2sHf/0rCP7vL1H1QhuwNv66HqDH41+Rv0K9Y/
         duhaozqPyrVMBjlj6lXFiOg4ABOYsv6/jiozBfTFenVL6JeQOFDKIqp0sZoiv/13uK7+
         zT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        fh=m1MVMNJd+eoXjsIccPmVKkWi90qJ3UU8VDdHtiDQD6E=;
        b=HsGWxtn9p5O8J+GmOoUeHmMENcqekvnUIoRnKRabczz+X8fGsGbTpP+C6xL+BAifD4
         ZWSlA0rqc1Xh7CqP1sylAmIJaCepkS4zMBfnhv7rU7ixaD+vJPT2xNQ+q+bQXQYoCJO1
         lCz4yTWYqjdGFEmLSPZChwqVPBcNNNmG18k96zPlRScKwzQKH+6kyXPQ0LZmwrEQZJIU
         WZ1REjMUJhwh2lNs1wGsvDScSMjHDkjtKR2WWR8qPCRK17mxHQrqIjB8CqsXrQjO3fWD
         eN44GnDA9ucve+WvrW3e2rnLtY7Uw9jFbY36D/r0+5sI6U7DFiC0E/jHR7eEl/sHb8K+
         MbTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248950; x=1791853750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        b=gD1zBwY63aneQEdRWI9O2+XhnWcnhenMpHkzDzfmr+2Q0LFpCQWs1J5ADzGW0KIPCt
         TOVS/UekxLDmL8+mKDkGKcZoayDRSgPcaYe3huif6OIc4UFMTbeo/s7sE6I0e5mM7VJP
         MLbb856XtAlNuVJ37tpT385z3EfGY9bqI7JBkRjVo2EQYN2brSintBa7xGik1bXmKiMV
         Hj4jG50TAT6qRMV/bAcLy5cDg15aUa8iM0fI3YSrYZKXwKa/2D5HUZuiACWPFyS+n20W
         QrSiwLGMTbXOqMLQ8na9nYcMRMPtLKzWDcZg15qjiZLozv4DR73uHJZy62lPzFmgxDja
         3w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248950; x=1791853750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        b=0Ca3cB4ViAw+DHjErgIceojtczpWWcst7kGHDtyqQ71K9g+6BzykNqJwsHoqzfVqnf
         aBZTGiq1EPTxkhcH/8I0jezz8FZ1oXGMhKgSBE90XO2LPMs4wBxhmSQjOjhWENbE0gNE
         FTuXnKmjL1T3vWW9XhbMpPxG2tfDpsaz8ElRVBcaklDB0NpSW4W6/C9gZlxDI5ug4srR
         xNNpq4nAjqVxjxnhHIN7REe2Ts4a+PATHSllX1KMvx4CIBc7XNgZVf0KcGzpY0Tcd93Q
         i6xUQ+1npu27/wuyM8klnuSAx/ybxfUI4cKV5PFGfYsB7VDXVGqo6xXpQ0qwy2uFXbJ/
         fpKw==
X-Forwarded-Encrypted: i=1; AKwUvBzbSOt+LhK6vZDQE6B8eYge+VaDFn62rWhf37CXViFGQk8Xb7IyrwUmZ9JMtvgkAZuMuc856axeyPPFBOd/E8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAZhn7bVNOac2pK5CH1uFajYcg7rFQBKHV/6WvPScix6kkDMzz
	/6VFR1T0jCm99WNfMgw4bpkHi7Xeez70fiFndV05gKKhn0ZDmX+N4Eq876+Z5B7dQ5NW7ncCz1s
	Hd/e4htM+i2q4C1cPOHu2Uw9vr+j11Cc=
X-Gm-Gg: AYBFou1KSLoFLk6zrLmkhQmSN7hJ3G6ZJYnTT5YTtzwhJ72Kr7JDi55geef/iKhzII/
	caX130WOHo2F4VN1QUNlTx1Y6HAenF9/iIo0vCTkHUQmB7EVmqWucMsqk3JDAK3E0Pe9IKiaYy1
	SROYNHqzNGtvym9/o+hW9v6qQSknaivP+m5L0yhu3rRapkWLxmyvLpW6P8UGZ18u36FaumJmfU7
	JS/ely8HdxDgabauZQr+WK8bDTMUMEHPdUUyIDxokQ7svqe4E3fVchdJ3x4qNQ15bnFqtm6gXVC
	Q24n/farm1guO5NRkIsn3YXVz+E6e2eboyzqLbF7m0wqnlOLVB6OWcOW87CpDnRKmpRPx/plPr8
	lLy1BwE7nqTc=
X-Received: by 2002:a05:6512:2523:b0:5bc:b091:e78d with SMTP id
 2adb3069b0e04-5bcb091e7e6mr4148625e87.37.1791248950470; Mon, 05 Oct 2026
 18:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-5-sigefriedhyy@gmail.com> <20261005164946.25da19c2@kernel.org>
In-Reply-To: <20261005164946.25da19c2@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 10:09:00 +0900
X-Gm-Features: AclHuK-bztab4w1lM2DovGlyn5DZ8ZhMm-bLH4zjSTjG2-Wv3eC_T9ovpy0ACZk
Message-ID: <CA+7S2v+XZjnzxpucTBAaKqLp8FtF92cyHBbrQF8G5D3uT3r8Hg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/6] net: add AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > + err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
> > +       cb->nlh->nlmsg_seq, flags, netnsid);
> > + if (err < 0)
> > + break;
> > + nl_dump_check_consistent(cb, nlmsg_hdr(skb));
>
> Why are you checking this on every iteration?

Right, we don't need to check it on every iteration, I will fix it in v10.

> The changes still lack polish IMO.

I will go over the series again for v10. If you have something
specific in mind, a pointer would help.
