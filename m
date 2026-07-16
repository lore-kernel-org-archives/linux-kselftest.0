Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D842FCA4
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212742; cv=none; b=IUAw3qyCutgUtxyJd5x8IpjMnbIbqdI5yfVJBWTuQPy406zYkPgHDUNgET+wdl1Gs1HzsB0iLlXp4Av47gsfoN9Gs8icVe63msrVw37Y3Aotxs7C/fEO9PuJKMvfkQEKRVtdpqUN4yXJuNi9PfmaeECnyPRnRW9QMo5bi+EWHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212742; c=relaxed/simple;
	bh=+DWWycF2Ya8d3r+BKSyQrkBt7+k+gkI6OHJ9lujz8L4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OCNYkj840FrhEE0KAM21VGqebjB/IMm0GGO/CQ4tPr+mneSPkDeKG5yejhOIwt1e5MQl0wU+hNPw/RJERXGNxhplIQSz62EA4gffDhb1caQjdsvlqHA0b5kc23b1VSf+XjQt6YYhFshI2mSkLSHyUDviDIhMUf//wrcl3OppX4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5B1YV1R; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5B1YV1R"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4925a778491so2565525e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212738; x=1784817538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DWWycF2Ya8d3r+BKSyQrkBt7+k+gkI6OHJ9lujz8L4=;
        b=j5B1YV1RgH9ixe1VssNaQ1dEY7aVhqb+Rf5HrO53MtXa66YQD23Qflo4AQ6/BYwmTR
         qI6AN8DbnfmE/70PiGCpot8iLqk/oqMR5h2+nMH6+tA5zY5Z8OQoIKDaZuOS3cW898uh
         FauUM8CFCncUBZcYZX4rm/J42Hpp0UFmAAwHSZHf92DqEyCfVDI7Nf5+fJKe7gO09qzv
         O9XDBrwlr3DS455dqK4fgVNS7PIPbnOlYhT5umVE99ey1venB/MpgLtqycNt2ZKIW2X4
         JPp03JZEbkaEd79izonNpkY8SALKJfvOYVa76UPy845/Jj9c41NcQVwWYenUHV3CKeFb
         xjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212738; x=1784817538;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DWWycF2Ya8d3r+BKSyQrkBt7+k+gkI6OHJ9lujz8L4=;
        b=SFjZSFdAiaGBLtoqeifVjVv1x3SAcR7L/25O1elWQQzVLnKnlet6B7AJSAo4Qt8kMk
         9DCurdZRJRXwH3DdrVfy3BVY/j2jS/8xhofKHjqK4XeFCnIou+Hqf2L1OKkBb1/sfmQv
         BplZZjXTB/HBZ83PbUyvLToM/AGG0ZOpxwmkdn7nHkwZLwvyuBYaFOqZkXMDPMw9zEAR
         mAQbEOnDQmLic37gZ4y45ny4RlfFoh5fTCTSbB2LBL5nJ43BE9ZM9Im2h+HpvZoNCnaE
         u+Q53IjJN2zD35NQnmDu8tRDXn/Jpok1kNnBjov8DYCXaYad/BdyjmGMFzXTzLr2LqXs
         S1Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrWAU8D4dDaAB0omp+qs9h7+W7egM6XzqT0buAzhp8R/G4gdp+ZP4I+PHFCZD61Y02y6eVNO1KUfAD9HUskDWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLf6ywgHVojVlloDr12aObtZviI+XjbR5k/aYAWKZWvPetHlU
	qZHCJ1fOu7cjEgEi7cPZXKgpg5/ACg1sxX72sAZ0UUjK+PesJbmmG0ZS
X-Gm-Gg: AfdE7ckWbz9R37TckVQ7LIN1jqBgasWK2S/ih/JOcSs1CTMnjoE9/Glwgsc2sQ3MKj+
	N7oAZMSZoJ3UpqeYO7vS3ohyxYWq/6eivSIPM2LabzsY+UMp1o//Li99JjTgOM5cA5GAzTQFrcn
	OsRS6T05d2RCZfANgLt96bvEkQmUhIQFx3KkFr0Vx8QQK5noeLqQ1pzXjY+ktnAkWc0iIywSlXg
	fTb3iEqKdi6bvsLhNCDqOfJFnBBzQXu5Dc0eJuKuJwf7fb3Dd2L63xYcTyyUupAP2oH1lOMbTJC
	2gJqPQmqGzUPJsn0gjEJJEfmRne5q7CNMdxmwg2XJs3AiIiKV4Fi8v/4Vx4m0HUx47pIbUDj1Ep
	J11WW+aQjbDwfrk5jUpzBEsn6b1XfQ0Vv6JdAwemcLMojf5DHHCBe/fQndldznpwjb+LVBy88WE
	Mp8j2a9zGXRON+Gg8j6XbiNGfQCAJN5rottuie+ceB+RlhecWyRuFIjz3AA4UYsTuG4z5C7DUuY
	DM0v8bld3ndgOw922psiD1QKlFwn5f7+hr4gDc=
X-Received: by 2002:a05:600c:a214:b0:495:3ca5:7069 with SMTP id 5b1f17b1804b1-4953ca572d6mr36272755e9.6.1784212737534;
        Thu, 16 Jul 2026 07:38:57 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-187-169-051.77.187.pool.telefonica.de. [77.187.169.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm102981625e9.0.2026.07.16.07.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:38:56 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Felix Maurer <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/4] net: hsr: add PRP interlink (RedBox)
 datapath and duplicate discard
In-Reply-To: <178420323080.16062.7813915035618214520.b4-review@b4>
References: <20260706134131.61659-2-xiexinet@gmail.com>
 <178420323080.16062.7813915035618214520.b4-review@b4>
Date: Thu, 16 Jul 2026 14:38:55 +0000
Message-ID: <178421273548.70.9896722161695038010@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 14:00:30 +0200, Fernando Fernandez Mancera wrote:
> Since we already have rx (enum hsr_port_type) here, can we pass this
> directly to prp_is_lan_dup() function instead of passing frame?
>
> Of course these calls will need to pass rx too.

Yes, that is cleaner. Will change it in v4.

Thanks for the review!

Xin
