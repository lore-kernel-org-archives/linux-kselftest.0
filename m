Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590241A555
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311416; cv=none; b=FuF9o8Rvr4c+niF9FNJJSpcqO0VSH5MjuBwyT4Oq02X4MJE+na8or3E6QpVNUAzswuYCUfj0Hhg/h3xhxR5wSHTnz7hmVUsR9HT2JURNn4y7EufB/cause/5X5dLzuZ2MRMT1kFOE6mn+JnKBNG18u/kcZBMOJwEl2CLjVY+az0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311416; c=relaxed/simple;
	bh=TgIIJxVOJ+2iOdFoDJUVRbmeJCaoACab0y8Ff0nGE+s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=dWfC7xmimDxnWoT5p7r2OL1A8z3bGpQFfGtO3GCOnXh02vaYc759JyQKhPgZUKH69d2r3f/1ZQor1Qe19FDHUWnuPKsv/b5pT/c1/jonGMYdS6qnkVn1LsebRATpmzkX+3hffB79XWNpBXjuM6rZgomU+xA476pCYJJv0wws4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/8zobjM; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/8zobjM"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66825847b2cso637351d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311408; x=1785916208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GuHZNpbtVXBmsr06bXb3BPsCK2CmKLVW3k/vJm0mD68=;
        b=c/8zobjM0CWv0aS4QutMxGONx2km5P9ih5kkTXOiVqpVcNyVkKOKmT9C7/PrYjDl1/
         z9lCZO1Ywlo9jaVuIbOyzZuvwu/oPP/4Umt20Ey3TneMh5zQyXOnBsuV4SgI/M2FZIl3
         IRJxZ/ea819mAmNkjjqcNyPElyatp9frJFxWPhbhnEYasrK94fG415nAbyb1zUbj5cLr
         CsNzVmi0Dahi5tIOlcgVZCiJrXFtRT+fiEpZMl2ZFN2WBN4Kvoa8PSjxReytKtCptOUu
         cwq7km1VY/hH0n3T+hhPXYerY0XF+xXJjX6WzqsBZ3o+CakfU/C7h2SNh/6ER19/2Ojm
         R8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311408; x=1785916208;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GuHZNpbtVXBmsr06bXb3BPsCK2CmKLVW3k/vJm0mD68=;
        b=g/ccLRfMp4C5S/p2rEpf0ad61Of/Ba8Ms07YbnaWJ/O/roYztesCDuunlt7HlHXM6n
         uiiquRevqaBUjydMAwtQ7RH7C7losIg0ILTtHwJzLXqkA/b7Wr79J1aSE+VdauQ+kvUo
         7qmIeQd4P983k9JIhijB6af/+I1Ml1g5cOW4XdvsqnMziat1p/sR0tFKd6Y7JgND5Hsb
         CCY2ce/jBGbKujvZmslypPxYUHivlL99Vv0DCVzSWy/z1X9v+317/v+dNmiLcEzPBUuz
         mcewRM+lIPU+PLsFxzdgGWH0h3iu+SRfod81Nj3/XmfEtNNpOGfsLZj8StdJ6EpSDvQK
         ZmkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rquzfm1sPpIX7v85UzUO+xGO7GqiU/1R7a59xgyg9y6mUyVOEpIoiN1K+O2dBbGgbBF/XyVjR7DrNwAU+YLeqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24oMe4FQaVGSB9AB8k9roNF80AnofZU+qjXEvSoyXGc2XY/Ey
	/lE8U6qq+0oFFIdUev7Ppz++hOfIgEXEq3fbswFflk9XoCjmE+0cHtPm
X-Gm-Gg: AR+sD13wfv0Ie5oBzsgHy3ihxWC+pkId8mkwnxjPsfoq1gNQCRohArwCl3BE0kSG/bd
	g/lZHyz2tni2R0Q5qVTnfryJ65VbA6Y0GNmsf55J5ZQvm/0r0fgPQo6S/NqI1an2dx7thOdHVZh
	TYs8wHziAGAMS76leqBZmm6sXtycmxS2ohLCFqqm2duvB8DkD1VKDSRgH3UI0BWaEB/ZoxuSHuw
	ZGQ37nS1u5R4vIm9087VQF+t7yIGw7WTpmfYWECaYRAIxuKefPXMJ9H0hzIn0GqqegwjR2gDdCM
	s/wBVbZVjmxt1oBHsdcSKubl314OUAqsFVBamlTALtiGRYPeyBo5bmwBfUNVBlUGqpZyHWtHlMx
	j3edy74QyNyi7tQCQRYO+BNNz9mwOI6Okbf/UKESwqHrkK+FmK+ilBj0nIVaxnAPTC771mEeO+Y
	buOYNeWoR5THC/pmMCSxpKanVCFFRRk6cjMo/N0JfKECi6PLKgBiqET0ccdI/EUmbaYHueQgdbd
	yndaA08djP7e3bCNCbk7ndNaDnNkLKoYEbQ
X-Received: by 2002:a53:d38c:0:b0:668:1afc:e760 with SMTP id 956f58d0204a3-66905828675mr1661727d50.74.1785311407986;
        Wed, 29 Jul 2026 00:50:07 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6691218c643sm1369405d50.4.2026.07.29.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:50:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 03:50:07 -0400
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
Message-ID: <willemdebruijn.kernel.846d137be17c@gmail.com>
In-Reply-To: <20260728160935.4128982-4-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
 <20260728160935.4128982-4-joe@dama.to>
Subject: Re: [PATCH net-next 3/5] selftests/net: psock_snd: unify on recvmsg()
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
> Don't maintain two RX paths in do_rx(). Unify on recvmsg() and pass aux
> data only when needed.
> 
> No functional change.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
