Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551919;
	b=tTSk1MbkzCQKhPYgjrCYtUR4o+2TM9LnHYLJTzuL4yJ7nus3ADmpr7Gjy0JciTMDm2ZY
	 owEfId3jF7pCAEaoUFs7mdn6rby91HyveoV60wkEL0d02HBcokvhnoKJUvyQaxwj91x6l
	 ki5uvq72t9bMx0nbJd8ITjlUTFpTHU4s07QDaD4FzEyHSzNGVMPjeW5qokewQAGhEc9k9
	 11VZp+WBdw3OHQqcbfocJO+u/yTfeTM3wBpR14dsjfLzbiGqaI2LryHiWIh8rStRhgpC3
	 FHttOjWYVAMTL9HvIXvYfzxp3ES7dgM+y9/BAcL7OkyFB19nrU02JXbu+Zg/abeT2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
	b=rv4Bd0JwF1T04bRzSRl/v/xTYaYnphae/2LlSGdrnYTT9oPFyv5FGgV47BjXWm2tMFH8
	 LiNcIfKjxTJI2A1OZ1H+282YALNIKGctYAHhk384yUnU9FAlWOdO8N15KTS2XbhkP1jaB
	 r3DCJIMpz0bOkrxdXKD4eQ0oxvZLep0mq7vtyKJFRbWCmT7/cZ7RKzlA+7j6dr1y69Kny
	 ZsqAk7ZsJ2FpuvheZoIK/0ae+3k+oGSnRNCoaGl/M/A3xvXXPQIc7QoM8BiUcneUX9UAR
	 cE161rWKrIT0rxAqG1+YZ3a/spauTUTp8afmzNECqChY0taOZQLmoItrTzsj+iS9rsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTUhIXqc;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA32606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTUhIXqc
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so270237a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 20:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551919; x=1793156719; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
        b=jTUhIXqcHD5paioHMBgpX/nNDFeI6GefwrBU5JCZ9L6hQkgDCCR5V9qDyK90TWxB63
         BUeHPqsNqUAWjxsKRzhiYWN4gg/2tWiSqAFA02QpOTMVZ8HDrd/73VlSzZ/z6Q6Zcjmb
         y/SpBz7FnPTQZRm1MiEuoSZnfDeQH8kZYfIu4tSt+PzCSc9QM3JzSGKAPbcRqH35wiGt
         iIVaNSX1r/6k7vkTPWGRrKb3k7KNyal3wwC2/NRW0KdNFdIthL0IVESKxGtAtYSu8Cn8
         cBxQ9fMunJcJn3KmG5zDQHXwvhba1VSFsi76J/0MovajXPhER5CLkwBZRb//TPZDUhXi
         dl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551919; x=1793156719;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
        b=WPmxEnYMqtUKV69BwGJj/gJE6U4ELUBUMn2UvoK2IIhqyNXljyOY0ReYpDjB7kPQTD
         6mdSmno5Qgw+G1CfPCuq2zX1sLHEhXD4jq4r8c46f2KIAMTh1RJN396/gZo+56hea1OI
         LkVz8y40w8kChFkwiXfXTfefxP49YvvCWUfGR8eB4PjiajJ9ZZeG0sOuXFQgwNIhQsjK
         117u+8IlkCn9w3Tsfm/ssUaUPq/cXMphRecmmiRar4hQSj7Rx28NyFOV+hlQMolrLOph
         L7/rnKyVZdEaOlQFXkDG1p6oy0vrblGANb8XI7Qjj+7UZo+q1amnyWj2hkoTKlox3NOP
         0t8w==
X-Forwarded-Encrypted: i=1; AKwUvBynvX67j1pgkDs6pH0nIj6Lq8EMNnmpkr25rMJU41WZRZVKteRh9fm6sO+vmduLtrnAKo6zbs2NJzX5SD0KYxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpv8XWpdMj++N2UVGosbnOIE5wtcyK5ILPDx8UFTJhB9A3LCVf
	4AAXkFArheJ6XU4GE3GXHq2NS/OgrqhQiJxLoqM4pIJgYwe8WJEu88Ud
X-Gm-Gg: AYBFou31xJplDWg+SD390XzUQOCw07jAPGe7fYSdYzSOVvr7c86e3jJ+BWILs+UcNpX
	kcS8ynsxkOx4YcW9hjDoL/LLPDbjANV2ENf2aXAq+sqd3eR9YHKOLq9d6BRjZfFrsWIFqJbmXlX
	69hmxtTrN2epC41h6wtydC/YVEEdxdfWIiyuiP1sNlPG0PfRjbNwOT3MhRge+HkxFxB7orp1R4U
	H7CmjeG2jzltvyNp28oo3wt3mvCmBjCrNNdQeaN/9qnmyYCisRQ+K+biwv5Wupfsr0LHHLcwa6Q
	Vyn0657qovFZohuKK0QvWxMvs4KmhDuCyIzNqLBpwelEC/sVqbW8sDlDwLtB5gvdIoXPAYOUAdU
	+83I2X3hNojLBbDWz8+mJh9eM//7lGo58f2C6/48g9QQaQEiqiff6mcD93aECwrNydPuVkDgmk4
	bLymC0kjup4WopALjtfA/ET2HlN3MkW6iJPQxkAqcrjhFdh+kKKbUlRBAJp0W5LQvp7E1NjaSoI
	fXkZa+w0xx7aC6mhDVOS/nCn0Mn/hrRzjnNjLCkWwXB69+LSsyv+JqHEgtChBMEqywtRTdWMSil
	ZGjzuomecW0nBertRgN6wK8/bBnXgZ3FJVYlKavf9Iml/xoHxfkSWtNhVy7v
X-Received: by 2002:a17:90b:2710:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ad86c79924mr698658a91.10.1792551918978;
        Tue, 20 Oct 2026 20:05:18 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad812c565esm1924550a91.10.2026.10.20.20.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:05:17 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 03:05:16 +0000
Message-Id: <DMA6ME9P5EQG.3EI83DBIFMBDE@gmail.com>
Cc: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <rostedt@goodmis.org>, <mhiramat@kernel.org>,
 <mathieu.desnoyers@efficios.com>, <shuah@kernel.org>, <kuniyu@google.com>,
 <liuhangbin@gmail.com>, <mkarsten@uwaterloo.ca>, <masashi.honma@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/6] bpf: Add syscall common attrs support
 for xdp link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>
In-Reply-To: <20261020182700.655edf14@kernel.org>
References: <20261020152804.39863-1-leon.hwang@linux.dev> <179253001886.208021.6536312952037292688.git-patchwork-notify@kernel.org> <20261020182700.655edf14@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 06:27 PM Jakub Kicinski <kuba@kernel.org> wrote:
> Please don't merge changes touching core networking without an ack from
> networking maintainers. I haven't even finished mopping up all the ways
> the XDP link bypasses normal XDP safety checks :/

Fair point. Will wait for an ack next time.

Leon,
pls send a follow up asap.

