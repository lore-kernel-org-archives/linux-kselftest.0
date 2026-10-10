Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9130F55F
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655842; cv=none; b=l9cAj+x8Qg+UpJLrAIYDiba8x0uGYuow3C1utJLPTiyxY3GjzwqEHYt8mq91f9aJbycfV5jzbVnIdwpTl90E4iqrRTw5mICcc8glIwz0Qy6CFchORVpkPWvzMr7X3snmK/euDKJpwIfxl1rXLD1bIhKTfT5uoVQmoNPGr88p7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655842; c=relaxed/simple;
	bh=D4j7jigH3IDJT1uH+JDSltXr5yrzoVriCLkjbvQ0QF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rg0VZlMo46Asfy1KHsQGq/CSITA1VSQ9ZiT/NVSjyBB/1tCgUbr4lxsrHo2/gxW6yDfqHsbe6NhtXxZE0fH5jphA/+X7H1N4WI9VNa+rpkIaAepCtgpQ5fQPXVG1+1x32dxBKbf7YDwtMe+iMrD+bpzvcYc6lSU5xyyCUvLEIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=TUXH8nvo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="TUXH8nvo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d870d54so400457f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791655840; x=1792260640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4j7jigH3IDJT1uH+JDSltXr5yrzoVriCLkjbvQ0QF4=;
        b=TUXH8nvoEToTC88b6MhrRj0RWhednvBqmnPF7iYP1ex37EZDepQw9yRqtL84bGiZV/
         mwzezVYqHFyerHlij4s7Zvcn1SwX7fnp/kyjkpBhGPGduxAbWw5KbLi+TYd05a9/0Zpl
         1/wyVT7R3DF5cxfmg7JDeHSiIENMn/6cBTbG2+dUhEb2LfkEXGnMS4o6kWD7rO2l0Ml4
         ytvAY7EEKOpsSwdws5BertXZ7ubaiatEv6kPv8NF6iPQJlBy5gzWbkD+FQOkrrmzPvHB
         07KwmX23wdpsxK9cGvIgukpOAHTcAU37DILhwDzBI3CyKrW8pZ+Vg3rGtEoVk6cXsYI/
         pTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655840; x=1792260640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4j7jigH3IDJT1uH+JDSltXr5yrzoVriCLkjbvQ0QF4=;
        b=kZPu7QZomi4jOhBNLzoF8qVNIwk/1aNNqzHWBAqa5pXU/7S5pbrwxX2x8nQFcmceje
         KmQo4Zf1Nal+qRkMdH3ZRrjFM4DoghevJtQ1qzqSImvNMwqkzdWNrVQ24ebueNyk+xrD
         XDJ7aFsJlr4wo0CdaZPntJ4qd4Ia6FbwOZis7ThB7kbtXbbxDA5+NGQR3qJnEpaaXppD
         AmzCEgHShj7g3Ea4ZTVUSeWp09Fe4iU98VPW5gyTm12nArIYYfA29YK34e6xfMkjuYmo
         1bYnLsP8DDW38e/MZAi3h/tx7Qi5Gus7s+O/c6tJH/bFQ1LVd/nQrwyF1Eq7AL1t4yRC
         nuhw==
X-Forwarded-Encrypted: i=1; AKwUvBzXKQCqC0rcXT60tR2rUN+N1WjqKUuxMwmNtwZ78ZZK9roASmf2mqY+dQq8zoM/iwQLhV/J//l7JZWCKVZ8UJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz4m+VQat1giMrY/IsDJ4ysxNJcsKZuquGHbnfGEi6vASRJsiv
	YydL9hydybe2dCnU9iXyVko5liQrrHATdqSQ75LdUCjc2HEQsVJFyDHtt728aNGOAYI=
X-Gm-Gg: AYBFou3ZVl24k06Wb+zKj/JU2zFbGiwxXaNJjLf4o6eu6o8ysr6cXMmh6Q/0x1P+WNV
	+f8r2+T8TfHLqTE+2LessoBBsZUslZPvIg3uwN99zz4R+j1gHuFc1dnSEvPlKQa+bj4f0Bc8DZ0
	VvCowHiMLq7SYhdR0YwvwIYcuKPTWN8V9wHOLltWYn4p1lxtpfGJaTyUWzrK4tVin0GJMYpY+7I
	RknqoAWV/FB44TZtrTn5fnyqkT+zWYmHFFHDWMNPx0+Qe/xkySYF9+C3ghohYIzMCk4x8W1/po+
	QIAy/SW5lH+YlgyocHLfVOlV6XT7Efnw1wivc304KRHITBp2DsRqruY+r2k14yfJDiDDe+JRPZJ
	4tJtkq9Y/Ooj43OlTc8VyEQP/ZoaeDSg79XVxKdDyX+/6FXwF04iPhqSKihY23HxHz1W2xl3W7s
	20f2A7eobsOTnMRizqwUB26NZOsPrMZPMry/ggdV09l8HBQm7i87ToG/cJiQ3JdhDBdmg49nold
	AnkoMBpmmZNHZDlkg==
X-Received: by 2002:a05:6000:230e:b0:487:1f7:f506 with SMTP id ffacd0b85a97d-48dbaadeba7mr7949230f8f.11.1791655839802;
        Sat, 10 Oct 2026 11:10:39 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:26d2::3de:5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db946323bsm11294868f8f.2.2026.10.10.11.10.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 11:10:39 -0700 (PDT)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	kernel-team@cloudflare.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	lorenzo@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	tianyi@cloudflare.com,
	toke@redhat.com
Subject: Re: [PATCH net 2/2] selftests: net: veth: test peer ndo-xmit after GRO toggle while down
Date: Sat, 10 Oct 2026 19:10:37 +0100
Message-ID: <20261010181037.34130-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179165459278.434549.1711113374323842550@kernel.org>
References: <179165459278.434549.1711113374323842550@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Sat, 10 Oct 2026 17:49:52 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> If cli.py is present but can't run, should that be a skip instead of a
> failure?

I don't think so. Running net selftests from a source tree already
needs the ynl CLI and its dependencies: double_udp_encap.sh calls it
without any check, and the Python tests import the same library. A CLI
that is present but fails points to a broken setup, so failing is
correct. The file check only covers the installed layout, where cli.py
is not shipped.

> [Severity: Medium]
> Does this block change which code path the chk_gro "aggregation with TSO
> off" check below it tests?

Yes. A kprobe on __veth_napi_enable_range confirms that the NAPI is now
enabled from veth_set_features() instead of veth_open(). The series is
already applied, so I will fix it in a follow-up for net-next, together
with the selftest requested in [1]. It will end the block with GRO
enabled while the device is down.

[1] https://lore.kernel.org/all/155aabf8b873bb8cdcafbd6139c42b08513e5fe6.camel@redhat.com/

Cheers,
Tianyi
