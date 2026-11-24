Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549437;
	b=j+Ly01N9cnpPGem3AD2JGV80Gpox97WEt83F4MEaU82xnbdAr/fLqsTZ3fAMmXKTt67b
	 BT2bGFf8eQgVbiocqE/AAwB9+KTPMjjjfKZEeJ/ys58ciKrQOwbLUVTWQd/kYQEONp9UG
	 16bHvV9i1hRFD1X8gXKAqmCZHibEqkZltsDAnsV7ONqGiQW9cX0qGJ0p2L+OmK0ElEy31
	 zkGaubgBLj9rQjfPorPLH5Nps4Ay+quaBe7aMUzNBqxHQTPOql+ewZGg8HpaVa4U9ztqo
	 a5rD5Ru9WtQQ+bItCauft3GFLjLN2ty7v3MqsUYV2fv/h83m3kJgAh9DAG2Bpp0pjxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
	b=w54v9M1bvDeLHCXE4wwsJqmSmTq2M+uY1sZm4YP0QQdt1APgboqBOl470cF7b7BCvgtC
	 b4QBuON1M/c7ltXqfgkupVOw36pVrjEL4jRl3aWfBoBIyaCFBki0lLxdzNpADaW8Yybc1
	 n+hEDuFQKeNaCPr2PYe9RnKvYssPPj1L38uVVhSRi2R1d+i8wuo6YHsafax7Q+a1nmksM
	 PSRNjcX1vIE2SrIfXu+ksSyxbD+dVhSBjCJAvye6EbezeHBYP5ivxlnglrzCfgorqXsU8
	 5VCh2qOha19kv9M6ZnEf6kn+hgXBpcfTebGnOu+MLC9+czUH6fxJImbVB1XJhBobOZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E32606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so5682078a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549436; cv=none;
        d=google.com; s=arc-20260327;
        b=DvXqSTUmR+ofEf4tSDN3MK5ARftOR8r3AXj14lN1NFQ+Sp3HQhqH79cQXiiYbfQRow
         1WyS/OitSiE9vANKr45+u5aOdmuFZMQ0SZuhOQw8cE4OH2s7XG871Ex4Jr6vSX8wh3SF
         ULp6PrVWolO+CaLvoepRli/gtLI86jeAYRU+lujCK0usfHpiVenYTOP6qnHJgq9FrcZu
         DiSzgH6Yb/yGhPovvSq92Yzyiat6SCBPqWpZ2+5hAiYXwtYUY8UD2NG5tGREZ2dLRnFL
         yLbpy/t3sH5wuwpv30gfCxxTpXbxJ8c2Qq3hs5r97AcaL+9EtPf5avFR9ZxL/zIv+lWX
         NTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        fh=6g71w3xAmoBCXQPuJ8Ff0OxFQDd2Gx/u4/Css2E2Vq8=;
        b=CemYDKgQzK4w83HRRGnzcqGrkqBv1ddsZPjxknFM2x6LI836ZqZBPzmegByKNg9sG+
         FuZhQuWzE1fZ6PE1islqSY+hTChXvOAm926lHLOgzEVDogoPDIz3P7WbaiQ69FRGauWw
         PxnvTUqH7FwJNq03QNbLVmJrnYbB+o76UW/FiphKozWVG3cM5f6JaFcOEcXyjKaS7D54
         au8uic6lOJdBXvZkC5/gh7pFHi+PjMZm5XWojmboxQ6XnBqGmcxqrOaeNkmTRqcriz5d
         DnvrPETxBfb2pkYIDMdEgUWahfp6dsv3IhZUYU8FWW053IMVG0Spark2Q9suo68zDdKq
         VVUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549436; x=1796154236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=XAGtHY+4xaUrnSj0AmUfbCZQv/JYYTKVznKj7XFa4ESf2ICNPobilYb1TiLfWjBzic
         xufpRUBUzROsFWPm1J8YSzfA/34w/PyALXgPwV2xyrHyXKn2Os4KGwHd3BBzDW/HYrJU
         JHNDyYjuAJr4adyDNx+VA4EH6BZDkhK88jRggaNv1jjEzdJOVr6NO3s5J7lkcWO6sA3R
         CSaoRHmXrDpN7c3+Z3KfuGbTF8Ni0E0XJFeWe03pnyNvIpZuu8kb/xvbRWtmPxyJYGj5
         0MSqUIEuvEflSX87IlN9NEooP42qhhlhgVF8Vz6Xn+ybEAD+lG8TH/vaMvGT/ILySZOV
         FQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549436; x=1796154236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=fVL1YpGqmrIkj+otihyxV7YGxYtVW848PgrWXKmdyMw9Y3iPr0ZBculXXgdPaTCsBK
         AHkP5COhT4ctKotvO3ikkueljlC5BwNDNmE6lwLUmW/FCKZ8hjMagbIlit5U3/3f9y7I
         /yJXrCqdiZIkdc2gjfXdqS7S3tyO16hUh/bLzlsyuvxogPc7RGLTJbhj8IU4p9blPBU4
         aKgvjeWAVft9uNITSPWKJDtVTtp+s965Yl0BoFM1TYz+UOT4UU/c3d1Q8yTch+yz03ct
         arxjIByGYblCMxxtficeGT3ytt/OSx6GljYEciYkTNj1nnMIRY8mYqUWwJcRuLA9LOIg
         evvw==
