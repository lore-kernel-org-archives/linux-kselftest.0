Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67513D45F7
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879258; cv=none; b=huAnp/U3Iz4dlbDRDLaU5m01b2eLUlHUErcUx+7K+n+uO9TyM4jZdyf3IPu/l4pQ6VkhODaOyQ7I9VimKJjOaO/rBL+2FUF9jg+gBeCLqk92Vujm0oBlo+KXzdEPGVoUH6oOtpr1OA5AOsVNn4P7WTpqmwOJbq3YUkoUNr51GM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879258; c=relaxed/simple;
	bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVGUyXbh1Biast/3Sp68K4/wW8fVfOZ1jdbmXcLlBRcykK1fhesLVGdyGgRUytxdzI1B5xkh0usVTSr+lNAajbzdPh+1ay1o2fo4Dbhi2/fOw8JafGcH4fJi7Hh3Q0G/8s9Qo8T/HZx2qYgFvpz2ZYMpQIx8LlLXCyguCg84Dp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=R7o5tUNp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="R7o5tUNp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso52596245e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790879255; x=1791484055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
        b=R7o5tUNpR9hmLw4mfG0sHW8WqKMY1H2FgoOEwv0f2XpcIxD/sOtldJ14wqLdToi5/p
         lfukGXxCczUbolCHXqlLxVXozpvbiJl6Kp841S83ifbVJBi5nZiQp0u525DL5fBI24Gv
         oXNI/Xnc0flYwKdLcrR2jufMXKfiXppbDtZJ/ufyQeVt4L5e5C+EAWXyxdVc2Y+fH1Hc
         eY+fnrH1VLcgVMN66csnCxhut31gckmz1R6CEoPPfWnPLJkI1+cMRPSuqAvSE95NrLAz
         y3D6AVHAgaGn9/LH5rhj8bVmru4ueZtY5ie1aytSWDlFD2EFIiAOx7gxamg5h62n/aOP
         jCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879255; x=1791484055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
        b=jsNqEcndowG5Pkv/2zI8nlH1ymqiylt4nl1yQc2wDOrgrOYYkrShoHrRvgZ2G0sp4G
         kR7yPLzFfekTSewa9uANda8smv9wUZxDeDPQV7DUKhB2+/GpPBkaey8izAxIrMvquMP5
         X1C+lZgqK4u/lrVXfYUs/VwAVpyycIF2sPwQZMd6RpKt5Kj6w3bNBWrmnAZSs1zWthit
         tV4f2IE3V+pojrYLSiUp26HGy48lQLhoFLhzJParBt/0qGKXWvbrSF5aECD+ywyIok8b
         sV37GtMZi2q2wHZPB8naTPsChYnRlMPCkEIvd+TjFCNuZmE62ZcPFwnePDt3047BIVrz
         WkpA==
X-Forwarded-Encrypted: i=1; AKwUvBxdXgESe8CtaSQRItDM5BU1sZRvVzhn2hA2wlAmJYAG1Na12TzXD24H+63mq5TGaZ34LzsMSDsRdRfxRmlZ8yI=@vger.kernel.org
X-Gm-Message-State: AFuF++ksSWa7kTozQ4MEFiPKio/zkUYuTMwh8kZpsgFIxtaCWnGbdzj7
	lKR/TSKTBGPu2NJ70MI+1zT4xq61DE5vSpXWJImzkqGHgkTYKrcGKbmF2zt7lDKn2vs=
X-Gm-Gg: AYBFou2gcL5e2SJFHSK0OPS+JF/ygDJJ9wld4ooMH7mpv7/zPcQz+/RGCfuhkM6xnlz
	HTtu39TZeupa2DeZNGP55+HKXSqs3V6qxRTsi6PbUIjfuxurxF1uTO7E2T3sQfXxAPDVmv1hghM
	1GXxZ1eHck/YbTnPjkhpoQFxOBVfWQ1iHsgPjAtiYQ9pP1KX+EUzE4lemLdJHp2gFZg/Qc+t/Nx
	x8m6xrAFpDh2tr68sY9SfWF7ZsmrW5K1UxoTVDOdsySTg1R7msFbLqWZPTVwtWONaQFyTr4tU8a
	qOFjYmozlgyaFRsGfP4xa3upEnTm8V9Lp7pN95RD4GFpmMwwcBbAeHW7qjCDw0pp3keLcelU18w
	A2C14ESKAk1Eqgg7D66cqJlJxYFmq2c8EeIDEU0unoWfl/SUhwWF9z+TjPj/PXTZ6+2JpuOlYuC
	Wugbb/7h8eVHn0Gwpmb4wdoS72e/gwJHJal+CzIOJf+FBKOmns5Uxspa3FYZftDO6Ug+VLGAvaI
	KNuzlWVV0J9bQkq/6NrZL1CxPObNxDbZYPpDsMw87tLU2lXnmjLyDe7+kuuBz4eN+61GCR7W4O1
	5ZDN
X-Received: by 2002:a05:600c:19cb:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a02759fc4cmr8556725e9.13.1790879255118;
        Thu, 01 Oct 2026 11:27:35 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ad8c34sm4242795e9.0.2026.10.01.11.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 11:27:34 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Thu,  1 Oct 2026 21:26:54 +0300
Message-ID: <20261001182655.29692-3-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CANn89iKErdqHOGFpQLM_MAi-LcAaR6ZR2_rhdtZzv1TJc2L4RQ@mail.gmail.com>
References: <20261001171016.88208-1-omar@blockcast.net> <20261001171016.88208-2-omar@blockcast.net> <CANn89iKErdqHOGFpQLM_MAi-LcAaR6ZR2_rhdtZzv1TJc2L4RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 1, 2026, Eric Dumazet wrote:
> Okay, but the changelog is far far too long.

Thanks, and sorry about the length. I'll use your changelog, add the
Suggested-by tag, and move the testing notes below the "---".

The netdev CI also flagged the selftest in patch 2 (shellcheck, and lines
over 80 columns). I'll fix those in v2 and shorten the patch 2 and cover
letter text the same way, and wait 24 hours for more comments first.

pw-bot: cr
