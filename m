Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84723C4555;
	Thu, 19 Mar 2026 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917242; cv=none; b=crfCsKv9FI7fMSheN4tsfH8Vj2aSl+V4CW2ORzUNiGne+xJbUIO1U0Ag5cL/jTPj8pIETxmB3BB7CvT3XoUyaQ2Mw+3O80kJnHBQ4p2L5vCSIY2wJfDtHVsNUJzs+yxfbGkao6K1SZH6DHtIXP6Av+QVzzO6ebCluiEXACst4O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917242; c=relaxed/simple;
	bh=DqhTRr8CaIg0WOOkVXziM7LkJ185oCccscWNtuTlliQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQ2U9hMk6NywZwWycBK29AvCXSaZEi9TsfodjmrkN43qa1YYdvc0kDZxVuxb7ozMqnNzGOkpNxUVn6XlvJ9ivARxyS8Zpk9mHLMDsboAfokdoyOsBXZ8ehjyZnsm/tweCp67h6jd2aUzxK2GFgJ9Fndaxt18bMW9b+lhouI/1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=SDQcj09z; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="SDQcj09z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=6UKsTiQKnFSM9Hj1ADDF9mPcImxzZ8Cs+q/b207zLVk=; b=SDQcj09zXqDJ
	k4bEtMa2LE6YAHGV4YAXnmQ5lLU2PeqIOm28/RsZOKiOGXtKkSzBReWipgmKkDN+tevL8VopeSSaw
	SiRquE31F1SWjhw7duXvW2Cn4nStyegafF7ELvKjdfxpU5R64izzCB2qv1jpEDZToTL4vTta6Vy+i
	DUwQVj7dzS5VwtuekSYxhfv7fSkSGMY3SSDfR0n5sjiqpNuZUnibbU37jYCQrhqXUDGid2RCSZlGj
	1qIE0OiW08cWVjr8+AK+6oXYnkq4ggwOY7R9lHCG4GH4dqqg/g/MNuxSMuqMlmf+4Venni63c6Ijn
	7vQn3PCOatt6MasKc369Eg==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1w3AdE-007bwS-1I;
	Thu, 19 Mar 2026 11:31:28 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 62JAVT4p146140
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 10:31:29 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 62JAVTfG146139;
	Thu, 19 Mar 2026 10:31:29 GMT
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
Subject: [PATCH net-next v5 2/4] selftests: net: rename pmtu.sh to pmtu-test.sh
Date: Thu, 19 Mar 2026 10:31:21 +0000
Message-ID: <20260319103123.146112-3-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319103123.146112-1-aleksey.oladko@virtuozzo.com>
References: <20260319103123.146112-1-aleksey.oladko@virtuozzo.com>
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
index 605c54c0e8a3..8fa6ef771757 100644
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

