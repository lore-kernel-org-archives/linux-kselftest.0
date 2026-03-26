Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FC402BAD
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542551; cv=none; b=f/EONvRQDPJtSB0xZO402+lc+I1cbhrUIDAv7DTxjhhVDE3cyFmuw5UqXo7hL4OP5fGOpB4f3bwPewhZyYg7Rb4uuXP3sXw09QNk8qwY7oPafYjQ/kFfAzu43uamvT7kshHPt3H4v7NF1AWEpYQtssSJ/Z3ZNBt76uzxsz6fRwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542551; c=relaxed/simple;
	bh=z6GMWOCYmwQPpclwbRHQ3L8tkjcwK1pnli6GFBfiIKE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=ZiDcTDD9rAIrr2qnlYZDbf2LXgDqUptl6VWIresqMmi8yCGQ6F19nJkiXlkoyzo2heLQtruYql9HJUULNkS2r2mdWohqbxStWhYo2MBrshQQ6nifO9uph/BjV88WUD+i2YQJ/Qspp+p/VY3475aZXCHDc5LxVrs4dnqJodHH0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jb5+RN/w; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jb5+RN/w"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ae222d978so1287808d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542549; x=1775147349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDlf2p6914NjJVCVaq2Q/Nq8XSjjhMKVxHPhxp+UG88=;
        b=Jb5+RN/wcmRrbnOKzgXeeDbTGMsRT1cr+jjEF+HdsswaqYWH9wBOTKkHp3MQ/Z/0iG
         KmcOQuVStTRWRh0vCysHuGOHtd7tkfUTHzXpIUJtP8Nc0TGmwrBw5QbsPEjO8FjoEA8N
         W+rcytTfs9K3Atk3eZ+dxwE4dSlAVOga9QOyBv2/nv0uJVivXhzLlHiMmxF/TNdC0xE4
         JjO5xiuz27vdWX9zno1Z6blJ30yXzLfRg9w1k5uY36O0j1wH4gBpXo093g2jlfAL4xyX
         ztXKRS5NRfJs+LJtPPdmiHMX+rRWk5adv0vl7IrYPg8b0XeYNMUcE4ZXivkmf40VCnav
         WsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542549; x=1775147349;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDlf2p6914NjJVCVaq2Q/Nq8XSjjhMKVxHPhxp+UG88=;
        b=mZ602vVNSJTf+y4HSUsMnjBnxx11upAD4e28GbBObbgHCwVQ+anQuu4Onpn4HB5Lj5
         cHYmApfleEcwarU59PN2ziVlstPtew5nxQYsZVCH/jHk/0rOVtcxg7M1XHxIhsxvHeqY
         vLfseNgDabH+KrDdGPzqsa0EO8bC2gZDLffnnL52pS0clWgNGdASlvL56YWyR+PZZb3d
         2sF4cg4vgvhhXoj2WO8sVUmH+gZLb6OT1tVOdBi+qefDBarjs1sU9sewTutWK60ICpyn
         RI1JmUK2F+KthZUTUOZe10rM/qk0SZ2zg6tJZAZ1zMp9wKkn3fmD/0xuWBNvIYIDQYFs
         +4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW3wGG2NZZ2Hi2P4KnZbIlqi7xlJyxFSyT7hnpzS8qE01lVD71QPtJR/muDnUG4d3ehgiJk1olm/hr1hjlBaUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWrPQghFwBLr75E/4NJcvjYYoDWjKjlYFBnKNI9HpBpfgckZT
	xvpEbXmQ7J3L5+fQCB8RrMqYHCgHfMTct4QTct7uHLtnHD+uueP3ibVh
X-Gm-Gg: ATEYQzyGs60yTLyc/4a0RSLaAIFE6ZsWgizEcWRU+BRna2wU8Qg3yybM4kEUgSeH3eI
	+c72aAFUS1PEH8LbgN8iQv+NUcY9J6Jl4F+iedT4yu0cib3Ci2pfC6hNFwPYmJRxjO7k+ggmcrg
	hmXNvatC0ar5kxcJ0FIHbHfL+ZcZNJiwK4m37Eeb6sXdQbgmMTw4qjckEYBSicGYImgS7ukEjvO
	iJrauPmK2LPue85SD9fvDmVeCx4flwwDjezsSiWlKH4PBkpP46RQqM+NpFeenlBK5jybtWvZ7m2
	9DUEy/LWpKkKaSfCmZLR3AqIYCj4rPS9bCqI8JfceU3VJgM2DES93s4giKbFXILoJrmB/XshapZ
	GQkEoRYBk+CLjq5Jk4ivVjAang3M6+japHB09G0IsWILbZQsiv/7rk3rpqIbjgSVJ+CTbiEayux
	DfzW+8mHSeKwr8UMiqHbUJINDcpkDeTT2WZr/2vHP5/bpe6iAzh3KRcbseEhNL2d/i1NmZ7Og4d
	7C+JKKoDXvZSjw=
X-Received: by 2002:a53:e105:0:b0:64e:ba77:8412 with SMTP id 956f58d0204a3-64ee6185ff2mr5998843d50.73.1774542548777;
        Thu, 26 Mar 2026 09:29:08 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64ef58ca09csm1662948d50.5.2026.03.26.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:29:08 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:29:07 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 Petr Machata <petrm@nvidia.com>, 
 Richard Gobert <richardbgobert@gmail.com>, 
 Anubhav Singh <anubhavsinggh@google.com>, 
 Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Message-ID: <willemdebruijn.kernel.29bf4e0691478@gmail.com>
In-Reply-To: <20260326081127.61229-2-dqfext@gmail.com>
References: <20260326081127.61229-1-dqfext@gmail.com>
 <20260326081127.61229-2-dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next v6 2/2] selftests: net: test PPPoE packets in
 gro.sh
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Qingfang Deng wrote:
> Add PPPoE test-cases to the GRO selftest.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v6: new patch
> 
> I'm not sure if I should include all the existing IPv4/v6 tests for
> PPPoE. There are tests that hardcode ETH_HLEN as the NH offset, which
> are meant to test the L3 protocol, not the underlying protocol, and
> changing all of them seems too invasive.

Overall this change looks good to me. But indeed all the churn of

    (pppoe ? PPPOE_SES_HLEN : 0)
 
is a bit annoying. Left a few representative snippets below.
I think that could be avoided similar to MAX_HDR_LEN by having a
global definition and using that everywhere. Still a lot of churn, but
at least no repeated open-coded logic.

Also consider whether running all these tests again in PPPoE adds
value, if not, then indeed trim the tests to those that truly add
code coverage. 

> @@ -745,7 +777,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
>  	memcpy(optpkt + tcp_offset + optlen, buf + tcp_offset,
>  	       sizeof(struct tcphdr) + PAYLOAD_LEN);
>  
> -	iph = (struct iphdr *)(optpkt + ETH_HLEN);
> +	iph = (struct iphdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
>  	iph->ihl = 5 + (optlen / 4);
>  	iph->tot_len = htons(ntohs(iph->tot_len) + optlen);
>  	iph->check = 0;
> @@ -755,7 +787,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
>  static void add_ipv6_exthdr(void *buf, void *optpkt, __u8 exthdr_type, char *ext_payload)
>  {
>  	struct ipv6_opt_hdr *exthdr = (struct ipv6_opt_hdr *)(optpkt + tcp_offset);
> -	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN);
> +	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
>  	char *exthdr_payload_start = (char *)(exthdr + 1);
>  
>  	exthdr->hdrlen = 0;


