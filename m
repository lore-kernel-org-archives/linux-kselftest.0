Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973757;
	b=NSpLD/sX0RQc6B2jzbDu9+CfDNCt81IkaSV7LMEDkNW75X9ZBVDT4e5U7gXEj31z06JF
	 Zgsp2OG5Xf7k7Ht7okwOrNAYtaaRkXASpg6qYFI8+Cv6SMtsaMDo5UDQNDIBvGtRgEos9
	 Sd/CkZ7ovf3fcyMjay3lMdd1705U+0U3M1MRawBjtwNGTXRzpTcf7f9tzO4TVPAF4HbPE
	 dH2szl5ArepcWqk/UpsmcrYUtwDhO73xA/UrTdZUKbhvq2nr6Rf9SaTYD3adc7PVrwp9h
	 Cm0Zphri5ly4hPRai/MzxQvVxcf14N80uqp5mPFctnXvI3Z9qqvQGtWAt48B5Fd6Q1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
	b=DspABNHfeJJJV+1ZakVOitX/dIdMFDgFGo1w35CP+GJFKn/C+1M0VtPS1x6MO/E8SMVa
	 fLmvBQyHcV+RY9sLMFozHj3W1LUI9UeHh6R70pnqU0laF2Dp/ZztbysezbG6r98cPlLw5
	 PasQ0BnJIsvZF2tW0XglRuOY4mVyqud8fI+f5jSFo6nEevhLPn414Lwoi+HIuThcM3uav
	 6Sws9zFzVVVBwRq8rsKUx/NZ/LbnkYIHdeiMp39CcAowwPtvgb/91GScGj67KmvVhrhN2
	 tR2rNFKcj7OV6A/bvtKFwoVUjiuCv7h2Eno35VcK1NUYnQz3NAp/yvTE6YwSfjkHqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvyjVhGD;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C52606A33D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C52606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvyjVhGD
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b315dd057bso3890977b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973756; x=1794578556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
        b=BvyjVhGDfWBI/TE/LM29fTHwd3KQaAP/hRA+JL81IhzSMYw9sExBjuiN7/iPLr++gy
         SFO6N54FxOjXBluQRHShQTl37hr91VNz+C5F+sLfqFjmAS2CM4rTxVJuwk95/lGxhfCc
         lufIwR5/n64DlbsMp7l7cZNaGDAUFCEcaN2ZhfFhafD+8kbiAe0qmzmWg9NkXGxyOj7F
         kHHFgOwf1l+GpmGwfwik9k7+886om9HlMzUcNdl2CTOEa2VGAq/4f2u8DDNIVglJMkZ1
         ybwaPXTdkWwvgW+X4p0UNpOZxk0oMJ72boKFWLIjS265pUTXt3ZfudYocV7cFShVAgyM
         xvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973756; x=1794578556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
        b=zCTCzkMzNn5Futg7HAjg1RFttwI7ESrTr10ET55gEEptgLeEkFqeawDRUqo7AYY1o2
         UC4Ms1LwwH8Nro82LAsK/ECc2rry7oktCoM8/dAR07y4iXjl0uJ1U6A6aEvzTb5KcFzL
         o9EIsezAl8D9dCqet19aA2qOva9B4qzXQX4ReyI8WcylCS7QlxN5oDjWrMOL77gFvFAX
         Lv5LZdpKGCH99j9k5ifWirG0i5uAwtQQzzbj9dvShMglLSgsvoIwxJW/Lc5TBcWJD81K
         /p3Ell5v0JE8qsOcxxykJkl6Km/0Vhjyn1epWPFW3RVEjQWZcwGvLup3WEZPCQMaiC8p
         LW/Q==
X-Forwarded-Encrypted: i=1; AL+hErHpgIAdgOX/lUU5nFbIwJXrUHIa1FGLdl2myefLbKfLeHArjaPxfmUo69NLGPRZIe/LE5dcO3ncmJaqolSUCbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vtu/+2xS+VMjFRkv1vycyX5QmO1wcqiMDJPDQDMoOFO9wVu7H
	AAMtFHv1f+hiEi6Y9VZfsrTk3/yTqf11whBCvoEoU9SVdfkDzGyfz/L3
