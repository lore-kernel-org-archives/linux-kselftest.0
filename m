Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7C4F96CF
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627005; cv=none; b=RAKycWMalkPStUwKjM/kbK+lyr8NqYWHV8TlJa/U0kvGMz9jTwdw1cfspFgaR8RzL0cz1HVQtV964fcJUp5GbAPZaVIFErtlRcHtoPrIzOQo2wdbtCyfeu9qUb6wn52PjsTHvyYBD6/3xErtd17MyfSlPbv5p+DlGDsLgJdy9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627005; c=relaxed/simple;
	bh=3qVnGX5rRaJCRwlcgQzeEp0Kkeac6bWfTm59GQvGhnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfCqj4pNXL1MGFUf08uk4NkGxjkoyQuQp1g0Hy+/pjZGJaM8qnSG09fbP2Zha6pWhSfNXBZplc6BTdwpTGnijkMWCGbolClCi0TX+2YUxAupIBcv+MORgKoEwxBOuovgHs6O7lF1zcEBlO4JCrF5BvPyKGoEubXwEiyLJLnZloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=PhIE8MLr; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="PhIE8MLr"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-49e73611928so2707795e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790627001; x=1791231801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1fkwGoumcXsELwjWXc8Y0RIsf/dT14wb+aaMLvRjLc=;
        b=PhIE8MLrmekDU/QOE4bV2Q8L0OykDqthq2V4TYqajzgS+tG8DAcptQogKDQNqzTmwu
         ksW+GYFNw8/npEtnDVZ8JK0DLjAPhhNftzhdhO/SR1xD8sa3oJpcV4RuDi2bS/ugDSvi
         VvrljkM0bxCmK0UD5CjKGLgWO8avZCTBTXGERvhUkic82Mf0e4cqU8nM1jjPCw4FdVc0
         BLOX6Ifb3FFhYQztC7Y+aKd3qEzldayrdhbF4BRv0jKOo0gBmBfSsZmado+R/Kqk41Bj
         5DEekzDXEFhTVo9QyzR9AAU92SE1+DeNaC5knHLbwMocaw5SXKtXrVs0+a3KXT6IIGHb
         h8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790627001; x=1791231801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1fkwGoumcXsELwjWXc8Y0RIsf/dT14wb+aaMLvRjLc=;
        b=d2yn8ZF80b06vWvMuu0jllvSFBrKCeHpZn/1HhZ/KzUl9w17brhk4yWKuOLHF5WLKY
         U3V8Gu6u+UvDbPL9AFio1mlQxcGvdqibRyHFZpxu8PiLkBnWGIRWvNlya2QLrYpdp5FE
         ZulbIOBtDzUyiZdAWlYuBL/FMaLnK6G+n47Jck1MpdXrg086B2BDwJ//XWh8q2hqbWOI
         MpplddvHsZEx9TrZNBjNb7lObfz5yLE6x5g1pgofpNd+2lFfsMTsUbSYghAIqGp/4lSO
         iB00H4oFtoclCpHs8wBVSKzaLw4Y0Kd497p2FQYtmqi9XJVGwFhnHtFhmwmDv6YTX3YB
         dswg==
X-Forwarded-Encrypted: i=1; AKwUvBzT7+JE527W1uniFrvmpD66OHHEDGj029hkuYte8Y0YDBYY/Lx53LyKPLlEZRllVpDm7fah+WJBoNqUzsrtx2g=@vger.kernel.org
X-Gm-Message-State: AFuF++laec2YgbLkxxhNPmqJKEGJ6/CqPgjTsy0yCv6pnTYEW11+0bY0
	1jlnVaS/Ys0CNdN3ujsFSDg7C+btiJmWRVn6giYRsXk7GUz+izpPDLiRD984BLqff1c=
X-Gm-Gg: AYBFou36RZXx5LDcQtv9U7cJwWv1NoisK+GJDeYPm3nhGYVR2eHIQKeNtBzRKar14sj
	1G+jzyTIAbHvOQbMJfrXHVqaGJ6wy0OBxQY/Vf3srT+j/qF+QG63ClobPLdB2bn9aLIzc8iFwh9
	X4/iG9qZXyDc7xejzujbga2JZxqTSQBibQhKAzKwGGEJXiviZ7sdqmhqQgtonwsW96zUgAoPid0
	sp+E4EJgsfEzTlf0FOzi1tlq+2C5c3maS8UtoKCc0PUuNKDeP8u9ymsrWukmo5ks/luxcQLaQDT
	e8oOF3ciFpf2ewqrT4ZEEKAV7gqYbcCsc7eTosegw1XKUU1xzlDPLAkb/+/wnfW6cF7FmIZWN1F
	+aVY/yukbu7UvULLwx7Pp8Eke4o/uE3ZL4yapyNkMphoVsxeI+iFvRk+3OBkNEdchXUfre+I8NR
	5DZzUkw4nWQsJBM9Ca9oiEsZkd31nf2pInnHZLubnfilS0fjqWYVGz1/y1S2zSHxVGEfcnlF7qA
	5YUSydfgFhKMs1mJWLfrnAoPl8RhH2U/B7KHzkM9y9WRAgFKjFQDrAVLuCQ4AYeqEF5eDvAwmV2
	xleyfXQ/gDtR
