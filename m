Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D972439003
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237994; cv=none; b=cK/GTFPma1RT66OETiaALV1o73iG9mgTWDiawroQ9j7iJNOGlQ48oyYGThTFLMdO73Y67nLX/yYf/plopMqpfTkKTDfBZRiSrjvZXtg+GPU4IAb4/NK4PtZONeiXpNRbUeTV5O/Gaj4O38v8n5t2Hlgy/i3XgArjXnhn7KfgSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237994; c=relaxed/simple;
	bh=cZdbzn5zJVjZIEe7/tzsAfFiszw+/L5oMJqAvM37icc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Oxz6Bu6e3ciafBtRRXiHjciPC7WvrxMqZKc2fWqXPASU/Vy81ClQHHsYdxnaN7tWzpBj1SRe2x2h6EukxN1u244lVFSWA1V5QQdPGNUCJJKfddTiaMv4vgcsTuKkPm6dNFA4zIzoY+1lYyK3Pas7B0oYNZV0sDBpCoSq1y/n1n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVMlI0xL; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVMlI0xL"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-795176156b1so382337b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237993; x=1770842793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCa/5leyVb0HfwWNsS0eZiKuGQsz93x+xRuXmo4lowE=;
        b=BVMlI0xLXQ5lY4c50+f7OJ5Qn10OStia3iM1mLOjQ/ydsy2Hy0tqBZUCQAG8dt6pEx
         98mL3ipMo7FoNnqENhxrCKGxFqK77ZjETk6tRozBADpbPfjusbCTlU/VPm0ayNmzih5d
         wKAZpTFqsRS4+rRiKaVKgS45S41q4O6dk0dex+5ibtekL6n6i9ceise9Kbgi0WNMEkII
         g1nnxq0DFVnDG2DctKDMN5Wvms6nlKfux7YXGonSVitMQjXLbmAM1USdYIcf+4JOwSen
         Qq2eZ4GquMya7bXyswNSgQt2ViNLdLhDf01pYTWy2pfisp4DLNvaqNFIkb4ZXNhQOcGw
         ZWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237993; x=1770842793;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCa/5leyVb0HfwWNsS0eZiKuGQsz93x+xRuXmo4lowE=;
        b=dfJbxF92pnheLa+8CJ9ZzFsuFdeBIVheErpX6mh1/zadYBLQ8Ip9TNBcnKdOO6xDSy
         UvDkvFYWYh0WWmm8MG7mnwBDrzuyikqTqB4h5d0BTEyHRECEbY8gg4pk65g5CHOxI72W
         hJMXnZfcXxObOTuJN0wsqvdYR8WRfI1kTbJGFrSqyqlRva19BeWZbygvViAXRdgcOVI2
         QvlDiN79DQKPxk7/MwCkZ9gvcKEqLvYmTKMsaJUsnQpLjfhYQ4SJuCC0qifPo01Jb6RG
         BogiqPyuKZlGqbRbmAkVTonL2dHwTcRwodMfUZqF0bskx7JOE/B2suGGv7ACkFW+/4gR
         0QCA==
X-Forwarded-Encrypted: i=1; AJvYcCXRK3wyabI3TJkKQHKf5eY8C04eoiX/35+anXnmauj5ljiIG1yCMrfsIFlfIdZO2Mtz9Umme16F8Go6Va+Wu/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBb74F7rRUjZV1bYsgi5NVfWthF6zr105zuQndyiwsWNTiY+Qw
	NVOG0rafp1ZizAx32TwhRXukEKTZrS2Z58kFbAyN/GGClUfbbnGyc+MR
X-Gm-Gg: AZuq6aIv85UwZXR6DM19fuxkqVenpDHzkdx/GREOyoZcIrRzsRQka/V+S/G4kiOpQjS
	KePXflG82eRK/BozYT0SXWsXkRoHOscw/Lnio3b5w7BtT/FymyIA2Z1iEk543/r948f3y4dqSJa
	7m+H1Wae7zI1s+9ipNX4rCfqKjQwTkyXA5Srbim0sz9QyxlbuctHqJTTXs/fmJorbTwAAmWjHDm
	ilP2k3l2Q60RxYkEzO8jDFrHz2Wb/EQRkOEw6fFhik3HzDw+oxFlsdSd69smEMjY/X1x9NXzp9i
	8cWe4coyE4bmxgTSCoOuzNeQf/61bEKr3Tg4NMaj77ElGRLUy0qmFvugEeK5oX8/nvUXCKAsFkT
	zHw2Ay31dfewS8S1HfA0+h4+tuF4VRBPZwq9LWv+J1+riD1+74w5birvGUqKXEHSKloUAUh2v8P
	3wbGif++LyfajkOddZARTE8izN/d+ou2ffwr6zs1UtUd8NcCJf9vA57gXoL2I=
X-Received: by 2002:a05:690c:7403:b0:792:6c16:110c with SMTP id 00721157ae682-794fe7e2f6amr37355227b3.61.1770237993416;
        Wed, 04 Feb 2026 12:46:33 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-794feff620esm30244707b3.51.2026.02.04.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:46:32 -0800 (PST)
Date: Wed, 04 Feb 2026 15:46:32 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <willemdebruijn.kernel.1fcb030747672@gmail.com>
In-Reply-To: <20260204-psp-v1-4-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
 <20260204-psp-v1-4-5f034e2dfa36@gmail.com>
Subject: Re: [PATCH net-next 4/9] psp: refactor psp_dev_tx_key_del()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> This is a pure refactor. Lift the list deletion and key validation
> code into callers. Subsequent patches will have different requirements
> for what actions need to accompany psp dev key deletion.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