X-Gm-Gg: AYBFou2lvuul1PNm38s6tZHMN/qPDi+xiTxqwovqNsXw0GX8IV0rdkLj6gTOesmVXcc
	8IC+7iqBhFf4zODJjkrkSMy6ttk6G4wUbk+ReTo+5GQ3M4lLz6NkuCXxBk/hHadE92EAV07Irjz
	0In2M4L4MfDcBRmT6pugIoq8vT5I5MmDHXEBul9Y3qzzWZjF/m+J7DfM6KmQzVkqJJ96tfpxG3g
	ryj91jcnuxB89EltWd6o9ZTCmSh3v3VwclZZFvnZML3VBQAijMv9yp2VVVH/fI+lbhExqXMYLgo
	CGUcTrrUSpfwHckPWfcj8BUc4XMX6vu/wLDDIL4obwRtYrockFV5h208zAmZMxtKslHnXYtlF4J
	rrUuqe4dQlPoK4FhCPWieLnblpsobkTfyW9drVvy9kVEbtJp3qDQO0tzb4WxzJXi+Vwg8Z5Y69W
	ngTmoQpOwh/gCCB1rJcKxHlqrAvBuwSX+ZQQDe6gcXiCp1ITyabTfefLU3CCGFLecymXfk3lFRt
	JWQ6Egx3MbJU0x50BQTvy80ILGvKxD2E1/iozTwQiri76Wd7fRNeuBD1hK/wGQ7pC0eFOtcyzU9
	KDEFPJg+GrTnVkLIty5aBgVUy9HMZxp7c5sVyJijV6DtpAZ+ug9tX0xw3fIAhvX+7qaEUJ6emo5
	N5f6B2RbLbvaFETiuatjKVRnWYBXhVoXqEb9EuAxN+kMokiQRBTce0nTjP3E3
X-Received: by 2002:a05:690c:c4f1:b0:8b3:416:b1a7 with SMTP id 00721157ae682-8b3419b5bf8mr14445747b3.41.1793973756132;
        Fri, 06 Nov 2026 06:02:36 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm19090677b3.5.2026.11.06.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:35 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Subject: [PATCH 0/2] lib/genalloc: fix a NULL pool check and add KUnit
 tests
Date: Fri, 06 Nov 2026 09:02:31 -0500
Message-Id: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfd7WoC/yXMQQ5AMBBA0avIrDVpK6lwFbGoMRikpEUk4u6K5
 Vv8f0EgzxSgTC7wdHDgxUWoNAEcrOtJcBsNWmqjlDRi2h1voidn53lBkWnERsuuyK2BGK2eOj6
 /YVX/DnszEm7vBe77AU4sYxNyAAAA
X-Change-ID: 20261106-kunit-genalloc-32ccb20f97a6
To: Andrew Morton <akpm@linux-foundation.org>, 
 Fredrik Noring <noring@nocrew.org>
Cc: Christoph Hellwig <hch@lst.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

genalloc has no unit tests, so patch 2 adds a KUnit suite. Writing it
turned up that gen_pool_dma_alloc() and gen_pool_dma_zalloc() crash on
a NULL pool, while the other DMA helpers return NULL as
gen_pool_dma_alloc() originally did. Patch 1 restores the check; no
in-tree caller passes a NULL pool, so it is not marked for stable.

Tested on UML with a kunitconfig of CONFIG_KUNIT=y and
CONFIG_GENALLOC_KUNIT_TEST=y: 12/12 pass with patch 1, and
genalloc_dma_test crashes without it.

---
Amit Patole (2):
      lib/genalloc: don't dereference a NULL pool in gen_pool_dma_[z]alloc()
      lib/tests: add KUnit tests for genalloc

 lib/Kconfig.debug          |  15 ++
 lib/genalloc.c             |   6 +
 lib/tests/Makefile         |   1 +
 lib/tests/genalloc_kunit.c | 508 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 530 insertions(+)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261106-kunit-genalloc-32ccb20f97a6

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

