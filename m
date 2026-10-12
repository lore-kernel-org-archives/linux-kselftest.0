Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2138A718
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768376; cv=none; b=bZrgSmvbd8u2sgO3wh8Z/EhHQLVeirDqcdYaVpsvirvEk/woRNB+T73g9wpsUe2k7uO2smCYX6Mjdwk0JLBK4f1MeXRy/POfqyJBXpG/dLjUDcI/sHbVuTdu8+QoETFSlYCB7h72uQQ+rSJPs3pJf80QpdrsK7LSeqXNn62XL7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768376; c=relaxed/simple;
	bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKL+dM5PO9Rd/blfY/SYkNRDsfOfDt++5D2PAfEXcjjPVnWh7MvTSyIbjEOy7X/I/J1Yep0XeUI87EeDEaodjZZitm7uoRwHZ6ohKx8kHKlsXqThk8hokBAzk7R3E7IWcYhZAjmy4si0bdMXgOjrk3wsc3xMsX2T1e9sWA5A9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=H/H8/mTL; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="H/H8/mTL"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1097457eaf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 18:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791768370; x=1792373170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
        b=H/H8/mTLkyXvpKmYhg9xcirznaALpC4U1xW9lVzwYby8Iqd5A03o3rjoSNmrU7geV8
         TRKXpdraFBaCEkaSf4iPuyNdyciT++UrQjCcMb4LHQdlb533vkyEORPNcGrfM+eCFkV3
         xkqg7no1nZp7IV/hlM1lKa4rfzGnCJGgynHdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768370; x=1792373170;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
        b=2OOS7sXQayCCvgECygPvd0MTllejF1O1SMZ9xN+4GT5gI3b/h/x/tGRsRmeSkCDAJs
         yc7I6lEJhFdYnTT1E7aNPrfNky8HErrKHz/KpEl5Bjx0n8GdMWVysIYMFJNghxovLeqw
         fB9fY5YAztCEkIcLs7x6fx2I5OwJ5SdQ2h/3u2E4qGt9avYt2ix12cn8lNdKmOj+Q6Jk
         9jJ/Ho/vgi2SO9AZ1ApWjH+Ghg0tDn3irXQIQRf2h1/5nS8j1P8Aae9WCJJgVJNAlZ43
         ZJ8tZDF+4197CKyIPe3fWg8bnX447XBSRGPr/AStWeyM1iXqILCnap3u7uY7ynEmddIT
         qvnw==
X-Forwarded-Encrypted: i=1; AKwUvBz3o3NhOnJR6JQFmPNTfVrmL+S9XCNt5no+RrxTGV5zYuXxtHeNQcGvmJ+B/ohU0Qlyi5d+C9f3XWpkLoqAqiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrUYnSE5Xm3fD5WZe+Lx60uhBgmXA4zhtm0+qnHdiNmLHK3Qll
	C4rgklpxzugcGhoaJWpyYLEeRhCgceHZmvmgYWFU3tIw3ik9WKUXnyeZT46Yz3+qr5s=
X-Gm-Gg: AYBFou1Zl2FMDcb1K1g9rOqtMEnDpHPCYWJsY944M0S5cQwZZpyC9mG/bpCQj95KEIi
	vdJwuOWfC9K/Tged0cF96AwwXoEW4jd9MPcdehpGCcx4xhEJLkKWAM+kVd7YHDzAHhyalHYJSKP
	eOgb0w7Go4On6mZCPv81LzCvj5P4ejyi3lYtgB4gbv3mqrapoDg4VJpiIJyn4wM4qFhSNxOgLut
	MjgrFEmc4XLUx3PJ4ys2AjWmR3IdYsYxvlRtRE02BOFnYFwjcrXh2E+Lg1sV6xcKh34+BpDWFrc
	WnIp5aF7O9KKhS53W18wb6/ayIGRNzYr2yNqdnir1qD6f6QdhwdGwchT8YIuVVCiqDg+xyFgSgW
	W+92xslBigYAZQOeLx63+1KBU/rNFnqWq8ULCvnafmSREVNCPJQP3oIyNGWTOdIYyqADtKxo8Fq
	C6lmOh8xrS/6nvbpZ+xEq/z1z41pcLe6Zmnbkz1JynRnZbcQ4wpOFAVQmJ79psb/1POnZWj9o7u
	M24L9N31FK6l65btsq7Ev7KvESeX3UZhswBqZ1QVrrS/CbLUhb7olr1uqG9mYtmw2Wqd8SoUpmA
	czqnF2O5cHgNYk5dJKoUbUDeFBh/JRKysiXhdg==
X-Received: by 2002:a05:6820:a291:20b0:6f4:eca8:b1ee with SMTP id 006d021491bc7-6f4eca8b8d7mr1090389eaf.25.1791768370024;
        Sun, 11 Oct 2026 18:26:10 -0700 (PDT)
Received: from com-68297.corp.openai.org (vpn-centralus-01.tradc-corp.com. [172.169.249.3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f634860481sm1584254eaf.13.2026.10.11.18.26.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 18:26:09 -0700 (PDT)
From: nramaswamy@openai.com
To: Eric Dumazet <edumazet@kernel.org>,
	netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 2/3] selftests: net: packetdrill: test RACK after partial undo
Date: Sun, 11 Oct 2026 18:25:57 -0700
Message-ID: <20261012012601.27658-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5ce181b5-af31-48c4-9199-feadf24af27a@kernel.org>
References: <cover.1791506907.git.nramaswamy@openai.com> <d0c538a03fb1cabd090927cb30a3b78fb485ba72.1791506907.git.nramaswamy@openai.com> <5ce181b5-af31-48c4-9199-feadf24af27a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Hi Eric,

> Was this test changed since last time?
>
> I thought I already reviewed it.

Sorry, I only changed the comment about partial undo to align it with
the second implementation. Nothing else changed. I'll carry reviews
foward in the future. Thanks for the review.
