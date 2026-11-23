Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394761;
	b=xxV0xAZ5ywzMxoQvI6PL9Z2N4gkI4Vw31WWM0bUaQI/DTjryRIueKBhTxZEf/S6INOeh
	 7Iqsp5TOTALS8ZP1v30sQoCG8mxZDpujufXST6tVuiQrjLf+yQbt7yHqrVu02el1RBZGw
	 hWf/hEcIweyUvCeoxmCJUb2Rsq1zIxOSGZCpR7IK3ceRIOza/d2pqgTeDrNgynbV0gKT/
	 63/HV8t12g9cDlQjBQWpzUXJtXWgSEzy3oA7e+xKZgnLiKtuCXXCtnH0EklQqaUrFxc+o
	 e6QZr7RzFXYce7nAXB1S97ZtaGiWAs/eZvY5hLdfIrDdCa4zZUpFKSVBrniekdQAnuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
	b=uHAZ8SeFqXvI7lRRCq2z6HY4BEQ7qLlg2oFh/uEcQ89glVthQ0Paww49WYyEj1N+Ploq
	 9aBVHxw/c158orSrwVKuBDrtNR2wasmDtagJp2g4WhoHPzRHGo5fZZQGq0gT4hJM6qKBw
	 tlljBkpWnf1WjcEzU4SyN+GeA7zmOJpT1oBJsvSs/a45oCBX0MyhGpsfzVtjQA8mzq/Gs
	 Ip8EiZDr1JIeR46H9pltTmnj83QGnyyBb4F+QN6mDvwAk5j/Q1/+KxQ56Ijfr/MLaeO8N
	 J7C6lpf7JdeDeUZ8sz0KjanxbXqKbpbKeujH6K9XbNLgvICKxOSeFGa4Xu5J6wM0K0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C5606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 00:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3C5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f05bc71e01so9117675ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394761; x=1795999561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=xjQNwyU6MYR+Sv9DqBxkCsB1ojg0HIKyMipAx4s6KRT5IYdJvl+GnVSxTRanDwlO4b
         OjsHRhZlksxkgGyYo9uQR4xnsH9smwEzvZB0U0xWIc7WLxA20JEVyHvBNfOB3Q6RKyJl
         W3Omp6JWwiCVAkQ9a9ECTstSvDMsiW2opPGebxfCTT5SlPd+dIB1fYQxZJhDwkFAzhym
         zUVWh9jYqyhJ1lPaR/5BHmGuhw1iLZ2Ep7uY5F2lH9rP296aefHI8qNbvrd9S8rKbf0P
         oiX4dY0ljie0g+etEjHvsK3G0VGKqx3XN4ZOcK3unI0mprBibWrDrY0Vx0uR0JHB3rXt
         eoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394761; x=1795999561;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=qOG3e0RhIGg41r99S3B5r03Wqj7bK9NhKOtRvQgeTVKA7wyU17q1nXXNMrL+XzSX9a
         107o9NsrhiBnnUP71GCfN1Ri2nHur3TF95u1a+nOCjZUxsl16FJv8NDDRelh9+73hjU6
         MCK7NKuXNN4nd6b7JcJehCP1I0VXXxjyl19GgpRgoUb+ScXZngVX9gSpZzqo+rj/GL1a
         8Lh69xI5jEScWtHxa/prejz5PESUNV964Bx/uV4YBvMPmQQVc4I7wGSoGqNhW3/psfad
         rtNmfkNpUrqpQ/vsQQ+rtbvDd12eoRyMlwQCzA4gINBAYcekb56X9IYinmhuqetq0j4K
         PDlw==
X-Forwarded-Encrypted: i=1; AL+hErEsPoVcwb3aMRN/kl0apGQCVwGhO71CVsVe9bH9vB6FKJHMKHar5CcT1yJSPBIZKk+1rP6HpHLXR3eq3bnqYuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JRmaOVSJ8KjlTKpdAzP92jFxu5p0k1S8DmbNfX7N1EyMb8R7Z
	P2IwHOk9YNIu4IwZr+Qf6X0HPkULwR0kjUPEj72vbEPj9HZ7JmieKyZ6
X-Gm-Gg: AZFdTZesv1sCJIpf1OEbE03v2gSWFzuwcvf+Dr7KSQknzGBDdHIsTxy0hJ4jy+O+o7f
	LekYCUypa01aDtwxthwc5O4HYwEVV1Gs7GEk8UbqEXfXx1pK3cBDd1umxAZvkzCog5p5iro5/Zv
	OZgT0e0tVExrCiPkzPrSGSEyHO/9cvqeEzNMc60U3cuuTRFz+OmJhWoJx1WxBCWDN5MLE/1ytC6
	BdjluCec2zWmZzdC/HQ66CWSkETF54DDCnvWuHVXckFRkZ11dW2JE2InsCYuYMAc7n5XXQ2NN/T
	m8460Q/KhmncFl4qHeyGbgvL/v0uyH/LeMjyIWtzFSP8DtU0/zV76JhAHiHYhVCako3Sm08/sz7
	Ww9ZzRwNVtKbr02K9Omq+kbNidX6JpNqJG+WIz6qqg8b7t+zIXg27tsOfcKW5Obw/vYZT1o+hkU
	99HNDjWVE0gJk0YHsfnSO3j3k5sQwgMxV2fxLJIAP6Zfd73yfo7lbzThDNvZDD539u5uwQyqebE
	FP772FtRzAw2Z9ldR4lYL/gNZ+T4JlQy7mMBu1Jqs+ycFKxdxDloryqZt00JsjnBud/zmwyb6KH
	Xo/9823kxzQgRR3nmgXxJ0YOIKO+M5zNU1CekjrGXefSKl4YLzPddFzw5P1H6cbYcGeDQzfrqAT
	2hSHr0UyHlhMLKNBt9KwaMKVTBkCzKL6GaiU=
X-Received: by 2002:a17:90b:1802:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b41c955a0bmr8991155a91.43.1795394760621;
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm15174661a91.9.2026.11.22.16.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:45:59 +0000
Message-Id: <DN26BQ6CGT3J.2WZ83RCCF7HDD@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "Willem de Bruijn" <willemb@google.com>,
 "Neal Cardwell" <ncardwell@google.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sechang Lim" <rhkrqnwk98@gmail.com>, "Mattia Meleleo"
 <mattia.meleleo@coralogix.com>, "Michal Luczaj" <mhal@rbox.co>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 00/11] fix misc sockmap issues
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
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

On Sat, Nov 21, 2026 at 02:30 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> This series fixes misc issues in sockmap. Most of them are old.

Jiayuan,
thanks for the follow up,
but the fixes are way too heavy. bots are correct.
The patches introduce more bugs than the fix.
Pls ask your bot to think of absolultely minimal fixes that do not
introduce new states.

pw-bot: cr
