Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044C404BDD
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235246; cv=none; b=ah6fLfHJi71imUskOWPdps5ENt40B7Cp4F8rolxyV7H4Vqq6f5uykAyKedeGTMOlw1HflyKxYOS4g3bNJSmtzLNxL8qPnA0nZyW+ieYSz3adKXN44xFV0tnFf6sm0uESdpmKZzuUP2NY5F48jfWPWqvjy8Dt5L7Gz2f7DqRZrvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235246; c=relaxed/simple;
	bh=eKEhRWg8r8lcVQlTsVVu0qrr3lXjUZhkr92zgqGRhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWefqWIBnw0QrLK1+ZzAxdQub1IuSSAHZnDGVT/Ybl247lsxim0DUGs9QbJjmZ9M7dp+LJ0YscfjZqXNAWQHk4nsYRh1mZyZlBo9y8/OxgmNza0D8Zz1W3acKrZlXFDYNWebgSssozHF+j/gkZXuNcDRERLpIXX3yMdWWU3IZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=0GW03P+/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="0GW03P+/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21991235e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791235241; x=1791840041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq44C5dsPAhwLXRlUUC1A0u7pKaUDbi940VQRcT8enY=;
        b=0GW03P+/V2U/QA+KGvBbndvWZKaUIWR6Phs5dV4YvSuU6ihg0FOqP0ZE0fi/uKAWjn
         fwwqAuilqXLIzbk8Xaf7eC7CuJAf+WXOkERp+4mjc/AetaXznzzyivUvp2jvBGG+4Pfr
         Ph8kuAhlN5Vv4IkpzP6j6BQDepKu0xvoy6XNR8tNTart9H5e/Dmpm0/WnZYAqHm+NsQd
         KJHhWMFU99Ge/YJLCs12oeqJRY5rzB8n1Pn+YxGIyGJGF1twld/hTP1FJdDBAu8w+gcP
         UbU4F0MynG7fxh00taUBUFPo1hfQNAk6cwe9Qu6Q5vDh0lEpc8Pj35OsGGvqmyp0hlZl
         c1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235241; x=1791840041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iq44C5dsPAhwLXRlUUC1A0u7pKaUDbi940VQRcT8enY=;
        b=hMZv0LTm+57SXxZHdYJyXm+mAI6nkzjFVnPRBm8mUfQiTfgdrfQTgVdJTw3fyFSMMX
         fZH1BbLOuBtu5gOOcVncMfFkJoVIYS8hbIh4APsEmFXGA3ZBQFEDn1esKnCBxXB/oLCX
         zzrGWGrSsDQem93UTZkVcRlXNKuEQJDU8X9rAY7edBGWC/Sy9iJvWlt3ZRvdX1WJNnUh
         S+0bmj7gHx1TOmM8k5YcdCuOHY5zrcdHck9muKDr9Jzp0g3/DkO+TLtxxrbFfR6Tfm7u
         Q41haxgiLQew/oLaHOCOdkfiy//b+Y208+/16YUmacADT5OylkvxaZr/JiKVLezujl5s
         n0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlhSbpbZfcst0Dsz435zalwpVi/N8fSz6CZ3zmYoId//g75P3saLVRxCvsC8JTIdUqcOXG/kunEIGDzb/JW2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lhP8NWxHSiTe5T+unY/BlSiwzZ/3+HNFBzUfFdCf7yiDX9fVEM
	ij0jK95WC51uqHfmptuiXWMpxgOnhQ3JBrXYr2cWMuHiztNeIKyMpfelTbdQyJ0qZw==
X-Gm-Gg: AYBFou0o3VDg9oTCRoH7HFz3yvYM1z6vVOF3R8BTz+5o+pzXywRoh1QgpI9zmXN7Wiv
	pINCZqe+eX038TSfhkhAhRW5Ju5KrzoozsSByamn/E2bQUujdbvLkmyD6883Qazp+KfCLCsAzG6
	kZsK5UGTifXwlzczKSvf7b2Og8CThAIBX0foB0YKY8pJay1cv0uKteXZzK1GnkDTuJnC1LhjZVH
	NKqlSEiNpU8+BIIfn2ehon0k80bk0B45NVIFRSTt09fG1KbqqzYRpSkOQorv5gO1l2g+GhbbouG
	mGR8SVbWvtjNMosa1Dd8w242muZimzf7iv8h0m/WuUq5n2rxZS2yFFa/1Xcj4nPZQfIFGgEOzk1
	L7nhigxGIcjT5pZnIBOWcHh0CPV4rtRneNHwazlWWzwI50QOohbgG3Y9A28QOF2qjBHLjrqtV3E
	14tptNZAkf6TFhUvvo0L/SwuwVcJy35+8vQl1FBKeMfCpIbdwQzslXqEeaAcHUKYPy/y9u7lt+/
	zR7oJ2ayL1lkuuxxf6r2dz36icuS0H7sL2VSNM4sUBjgVKR6+hsXK0CWnBZC6RcS41x9RgfA9Nu
	yU48loZdvBH+YzWI0lHzsI1x0zdN03kdaoM6e43PdmADxS+ue3CvG9rxjYxAHd1UFCKoet836Hc
	XH5mCMGHINvWgjkDSPHnyWdbZdJI7FVqmVX2hwqHrzXfQEQsGZoei4pdBsSfZKW55k1I=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6843:eabb with SMTP id 5b1f17b1804b1-4a16843efe6mr133495455e9.1.1791235240914;
        Mon, 05 Oct 2026 14:20:40 -0700 (PDT)
Received: from Desktop ([187.40.54.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca8127sm18607725e9.2.2026.10.05.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:20:40 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: sashiko-reviews@lists.linux.dev
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next v3 3/3] selftests: netfilter: nft_flowtable.sh: check the priority a flow carries
Date: Mon,  5 Oct 2026 23:20:17 +0200
Message-ID: <20261005212017.2997-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005171647.3D12A1F000FF@smtp.kernel.org>
References: <20261005171647.3D12A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Could this introduce test flakiness due to a race condition?

I don't think so. test_tcp_forwarding_ip() waits for both socat
processes and compares both output files before check_priority() reads
the counters, so the connection is closed by then.

check_dscp() reads and resets its counters the same way, and its
"dscp_ingress" check also expects zero after the "dscp_none" run
counted packets:

    check_dscp "dscp_none" "0"
    ...
    check_dscp "dscp_ingress" "$pmtu"

The test passed three times out of three with the series. No change
planned for this one.
