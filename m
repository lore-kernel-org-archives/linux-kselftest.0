Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269302;
	b=MQPvHmD+YrlFWNefc/pCocvUAClCwrStlTfH9e5MH4CSMgF+azRoIo5ZEgkkUP9CmiCl
	 9UvBbYCjcEir/1JfHue2cGdl9BJsJoQNS7LM8SRGVe8Kkr14zfIJWuvcpRnYTOgsOKsma
	 oKGQ78UyOFMKLqOYO9BtszWhC0wD7BHm0/6q/kqZlYR+q98AnVjpTdeltFCWmucAvz44y
	 FeVNvrQV5gt8cND2AUfxXIznNahrLeTab/RqFyZ+3YIifC7vRR3uKAYHab3c+ZCnVVwbQ
	 mQxsfrI4PdX2ofOD4cZPLZ3ZRL1Fi9DZAQ934h/mmOr/DU0TTFQjAKftSei8fkpIabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
	b=Y1cZWyu1/mImrTNQQNx6dUktmWxOnf4VVt8C+ptGte+MetlvbAL9wP0d5vM6ZYGBOVEC
	 cJl2U04snE4lZBRbBa1WCgxffrPD6Jg61fdkrxlprMpV05lB12IsUQwQxKJpLD6sN3iGd
	 xibPt5mvlUwxPJ5naJQXbtAoIsjJ7KMHXBjnrJ0zs5tvkPa9jG9KyDW//eHpU2T6XUd2H
	 bu3pA9mmsAHTGa8ZIbDyOBGpicq8Mg0BbM+9ldxxfuBj5YGq+Hxs5YVAELDGqQIwLqxDB
	 rUXoJuwgFHJ8+JE92kXAkH+Klcn9ZDb02u0+7Gj4HEHCJiQzbj1+jutjnXDDrVfxSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYEkEP0d;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBF606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BBF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYEkEP0d
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so3615349c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269301; x=1793874101; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=bYEkEP0dNxlhTdG9foSUPIsWMX1MtvqNyYtlLTMcLbRq0lyy2cratV0BIr2gtYu5ia
         H4zg9Ixd+52wVE1IOa1nwYwk0JaaaTVOGzCRbxdtp8UMWRBohoa59HBAkTPnVp6UCjYG
         MM5tpk3Qrmw+LDihNTctddLyIJcWuFt153NjbOak20ztDLbLw8MGv7Ayc/Ncpd/eY3Q5
         g7OrNaKPat6T4uqBs/NJ5x4Js0oTp1QyHZlkxvIILTsOo9tvGe6YYKzHiuNHZC8yKsKC
         JClp1ejGPTY4+BGdjE4Jd4Kl1RXPXXteK7SPhdDpfqTYVwJuMrAI5HkWguqSUZ37URHf
         datQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269301; x=1793874101;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=DNvwYgk5DTHSxwQWo0LltsabzcahAJ0uau4QoZy0tgSp7K4I5Nstah9qFGSaIrSJAO
         al5IPEr9BGfmGAZGwcjRpdjOM2RCvb6p0aYQR7dTyVpiSCr5WWi8CVHNKfOyDVRlAuPk
         sBjPXdzwdbi8so6hjhfD7aVLo7etgoMCaYZdpyNw+7THuTtjf7H/Qy03wW0OKuazTvli
         CPTrOB/hsxLM8i5YbFaMPHP3zVs9iWzVGGIT01RxP6arH3Ry3rrGWL9DHKeg9KpXGVqT
         a4g67tZ37nBzljJ+oC6qk2gITB2+lVEXkr2NDoGnbAGESWgENYYxmIGkBQ/W4637UPo7
         dY4w==
X-Forwarded-Encrypted: i=1; AKwUvByMd2BsYF8Gl58DPJn9r6yyiSZflBqJ6/HaGM4mPBeKXmvP0oC21XmKtsTjhDuMD17odO0LVBsKePCTXz7AcXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHS0IXLZmY42UF89cHg6hfzSFAJ+6v1SM3KOek7apv2ad82ehH
	0J9At5bQAYVhg15jG+tpAkVds9dGi9bt0Bc2/epaEON/dHdGEfvoFLQf
X-Gm-Gg: AYBFou0tjx/oUFTlEH+ggwFskeW2BSc5k3wJUSpU3q92qSyzVOvR54tOCEdwAUoNWhp
	lkTAO0QYq6U21zapNU9TKiFoXEBsMqq+hzfhnDxQTky9r635kQk2tqknxUjoNYsx2FfNSzdfWE0
	lVSmyeNl0FneUYxsYlktLW+3ZLHmCWhTfXGoH3EgRGpBVjld97w6i3zZPL3rrWni0Y510dV8Tgj
	rKieMz0atenGPJiUsB1bpVzenNuStbFvobZw/Y9T/8eQ8Tn3uJUtPtaaJlyh8oCo5Z5jxj7IwGO
	oqJ1BlokC1Tsd3b0b5v0r+7u3yMm5IgRUBx77XQFFw72MYAQkJLnz8MffR5R0pN4PkbGC39244y
	h36dpr/XK2qP+N0MTOGnoDJBuEiCsDW43Ymkd3t9Fpsqzd7LYWnH1QBXp+YVsnwoakcLU6c+uX7
	P+FNphhqrCYr/0ZDvWCV0yQ0Iscof36WuZKSDUJTP2X0mTTUeX5XJwwtitH3uzVYpTbLQ8MoD4S
	Mfu29SIKqKZXEszMJdEPtUlginq+DdBW597tvzT4guzMoeEcasvpP0TWSYOCtAJ5XUg+8LlfrGz
	vvHpRTpvdZDZ0XjePR7gtUkDjEJJloI926+XkVkVwISBEmkB9n+yz5qXYH3qHX0W3Ag=
X-Received: by 2002:a05:701b:4211:10b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1a6cf914593mr7053743c88.45.1793269300875;
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm13556801c88.10.2026.10.29.03.21.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261029101859.6893f1a0@pumpkin>
Date: Thu, 29 Oct 2026 18:21:22 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> If it isn't a silly question, how to connections in the other direction
> work?
>
> I'd have thought they'd need that ICMP message to get through.

Not silly at all. The frag-needed always goes back to whoever sent the
oversized packet, and only the client side filters inbound ICMP.

Server -> client (downloads): the server's full-size segment hits the
1456 hop, the router there sends frag-needed back to the server, which
accepts it, learns the PMTU and resends smaller segments. The server's
send side was never changed by 2640e6419594 (tcp_current_mss() still
uses the learned PMTU), so downloads always worked.

Client -> server (uploads): the client's full-size segment hits the same
hop, the frag-needed goes back towards the client (via the relay's
conntrack), and the client-side firewall drops it. The client never
learns to send smaller segments, so the upload stalls. Here the only
thing that kept segments small was the smaller MSS the server
advertised in its SYN-ACK, which is what the reverted commit removed.

Thanks,
Yongjian

