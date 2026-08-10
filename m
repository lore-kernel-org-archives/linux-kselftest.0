Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30635C6B1
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 19:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390507; cv=none; b=G0Xvr1dGX1IGwN9JP4xhPUXmrAP24WI3bDnlpcmZrYvYKDlISrzKkvaCEtdN233EG9sdcTXexZD3ROjfUxJC350+40vBAcGwYyfZ++UotFv0BCrNXRxVb2VcXs9TvoFB+JPQVGfVXW2zlcVZuwoEMHRT+GQf6G50SkpYVoxvMK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390507; c=relaxed/simple;
	bh=WwTpth8MrFVJI0sYO78MEBeGQnL3an5IX2+5ZrTWz9o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pupb3VFI1dg4RelIYl/obzfnus7RFcFXnf2DOTbvPN2yfrkvtDVPDCOdhlN2yRlcToebq13xOQTKge777rjQ1ENUBPJD0nUJP2UOnP8YaDQdH6Z1AcgvNmcCr3zFRp9xq07ZUQK3gq8PLJJeI1LJWe/l75j0grOG9SoeiNeTd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZUMbA0s; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZUMbA0s"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so80118a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390506; x=1786995306; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WwTpth8MrFVJI0sYO78MEBeGQnL3an5IX2+5ZrTWz9o=;
        b=sZUMbA0s26EWbUEmsvpHQ85XEMvlR/Ulytn+PlhN/TjqpCvb0j+KM4GakKKBYqe3mD
         BqTHniynE0z9pmpVhU9jdOXL44a03aOg+rnbpE6Yb1CJF6DOtQXQh7U5dVpdjPx1S66F
         TXdcCrIEJtxJZsguYTfjymygC8EwkRMKKsFuNun9TRQO2NwUso/snb1ex3S59RYloONG
         bfT4MiSZZoZtJnVYgRFbRdPy5+IbWWOHj9wSNruVjWvEvaID02nwLjAchCg7Wj5OaJQ1
         oGKJLTzLdh7kQp1Io5tWyk0moHR68E/qkt3/ZARy+b5YSwQRuzlJ8OVNZMhGDXqANMbr
         fPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390506; x=1786995306;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwTpth8MrFVJI0sYO78MEBeGQnL3an5IX2+5ZrTWz9o=;
        b=tJY50ezjisNImV6lPHdd+M2gNwAT4n3t4dZcUM4cRPigCn4GRpBqQMjBw1jCWX/CWP
         px+Y46GE/SMXbCFhxl5Bw0TpmlygjPbqV5f+AwLrhBnKGBCtXDXkWW5xU1ys14kxT0W1
         fHyA+Ut6aXQkxvTCc8tGwmVOyhOnI3ImMTyHTCJfsWQGPP+lFp2Ie4phgYuyNsZ/1UzT
         UCTfiWZe42Z6L5VUos8SC9UJAcNlN2FA/Js6sWZT0rQRszDUO2PbREQOkAI+g+BWiZ09
         rtQcG0+oMS5AngHC2+YFJ7ENysEtR1q5kqXCQAzUDNZMEb2oIFJ8nA2agyTZYXGFZU4Y
         J8DA==
X-Forwarded-Encrypted: i=1; AHgh+RqGx+GhHwhSvjKRUyu2bpoedJftlgPGD+927/xGb5yKnYWa6d37aKXZXxfgafK1HoGOqwZZyoZti2084p8hFyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1mbO1BwXa4k1LkLJah1a8Ab9R7/XEJjWFO8nRcnyq1gPIu+E
	jEyhpy2tk4cV7dYIGM7eDmW5E/y+D8Kh3Kw/ze1+uRxnHSTHuyIEXJVw
X-Gm-Gg: AR+sD114wuICf0+jPIW0lfvkcRrg5SjwLcnioDm9+l31km62m5I2dtn8EZSENp+V8/e
	dTbGY7S/DkpLyokdtZjD2NJuDlovFTYCRSGqN/zUizcYFhU4rfRbaUhPi6VW9BBzVsA4xEdndAp
	YbJep4lKRtB3bm4MgiZsxUH9pqdGQLDA9yZuLNA2MF1Gp78Rh6uuXw1fjjq3Q3U8bGpUEXGFcy9
	UHgTYOL29a6oPvC3BxOqYeeikrE5YkzGw4cUTJAeNMyy+6bMuYOtCZzf4gfNwKzQuf2Lo4hUCOk
	QmdEecrvcjfWhMADXv+PydS5JTOQzY3fq0FAQIMtsNrzPKlSlLBuSqd2IRom8q/iOA5SFcApKR7
	LsuHh0jWszXPzEAMc7snFHVfRw6YGeEkUFcWpSOfnokQOk0DqLdKONct0NUYOtZUmPu1aP+i3bJ
	2clk4i8zj3fBfGxVxeYo9+cEgdSKnjMDt4wY+lg85N/MIYpS+K8rDHLNUrhdMrKtdXBQQlQkN+W
	qfzECzOzloqPUPtn51iFv0MTD8=
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr41170573a91.0.1786390505796;
        Mon, 10 Aug 2026 12:35:05 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5226b40sm747333a91.13.2026.08.10.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:35:05 -0700 (PDT)
Message-ID: <d7f9046b1212e0b368bfde10b88549ac9ac8f63c.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Compare iterator types during state
 pruning
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ning Ding <dingning04@gmail.com>, bpf@vger.kernel.org
Cc: memxor@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, 	linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org
Date: Mon, 10 Aug 2026 12:35:02 -0700
In-Reply-To: <20260807004320.134069-2-dingning04@gmail.com>
References: <20260807004320.134069-1-dingning04@gmail.com>
	 <20260807004320.134069-2-dingning04@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-06 at 17:43 -0700, Ning Ding wrote:
> An iterator stack slot can be MEM_RCU or PTR_UNTRUSTED. These states
> must not be equal, or the verifier can prune an unsafe path.
>=20
> Compare the pointer type for STACK_ITER slots.
>=20
> Fixes: dfab99df147b ("bpf: teach the verifier to enforce css_iter and tas=
k_iter in RCU CS")
> Signed-off-by: Ning Ding <dingning04@gmail.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

...
