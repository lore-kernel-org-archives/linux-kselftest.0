Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421036;
	b=cERPaBN+ExndmMBZozV6wNK3p4PelxPrznwxXZ2IZ4Bypeb1/trM1SdpEO/RpmjpZLcy
	 r8IDN/7fYbqXnXDUix4nxmN9tGLXTEufIVsfa5ZDp+YsvDH7sb7lHLyRITUPKVpR5deK2
	 Bll3kFZ20MLkzmmi7BGFysSN03sVVctJNC2KPZ7P7HuNo+aYyVcXiv3zkRRYGIQctYtNP
	 LiAL1zf00aiU3j5SviIl1TY6UVKoq9Q9HYBFSmdzcYd2Pvdz8EWGjrPpwi3Vv8xy7ez3j
	 PllNGNOtJUZRa84bwJhR3YGSV84tMpwh0+Xu763I0fTBabNPLVEAprR4GGLaTws7CXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
	b=mMY7GRu2t9NGgblEgRWJkHfFpDqz/3yilWDvIw8q/5/06KJgAQCO9gq0vBAxNNIFyOCj
	 38uQ1bZGrZCS/7bsxl/qbG90yaeC+fLt4lGPMjX8659SHbxwxLthBUWrCU/jSBjnUN7Ne
	 8DtT1ID0/CtT/c6r5IzXpEZxgZrLr+skydNrEzVTgG117XY2ubaJsypagmKFohDpG089b
	 v/EMp9ZrbhkMAjbgF/fY0EZgWtpOOtZkByYfslNBIyv5Kfr109jUZ9bG6qnCv0YMQWTO7
	 9xzWZ0D9LtI5eqWotL9jXHC465BxWiPBK44jbxc1HZtg868OBcmd1a5pHmVngyrK7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwijkbsv;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93844606B784
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93844606B784
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwijkbsv
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b31261e8a9so26666027b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421036; x=1795025836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
        b=dwijkbsvLnzoA4zzzp9y9nmiI6apaIA+1m5HBezQZ8XkuEbw43wjUc7Xvw+d9O1GLT
         TlrQhyXiS2RyxkzltzAO4vtDobrmsUgOBrADJ1ugAxW8QBZqUWVBDwTtCBoA1IROe4jB
         DQfOCWDXMWOLmI/E1fLKhvUv5kdFIxwYTCSR39kSjkZs1wk420ihplhxJINapLEEqAiA
         DMmxREYJ6dJpykoQy5NksI5cMK1pK1f4RIUlpTvg8zEF2kvFkVdq90RGM+GYXheHGSHX
         v9LS8OJJXe/TxeeF/JmR5nPdO0gM/jXpglpQhFgYqdKrsDyupn2Rx8nNP93oYamkNskN
         znjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421036; x=1795025836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
        b=Ht69eWLrVhBUrJhQvL9eUL2K62VgFjpy/K3/HbhH7+PyNvdPfyRoWUusaMI68u/N+B
         c0otrhegNcO9c3n8ZzfXK9PFKi2FZl5ipSjZ/GlBGDvAyhda4sB/moBiBvlB7jnLAbiB
         0DaogTTVVPTAQnoPB1TrpGvul6KwrpNTCdASa2aCnxGhy51r7JglgHmhZylBH5AkE2CN
         sEcQYCg0jj/fldzuz7JRzUyXvsCGwFlJQNDcU2bQTn5NIihcZzE0kby7OytSdk62oQnd
         X7NS3+FOS5k/Gw8lrA1hY48HMJSvzWKG0nN9KvJ5MyBybSRgy2M9EP3a9SO6+xawOTZG
         R8oQ==
X-Forwarded-Encrypted: i=1; AL+hErEfb/kpAUxY+3VLJfWpUe39WF0sDh/1Is6iv62PbQfQI77zyFYU1NxxAzSnwRdnnYWQWdRTMp2xT7BdKZ4QjqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qdr51SAhpa3a/ubtS92BQAo3B3CJYeZ3XxyOFHiZwNBDuhxUQ
	5rmMDTZjPh2LN5NEOGM6G7P2iWgrsiYo14M6KtAMkt288PDAxgtzIomu
X-Gm-Gg: AYBFou1WcAvabjp/suUzvdsMk7kc238t5kM0KwypNsQRs5PlTQj02DLVi/ot/mqW2yw
	JoTM1WP14Qtz7LPrD8Bh5mlTrPnMWU9Wcn16Nzp71YWupimQ39BzpZWudyqpHxNIaXliClfVVdD
	9C+aiL3YSNBBASWHR+0U6QHuAv/KY3627B51z7o+kOOjmOWVyu/cRvZvEDsqthdaqvCPbSX/S9s
	rfKCajQGwEca8rVnELx0jywWH2RMwT4zr+tzJBqYj6+CHp3DvY65KxsGoA+dUiBjabdXpj8mLrU
	9EPyjWhJPTVUFF3SK/NgwaD+BzCdiXJ14bXoarnq7XEqraA5iPYOOX3qJDiw2Kge94Q9Wcn7EhB
	7AmKaTrhuxc3/QGnvYnDQ0jHxfhA4HrnyYzCa8/E1QeKpGhvqcHquXG3qu/iDEJ5SRuwUILs84b
	feTaWpk2X+nBnJPq8IiRfTex7nOi38ldEnfGY5C0RrtNK322ZokPBMWL5yXbh4dMuoKYZG6SiuN
	u5ZvRzndSMHYyKJc67ypb3GYWIgMbYgTVsLobOvn9/SOffXz6WoNdA/QnJrM+u9QHjw57X2a6n9
	JrfNb421W77vD9879mkU6pzZ2iBacGJtS1jYgTOLDVBSJ2yLZzrovcyIz3Ymt7FSI7pYmmU8ShI
	=
X-Received: by 2002:a05:690c:288:b0:8b2:bb94:8cb2 with SMTP id 00721157ae682-8b3a8071a47mr23369857b3.35.1794421035512;
        Wed, 11 Nov 2026 10:17:15 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39343d4a6sm50363577b3.37.2026.11.11.10.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 10:17:14 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: Re: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Wed, 11 Nov 2026 13:16:48 -0500
Message-ID: <20261111181648.34819-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179441946966.2168702.5078417118584073258@kernel.org>
References: <179441946966.2168702.5078417118584073258@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The bug was found by my LLM-based bug discovery pipeline.

Best,
Agustin
