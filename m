Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285274;
	b=wVhCHVqi4z81vABXKcabf6wvjPO/+muVAhs+wfkfFIGWQhJqGGnZuXg0nmUHtkm2Td0Y
	 2Ums7Pqk6O0Tkorw/ySEjZ2z0JSSDmeCcgLF2Be01T0yD8S9aKDQBTE0oBcQ9BlJPVoKX
	 y3YQ/iw4EFdUQd+CTrl9khZBQDR3hArb5saM0IdWE1UE+oTBvcUiEMl+cbnogK5la0sLW
	 4k8oB1UJ1C83eQRCijhNSJ9GxFVEW+Kij0/iEfw5jHklAEsOLTFgHO0zEIOBrRkWSSm/I
	 9eti6xefNq3B1MXtN7lSpKhfvvHUwekx8n6i0VNqAEWK43sOJD8lPJeaidtCgpR7ciw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285274;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yxgM3lL5dJcUlJkuBazw5/O5iusRITjr0SHudbZ9D94=;
	b=NrdwKI0YrzbD2R81pShCLwc7cQr1cl8vLydJO71F1G48o1S4MxT73oyloyyAnSkvVMC9
	 mqRlfU4Oh73fmrqHrQ5dFEY9LxttqxhlkkTyOFM2pVx+aOEM8awdm4XdINXVVDT7wou12
	 pkRRQacnk5Nfeg2XwFHfS5lJhfWgQTaKn8alOeasP5QI8mw2j1nBOf+IInRd9Ow2BLL49
	 fGfalpmSiSjL906Fk7PGexIwi31j/paQIvNJ4U/LfGWSi06gQyuKDxn9nU4/dW0qXpnzp
	 Mw1FuME2dOaUn2J89FcK1NRA4wQsPRBNJJ1ZWIQWY40SuxtPznKqQkzqjImG5otxqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=LLzBEmLe;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27477606A332;
	Sat, 21 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27477606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=LLzBEmLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yxgM3lL5dJcUlJkuBazw5/O5iusRITjr0SHudbZ9D94=;
  b=LLzBEmLeI6fC0J2XKHrIvoM7YlTjRzAwNTxl2T29AIWbW+XmxSqNe0I0
   2DK6vsZuAACJrPZGvYaNNj+tNASdj5BK6tdBkIgCt6Rv+DITrOKjbaT1P
   qMY4Nmi+PWrh9QfVnTUNcIFJzjzr4q6Qe5EpiT1/v9e1/N9+0sWST4LJx
   o=;
X-CSE-ConnectionGUID: sOAZQ2ToT6KyN1NxUHuIOg==
X-CSE-MsgGUID: yuLOLVsbQOeNW0qXuLI4zA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=yifei.sun@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,225,1787004000"; 
   d="scan'208";a="306681189"
Received: from 193.186.140.88.rev.sfr.net (HELO macbook.tail650e82.ts.net) ([88.140.186.193])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 19:21:04 +0100
From: Yifei Sun <yifei.sun@inria.fr>
To: netdev@vger.kernel.org
Cc: Yifei Sun <yifei.sun@inria.fr>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: test IPv4 nexthop fallback in the same trie leaf
Date: Sat, 21 Nov 2026 19:20:17 +0100
Message-ID: <20261121182031.36626-2-yifei.sun@inria.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182031.36626-1-yifei.sun@inria.fr>
References: <20261121182031.36626-1-yifei.sun@inria.fr>
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

Check that a lookup bound to veth1 selects the nexthop object, while
one bound to veth3 falls back to another route in the same trie leaf.
Cover both a shorter prefix and a higher metric for the same prefix.

Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
---
 tools/testing/selftests/net/fib_nexthops.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51917eb..38bb56f28187 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -22,6 +22,7 @@ ksft_skip=4
 # all tests in this script. Can be overridden with -t option
 IPV4_TESTS="
 	ipv4_fcnal
+	ipv4_oif_fallback
 	ipv4_grp_fcnal
 	ipv4_res_grp_fcnal
 	ipv4_withv6_fcnal
@@ -1535,6 +1536,28 @@ ipv6_res_torture()
 	log_test 0 0 "IPv6 resilient nexthop group torture test"
 }
 
+ipv4_oif_fallback()
+{
+	local out
+
+	run_cmd "$IP nexthop add id 12 via 172.16.1.2 dev veth1"
+	run_cmd "$IP route add 10.0.0.0/24 nhid 12"
+	run_cmd "$IP route add 10.0.0.0/16 via 172.16.2.2 dev veth3"
+
+	out=$($IP -o route get fibmatch 10.0.0.1 oif veth1)
+	check_output "$out" "10.0.0.0/24 nhid 12 via 172.16.1.2 dev veth1"
+	log_test $? 0 "Lookup bound to nexthop device"
+
+	out=$($IP -o route get fibmatch 10.0.0.1 oif veth3)
+	check_output "$out" "10.0.0.0/16 via 172.16.2.2 dev veth3"
+	log_test $? 0 "Fallback to shorter prefix in the same leaf"
+
+	run_cmd "$IP route add 10.0.0.0/24 via 172.16.2.2 dev veth3 metric 20"
+	out=$($IP -o route get fibmatch 10.0.0.1 oif veth3)
+	check_output "$out" "10.0.0.0/24 via 172.16.2.2 dev veth3 metric 20"
+	log_test $? 0 "Fallback to higher metric for the same prefix"
+}
+
 ipv4_fcnal()
 {
 	local rc
