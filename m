Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F1E2EAB8E;
	Tue, 27 Jan 2026 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554328; cv=none; b=MTrjXJRuRcE3fC0aZL7S0xDEOGarYUdQCacj9MIFusagwPNibwlDzgJHOlgeiydCLbmSXhEtgkI8wTSAQeCeIWwXIYmioW8R5IfxFrGkdHNv6OtDH/L6aScFsGHdtU9RRj2g0XsbBgDz8Jv8sgBP1D842FXlvHNZmdavjLZO1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554328; c=relaxed/simple;
	bh=fAwcoqurxOiP2mlKpuJQinVz/GPCAjW6iExhrTuyN0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUZDHAP9akJGaGcL32EdYTWzRrIIArSaXfExjRdAttGI64fU0xSFbbASz+0lx6OuFWv1i23/IbOe2JdIOCA8eBK2G263CZA/7DeFLRDk7V0yav08ealnGIPdJZxR1h5cvZJtS3CGGuDKP0Q2eX/O/gVYiKIkEOhkffBfxYmn518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=Ms2I0qzl; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="Ms2I0qzl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=bW5DtRsamE95vGAdJSFvHf3U93xrRQ4W2Xdb4GAprTM=; b=Ms2I0qzlkEog
	5ruqsEb3QiEMxNVRgOc0w+3gVDJjeucexsdFpIClznfSs6iN+ZwffS86CP3tNObgxeez2W9xZz1Um
	1ofAF9gm3ulNUOhVApk0peIqL4GF1eXNjrGxiFWIF77X5WOHt2yauWb1/4hPqs44GIES67ZpbTHkH
	RzxuGgKVVpgHsPN3mTCEsYDmmx00p+d8SVd4jcbtl+tJJXLsf+2+Sb1oe6ZsVZR39DnabC+7mWYYx
	FUvYorA66Me1y/t1ZYMCNuEDlbQ9D/aN1w3ns8eMfeWJQdtdquAWGLIIjpvnba1YYCyE8LPN1djMV
	W0QuioCF226NWT0I+XjhPw==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vkru5-0080Te-2n;
	Tue, 27 Jan 2026 23:51:52 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 60RMq1AW304403
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 22:52:01 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 60RMq1IW304402;
	Tue, 27 Jan 2026 22:52:01 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
        Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH v2 5/5] selftests: net: io_uring_zerocopy: enable io_uring for the test
Date: Tue, 27 Jan 2026 22:51:34 +0000
Message-ID: <20260127225134.304362-6-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127225134.304362-1-aleksey.oladko@virtuozzo.com>
References: <20260127225134.304362-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The io_uring_zerocopy.sh kselftest assumes that io_uring support is
enabled on the host system. When io_uring is disabled via the
kernel.io_uring_disabled sysctl, the test fails.

Explicitly enable io_uring for the test by setting
kernel.io_uring_disabled=0.

Save the original value of kernel.io_uring_disabled before changing
it and restore it in cleanup handler to ensure the system state is
restored regardless of test outcome.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/net/io_uring_zerocopy_tx.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/net/io_uring_zerocopy_tx.sh b/tools/testing/selftests/net/io_uring_zerocopy_tx.sh
index 123439545013..8c3647de9b4c 100755
--- a/tools/testing/selftests/net/io_uring_zerocopy_tx.sh
+++ b/tools/testing/selftests/net/io_uring_zerocopy_tx.sh
@@ -77,9 +77,13 @@ esac
 
 # Start of state changes: install cleanup handler
 
+old_io_uring_disabled=0
 cleanup() {
 	ip netns del "${NS2}"
 	ip netns del "${NS1}"
+	if [ "$old_io_uring_disabled" -ne 0 ]; then
+		sysctl -w -q kernel.io_uring_disabled="$old_io_uring_disabled" 2>/dev/null || true
+	fi
 }
 
 trap cleanup EXIT
@@ -122,5 +126,10 @@ do_test() {
 	wait
 }
 
+old_io_uring_disabled=$(sysctl -n kernel.io_uring_disabled 2>/dev/null || echo "0")
+if [ "$old_io_uring_disabled" -ne 0 ]; then
+	sysctl -w -q kernel.io_uring_disabled=0
+fi
+
 do_test "${EXTRA_ARGS}"
 echo ok
-- 
2.43.0

