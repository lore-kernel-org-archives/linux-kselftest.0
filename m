Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822679;
	b=hY+qVyzx+g5M4uljlJW4ogTvm7yLm/qAlCP7bm6XdPJf07lrzr+rZzKybxbIbuNDFxsE
	 VQAzgtzJEkhCtqi7sBX+c7vocqiqWMnliIQW9yE7KnOCXlL7nUXl0OMx0V3XfEJ5O4Q5m
	 cC9TiIkBhzOYJqWziGz7k8QYux+8aaKBIWUUxtwiWcwoyxXYjH0IKqn6hiRJTATY6YCV0
	 4S3S9vOmQq3anX6WZqJhXmiGx1ytqvSXfLSlgtcZgqFrxeNidf+MkggpbfTu8nGdxfhRi
	 y8wag4z8o+TLq9ht0bzcMdCAjK300xZR/fq1sLISGS8et5H4ZS7IsSb8H80qJze+bzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
	b=kMLX3kTiXRqKxmS7hyyuPRWGVVaRZcuyEST8ra5uo38ZDTE9x5NGVIBdTJWyOGD2AU7u
	 DVGOpyf4Bs6ZpT9iESeFej965XBuzTE8rBI//3eNPq2YM9OqaqPiqF5g6EK0TKfGHSDod
	 RC5Wo6lR4V1X05Biwuvd33Ly8gLa05aeVp4ZKUig8lKeCq5zXcj/1b4syAuCyYP/L3PaG
	 /LH03uyDFcD0Rck8rLpo9jaDEv5mM/hZfZqjYsUylfSg9G7onoI1fgPc02JMHdAGgvGRq
	 nGs15w7IU4jUmO3Bj34q6pAkDQ/byVvXoXCPL8qNlz7Qy0Fvby0QIIQzUKxJ6vHWP5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DCecO28;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25180607A96D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 20:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25180607A96D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DCecO28
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso20535341fa.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822677; x=1794427477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
        b=0DCecO28ue16+Xp/dZw6oCOTeArtgudPtEJi038NWajCPUMgU+Ncyxu1f3gg+8QXA7
         C1Spupb+fbH0LTCgmxLcbp8gu+6eZ5jgq+lUt01LuoXFHduSdD3G5dot5vAFB6bEoGX0
         dzuPJ6EW1pJtHs2dz74RHB0/n9EPaWFkAg87oeS34ikgMMxqR3aXriVN9S0fIcvRo1uC
         aJ9MebCz9V4uzJP6kXoEhg5koqBie0S39kGxx3jwWFgHPIg8YRQNjrk/ML1V66p+F4Gp
         YtdaARu0mRcX1qdSMX9JahtX7Y94FMcRv9IWCTS+DPucCSLYFjOJmra10kzvl/eXE62/
         YnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822677; x=1794427477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
        b=VKfF/UGEWfjl3dB2p+QexVg1qddFURLfJ/lbzaAjAlWz15pUlF6YnO9lzkTZlKPjca
         oPc88aw7YF6n5c7tVu4ejIgjjor7DIZUa3jJZsqEB3zzqh+TgciS7Jn2EUiHNdBg6kf9
         lAjjBvFJhplButSvztPnUpV/pJWr/lmc2j9afxqLyTl4Ym6bBlXz30JQMdqVrLySkpWx
         D+XCHMjDNt2CLO2BZkt8rCwaK96+jix879333Wi2mgxr3HOmGYFEka8Pn2us2aysAwIJ
         k8+Rl+NxsL4G+04HBqHOk4waPlqhZQ7WBxBSKwzPgaxa+P3KgKmbmB4B49LEgtKjiYqO
         YgnA==
X-Forwarded-Encrypted: i=1; AKwUvByojdF4L80KySvZXo2tbNobZVkX6POmKhjRj8bAyTqMrtzdQNKD7iyikkmFRu13o8RPYsZocEmhWkNoKpEtbjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BPyC9Pd6LrMay/ueq0vXjitzKdV8QSDCJfR5WVBwG2vS2r4+5
	gA0zLdnpebfJjY14PDcoGS2IQmTHo1M9vcg+61C2f/iR6kUqkqyY5KtX
