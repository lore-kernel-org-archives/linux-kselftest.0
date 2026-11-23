Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443003;
	b=NF6tNbMZCXCJenKf11P5dueepilzKSTqsOLo0YqbFBWDOQv6woi5gucDUKh3nQFKT6Bb
	 mAXt52fNf38f4IMM44BeMHQWATAiGp/pVLWkv+FC4Vm639E071AWap7E3Gf09PFBhqipc
	 wzVjrOIvw2bWO/oW6tYM67btp7JNlx8M3gQSSyO/Jgx47cCYUaSRfAqoUk4MvMX8jmMHq
	 2yCoEir9C9miGtjSSDGtMvz+2IGx7XS9N7eEM6uYkQULsydfWbMuufvoy4fjJCq+wfksZ
	 sU8y01Sbmg5EC/oBEc16iPU8b26fn//sRSpkXjL+ShzkJDNcrEodU3iNrgDK4fvwp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
	b=wi6jTov36Q4cQWkuzCEowCHfrAShySeArzumxolKLAxrZRNpF8M05eyPJ+7s8ZOopHmw
	 SgscuJzNDGfItifFLu5vCvYmU32cYmHtEUdYFztlkmS1nStQQF701XNv+A7GXo2wNlAA8
	 chHSwNeWVOhuElFX1FuXCSP4EaNlGcCP6FUfdxONgkjt/n2WeEcv/4rwVqbGrLl9AmUmD
	 R2TJ3zO5q+Beb5xJfwncmfBYLV0nUIlODG/5QhkWSPXr7Nwl8GabBr+5kLW5STqh4+vdd
	 Cy2X3gt9y7P+2J7cR2+KFUIN7//T34ucw+TKl/KG7F3tTwQbyYs4MgvQ0wC9RXeeJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FED606A68E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FED606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so4002054a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795443000; x=1796047800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=Paa77cZChyyChxxqH0++ZoHrNdr+ZwfEV5r3GB0JbKAt390gQbZVBTLUQK/SdI9upz
         xGXlAKnQc/LOSJ125nn0daxggCAOvLBF68qypSE/tHYltYiQq8Ftq7d7gBBmmiTAM3A9
         iSdT2mbU+8CzXHhDDd6dqQc3SRWZNKOyny4bRIuFL7Gbac1DRYadRvefq4UjuhQ6IJOc
         NYBjw8WW4q549KfSprr7Q2nsQsODiY+WQPIb9Zc7n5aYf5+nZPXZifAFkI7OPkOSaeot
         m9b6+PCrJwa55p6340Xphnr9GVkalxKvS5OaP2qnFVst3wc999+6WwFX15JlNcWfWtKh
         5Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443000; x=1796047800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=BEKiVyKicOwzmsySqYqfF3ivMFv9kkZ5oKzRr47szfABTcPprX194NayIVqRKKDGkL
         Y5HNFV5/XNcapsB60F76fVD42zpdmUZxg/MC8bsbIq6quDhMGyXC9iRDVfZjtYrrR1a/
         cpr1JxcG2S/h9xmDboDrKrmrNISRG4oicAc4//cZmT+DKMmZ6kmlhHJkYwL9dmrkbj3I
         XND/g/07Zja6BFWnd+ogVM35st4Kza+ualDY7WLP4Gj/qNtXh/9VQe+22xHjkAuaUkD6
         4Xpz198ot84BHces1irDLFVz0tPvnpU1FdQMQVw6dweuCx3cOMzCpc7svih/o2nMs2No
         rM0g==
X-Forwarded-Encrypted: i=1; AL+hErFTRtGgeOpjrnaapZVSY+Ed+7lf4P8SefAAx06n//YBw0EpQfFZuAcQTqh/ugcFRAIdv6bi6TkkhxllNcHRdDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4L4IHUf0SnJnrFa7l9QtQJYbAmzCC1G0kAA1kvrxbO8PfVdgD
	ay4Xgqeqt9buaFQlE3IDLqkqMKLCwtr4CzyvFv8kLLCxLrjumQIek86hEDjDzUudxqg=
X-Gm-Gg: AZFdTZcWmcGfy7yHZLkK018WO+dB7S+j7hJVXsjSNdlWg73WsR7FLyZQaUEN4wTl4xd
	tu8A8N7RrIP3K60zrx3oyhnCXSDLFkiI8Wx+lKmecLB7OK9hidBIjMNESssYroSR62k4VfSCknD
	ZuMqsAZdq8meBg9ulEjsY8T9h7jc8gxGFQmz3JVc/82hjfH8okcR7tOmEVe0w5A5wK7RRWsVg8R
	1F8yQoMHeMSl6J5zgTKOMPsCh6P/4Jmy3RhEOotRq0NQ/vHWM285Zn+k4YlHZsTb5e1gXDSy5sF
	t7dqL/nXf5biSx/66V0Mmd9L9izw+O/cfWnvwvrv8+vmBwXP6+0rsGIP/9CiZ8W+e7VZp8bskh3
	EzzUKTNlVPM3NDpya6HsVjkGhwuwuPii12JlTC5KRzN/cA7jJ8v4jPoCahEtUUWP1Rv3sFPntC/
	THLzmx3ydOassTMmIvqsf/WUAQRGghDP7XnGpHI3L2EGB5YeG12bYelhJyqNmIlzkPrzH6Tve6R
	Tt5C1Y9LqK8EsLGjDepHdfe6csJsJC6d2HE3uRDUT+wQxoLOGcMQNj2rsl7sin6amQG+cv5rbKV
	/hHfjJBNkntTmhqJc7e3Ae2/M1wq8FaJ/S1Ju0fVIjSGySg=
X-Received: by 2002:a05:6402:1953:b0:6ba:ad05:3fec with SMTP id 4fb4d7f45d1cf-6baad054b87mr2592953a12.29.1795442999662;
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5388027a12.23.2026.11.23.06.09.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 23 Nov 2026 14:09:47 +0000
Message-ID: <20261123140946.13992-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-4-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-4-emmaonana18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:17 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Three more checks in veth.sh print "fail - set operation successful
> ?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
> "bad setting: reducing RX nr below peer TX with XDP set", and "bad
> setting: increasing peer TX nr above RX with XDP set". A kernel that
> wrongly accepts any of these invalid operations would be reported yet
> the script would still exit 0. Wrap each fail branch so it sets ret=1.

If you squash this patch with patch 2, feel free to keep my tag on
the result.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
