Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149948;
	b=RmaF+ysMHLePagtw0ywOVt+Gm1JKgunOnozlAIFLIGoVyMaqqex0A5O1HoC7VN1dnAww
	 8WLoe60w1qBNr5GO6Cm2hU3/DkBWPTWuwRUmubne/sHz33Z2LrcGVfP068cSDXXndgCyM
	 o+ncqdXR8bQeybAd5g61514LZr9cn26DzluGgaPEkgP1WzACf9d6JqGXSL3FtGuJxqUKb
	 h/ApkB/E0u3w3HGrpS2hlTxwKj4g9L6RAXrqF7zhUsiPK5BGvMR32AJQXtEH5N2YGxOIu
	 MxyfZOWrdxMSQWcIWeGtaa+6PBfDUflITZ6pRQjwgg2ppcRfnTVAYzbGh7R1Ts4GEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
	b=0uk3f9YXPJ339/YluTIU14/YKyoqiGiL3paYRhu/ouUnyODEjLMJ405JJTrm52oSFyko
	 OWwnUygm9gpFN1YG6U+tPb9edy7kh5daVy0GTo6rjiH6ysykpYmJ5sGMhqfHXXOB0bFBK
	 YGwbqi2cHEnaDzd4DBa5jzvTCs8MePiSoFP7UoxqUXUfdq2RHX+kgmKPVqYhG12ljHSlO
	 O4HjSxJandJPkJl4FurAFgEOqbcWnIYpQmemAyJjpoW4EYT6xpPloOLobJBlBvsUNoa1Q
	 +Z0IBx4HSAkjF0EHiHhLE4e1nRKJp3urrN/eqw1YpkXb2uDkbvaeMfE237cH4bFqb2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+mgnbqn;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46254606A320
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 14:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46254606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+mgnbqn
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36ff9c9da34so204325eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 06:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149947; x=1794754747; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
        b=I+mgnbqnq8NSHuqYlXQCBRsCwEE4OSEQinRr8N0VZR0arR5lJW+qfCv8UvBUUbAt1A
         iuNEdhaiHT5wbCtr0NgDNbh48EXeKcpGcaJZszJnqmKYY6z5U3E7veLLoAjgfQmxcYbI
         JmwYZwMdrk6PAc5Yq2opy2NeE8Ns4p9GNTn5qsxTBDmYfYaVZgbenDQNJpseaGv71hEL
         IzcqwNqVhVdURUQvExrPOvJSU09getdEEbZeaHkZ//MDYaHZJZh758RQ4kLPXtqv0tlB
         c0JPbzbwIdq925YL/RhIsc1eAj6H9AHwfkKLa/2RLe2lI/PDG6FNJGBWO2PgUC01qL0i
         lWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149947; x=1794754747;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
        b=DGm/c9aGO8EcXUqLo9dpI6KRfB2tFOUFk4zJ75WCm3d+pkFNEd/uXvz/5khEkVKWFC
         yNs8+rEiSwzAzOieRn3da5yp3WXkIQUY0AHUvMbQMasvQIu/cL7lb9SgE/fYLqziuQ9n
         qqjEgFLCOekpNwRw34/t0/WfJqOyp38uL3YOySDIsot7Yo6B3OINwZ2ltce2vHtZ54nB
         DIqaFP0BRXw2ZAYyzOyszlfLa5h9+H4cgb3lbYJXLH1XPLAB6JaO9o/h+IeftrJeaAV1
         JJUKDBk9yHJjAO33EQ0lcMaBOdw6mXd75bDhQg1JzvBC+fD0mjbzmL725I5zDR2wN6Ef
         ljLA==
X-Forwarded-Encrypted: i=1; AL+hErFFeE8bO8ifCqKxtvB4kLTUwxVd1glUSPp4EPKy6jBEEsrbbH1sYAabPGSuOr7JLvkj48rbtSm1h82bljIMX38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JJkOmHGIaZVZ42Sxl0p8EdAjf0UaH5eUmbi2MYdGj5vJbWPaQ
	7aCuppyQQr+6cyTJn3f/8NNJL6ADANILeX6v7v/i/tHs9Zc89XVtdvy6
X-Gm-Gg: AYBFou38L5RF9Ob+NFSh+J39zGoc2QDaJP2nCvivkoEjTem8Oxagd0uvfEwwrVJzjBG
	2tcgqZ9rXUZhBMF8J2LgFc7cFHNpdwnJbReYudGlpsoVMo2LxwKNGp8shMQ2oi8f5BaF3Z80IYH
	2X7A7zZ9uja1zu7BNLIDU3t3j54lGJAbSKnNbpUp0CqAiB7AxXD7deEAc/sU1jOHu+Rg1MXjwVi
	gPcicNSEsV5vSiyv8M8bP1GXxJe1LQZgfTJjePFd2ms8cOLmOCnXgx3xoLHBSeDAVyeeQz6e2Ge
	egJkHROhW8VuDYgFYkq3d/zOEQFpg2GlT1nNM2DyGnZDZv5V7knveFbpuxiGncWPU2gV4jLmmqA
	Zx+UDT16FJuYWqECD50cQcun0WueuAhiawAOj/+53Z92PVXHzEQeJBiDNsbEcTe8HZBFo2j6/zq
	O+SQeiVvdmGFzuOZqdTwFaHEJ5QpE+Nl0JBE6Yz7LPzaQfWCd7ZpOrtYCQnlNdm45IhHEEyq0GA
	8nYvS6oZV09B7gLty2GolIVdrzmCFiBO0elZH8kZzfnHfvGlJNlP+YESfIHIn+2WOpYOWaLZZC4
	+cnFVDX4/A7pVbNDExJWzbSYqyjH+dQEE11SnX1k0D8OHt1mYPAhXXjwA+itQS9Syw==
X-Received: by 2002:a05:7300:680e:b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-372575c63fcmr3296545eec.36.1794149947219;
        Sun, 08 Nov 2026 06:59:07 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm5679879eec.14.2026.11.08.06.59.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 06:59:06 -0800 (PST)
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
Subject: Re: [PATCH net-next v2 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <179414895487.488859.839196891969031483@kernel.org>
Date: Sun, 8 Nov 2026 22:58:50 +0800
Cc: davem@davemloft.net,
 pabeni@redhat.com,
 ncardwell@google.com,
 horms@kernel.org,
 kuba@kernel.org,
 kuniyu@google.com,
 shuah@kernel.org,
 edumazet@kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 panweiping3@gmail.com,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6A5F2D50-D257-4F6B-A1B6-BE08489591F6@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
 <179414895487.488859.839196891969031483@kernel.org>
To: netdev-bot+sinfo@kernel.org
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> How the issue was discovered
Hi,

This came up while adding packetdrill coverage for tcp_mtu_probing=2.
The test work involved comparing the initial send MSS and what happened
after the first probe was acknowledged on active and passive IPv4
connections.

With tcp_base_mss=1024, the active connection started at 1024 as
expected. The passive connection started at 1460, and its send MSS
dropped to 1242 after the first probe was acknowledged. That led to
checking the passive setup path, where tcp_v4_syn_recv_sock() called
tcp_sync_mss() before tcp_init_transfer() enabled MTU probing.

Thanks,
Yongjian