X-Gm-Gg: AYBFou1NVAUPNinUkxkKo2v2p+QvKrcF1mAr9gMTDSzYAzcGSn5dJdb+3iG7AlN9Rov
	gl+2MRuuv5KrBDaDVFe/+uZ9oVqg55HdNc3qD7RuzUogTlSOkyntzYKxoQ07tsHVZqP4+of/g0c
	6roBYHkixcVOUe4qn+4LFumcr5zcRi4eV3oVfPe0oiEP4k5AQoZ97hCaa6ussYst7Tbza5KH6N0
	gZ51yEg77vkbiHpYJYWCVMG0UU/qPmirCyZFJhCyxpX7JWMwnpEstgaaoNR+WTI1NbXCa/B2Hpi
	lfoeYPTRr1TbRhgJn28ww65MxAyc7QMGWKT58lfoK//e+1zCMN6AnhwhpK4puER6JpiTPu4kppE
	yhhSIWhtHh2uxb4af5w3PnyTqLCCAp524h7cFSqEwzYZ4DgD6tEs95LHEMU8ME2vGdM8svane4s
	yQqkNJBUJ8AnFV5SMdpGL5en0PjyQSUn9vJod+Zhk9v2URXD+fA7p9mVOfy28ICRDEbITxdGfhc
	znlrKCYvf9+n2IKYSqdvFoGi51x8dmTHWfF7Gr7rG8dR/zWlrE4vuZyFrJTaAsiML3LMuapBHRK
	0wpxjuz9gBcrn4wKvBOUByuEAoJ8vw==
X-Received: by 2002:a05:651c:b07:b0:3ab:4b4b:fab with SMTP id 38308e7fff4ca-3ace2f7fca9mr994011fa.2.1793822677045;
        Wed, 04 Nov 2026 12:04:37 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:36 -0800 (PST)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	weiwan@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH net v2 2/2] selftests: fib_tests: Add carrier gateway test
Date: Wed,  4 Nov 2026 19:56:55 +0000
Message-ID: <20261104195655.1406837-3-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
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

Test adds routes with a gateway while the nexthop device
has no carrier and ignore_routes_with_linkdown is enabled on it. The
routes are added to the main table and to a non-main table, with and
without a device, for both IPv4 and IPv6. Routes are expected to be
accepted disregarding the link state.

Without the previous patch, the IPv6 non-main table cases fail:

Without fix:
Gateway validation with carrier down
    TEST: IPv4 route in main table                                [ OK ]
    TEST: IPv6 route in main table                                [ OK ]
    TEST: IPv4 route in non-main table                            [ OK ]
    TEST: IPv6 route in non-main table                            [FAIL]
    TEST: IPv4 route in non-main table without device             [ OK ]
    TEST: IPv6 route in non-main table without device             [FAIL]
    TEST: IPv4 linkdown flag set                                  [ OK ]
    TEST: IPv6 linkdown flag set                                  [FAIL]

With fix:
Gateway validation with carrier down
    TEST: IPv4 route in main table                                [ OK ]
    TEST: IPv6 route in main table                                [ OK ]
    TEST: IPv4 route in non-main table                            [ OK ]
    TEST: IPv6 route in non-main table                            [ OK ]
    TEST: IPv4 route in non-main table without device             [ OK ]
    TEST: IPv6 route in non-main table without device             [ OK ]
    TEST: IPv4 linkdown flag set                                  [ OK ]
    TEST: IPv6 linkdown flag set                                  [ OK ]

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
---
 tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index 7c47d7fe250d..d7ac3c727f70 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -406,10 +406,50 @@ fib_carrier_unicast_test()
 	cleanup
 }
 
+fib_carrier_gw_test()
+{
+	echo
+	echo "Gateway validation with carrier down"
+
+	setup
+
+	set -e
+	$NS_EXEC sysctl -qw net.ipv4.conf.dummy0.ignore_routes_with_linkdown=1
+	$NS_EXEC sysctl -qw net.ipv6.conf.dummy0.ignore_routes_with_linkdown=1
+	$IP link set dev dummy0 carrier off
+	sleep 1
+	set +e
+
+	$IP route add 203.0.113.0/25 via 198.51.100.2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv4 route in main table"
+	$IP -6 route add 2001:db8:10::/64 via 2001:db8:1::2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv6 route in main table"
+
+	$IP route add 203.0.113.0/25 table 100 via 198.51.100.2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv4 route in non-main table"
+	$IP -6 route add 2001:db8:10::/64 table 100 via 2001:db8:1::2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv6 route in non-main table"
+
+	$IP route add 203.0.113.128/25 table 100 via 198.51.100.2 &> /dev/null
+	log_test $? 0 "IPv4 route in non-main table without device"
+	$IP -6 route add 2001:db8:11::/64 table 100 via 2001:db8:1::2 &> /dev/null
+	log_test $? 0 "IPv6 route in non-main table without device"
+
+	$IP route show table 100 203.0.113.0/25 | \
+		grep -q "linkdown"
+	log_test $? 0 "IPv4 linkdown flag set"
+	$IP -6 route show table 100 2001:db8:10::/64 | \
+		grep -q "linkdown"
+	log_test $? 0 "IPv6 linkdown flag set"
+
+	cleanup
+}
+
 fib_carrier_test()
 {
 	fib_carrier_local_test
 	fib_carrier_unicast_test
+	fib_carrier_gw_test
 }
 
 fib_rp_filter_test()
-- 
2.54.0

