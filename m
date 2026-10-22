Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665079;
	b=kVrDxKOMww8ZitKOZ59etaTEIAnsWoYz3e7R45Aukd+mT8BITfKlhUz51dfPSz6fFTea
	 gUoFm5OsLAyXilvSYCzTMapdDG+KJyFx0SfbOncOi3i0Fi0fOMnroakgbRMrvvRjuV4Nj
	 K3MZ9VFkNkGw7aBoA9I0gim/ok54kedqxnhU8xfBRF3uQXj/LulRZiKclxQZCcl5VQE+p
	 ASukg+XNrLiAfEOsbAI5kaDMhfAUKuX+aGitlIyEX3cgd4zNaml6pZQpE/r7DoBiLM7nB
	 kgKCGqPi/xeUStxl5QufMx0pw5uuX60dwC98o90B+wb60EyhocRsPUM0DLMHV5BMqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665079;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:X-Mailer:X-Lms-Return-Path:From:
	 Subject:X-Original-From:Content-Transfer-Encoding:In-Reply-To:
	 References:Received:Content-Type:To:Message-Id:Mime-Version;
	bh=QutacFbFNmbvxrdr0i9JG0tUyGV8lfCzIx3D1a2xLcA=;
	b=QmR4imfEMXFC8VpKguWptnsL26y9YskdvRpUXeEorsJU1Af/RNRGMGmhCHaQ3RU78z2j
	 JdgUmcvTxIVJSE6LJ7aoM+XJ/tBexz85cYXDeZNkwoOVYqYnI7+BCr5yNRsB9kRJPel4a
	 3Mcr3AWM5EvqC+Nausy7OIcWjpfoCB6zjmpIhgx+MIDO2ZDEr0andQbZQA2MmDcOs8D5U
	 sjfD4PWGu6to+QI/RP0KiNH5rKYuVySw8itxcPLMRxucuCj6Rxp/XPOUUlpG6C0wg0xFU
	 4oSwrV4Glk2UGkgI2jyyqb1r6PTyVzWSLmAvTna2Wv8wPF1ivkReLcT4nyfczZ2027w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lanxincomputing.com;
	spf=pass smtp.mailfrom=lanxincomputing.com;
	dkim=pass header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=i8fwoEPN;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F0606A322
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 10:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0F0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=i8fwoEPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1792665071;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=QutacFbFNmbvxrdr0i9JG0tUyGV8lfCzIx3D1a2xLcA=;
 b=i8fwoEPNw/wo7Z11emm1mqRtuPV5hVvHr+jTPpQpi8UM+StRphvF46TZFGqCqtgswCw2+6
 vuK7m2kDi2ntWcAyBIrl3iK0ELLEyIjLyuPaClsyLRGfjvqdhA74rTdK8Jm6TXogjBAM3O
 H8uXU0rR316yvdZUxu+Lp6BJfc4vpeZ4Hw8ijcHAm9UqBUsuP8LUJMJEHT1+Tu6ZhW8/p+
 CrUmC7pw+hIT4EIugCV3gZbqY9WK3SF6kH0XENOliLqE+g4wR5eIYGPX6zROGDh8XvdezR
 U/peuJk8XRudbilXWUsNUZBye4IsdqBPNoy5gZESgvgJl2w93jizN2PDiprpsg==
Cc: <shuah@kernel.org>, <dsahern@kernel.org>, <davem@davemloft.net>, 
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, 
	<horms@kernel.org>, <netdev@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Jin Li" <jinli@lanxincomputing.com>
Date: Thu, 22 Oct 2026 18:30:22 +0800
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26ad9e5ed+39ab13+vger.kernel.org+jinli@lanxincomputing.com>
From: "Jin Li" <jinli@lanxincomputing.com>
Subject: [PATCH net-next v2] selftests: net: forwarding: bridge_vlan_mcast: Allow default startup query interval to vary by HZ
X-Original-From: Jin Li <jinli@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261012115414.GA704996@shredder>
References: <20261012115414.GA704996@shredder>
Received: from Test-PC-Jinli.lan ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Thu, 22 Oct 2026 18:31:08 +0800
Content-Type: text/plain; charset=UTF-8
To: <idosch@nvidia.com>
Message-Id: <20261022103023.834927-1-jinli@lanxincomputing.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

The mcast_startup_query_interval default value is calculated as
125 * HZ / 4. With CONFIG_HZ=250, this results in 3124 instead of
3125 due to integer truncation. The test currently hardcodes 3125,
which fails on kernels built with CONFIG_HZ=250.

Allow a +/- 1 tolerance for the default value check to account for
this rounding, while still catching genuine regressions in the
default value.

Signed-off-by: Jin Li <jinli@lanxincomputing.com>
---
 tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
index c4cd2078a8db..c07c2af5df94 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
@@ -383,7 +383,8 @@ vlmc_startup_query_test()
 
 	echo -n $goutput |
 		jq -e ".[].vlans[] | select(.vlan == 10 and \
-					    .mcast_startup_query_interval == 3125) " &>/dev/null
+					    .mcast_startup_query_interval >= 3124 and \
+					    .mcast_startup_query_interval <= 3126) " &>/dev/null
 	check_err $? "Wrong default mcast_startup_query_interval global vlan option value"
 	log_test "Vlan mcast_startup_query_interval global option default value"
 
-- 
2.53.0
