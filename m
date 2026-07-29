Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43043B3DD
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311439; cv=none; b=ouL+jQTg1xP/z5ge8kIMih+nSu28CDIytrHrlFqV36tW3sAYcYGVKbh5i/tR5Gaf3X2GP7tL/rsEkWLPlyU6HbD8qmBH9kIGPpzm6aU0SSsc6yy2Xc2BkKA2opmaAbEcXEHZjRemGR141gdFL0Bfuhv9lcyq4GRpVP559b5RHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311439; c=relaxed/simple;
	bh=pB/iasdouCgv5+/m46LVzlmorsCQMcNvBL6R5iWICCg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=juH68s8x6zmWvF/rYN4JVum8CHfXWiJ69O2U9O/BtPuhGn47fbFBcrSxhXpLQWbeLqhXaQ8ACVjcOctyIxRIGizN/vLz31NUs18arKMp8NV2Az8UpVvIhXBnqCN8yklSRcmiMgpLR7uW0vyNgA4IZwBu9fC3y/SHpnnGFcGEGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2w17lJS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2w17lJS"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81f64e8dfbcso10733497b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311432; x=1785916232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ArooMk/BeNv3RVej5k9pLl6zc7N9gWRgmh4NCVP0KIM=;
        b=Z2w17lJSYZFTIVzMxTYRunl6TQO8p+XiNkGZsMmEsmWy7fkmp2xKA99OCI6wsfruPk
         1UeLVifBdzz54q0hulqCGvNucLKqqFkEKTiz/4hULDqPhGrnP8+f1cgGgKcg0/RtK2Hu
         cjmNmOarZ20UToBznkASC7F0qr/mtGam12WIRA+VwNIVuL/4PRUb3Ek8SNpJ2p9Rfuxi
         ixEWAYlxdi20GCxjSgYF9ewU61fk8zf5y2Y9Y5WUG3t6llN1ibMQPu7Fwoa4BOoAdQWE
         xeEm3pGO7AovXMKpMtyfRbMAfmJelIDRoI9q5655C7he+sbY+ZyoD16kPwEsY/zL7OcJ
         aQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311432; x=1785916232;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArooMk/BeNv3RVej5k9pLl6zc7N9gWRgmh4NCVP0KIM=;
        b=lX/4gqs5cFdFlBNn7crM4IXF9IbUIgDRkrMTx32CxreqGtHiyAEzcPTxo/5vVs/LFU
         BQXRm67MpZN5qSMmaUIQZHOVijgF44sQpLqA8EOd2N4xkiBuA56HID0C+5tSk1XAZ1o6
         udTRAybFcnrPZv4hVgY6d2tJwmInxzn5gM9Dnz45x8D2vl7HpUMuEUgfl/l9yBfFiK3K
         6ljjUUM8s4XINLvklcZKhASwMn/NR2hOBXCihfgdpRhgq0pQdtfSQFE4DIAzcQWe23Cy
         2buvI3Ci0OwQpkjJWUFzr3lDioF8hoHf7/qoHqqmlPpZwUstL6m8fCwvlk1o5TOu95yY
         ALYw==
X-Forwarded-Encrypted: i=1; AHgh+RrKAHl7b9r5KU3SJij65mc18uF6zEVM8lcwb1CJ8kRAvLaEYfywbvgrQDy7aWCe1UTmiLstowxJV+qPkYD23Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0bMFi0NlkQZ8ZqbM8HNdm5ZZTpjqaPoHxSrFYgzcZ4Bb3IHVy
	KaZ2oIv/8lABkfAyNInR+0eGwmNs3TIF8hK8ZfZtr2+NnU0qpGBhRzcM
X-Gm-Gg: AR+sD10v3QMrCpQylNDcwf+nh9SwhR7nzd2AFhhMTp6TrHQ7wC6DZVPkhzozG7Xr6e5
	zQNyOOmN1nffUv1Pu4NygPC2CT2jyEM+nbKsCRl2u0wht20S1HdfRDc3F0OOI3Q6O3OtkRbgReW
	yNa4viX433N/qPvuCIOgPlsfm5fP+82aDKDEcigCc6nuNOj0HnVjyzJ6jhbwcbNapnzRXvKxEdn
	w/EXueZLtDwep0y9Jeeggzeug17hlQ4aN3yJUSc4cNJKZexN4/VKxtPWaZny4zawrmEdTHrRQHN
	vs4RpucjVW3JJO2V/x1Gp1PnIw6v7Sss2Gq+qw4497jwO882onUsp0wADvBT7pmBf3ueu0LwmWq
	6ZYz60SATqTfPhaAxL1r3zh7Qry0OGvaAQcDd4bv8hRXO46WaFF1VYq8pYW0jFqYyiY6/rCevzS
	VLtYsR9x+OzUZXNp7apxbbXc3yBTwN+J4sVh2H/bOMz1O0jYqXN7l17DxqI4b9i/1gaF7b/O6La
	pshJZG0J7h7IXb4L4WEb2ci+6/RwER7ZuNl
X-Received: by 2002:a05:690c:7245:b0:81e:6d9b:156e with SMTP id 00721157ae682-81f99376184mr29288167b3.47.1785311432078;
        Wed, 29 Jul 2026 00:50:32 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa29b5fe2sm13394877b3.49.2026.07.29.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:50:31 -0700 (PDT)
Date: Wed, 29 Jul 2026 03:50:31 -0400
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
Message-ID: <willemdebruijn.kernel.e3202003b46a@gmail.com>
In-Reply-To: <20260728160935.4128982-5-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
 <20260728160935.4128982-5-joe@dama.to>
Subject: Re: [PATCH net-next 4/5] selftests/net: psock_snd: Verify sll_pkttype
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
> Extend do_rx() to take an expected packet type. Existing callers pass -1
> to skip the check.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
