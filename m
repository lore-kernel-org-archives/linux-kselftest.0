Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759236;
	b=vFiYA8fXItk06i9jFBur4GBF0J6oELZillKkq+I9/NdKXqLdpWl0asETqpL94LJzTFPv
	 63tKYKRgybz4MKYjrRXdY/BLfBtVPRhC5fbxaPq7+0RlCIsS5lCr6xqhT2q8VPjeqDq3Y
	 2qMGnYfrpBSIGu7rPOQf3KIDe0Qe5NzUXRf+m4KlF1tGeXrYJryOi5f1UZz7oZBPOGIKP
	 pPGn9p4VhYxn/ok1U2/GHmWVfqCAqCDUNUv0OyJ9ERB9jnDVFt8QsmBRA808eJjbqAHqN
	 v4ZeBrWVEv1ghgLIFvIjDW8j1JnRDKDq5uGzMm0F4dqRh26TKVqc42njoiwwd1/QzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WreHQ+ctfIQVAJ04YTajYP11NvK53JcUXlDQxWzL2OM=;
	b=BacngyCmmDaMRaxG/xzyZxoQdxINfrUs4uPszL1exeXqIsbxybVzNnxHuP/lGiBh8AwP
	 k0KvlY0dtSXM6wZ5NcIFHYebeFf3Px/ldLCm9JiPiFRSbHC/D1tX+zgvKRaelskIZ7DLy
	 Rcdr+KHn6NHsOJaFYp+A/wNKbCC8XRw1HuVOe6dkzRlVc7o1rgPDJC1ifHnBFExjGtBCD
	 bBggOQMhnsReClQ0B+OtpwtP3Cpf8rM9aIBJ4CwGGn0Wm0qtnBMkZ6hVq/k3NqBC3+JxE
	 Ara7+c/7bouqKrPJLh6yD42JRuvuQLvrL8lesQPLOh+jjpKybe9QBCrtFQmUy+wWDTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7Aqq8Yp;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE18606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE18606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7Aqq8Yp
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so173863a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793759236; x=1794364036; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WreHQ+ctfIQVAJ04YTajYP11NvK53JcUXlDQxWzL2OM=;
        b=Q7Aqq8YphUZDFDNoBsT5P/HOehgJ9c2UdTd3tOtAeoi7xIjNDPEoitwgwSNiiVmqG+
         VJXso021xyD1qGWiRJn1ddj5i1lvFGEsMurHhUIZoiWuIaRS+YlRCm28OLVx0+1+cdmF
         J8pVVzJggZ6ltY5EiGdEzzvDNQ1poQqpEQmReB+TdbDkXpo7ZpOBWTSKr9DMPo9aAQ6q
         XKMqZeVF9PwJ4n8SU4QnU4dXhCcrkTwBRGckjFhZClMw7NaSpiwDjklxGTjil7BtRJSm
         F6pwt1BYVj2yV2o+O4A7qCtFxLlIB+o3LI9hssrkuC47d29vhFCz3ImTleCZSxNaD7gk
         AFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759236; x=1794364036;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WreHQ+ctfIQVAJ04YTajYP11NvK53JcUXlDQxWzL2OM=;
        b=izaf2siDBe3DXD8hzyqFDC0QlpgRdcMIMFBnFdFOsLlic3aghDhpp2x2GtJT6OLIQw
         hB6LkFS2bZZQFi7EOAp0nd57WCNvlOuk9aJ00Zi7524vvKbKGLBnZnUdQ/0Sw3/jsGbS
         6/0dkjKXwls9f/0CEAGOIFCFdIdV1mY6rsZkL9jlEU2gD5xbwu8BpOYPF1O4Ozc4hi6Y
         KSHTDf9mounz58No18DjC65PjaYFPszamHtJ8bR4/hIhfLBOaxlK6z11vsiRuLWIQVBT
         mFarLcneLacb0q4GkQ/GYfFZec/5v27bF8j6+2iLIu8XruM+nHrrpXQL+AllYKFLK+It
         Jnuw==
