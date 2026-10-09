Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6DB4D17AF
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548704; cv=none; b=dEU8FoZVQcWd2TLvVIGDkWI6KgdoE4IEQBbpaZBd6ExCRMOst7T80a2nrrk8i0U+tSW1Q3JiOD5LpUHZb678bFHeulxKN/CnW4l9slFpmZyQi12gqxqJEWmNDO8z0EoJ+EbgZE6hA6Y0fJ4TS0u/8GkAJOWsq2Vqdt93CKzjbNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548704; c=relaxed/simple;
	bh=8RWnBIY88AM13j6DvqP1Xg+77UY/JVZIRlFkQYtyW5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMXLgaEvJzSR28ZjJM6YTsANMAT2LmKoE0Z+MuaDF1KHHEzA8pS9x7Q/JQuJlOl99kICmPcn6aoNLMLAUsOO1o+RwjkmPTw8ow/SD3qV9Q9+kYYGWspY5tZ7lciMRyavfqd+kdCUTgpAYlvG6qVSkvDRnraRznH/WMBo1foz99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=oBzBwAai; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="oBzBwAai"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so144720a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548692; x=1792153492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjXf3zywhfYnG5TRw5ezXLQRr19gQLXq9BEDfkjxJeY=;
        b=oBzBwAaiMSdwpE29e9S84nELrAAWn1z4l6GooekDtuQX3y1Uu6La1fzvYwqvZ5HY2O
         DTbCLbqg2nZuKb50vwaOXAUlkqTdvITK61yd1eUEtcYc2VuGLjRnqG1ocObE+U1gXNCT
         OpN4AfCf+B3mkegCgunA0ZTrI3CXR9GcL2w3ESxWvnr7iR6P6LbSjncuwwrELWt8zb83
         fm/ZafD77x5SP931vPvGZXRV0wb3q+7cW679/3AWIIp+otbARYEIjlrGnXJeUYHLxTk5
         H00nkel/ufRN/8do9KVjYOAsDJJZj+1tqlBIPdP8gnhdfGq7QZVq2+41xrzfq7QdAjfr
         7yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548692; x=1792153492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjXf3zywhfYnG5TRw5ezXLQRr19gQLXq9BEDfkjxJeY=;
        b=Gj6OlWxlYIW/DHxR/ZFddOF8Yd6iJukf4bJl5F6jSt8aFDFG/dvatyu87uA22zxN2i
         hgJt+WBaU2OJsKffcpAJqNdvPBNf7+baX8Wwh3SLlnJ0atFHFaAHxzuKM3MphZbgzBAd
         WEy46zuLxOGjclLqXZXUfbzR9Rv6kekTkRKeL0YwfF3h6LEyynp8JfXoTgPfJIWeOcmN
         i6XwPP2cCU5x4j0PqQt3WtDjw2bRa+bZ+oQ1BuWkxxG6PC5p+rcpzlGLMp68b904dV0U
         D5qBrTS0CquBGYsR/RP4KMe8CVpTIb+z0xUXsUQI0QHh80lZc9x+65sj2MH36h9fi4EW
         dGkg==
X-Forwarded-Encrypted: i=1; AKwUvBxHHccGLb4uNsSJ+Vbbjl/0KRVUjhaMbbNI9ozRysVVM7waqQHRM6EdmQek+yv0IL3W+P4u9Ko5sYM5abO4ruI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0bKqEphTccIprJKp97BOfHflVue0TdYXH86ILhXjGwCqpsna/
	zt2wDCgcVYX2HdndWQR0Z6sMzEXEUCMt4rB/AcKjeuxBnoqm9MyNujUZhv3kk7TIcag=
X-Gm-Gg: AYBFou1BuPz3oxaq3qkhmSAAZJ/it53BzFfVnGQ+WQN4F+18DozCKXQdHmX6gZPlKFo
	vwN+BenXMNCzwq5HT6v9uY2UjZi+2B6b2YyxquWf1r3kNmZKVkfHPXZ+mxjm0MTqedR1B4IixjS
	EjsWREc6ThpzWVQ9jFapS/5v1mmJLNzG7YIup6YuLlAVLfAe84XoXCQDLGJLx1gJe3kp84XYxAF
	nv26xJuM8lIGdcJyreVvVtmkhvnynkgsbDeW0WdbOLvmES+KHWIgw5nHnnw8tFAAitC92aAnnfZ
	iupx1FK9iSyNwEmLkZfqVM4dKzd0J0ZoBN3AFN+gSIkvNvHQs7lI8L57Orr3n9orD+afD8yr5ma
	/lKzeTQ1aoAQLKeEvB9RCGfcqkJ2e5Zoyv78JVUHRM/WM36feSWdfD5K8ATvAiB51JVrffHX2ye
	sbfCWd0SIoK1rrUGz0Zr862KQsKQ5OeIMd1oAJY2ahGnEqezdVMl60/eBf+uuPjBeQbOF8QdDZK
	BCUWO0UueIPo5ROavpcZ6ha5y7nBYV2Xpnu432D
X-Received: by 2002:a17:90b:2687:b0:3ab:22fe:b13a with SMTP id 98e67ed59e1d1-3ab3a79a2efmr1620761a91.40.1791548692476;
        Fri, 09 Oct 2026 05:24:52 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:51 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 11/13] MAINTAINERS: amt: cover the amt headers and selftests
Date: Fri,  9 Oct 2026 12:24:24 +0000
Message-ID: <20261009122426.551178-12-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b..51799f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1461,6 +1461,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
-- 
2.43.0

