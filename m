Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AF242D89;
	Fri,  6 Mar 2026 00:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755317; cv=none; b=qOENOexiiEoMFoHC32GFvJ8IjBLviWynp5lBIGtwa0wgiP19cvLcMJpn41oFQ0641D4YVFwb484+u+POu13Q5XI0VrkQ/fgbB9bcbodOTNUDI/uTsBx1x2POjALHppXeqSYfQdgTvItkuDSad5WqUyY1arbW4HXIVre1YIutd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755317; c=relaxed/simple;
	bh=At6h+EskauDBaA878gOENOXj2rvTCXCRxvx6/IO3Hr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2cH/UKrWWr3Q/Z5Y2YYf1F1H3D1nYw5ocXxVOGDdgcFcK4AEbJPpoyJ5pZFonotDZP5jwP5cuaBSNsG00WpBVuDAvgg3Y4E5Op+tGwFtyI/cznJLtALgNBdPmXMXEsXiaDaEwgn+6BNrNezV+WBVlg/fZxgi0W5VPcyON7kf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=cRbx52E5; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="cRbx52E5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=YBLSb9yqzf06qC3jqMe2A7htFbxo6l7F/VdwMYNeQ8I=; b=cRbx52E5aQVZ
	NOVWkx6q28jfZi9N2OV0uOyi9K+MM8xMZFLmopKMFhMx4GrF+tbGpipKvmizVeq+JblToiiZMC6kj
	rbgbBs8qOMrzTO+72g1I6QLrkOSlAmqTog5EuFFj+iJSF2f42fmNiWmSt1SjgxOUNqppJZsLIaPcU
	fRZZWS5fIz76isf8QRTye2iBx6U1tclaux3mcmZotHhCK2v0TyWh/Jczply0WbQfSou2L8j8mmqva
	cx2ulePbPU2P2pfLewd7+PaWs4wACCAlHxoSBoLzh6kdgaXikbZEGmNn5J6q8NRALV5TAaF8UUGlm
	8IeV7MunJeCzcC6CeJ3Shg==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vyIbr-006G4B-2z;
	Fri, 06 Mar 2026 01:01:35 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 62601b4L519103
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 00:01:37 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 62601agu519102;
	Fri, 6 Mar 2026 00:01:36 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>,
        Ilya Maximets <imaximet@redhat.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Stefano Brivio <sbrivio@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, dev@openvswitch.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH net v3 4/6] selftests: net: rename pmtu.sh to pmtu-test.sh
Date: Fri,  6 Mar 2026 00:01:25 +0000
Message-ID: <20260306000127.519064-5-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306000127.519064-1-aleksey.oladko@virtuozzo.com>
References: <20260306000127.519064-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the pmtu.sh test script to pmtu-test.sh. No functional
changes are made, only the file name is updated.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 tools/testing/selftests/net/Makefile                  | 2 +-
 tools/testing/selftests/net/{pmtu.sh => pmtu-test.sh} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/net/{pmtu.sh => pmtu-test.sh} (100%)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 8935967ad448..b9eeeffa5fd2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -63,7 +63,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nl_netdev.py \
-	pmtu.sh \
+	pmtu-test.sh \
 	psock_snd.sh \
 	reuseaddr_ports_exhausted.sh \
 	reuseport_addr_any.sh \
diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu-test.sh
similarity index 100%
rename from tools/testing/selftests/net/pmtu.sh
rename to tools/testing/selftests/net/pmtu-test.sh
-- 
2.43.0