X-Received: by 2002:a05:600c:6c41:b0:49d:28fc:d6a0 with SMTP id 5b1f17b1804b1-4a00d7b2adbmr4612875e9.18.1790627000712;
        Mon, 28 Sep 2026 13:23:20 -0700 (PDT)
Received: from localhost.localdomain ([197.51.38.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcdbsm29620500f8f.2.2026.09.28.13.23.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 13:23:19 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	Xiang Mei <xmei5@asu.edu>,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	Cen Zhang <cenzhang@linux.microsoft.com>
Subject: [PATCH net v4 2/2] selftests: net: amt: check that the relay's queries bypass the amt device
Date: Mon, 28 Sep 2026 23:23:12 +0300
Message-ID: <20260928202312.74574-3-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928202312.74574-1-omar@blockcast.net>
References: <20260928202312.74574-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relay used to hand its General Queries to dev_queue_xmit() on the
amt device, where a query could wait in a qdisc and outlive the tunnel
it pointed to. The previous patch sends them directly from the receive
path instead.

Count the IGMP and MLD queries that leave the relay through amtr with
tc flower filters on its egress, installed before the gateway comes
up, and check that there are none. The forwarding tests before it
already show that the gateway received its queries, since it cannot
join without one.

Without the previous patch the new test fails (one run counted 7 IGMP
and 6 MLD queries); with it, all of amt.sh passes.

Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/amt.sh | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/net/amt.sh b/tools/testing/selftests/net/amt.sh
index 663744305..d13b20ccc 100755
--- a/tools/testing/selftests/net/amt.sh
+++ b/tools/testing/selftests/net/amt.sh
@@ -150,6 +150,13 @@ setup_interface()
 	ip netns exec "${RELAY}" ip a a 10.0.0.2/24 dev relay_gw
 	ip netns exec "${RELAY}" ip link add amtr type amt mode relay \
 		local 10.0.0.2 dev relay_gw relay_port 2268 max_tunnels 4
+	# Count the IGMP and MLD queries that leave the relay through its own
+	# amt device; test_query_egress expects none.
+	ip netns exec "${RELAY}" tc qdisc add dev amtr clsact
+	ip netns exec "${RELAY}" tc filter add dev amtr egress pref 1 \
+		protocol ip flower ip_proto 0x2 action pass
+	ip netns exec "${RELAY}" tc filter add dev amtr egress pref 2 \
+		protocol ipv6 flower ip_proto icmpv6 type 130 action pass
 	ip netns exec "${RELAY}" ip a a 172.17.0.1/24 dev relay_src
 	ip netns exec "${RELAY}" ip a a 2001:db8:3::1/64 dev relay_src
 	ip netns exec "${SOURCE}" ip a a 172.17.0.2/24 dev src_relay
@@ -246,6 +253,27 @@ test_ipv6_forward()
 	fi
 }
 
+# The relay sends its General Queries straight from the receive path, in
+# the same context that found the tunnel. A query queued on the amt device
+# instead could outlive the tunnel it was built for. The forwarding tests
+# above show that the gateway got its queries.
+test_query_egress()
+{
+	local n4 n6
+
+	n4=$(ip netns exec "${RELAY}" tc -s -j filter show dev amtr egress \
+		pref 1 | jq '[.[].options.actions[0].stats.packets // empty] | add // 0')
+	n6=$(ip netns exec "${RELAY}" tc -s -j filter show dev amtr egress \
+		pref 2 | jq '[.[].options.actions[0].stats.packets // empty] | add // 0')
+	if [ "$n4" -eq 0 ] && [ "$n6" -eq 0 ]; then
+		printf "TEST: %-60s  [ OK ]\n" "amt relay queries bypass the amt device"
+	else
+		printf "TEST: %-60s  [FAIL]\n" "amt relay queries bypass the amt device"
+		echo "IGMP queries on amtr egress: $n4, MLD queries: $n6" >&2
+		ERR=1
+	fi
+}
+
 send_mcast4()
 {
 	sleep 5
@@ -287,6 +315,7 @@ wait $pid || err=$?
 if [ $err -eq 1 ]; then
 	ERR=1
 fi
+test_query_egress
 printf "TEST: %-50s" "IPv4 amt traffic forwarding torture"
 send_mcast_torture4
 printf "  [ OK ]\n"
-- 
2.47.3

