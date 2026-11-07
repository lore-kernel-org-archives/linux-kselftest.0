Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030044;
	b=W8m3UXPo7QhxbKGWOoITNrjJX+AazdT5/R8yAURk8oiht1R4vfGmE2agrtqqehHlIofh
	 1kuTRy4YIYeEgqPhEs23uHhhVrkIjoGcPk0W1kimISiRtjIhZulZDigEN9RDbvztBKorE
	 gLXQZcu3muiL7k6r0ZPLwEblbP5i394UwapBw024jvldUIrVPyeEFlNVhkKiT2MfN8rKX
	 qZ4R/Ufceyh1AzVxnRHvP9wHSH+2iZWm7OrdMuL323wNFJVW+a85OloGKMPCkKetZaX4V
	 wZq3ipoS+krVUHnhQGuOoXExwnzz7se92J/NohXFRYhpUyfI461sLYJ1cyEAAU6rifw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
	b=1PNvi2uPM3BWlBuiUc7f/vrlz334vQXFE8zawtApl+9slyB+U/KGQ2nex0LHAlF3TGs+
	 k9Y1EzW0i+LPlwU7zsPXwkAhOeGqkcyoLQ/aSQEWPmtSjdbYuSVCjbhUst9TgXUdrH83R
	 4vYQQaGoB89S159QCcv/F0X+T535KOv7Hb815KhcmWI3XySPu13lVAzIWGT1mJqkEbkvV
	 gi3rYtO9bcZqlhb99RkxLrTpsSLWqWhv4SR3C0f1t+K1wTe2AeKTaTquvQBANj2kO+fAo
	 wnejuWbwlh47KqGOsU3gDqYCTfeg6913opRz6Z/g0bIoh7Juha6Ql5tYNSPbAQ+v9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF643606A32E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 05:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF643606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so735005a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 21:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030043; x=1794634843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=MKKfBy8cKXapsmlYd8GOwL/ZTCcezrUbWwB0OqF5FjEPGS3PRmlqS61fHiccoL9MGR
         jQiwSHoSjQrFn5Wj/D4vDaOSjN/+4kzY5aGKTHsXJqNOVuCf03zIoqsNt9WbLv4rdHTd
         af9JsvxOc8J/50gWAu624GSz6J2egf1JjB4hMsOt9wW2cZvQ67Hp1a58eo5GzX60furA
         R67LX83ZH5EEqS1hlkhpAoYzV0Yh+WmEQoOV/jYt9vxhervEObCUCHCwDg/CizKShOv9
         jhlKU4eegdoUpRYmGeZW78IIsijX8MRJgyxUiRaL4SJBukmYR7PaBr7bhkiOZ3veavyJ
         IZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030043; x=1794634843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=rwYttQP65cZq4FRNgXiaDSl4dOQTT51OZ9SRsQYPU+aRFHNc/nBkE0UAAOwrvApIxM
         Yt3fo6Ao8FArUonWMl6phPrtkO4AUOgYPD3SgP6mGQu6kXrmAwE3sqwkbt5rC5ln8NWe
         bbFaDM66+/UBsycNnSrmvsjA3cKOwDxq+9VgJwc0tPFp04GCAyYXdZl/lWiJcZkHypoX
         GpexZEhIRRqYgiAim4buAlU10b+1c06F0wexY8K+WSMhkG/pqPNMHSDMzJ2aqpPVkSJQ
         kgwdPWqMZKf9dqVRTWqCQENT/a9zUEXNUlTK0uqAVHOjfWey3CbRDA0IL8WxHKdqFPom
         L1/w==
X-Forwarded-Encrypted: i=1; AL+hErFX0BY+nxbEiXI+132bfNoJDAbipHmcJGTJMwrsQOpL/fRapSWfmHe1rlBUMOq2fwu0FCO6TCbByOsj91gnJFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EcHMS6pUxTCbUxfBTKLJT4WHU8lHYoOIgmtCNAyH7GI8Ji2Cy
	UCmqWyF5BOb6LLrT57lC990xVKAoSWNdXDslSeBTodAjivhzsQ+nlR0n
X-Gm-Gg: AYBFou1FX2vqjc2d4gyxGXYJMnyWDqCEJX0IMrZZEwt2nIejll5TZmwtiYksvf60UMd
	46JrzNTEA0Rmue4Vor0di3jo96TzlQF0hrYXesMLwbXGgg3gGOBOVzXtU+qM977q3YawQ0qbMD4
	cLh4UEujroRo4mmb8OVznarRqyiiO+oL/kfwWDl7rBPmNmCUFyUwW3KXSuFPYbaEVClfE6wqnp5
	+BzQ8U9SAjOVK4gfEhhu87btSBM2QkZQObcWlfVRDx05n1FwNSQ/qabCSOYeom+NrNM3UD72S35
	ZnDql2LVT/AdGZLMvz/cgAZU7jU+vGit/B4MYToRP97zDRPZlROngMuwdyzXt2rjMWUXfWbXI1w
	N0E4ZmtfxyEcD8lwl6Ve7DQBeE+uYwxYtvZcl58yDjfJWNOVti5W8FrFtYYqNnbwG/qiy+3VXDj
	I3C8Th/82X6eivaDpeUhhTJYd4ElTiYUDolKfEHpn5FsyCDFrFxmdCLPi30N6foK17URp/2WhG2
	4fVtsnKMRLti4nUn2qzjhcZTQfrdt/Bh5/HcAzeKu9kNnEQmBY0ivJQtDYR1F8vtNVD3yAhzzYn
	mYQeeRISGNErUJM/EJSOfEfR4SXRyRfWqyuXG2a4jInbPWi/PsJwCgxbnT9OdzwstTh2MQ==
X-Received: by 2002:a17:90b:39b0:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b0db71a88amr4553467a91.47.1794030042944;
        Fri, 06 Nov 2026 21:40:42 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a0475sm1847682a91.0.2026.11.06.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:41 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 00/10] trace: stack trace deduplication for ftrace ring buffer
Date: Sat,  7 Nov 2026 13:40:23 +0800
Message-Id: <20261107054023.3077908-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103194429.739feafc@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20261013020321.1898006-1-lipengfei28@xiaomi.com> <20261103194429.739feafc@gandalf.local.home>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 19:44:29 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Yeah, the cookie + generation looks like the best way forward.

Thanks, v8 uses that format.

v8 will be the core, the hookup into the stack recording path, the
statistics file, the documentation and the basic selftest, with your
comments on 01-03 addressed. The binary export will carry the generation
in its header, so I would like the core and the cookie format to settle
first; the binary export, its parser and the capacity boot parameter
will follow as a separate series. If you would rather have them in the
same series, I can include them.

So there is no need to look at 04-10 of v7.

Thanks,
Pengfei Li
