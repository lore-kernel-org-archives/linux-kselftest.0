Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272849;
	b=yLJptcweQFvicMZ5GsJu/v3iwc4OhyJSlZKR8wWbstHHMYLHdeY6GtPQALwJbeh+h7ev
	 YhF8Hs+fikhZiikis4CWDcGm6rUZ+Zu1roHE48u3D0j+IKn29Pdxd1FZVvFRQ+AtpK/ny
	 MDwd8O/Xd7hz8y3ebSuemUqhrjWjstmJM/mRFhe3vM5H6d5pQp229cpL3NWydlfBk4shI
	 f6NvK5dqgohTJMWou7jxqwYQTTsRU7iwCYMnKdWQSKchWgIEcL5HTFHXfoQVQ8QyqaqJx
	 Y36XdnaxYWV6uIwlCC2zq3mQxcYFJ8C4YOkItrai3T0ZPZ6SHGkgRPFm/d/htLipQ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
	b=tEpa4rDZNphuczDrCvAyhNGGwyXG50q7cF8vZEApf6fPBlIUt8tlueqNraQRbrrv+dWo
	 zwPImlOdYCagXP9HCJXfyr3BB0mAAfFhZ4xBYezQ3IqqSgw2Afn72q88kaK0quvkoeN9V
	 UfPmRLdVhZc5rvWL+5jgMMFUbyN9qcyXU1LNCBwHOeefxYwkaYP/8+pkC2fyUN/+A8sOs
	 I+Lx7PnwlAM/TAo7GarjuKmPRAJtIT407RbwabfgOssTMHHpXNS9sjrs/H4ckvFzMARSj
	 8bbgymDJblZThyaCq7yB2EqPwoeSOrVxd8SBMyXZjzS5gZk0um+FIN6DtGmu8ajK6Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qk8g6IaN;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CC606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qk8g6IaN
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20767265e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272847; x=1793877647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=Qk8g6IaNzLRC96s45UVqwO7Akh0xDEgB2oB6ShZ3S3dAYnMFYwSN6XIQ868uHVjD3w
         xlEevPfhiO1ASAnLxtEQGJJgjbpXJ5AxBnKiBeurM8yl/wFHElO2uSuaAtHqzLvf+h+D
         zd15rVtpEmpuYzm0wON0ynBdThtALn54vYy15737THserh8ttgQtYd/xsNDfCfYNqV2S
         fgzwTmB3aphkX0C6kAHV/D+5UC8LVvM2pPQtp3K+7IlBziBJS4eEeLcBBW11fzWbOlI3
         sWewwss36PTuCr7WyM0SVmIhkVQJ6EVNkkaKWrzk1Kdy8xbACOcCZ1VHGMxPR0D6LB4L
         AyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272847; x=1793877647;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=m86CS6rq5Y28vBQMOvYZdgZslyvKZBeqrZRKBIt5L46W+W6V1GLalSZk2o2L2uNfwk
         vECzWegLAt77knAKB5IYuBNuk2loWd/fguKyYpto6ipnzipbKPylYvslvWvz1ti8Ddkw
         1Gngu6KnwzSfrzAu0qVyJ6ezVSpKKn1BjEXVg9x176K7FtVDqm+romW77NCpqmWvQ0mq
         gYpIK2TGf3MKE09rhzhztZqqphx4K92yiNn5IDz0bO/LAxr7H7ceAeQcwcZldYaJv2iX
         oW6cVBqDkNK6skmkDYQpnAS+B5OEUCAnBMNbUi797RY93w944H4mp72iRi3ZoeWCBbW7
         WvhA==
X-Forwarded-Encrypted: i=1; AKwUvBy3PpGGOTEzk05bQWCnLMO+nP3M3qEe4nLdRMu2W1QSWHP9hDgdWftWLISNIa7ygznhfNBqzxjz0XlzovklwCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHegz1+4s1u6vGeL7TGS6fVGfBfPocZG4Ga78xqQtjbbHEVAy9
	7sMWREC7H+FW3G2RIZO3J4GTMnPRTfrlBRheygjh4s/hGIWPWgssRnmv
X-Gm-Gg: AYBFou04T6g5ZWkkiYw4ST1TtSppMmKIAaJvzmgOmFt9oJIwB8DpRqudVylWFxdCYei
	EFoZvrGpNke/7bMbYEa9oFftWeyfYAP+GvcrfIFgTcXYXOzLHcRVpvkKwQJtnwqfI1eG5fhBypd
	4lgFC3EdXCN0mmEnKwXp2XEWqu3ZbyUyOH3NYzX5ACRJKyuxZruONmJTM7V5qA7tEuVs+5TyNUE
	qvg0hMYOKiC9KvTfCVmJ5edQITAYNOB+c5afdpAOcnYOpNlku+cMc7saP8LFaeSta8XTan9vYWi
	rdqgfipnWOxUNCAKDZTePX18T16EZDXQNZdHlCSJgMiNFpdpV45urUJ7szPf99A1E3vGbkohZvp
	CqGMGHOsZiSALDyCUqhbOGmBFMeY27gMLkwt3I8BAxM6t3f4G3LE5nulWBS0JQtPR7MbyxAT8Ea
	AfMzG5NcdhLoxat+WwCDL8j2hUp3KCdaz7fMubnKJDLxo4vYL6SbnQ8RUdSwCnlEUC/eUHqeLoT
	JdFzhi5g0jSK2NfVTpbhf5AikMIZZxoikbK/8pSVqn3OreYPmB6vLG5cwKkhbWUxLs79heBLUR4
	4Qycj+i6tjRYcJhDmiE4fvlPpBJW4ITR0MPE7XYo4kjbMhw0aLxLJ/Hp0U30yYJ11i0=
X-Received: by 2002:a05:600c:8184:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a967016ae6mr109930585e9.18.1793272847111;
        Thu, 29 Oct 2026 04:20:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6419e05dsm5345525f8f.19.2026.10.29.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:20:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:20:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius <echoowall@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, Shuah Khan
 <shuah@kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Eric Dumazet
 <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029112045.5e7d4317@pumpkin>
In-Reply-To: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
	<20261029101859.6893f1a0@pumpkin>
	<22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 18:21:22 +0800
Esko Mobius <echoowall@gmail.com> wrote:

> On Thu, 29 Oct 2026, David Laight wrote:
> > If it isn't a silly question, how to connections in the other direction
> > work?
> >
> > I'd have thought they'd need that ICMP message to get through.  
> 
> Not silly at all. The frag-needed always goes back to whoever sent the
> oversized packet, and only the client side filters inbound ICMP.
> 
> Server -> client (downloads): the server's full-size segment hits the
> 1456 hop, the router there sends frag-needed back to the server, which
> accepts it, learns the PMTU and resends smaller segments. The server's
> send side was never changed by 2640e6419594 (tcp_current_mss() still
> uses the learned PMTU), so downloads always worked.
> 
> Client -> server (uploads): the client's full-size segment hits the same
> hop, the frag-needed goes back towards the client (via the relay's
> conntrack), and the client-side firewall drops it. The client never
> learns to send smaller segments, so the upload stalls. Here the only
> thing that kept segments small was the smaller MSS the server
> advertised in its SYN-ACK, which is what the reverted commit removed.

But that relies on something having gone the other way first.
In general that won't be true.

It is almost worth implement something that retries with the shorter mtu
to detect the PPPoE mtu blackhole at the sending end.
Or even just use the shorter mtu for long RTT connections.
It won't make much difference to throughput (maybe about 0.3%).

David

> 
> Thanks,
> Yongjian
> 

