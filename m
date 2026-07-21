Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C331470443
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663497; cv=none; b=GFXdBCOoHpIwB2MCxsCjTVrys0aSmNrHoSZSMLwBjBf7j5IRQDaVezrfuVCPG9tNvEU+uHeBmq8REBBZTIOoMoER4jLCYwTJpZE72tSzAkPHTMrszIjMKDZypoGNOE+WGXlQDzWmac6ez6hbCs66lt5krCcSTqBd+0QV5+B5ARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663497; c=relaxed/simple;
	bh=pxmVjLPG3nH0hKHLAF46OKERZeBhdHYcYAXSEaXX/60=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=jRwmYnHJxtJqyyWdPEkTy56m+5J8AoOdYCqtPjD7bpwoQTjdN1U7P7XjQo9nikFD3K9114HVpe05dLCQ6suRneEEny8fv+F9a+NG2CjcRbbA6Ey4bO4zLcNx/H7SJ5CRb53e4VlN+FH2x6vl10xO+ItIFiWdVUfqiFeNrEMk2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNOkofWs; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNOkofWs"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81eaf3709b4so97302087b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663494; x=1785268294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8I7ufhgviSfj8h8UvuBu4QX2xTPKTDNTn4U/E8FrSI=;
        b=LNOkofWsMEukwgjweGlIaW2OaN33ffpv6wP4GcsyfR1ps3dbqdns1eolzrStdLmbkZ
         am7xEj8aLoYEm5L3+MYIGwZ7cFiJR4K8ug6fA1HbP/Hhnt1KpRzTPc0cmrXpDb5peDdV
         qv/iz8uHgLz6E2i1zjwz5oxU75Ay1Z48CjfHU4OI83Dn6kcQo/wNOAaL1PRTo95vtC1F
         7x2l6Cl18RnTfp4FuPofG0twkF3PfaqJGlbWPbvXMxLW6UYrj8bvIzYoiWxuu00ZeWk+
         MAKRMqynijGrRtgJsOBaFePjRDZhCcZke0daEvucKvfNBOXR+Pu9tZtqIcPAGKv5WXPZ
         iqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663494; x=1785268294;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8I7ufhgviSfj8h8UvuBu4QX2xTPKTDNTn4U/E8FrSI=;
        b=p7oJK+aNnuUqLJNs7sfcDa2X2mHBn17TbhpaTsFCcJjK8SskuKD9f5GG8lXal4yjdh
         VaOh6gbbFwVITkjD6oQZrCwpuccPgVaShiip3KoUL7XN+yWomPu20eVhXYfiIJ+jwefJ
         1vE4aYsEtuE6xa6ARpEIIzhuPywlcjC0uP9e2FiwiUU7L4O0HVcPi/KpdMH2d/Ld1RNk
         9p9IGX+DLmKPpIwwkuANRR5PFuc8oOKbGlGmdU662HeaqmjG6Vs9LOSJtijP84xLSbGz
         Dpm6Ol4BqZAERlUFOcBUol+0/hz4g8F7YZNTWbRx9QWUV/iEb3R/BcVxl1YIdk5/G0oL
         upLg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5cjiyQcuTpJOSv5p1q3g/P2vrVPTLws4maOWRQVx7gtrgBl8byCop6M2M8dbswWVnZySX1LD4zlEAXF6+GJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCzsaVct4uno3uPX5P50lVqKrQvnjxGkzFNENBv0u5Uz0Y8sn
	ZHQtZLjlSsAyZUfYLFAoKnqJ1qVSIgSfe8xdl1UKjupBqsDd+BF+4K5J
X-Gm-Gg: AR+sD11UdRgJtOsy5DLY2PoSPhnNsQtsal8g07hJIQoO+MJjnx6WKwjpg+HoCZJ/eqA
	AlVdT1l18JUSNmNCCSIO2L+TxMUB5vqoO7eMtzyd2Ec0rkmexE39fBrHD7oW8gP63xFovcWlcO7
	aVXgIc0nvMXz7461bnq6ydgR9puaWpiY1PjXTjx7NVgwHSUycSGVtGUFhkzGykt5gAOc6u+Iq03
	pIWDmlj6s4ADKBQ73RB2eO920WZvp+Q+NnExh3TOx6geUUgDV9mxynbFhvuI0KCAsXt6NY9GCIT
	na2qoBYo0EABmnqlLQBX+AFp2+G4lkctEMBg21KhbSjJMAUkTFI276B65tyVtxjuaq6ez/1hrBh
	WUP0VOEL1BVn051LjSMU4/+AOdeBpe9Xx7VNIScWsa1lD6cdzpi5PbKPKP6QWiarVu7SXA1/6s2
	aFChZcuKZJAybqkXM5b1SOtbid3kguivmupYGeOT63fcAEMWakhSWuY1k=
X-Received: by 2002:a05:690c:3505:b0:81e:6d9b:154d with SMTP id 00721157ae682-81ef283e79emr63529217b3.55.1784663494168;
        Tue, 21 Jul 2026 12:51:34 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33ddda95sm2715587b3.35.2026.07.21.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:51:33 -0700 (PDT)
Date: Tue, 21 Jul 2026 15:51:32 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org, 
 Joe Damato <joe@dama.to>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.22a199c03e97f@gmail.com>
In-Reply-To: <20260720122714.759175-2-joe@dama.to>
References: <20260720122714.759175-1-joe@dama.to>
 <20260720122714.759175-2-joe@dama.to>
Subject: Re: [PATCH net-next v3 1/3] selftests/net: Test PACKET_STATISTICS
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Update the existing packet socket test to include a test for the sockopt
> PACKET_STATISTICS.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
