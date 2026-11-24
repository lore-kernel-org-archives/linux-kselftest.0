Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504777;
	b=29DjpgTzZKAgUsH3jXWZ9Ms1+f393rHT4Fi1RcG8tsiyLeBQGuCFZqVlEuOOGw848DwR
	 lHjvpqKn2co1dPIyV0Pi8v4b/PNijujVJqQJg6vvsc5b3pBGZ3jO5H/3hJMnPpySiu18h
	 5d3vuzeQ5kTwZI+/ET+v5X8tJMG0aqGzOejewv3EaMk0FvBBA2ehKJBqEY7cToOZHG22d
	 oaG5I3SqNKhBK0xzSLIEalexjnL92NeHOMuLkq9xIdOoYcukCXy4IsM/Xk8Es6oMWhtEs
	 8dxKCy8HoZBRfzlkFrtxw93TIMLNGV5M+D6Ycj2J7lFD0NnUxV4VJ073t/wfikW3N6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
	b=nkeeKf1FgFgb/8ibewgKKM2KL0ZFeOaVXoaC02ro8xtq4tJMjTGeRJ/P89WdmhFj7OKK
	 eA0Gg3awknkbyFX45auMznftoik63h4BJy/CE7x5GDypcuocy4vRrdQ9LX26FPYLoaDlb
	 qltD04fCgV6/uICLHgplALA20jDkIwf1CD9QPoZZyYcE2b/6YXr2qQ6YXla5aLB/6Vbbq
	 mSO4ZiYSRlQzEeQ49YOw3g/2HiG6Egll4ZPUNZIxU8R27Swh6RthZ0288TbB0LPQTcdck
	 TzQwIZhv5XByJnnsvCjBVEZzgnhfQIbbPa0PuknZu+ciUS9lYuYtWPlwN2WFfNbLymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1145606A33D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 07:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1145606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1954977b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504776; x=1796109576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=jb33G8mOS/Hi1jWlbaudR+Y8v/b7kjNRymBbnp45JRiKAkM+lr1QSILrSFem736iC2
         AfvHjuItnI3tl4xVMogeehGLzwOMrB2+yFoU13bZ3qGKTRZR9JaIU8msDmLWruizzj8j
         OSk6LEihZORe7s9OQMIZGBkXVm+kEF6KUqbfzlc4/pxTv404AitSpyj5YzzJEcHIsezr
         /1DLOdMmJ6e9rD9GDj/ELR4XWfVfJG6AjbqkDpEa26i/A1g0xYDL07lr38ai6F0IKdp5
         KKtU89PJzK9LVmwEICshchHb2kl73xBJ3h7Hg5CleDSX8DZLiDYtmfUHIYsFky5Lfs90
         2YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504776; x=1796109576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=ZZXgKrh3DMrKOuf0gz9GtCZ7caCwzoiapDso9FJaovkCAK2PZAicgKhkv5u2+pG0FO
         k8owJMX6KbS4Ola4NDPlcXdTVLlwWAG/NlJfE+BYgxkCr9yoLPSNtKMzbB0GxFZjcSJB
         44muN0FRSKHgGbm47fcC3cGgoefxCrm/7IcBMBIl0p+fTw3Xwwb2xiitMKNVyLOfMOpI
         we1UjR5YN2IkEf09uamt+IRWZ/kN+5rIse8+oxp/VY3oYIJywKfnnNn+qOVncQfStF4h
         ncjvz/Ka84Tig16kb+Cr+XP6qVOxlwPLZLATNb31Zr8zPxtBcNyWc9D1TewjKfPduJWs
         TZ2Q==
X-Forwarded-Encrypted: i=1; AL+hErGqZJqDONZHInUyrcnyzvQzGJxwH4rgn+qv+oNBn4P69xU+dK99nKcgUbQjAErRIg6ljN0xtBr6dw/uxuiigls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e7rIPQkA/F7gN93Z/i+5QpErLBinbUw9EL9bV0AuyMPObj9Dg
	9ojdObzrzlBZZhuI/Zs+OPDNgPKYfbm6WelUhOiIawfaUN8QESk+Op17
X-Gm-Gg: AZFdTZedA42uzmf4NAv2XnXGLkTl30j/GfMONXx699IeqXJuz59SiNkvpukCtDMiIJO
	1JCLXZ5LqZj/LjHRvmNDv54+nWpGRrufVe28PzI3fV/0W0/ccriDeWgzbu81GJI/R3JR6NAXzsn
	rCvai2gs4gn0cJjymJe0jGis6CuItJAWntclemzRUWxHAZQmAeFiJNbWg1IoxBeq4njCTZWyTdN
	SnFcPVoQUqs4qzjb0d3UvS8d/wEIWsfkZx86MO/gxItw5RZCWfKIHpm4vuKXSoAd9u/osRDIGjf
	KUXOvMGX2fOVsBS7YYVKil8K9F/Rb1A35Z/jnd5nUJAxA8f9BAZ37lP0YF7iaW/SolD7eH349An
	QtOkcorecR9KCPdLFtNaX7GDCS+wYh0oi+iMycGfBRRMcDACvWk0MzxWb7gNhr5uvIHRSZwUK/2
	glgzcc4TzOGFg8RC2p5ckHWGcy1uvWHh3KWbRA7LoMttxbVtkBWwECN1JCS1RiFc92WLPdVWSUF
	5a/5t+i5g24uMTREC5HkfVC0KOvGriXJEVDRQWxpKPTeOfea4KstxsoIxnR6A3xVSYShswFToL+
	fP2uV70UIFLW1t4lxOdPzBeWGHlsrp2UOwiEAiy++NUw5videdP+t89bdTMZMeCyQW6o20d1J3Z
	v/HzaklXT80+HwU/6nyY=
X-Received: by 2002:a05:6372:a748:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-4014a27e905mr10620093637.8.1795504776021;
        Mon, 23 Nov 2026 23:19:36 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm4425486a12.27.2026.11.23.23.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 23:19:35 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] selftests: netfilter: fix missing echo in nft_nat_zones.sh
Date: Tue, 24 Nov 2026 15:19:26 +0800
Message-ID: <20261124071926.8818-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The ping failure path tries to execute the failure message as a command
because the echo command is missing. This reports a confusing "command not
found" error and returns 127 from that command instead of printing the
intended diagnostic.

Add the missing echo so the ping failure is reported consistently with the
other failure paths in the script.

I found this bug manually. OpenAI Codex generated the one-line code
change. I wrote the reproducer/test case, reviewed the generated change,
and tested the patch.

Fixes: d6905f088d2b ("selftests: netfilter: nft_nat_zones.sh: shellcheck cleanups")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/testing/selftests/net/netfilter/nft_nat_zones.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..f15bfd3373 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -171,7 +171,7 @@ done
 
 wait || ret=1
 
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+[ "$ret" -ne 0 ] && echo "FAIL: Ping failure from $cl" 1>&2
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
-- 
2.54.0 (Apple Git-157)