X-Forwarded-Encrypted: i=1; AL+hErG+8oUQzaKLwk5vem8QtcZOUHnY37aHPOakc86RBilYj5hQMcuVV/uSPU0M5/nuWku5HudWjSQyaoRZI/Ul3fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aTsTJ+V6UI8vKkVfGjZjAkjyVTtjigV8jaO5mcpZMaOEVZEVr
	p6SaMg4W6ewkBx7V3OPR15NQ4h7yoCUSXL9/0OnXl3Enz7pulQr3qbGRUA0WKT9B7EoOyH5aGHt
	DPvYSvvEY9U1pPDQ/2f8TKZB7/PfYATs=
X-Gm-Gg: AZFdTZdPeECEyZ4ST7yRddnv0yIpuEYv3XwY7owrFlRTfQcU/kJOvJgIFKvXzBeQypd
	uunDgOIFuGMBVWvufZ4wo2SCBTOgPuOCwyZtYRz7Igh9s3d8bHDaZejQvmbVSXZt+1+2LJ4dH0w
	gsFYWMXgEBBUE1tKHDEolYYGBN6xyuDjVfKRhWrInUZFhQzR5HVGuvuSvDa795zB9hQB73pljoH
	8Hzh1j5VxFRoEauTQmrYA6praK6/IH8S4qqOVTytDZO8SHcQdfz1iHiepJYgzgdZavGdDowegVk
	OYjz6JvHk7nKFwKSDZOy1oobjNHC0PBYHzl081RK2lDg+68OpB/p2+P0Ji5zuO4KVo25a0Bb5Rf
	X8/uhGK4gYKMnyHhG/sFs1u3WMvdIPuTvnkBYMIutZBeSxrleG5MPJOifQmjbdCRcfV5Ycw==
X-Received: by 2002:a05:6402:4416:b0:6ba:a7af:b80d with SMTP id
 4fb4d7f45d1cf-6baa7afb918mr5940678a12.25.1795549435824; Tue, 24 Nov 2026
 11:43:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120174341.35873-3-juanagusnicco@gmail.com> <179554500253.3135.7129341529911265513@kernel.org>
In-Reply-To: <179554500253.3135.7129341529911265513@kernel.org>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Tue, 24 Nov 2026 14:43:44 -0500
X-Gm-Features: Aa3M54q0ymEgH2iGN0KHi3f7zWEwzt_ONQZiRG7AaDrvbqatZSJsXwDKB0tlvzg
Message-ID: <CACQ4AciO6ESeDt4M1ifVgnVVKAvE=c3n6_aqCQ4kjpzpJe9ZNA@mail.gmail.com>
Subject: Re: [PATCH net 2/4] udp: Keep the bound device on disconnect unless
 connect() set it
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes the universal bugs, where simply binding a specific
way makes a socket vulnerable. It does not fix every instance of the
mistake, which was repeated more than once on every protocol I looked
at. I was already aware of the L2TP bug. Its fix does not belong on this
commit and I don't think it belongs on the series either but I will let
the maintainers decide. Also, the issue is pre-existing, sashiko
misclassified it, as usual.
