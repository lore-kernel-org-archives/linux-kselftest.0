Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC4386C36
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361427; cv=none; b=E7GfuBW+mUp6V4OwAj6VI+652nLiG2SnsvIO6iNqWB7t7tV65B6kleeslzEaMtOwmWczVJxlthG8qtp/fHpFPBRpXU4+yBnzyEW1XTyj6UYtuHHdD0Agwt7//xW2VGLTPl8/r1Hmm6JYukmG7APUZOIe2ukMDf24eEmTKY43/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361427; c=relaxed/simple;
	bh=ObiSmLx1vp3nTPUnHoufN7msYecVmO+SBh33oVQIJEg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=oF4OzpyU9EYR6c1nU3ePuCNxCvodyamq6SvqHz2gff8sLyxPwU0NfHCTwwEvLn3XO41HkdMcGbgzwKTV8kcVs+Aj0r5YvtyVypBqN8Au02dOGllSXYF6dDUdKdGG+SS+VRAxbZ8N/oQ+EdhlblqjRoi9zO2Qw9MJHQVAIi1lLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAvrRO0w; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAvrRO0w"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7fe36f1be74so46491887b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361425; x=1783966225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZ0WjjQDXIgL/o11ypg6tIN5gUP5sdHKhZMCBbiGhfQ=;
        b=WAvrRO0wl+jl4enFW/MKNpU2s8eKch/N94a/FD2wHGgl+u8xni/KauL+GqeEyL5cVI
         y/NPjeRCmRJfa+TAZVpkUsWAuFDCs0IWWD/P1zATo+Wn6E/miWsqFf+Xd/7VrQ6EWhXv
         d+MeJdnEPNG5GLhcFOv/bHMTfbzm7RVH2Bl/WdxdQ0inyvK4ieLPAoZ1HugHE/KY9i66
         0AMhBgvIr+ddPVKw+raYJ/G19i1bqWXerVA4uP4Z5p5u/p9x6f8d9Y8YY/oLmdkmK419
         PWFCUWpZRIGGbggGUq2dq1/uOGCj0G9fDLo+nm98PSy5aYv4hRK/TtSf8fNg8oSa+2K2
         xwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361425; x=1783966225;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ0WjjQDXIgL/o11ypg6tIN5gUP5sdHKhZMCBbiGhfQ=;
        b=nCtDeq445z1sPPdLj5YXPXAjyZegNSIvQa4NlzA5Lq0Ao+garXxv6DmZ48uUy7rlnn
         YoEmwaCektEx+fn4h/kDyWRAsNg81XCxlJWWoOskDV4VHXUwmsPYSpHYiqmhzNfaZpkq
         HDC4j/lMmQIq+ig+5YYRJsHbhH2pG86U+I6bRIInTip/R5Dd3B56SeuPpaw1X6evfxPS
         cAp6+qhNGLWCgRD63qFkOGUirBJrp33UO+KEX4ehusNvkAdOCb9GczlLw113N+7snkcx
         OvOtjna8jQtRixrbEX1SUM+FCg+0jOSDU8UbMLxMW8xUW2db2Bv2XCRknXnYNR3P1V35
         eUsw==
X-Forwarded-Encrypted: i=1; AHgh+RoFPOek2LOa8Du4yBUA0Yt7FhBBmhTWa91VViNN6fMgtbilvh8yJzvMhss25L+SizPo8xC7z6/Hq9RDflWS4lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcmnP7//w9g7/XERMXObV3kQx1giGlnbiBbX9nvtQGLIGPOLXi
	FS8ONI2MjFIXGSfQS4cPaEpiO/ZnW707GysNn+I+T0ODJUFeK6bJN/NtOoBzQg==
X-Gm-Gg: AfdE7ckHV3N1O8rlnJZ0iLFqdh8MZwKGIxvHX1ajMBXwPX/r5PaUdND9pvqUiHsriyC
	Zi+Opf5shwf0A2I8cleRgmMpT2Q/ja6stEZHRCgjmjhkrDFoEfBmvDS3oSz9YeJavrVLE/gUzdD
	0sFMe9djWjKkipmWVXBz/Hus5ipBu13H2ZCeQhTEGRJWKpk9+fSmXcTJsam51nQK/QIgBWsOlrJ
	CDkWrJKyTRovvhvDtXkB36dnMLFGuGzHmCvliUIMsimAjCb0mMpoSTRL1/XEIE+KifMz1p1f70D
	01lgldMf88yl0eiMMy6ORjcU8n3FizPb7MwRqusYBqmjKEhn9dy4awSTfd4C+QqMD+R3wZnyQJG
	4MFMTpfxHxVa/b4+IZM/81lTnV+haddxXgAgqg9ZDnMkvdDATftxn/XId51fpF6uE5T+csV4pKf
	XrGjGsz/+4IN8pds6SohLr6fkG/IB2FsF+52qdyW9jGRDWMYDq9x43Py8Q72lK+1z0qw==
X-Received: by 2002:a05:690c:4c06:b0:816:a321:5629 with SMTP id 00721157ae682-81be4809eb4mr10911757b3.71.1783361425326;
        Mon, 06 Jul 2026 11:10:25 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af52027sm61232527b3.25.2026.07.06.11.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:10:24 -0700 (PDT)
Date: Mon, 06 Jul 2026 14:10:24 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.f82efcd5c32d@gmail.com>
In-Reply-To: <e00539aa8c6f9428e7e92be0c0271c0d7e13a33c.1783218197.git.littlesmilingcloud@gmail.com>
References: <cover.1783218197.git.littlesmilingcloud@gmail.com>
 <e00539aa8c6f9428e7e92be0c0271c0d7e13a33c.1783218197.git.littlesmilingcloud@gmail.com>
Subject: Re: [PATCH net-next v5 1/2] udp: fix encapsulation packet resubmit in
 multicast deliver
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> When a UDP encapsulation socket (e.g., FOU) receives a multicast
> packet, __udp4_lib_mcast_deliver() and __udp6_lib_mcast_deliver()
> call consume_skb() when udp_queue_rcv_skb() returns a positive value.
> A positive return value from udp_queue_rcv_skb() indicates that the
> encap_rcv handler (e.g., fou_udp_recv) has consumed the UDP header
> and wants the packet to be resubmitted to the IP protocol handler
> for further processing (e.g., as a GRE packet).
> 
> The unicast paths handle this correctly by propagating the return
> value up to ip_protocol_deliver_rcu() / ip6_protocol_deliver_rcu()
> for resubmission. However, the multicast paths destroy the packet
> via consume_skb() instead of resubmitting it, causing silent packet
> loss.
> 
> This affects any UDP encapsulation (FOU, GUE) combined with multicast
> destination addresses.
> 
> Fix this by returning the value from udp_queue_rcv_skb() when it is
> positive, matching the behavior of the corresponding unicast paths.
> Note the sign difference between IPv4 and IPv6:
> 
>   - IPv4: udp_unicast_rcv_skb() returns -ret, and
>     ip_protocol_deliver_rcu() resubmits when ret < 0
>     (using -ret as the protocol number).
>   - IPv6: udp6_unicast_rcv_skb() returns ret, and
>     ip6_protocol_deliver_rcu() resubmits when ret > 0
>     (using ret as the nexthdr).
> 
> Both mcast paths now follow the same convention as their respective
> unicast paths.
> 
> Suggested-by: Willem de Bruijn <willemb@google.com>

Please drop. No need for this based on just feedback to a previous
version.

> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
> Assisted-by: Claude:claude-opus-4-6

With that aside

Reviewed-by: Willem de Bruijn <willemb@google.com>


