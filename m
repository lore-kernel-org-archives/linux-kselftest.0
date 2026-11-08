Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122711;
	b=L5/EMichEnPEs5avo/4yfKi0vgRJYkiLpfXSJdKkY/L8W4HoWOZfJmlOze0WVn1RAPSI
	 rmIJkd1C5G3hE5zSXC2YlYD4X7esasOvsdwKy2yphDfxM6efvgUOwQ4mlO39mqu0WhNap
	 trKY7kQj5lD+4kwLe75mkMx/e6PcjfGQg4geG3n80vhitC8q9+2dgcd1Ggi3ZjWEMSZ1s
	 LZHU+4JisUggRhjBVpeJEP7UQoW4lRv/JuTY+a0iz1NbbgWPqVQwBllrvBSJXqZpXEBPR
	 WIDU7Ih56tBR/QWnRENX0o5JWWjeXOUjg8ZiPJehFhzpTVGZL7TAHlzgNK5vAM3EVQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
	b=RZw5yZ4sOn26VCT+esAovHVLEIJT7ZeP0in5yIpzOrjc2qU6uSQNF66/aSU77a3+Ycz9
	 UJeVAEHR6Uk3S6PPC1aMPHvM+V8i6WWZOTD2iOBiLlWfke3OIZR30Xbz5TspqYNAc789p
	 kFAvj49CdC5GNFRuNc47vnL3Vbl1OuQAkjgCAvQ/Z+oUw4EgF/LVcc4+KFnKTxMjCBdzV
	 9CoKoZYPV3Ng3lQKYL4NRC0z2NMt9X+lb7zyAbDVqgM9RLuizoY1DlJoqAW5za1fq1oIP
	 KzRk5ikI8j12oQ1a7t/nOW1M8wTURZjPgetZtcGFZuObUptF2wR/TYDXnxB7DdbJS2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD0606A323
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BD0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so10420eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122710; x=1794727510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=0KlWNEhccXytztXcpy8QDI9lEo0PCwVFU3u38U63n6E3HSrskIS1ZoHL5zE1ahXoOA
         Mwg5mx3WBDNu1bBTw/HUKVQ83wW6jFdSi3Et4OyKGo0pC3mlXYp7epQtek1zgT75kEod
         8PiiomRbBg2t81RKaJiSkW3QsAr4HmgGkGqhW6Y1dipfoiIAf6mNtWLukVfPilhdAMcb
         PKaXQ0d3GBJHy46n/1HYInRyJzZD89FNMuwtM7Sxd6295HZwv1fr+i0M5e2YRl5XsQbD
         QcmuaxSmb/mL/FuNb1Oe+W/b0oZoCcUJstHhQKExPS4En8BAQcYulKUdD9Yj9mYGqrgy
         USwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122710; x=1794727510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=eN2eS2wpp/uJHkJs82+j5S6LaSKd0mpIaAV9RiaaGlfIzyXVtFfnZRmxLcDpF3MgVd
         hKdpjR5q13k9rHavcfdnJ39yRJ+mKY5wbcks+T8phVH5DtJb4KvR2kYZ8NicF7Tmmlmj
         gm7+ZoIChX75rvJZHezGM1ytFet/Ve5dVyqVaGCKpFwux1bJGkGEowRq5dFO55/7ZOX7
         8I4ZOzXgLyDwpX+Ez9abVSC8uT7Yp7jhsSGHz+zC09/gzh+eMiMSgjL5B47MASvGUdZS
         chrWU4cZDXDGFS4ks1RqjQIsn2eM5BGscUh5d+rdJuNxwtUOA1MQ/l4H9k0CDrdUVw+K
         YnVA==
X-Forwarded-Encrypted: i=1; AL+hErFv3lJmtyPdZi0Q3I2S6IBzp0rgpZ05YKwGigxStnC7GGCop9xUL6hCEvP6HX/UxztEgCdaOo81To1T6Gv9/VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HSF30R3H2V3CWR7zOGslv6FumoTNiqxuKJ+vrKWzeNrBjsp72
	3oMgGc2k1Ej5lyxZWhyGtWQrNRY+Hmw+jt2/hDgts9iUQhYjkPKNlrOW
X-Gm-Gg: AYBFou00LKJwnM1Y+7OZn+hfzftQIEwIu6SfxumwM9JTsuCsIgble4xdBnUyJlWLK4J
	syumIl76kxGh0xxdXrHwz9YH50gXgTaZV2qF0lIllhtPBnN40l02xPdqioQ1B8vesaH/tnPT7X9
	amIqkjxkfXrr2Sawv8+gPh4BoEY0x9VdqwIrFKyIccXUC44zVWnzETmFFLbtDb85prwomS5MgLG
	UIo8zC41QsdjE6xYDfaUGOfDFx4otuDdCmtImNYwf/WrmBUMH8R4aqbI2sOFKGqm5rrIbUl0C1H
	q6UfBH43dfNYraAhpEgX5HPvi7nwCD5d9Bf0th6uA3CGMdRt50sCs8fnF6sqq3pfDyEvwddsgmK
	vDOzDT9dySCih26t8TDrBgqQLSLs9o97hEJoy9y1jPcQzrB2Os3RdtFJj9T2eKcElzSEScH8rEc
	kOoSpSC0H/XDXhKI8XbYGnkBy9tnlDC4jTe9IzgJAPT0/FaNak2685NhqYZ07NniI1erdSd51eH
	p7k5j/PNCy9fJU6Uq5yUjdxWls+oaO2E2xgUgyDCjEkw9jtlVTtOw4rUl5S5Y2QR6kfToKcqGmV
	+eJF9BxAoI4KfL9/vXmKX9zGjPzKBaHBkgYCoISOmVNu7kE4O4BwEFCmnfgQFLbJiWXhKA==
X-Received: by 2002:a05:7301:1a11:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-370f6115a74mr6028007eec.9.1794122709628;
        Sat, 07 Nov 2026 23:25:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:5213:762b:b24:1be1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm3499775eec.12.2026.11.07.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:25:08 -0800 (PST)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: lkp@intel.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	oe-kbuild-all@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 2/5] tracing: Use the stackmap from the ftrace stack recording path
Date: Sun,  8 Nov 2026 15:24:48 +0800
Message-Id: <20261108072448.990755-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202611080654.sqFxIlwl-lkp@intel.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-3-lipengfei28@xiaomi.com> <202611080654.sqFxIlwl-lkp@intel.com>
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

On Sun, 08 Nov 2026 06:35:01 +0800, kernel test robot wrote:
> kernel/trace/trace.c: In function 'record_stackmap':
> include/linux/rcupdate.h:502:9: error: dereferencing pointer to incomplete type 'struct ftrace_stackmap'

struct ftrace_stackmap is only defined in trace_stackmap.c, and GCC
before 10 rejects typeof(*p) on the incomplete type in
rcu_dereference_sched(). I reproduced it with GCC 8.5.

v9 will move the rcu_dereference_sched() into
ftrace_stackmap_get_cookie(), which will take the trace_array instead
of the map.

-- Pengfei