X-Forwarded-Encrypted: i=1; AKwUvBw+1HUpF9YrICJibYmH+JKUgalDl5beGkunvW1M2934ML7hpjGC0pTlL6qjD1Kv2h7yCfnQ1acrrDmWVUt2At8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AnYuvwiiqMK31SflvRdgWpXSeg7H2s0DGT2N+ELfzWfiUmDnr
	gKzqTGIRCEEFziSKOa2NSP0JBf2e9H/pxFrajSV4opnBA//q8XWI6r/d
X-Gm-Gg: AYBFou1O4LXdtykXiiat12wbziDrwCjVd1tQdbL/Byxvyi5tamHAamxS7Hl+ZIZzscJ
	rjrnNEWhfpSOSL+YFCuxOPNXuo4GZbiMVjFj71Gcc2MOG2fyqOyFATUedd6WuRD4ZL9lmhxXQg7
	5NsqtXJ1/8c33xX4/vHtPuHbn5cXa5FQsMHc9X9eYwJiH2P2T6gguqRA8DJVaOpxY5HIIrY5X9d
	NbV8bPuFFaFth9YR+GkHwUUpG+NF/BWWHLT4FGp36xMfY8Rl4nIYugYU64vKIX9kFPu4tOzdc/i
	jNwJ+04q70zTiNgfbWT0j8je88fVi5hVoyoaTN5W+HkaIIxK7fRHYj29qB4FmpLz+bivVztkuP3
	RfYJecQrzYAdMndBn4d9gizeiKbfnKbEdmwE5wbu94R86/MTB/RaFtBx5ZF7aY0WUlT/2z/RaRW
	my+mIsNs0Ifmsy9WsRh5Fo95cRfNSVeufjUFvirKu4Pov5oxdYaF8ZGezWuJYo2jVkw4aYtD8eH
	5Cwj13JW76Kqge1J9UCMIEs4QhdVio+BWs6dEqtJnQT+Qy6X3hO6mW/53YdEmHQH66SuKq2WwUn
	QrSWjB1OT3DTOHmKXwhEgXAGeKl+SRRikrkXyMrB24ZzPYt7zh9IHt2apf64A4OBLaF1JZp5D8I
	9hK4agC1MVs8LROsrl0uD9CKPSf9hZZWWrA==
X-Received: by 2002:a17:90b:4c08:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3ae8957cc59mr12525443a91.9.1793759235515;
        Tue, 03 Nov 2026 18:27:15 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm6762493a91.16.2026.11.03.18.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:27:15 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:27:14 +0000
Message-Id: <DMM2KWGK3JH9.2TE6OINCZTTY@gmail.com>
To: "Tianyi Chen" <hi@tychen.cc>, <bpf@vger.kernel.org>
Cc: <qmo@kernel.org>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <linux-kselftest@vger.kernel.org>,
 <skokovmaksimevg@gmail.com>, <daniel@iogearbox.net>
Subject: Re: [PATCH bpf-next v10 2/4] selftests/bpf: Check bpftool map info
 across mixed BTF maps
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <2c25cf3d118cce558cc58a207449b25c5f66b3a6.1793732336.git.hi@tychen.cc>
References: <cover.1793732336.git.hi@tychen.cc> <2c25cf3d118cce558cc58a207449b25c5f66b3a6.1793732336.git.hi@tychen.cc>
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

On Tue, Nov 03, 2026 at 11:01 AM Tianyi Chen <hi@tychen.cc> wrote:
> Create a typed map followed by a smaller untyped map with the same name.
> Check that full and named listings do not report BTF for the untyped map,
> JSON dumps match independently dumped contents, and plain dumps use raw
> output when the selected maps do not all have BTF.

This test cannot hit the bug from patch 1.
So the four subtests pass with and without patch 1.

pw-bot: cr
