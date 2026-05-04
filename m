Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BD390CA3
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935823; cv=none; b=Jyin+Wwcuvx6Qk2OfI9zMpUq4q1xhvpWBR/adIxDV+FtB4EuuxCYdMJfk3dAlryzre2SEKpnQVAt2ShtPLQyyID/UZXkOJ4Bs3+5tSfmjwHKT0ZjOtbfdcnXapDUqfXQHq6O0Su8jLpXWmymF7wE9bN9NfrN9/KKuPjIEKMF0yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935823; c=relaxed/simple;
	bh=RTsVaPujv1Zipjqi6owizB/hu8GwpxevK7plImcp/R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fnmjkhtbr3Kh6y/+1/zXcE9Cfv13pFLUAM7BampxplR/yXR0CjaQrwhfd5NeG08bKmuLIrhYT7QXlCybaQ52wC39B9CGNzXYtA3YC1LL+xcMpF6u/JotTx+d0ftvA020VTeUf8v9/zy2z02HRlVxpqsVK4BtONGVEUtTguwUkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=W7EKEV8u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="W7EKEV8u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so31294795e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 16:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1777935820; x=1778540620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zACIKFEwz1yqIQZvSt58R2/bdNJrXZHSjp9IUUKiaOs=;
        b=W7EKEV8uOw7botOA8bYBB72ywzKUVOfhNfbKRBb4Q3PeUAFpWWbSO5XG8OUwD6UNv4
         mv0Os6GJ07nQMXN01Y9l+GI4zXnYeIlDjejXSmmcdwHhjJ0JN1BgK0nx3+s/Ke0xQSvp
         LRDknmeDsGrligTZaYV1akTMoH8XnEMV/3CSTvQ3h/cr/P7M3fuqsga4Od30d88SLJ9H
         rsXyH4FzFSdpekSRu/xhyUqeEk+9tarqudOlNZ9wfbl63u2dLGpghSRd2IetpVds61rr
         ssGBNPW9HjgXBLPTILQpPzPyYGhxA/1AutoMlaxmGKka4UXUg0d6PGHl7AAVpZz4BcWJ
         juAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777935820; x=1778540620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zACIKFEwz1yqIQZvSt58R2/bdNJrXZHSjp9IUUKiaOs=;
        b=G0tgqKZDt0w8N9KX4d8IB5bCQAzs8+RQ/E+SfjuzgrYuq++1rcs4QmndsF5TQhbI4E
         cFXQi89zyOcLNcKvlCQGcvZNoZjDCY+f4AOhoLBPYE1EAcg7qpxBdn+wApzmhEV3YmCs
         jiIBcDeZn+H2vz1F5yPNx+/KTDBn8fjc0wRuKJRNxU+UmGjuAtKzDkhDXuodhUHwNuNb
         dMNNHyU/0GquuHIHgNVP9E9hN5s6tA9Q6ilGWOuuPSBv/x5Gctn5ErT1knOYixOKnLj3
         my33ZCLaEiyURuLQedL632e91KkDjjvTB52E7wIHIeHMmZ3HkPCgOSkAFZ1OQ57gjuhi
         +qWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WsI1mmW0PirDyocw//816aCbU9mfPGM4ABSHZ4tZmBVEkDPeDJMJ6G84On3HyKBbpDH+qSc/WDsS/cMCbPzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9ycbIPS7956RhILsYb49Kioskv9+vLtCryM0dkgFUHJ5ZGep
	/2+msOidKlktd3rRnt5W5NyzTnVDYOnIO74DL9yVOAciikXovOSga3b/z7WVmYuI5T7ke9RW68u
	BsG91jgjocOE2CRJAlovEC+qIzLn96OzUyTez/eVh3ZedRVTvZKdx+6MlDZYNHDs=
X-Gm-Gg: AeBDieuYUXQ+znsJ1liaX9/tUP6h9SsBx+DBh32SnyLOyzTJOiHJdT1WN3+eIGwRbIF
	qGqTNp4NEM1zcTiq0sCZL58l0hfmAVClC8AVkjODnEXa9ezH9YMbTHJCBsV58VQ/P4nyySpteRh
	3FJUmGgElaGtrFGcLHbWduPc5ssZBeYPF/HdYtcS5hWvmpWV/tfhx/4CMmL8dYzQZVJuL+vegso
	1KgtMYKdDsgPoFWHD+5osPF/qEsAz6LD37w2WThfVUDBfT/Q+irdaTdegzSRszggbhscmPwit7O
	g/yhlX0GvgCgTfwc738urLCm/QZ0n9TxMB67fIyAQLwpl1fOCS22eoL16NxIdOdHd+2NSSLHZlP
	SuleU8P3/8CpylzLqnexFAlXyqPdCROyYjchWcENjZxaWKtSbdIIU074DSxrP6sRZkCg9R7C0il
	iXRFGdBHlZNpjxMmJRAMXlrmXZaNms9FQkKfWTGyX99mTKaEc=
X-Received: by 2002:a05:600c:19d4:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48d1422baefmr21167775e9.2.1777935820006;
        Mon, 04 May 2026 16:03:40 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:1d7d:7ce5:717a:133e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm636149165e9.2.2026.05.04.16.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:03:39 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	sd@queasysnail.net,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	ralf@mandelbit.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net 3/3] selftests: ovpn: reduce ping count in test.sh
Date: Tue,  5 May 2026 01:03:05 +0200
Message-ID: <20260504230305.2681646-4-antonio@openvpn.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504230305.2681646-1-antonio@openvpn.net>
References: <20260504230305.2681646-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralf Lici <ralf@mandelbit.com>

The second stage of test.sh ("run baseline data traffic") performs a
basic connectivity check with ping -qfc 500 -w 3.  On slower CI
instances this is too strict for TCP: the RTT is high enough that 500
echo requests do not reliably complete within 3 seconds, so the stage
flakes and the test fails even though the ovpn setup is healthy.

Reduce the packet count to 100 for both the plain and 3000-byte pings in
that stage.  This still verifies peer setup, key exchange, routing, and
data-path traffic, without making the basic connectivity check depend on
timing out under load.

Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/ovpn/test.sh b/tools/testing/selftests/net/ovpn/test.sh
index b50dbe45a4d0..c06e3135fbef 100755
--- a/tools/testing/selftests/net/ovpn/test.sh
+++ b/tools/testing/selftests/net/ovpn/test.sh
@@ -98,10 +98,10 @@ ovpn_run_basic_traffic() {
 		sleep 0.3
 		ovpn_cmd_ok "send baseline traffic to peer ${p}" \
 			ip netns exec ovpn_peer0 \
-			ping -qfc 500 -w 3 5.5.5.$((p + 1))
+			ping -qfc 100 -w 3 5.5.5.$((p + 1))
 		ovpn_cmd_ok "send large-payload traffic to peer ${p}" \
 			ip netns exec ovpn_peer0 \
-			ping -qfc 500 -s 3000 -w 3 5.5.5.$((p + 1))
+			ping -qfc 100 -s 3000 -w 3 5.5.5.$((p + 1))
 
 		wait "${tcpdump_pid1}" || return 1
 		wait "${tcpdump_pid2}" || return 1
-- 
2.53.0

