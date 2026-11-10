Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278499;
	b=3DbIztsCGX10LVmo8lNbwnSNBluIJPqfYeXACrBzTNtRBt0iF0Mn7u2Iu12TdMmsSAQL
	 uaB4k4/TYUH+OvTH6JGzsAK3Dkh/Leq2DnC5xVowaG1ilq8OBp+VQK+IlAaPvf8Hf2+Kb
	 hGUbvZCvTcNFH3LcfjMZvqOcqi/cSWib2YVQgThE5KsJ3VrGVTkq2OVICIM5dC9cBSjYq
	 bcUxwd3rZZkYUivISo9F8PHDcsxG78LXCoKaTXmIY89HW4ZjrucHmG5Te+hl5/aoGspvK
	 KgY98LKKbPk9y95WZmAybQzc+YsD+wBj174F+ocUBQstDn2tbQ4KXWDlNC7+wCankiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278499;
	h=DMARC-Filter:DKIM-Signature:Received:X-Lms-Return-Path:
	 Content-Transfer-Encoding:To:From:Date:X-Original-From:Cc:
	 Mime-Version:X-Mailer:Subject:Message-Id:Content-Type;
	bh=rPoVYl5XhffNID/3V35m4DVz5rHd/NjoZ7mdTI10EK8=;
	b=rDvT8RG3QxDvaZ4QtyjoSAOc0KFCGsrjZwzj0gk9HR6+lfdL0YWpZBZuWAYsFAf/zpR4
	 i5E6o9TAglvj0muMX5cpmoUGYtl0TGVXoBn6+BteU9Lczyc2ypVMjCSFk7f23yJuuQ3KS
	 XtEJJe3bXOPmKbyeFg50u+wChGvrkegkr8AcK4BBGIlP06Y/eYYbHGsNVgBkT3hg96g4c
	 e59PruaiFHql1OZ/DYik2PB30JAjsEsDKyuhQbgamNQDpA1DApoXKpJW3+dSiMIQo1iOq
	 6CK+0+Ep56Tey6Ixlqhoa8wYExVBJi+Dqp5pIflwWPdh7tZrm5cQSRV89lSGc/SdcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lanxincomputing.com;
	spf=pass smtp.mailfrom=lanxincomputing.com;
	dkim=pass header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b="gzAiSxe/";
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197DC606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=gzAiSxe/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1794278491;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=rPoVYl5XhffNID/3V35m4DVz5rHd/NjoZ7mdTI10EK8=;
 b=gzAiSxe/p0SPFoUDwY3q4yCkV6tuziRId6awtTfPqmkdYvK1BzhrDsW/7psvU8R2FaYkn+
 w/IryLVgTEbwkcg/Bt4tOkcpEVm08/njFnN7O5M6X8itUKIVf2NrrsiJ7F7XezHQ+Ge8X2
 0AP2xHeANP6sixQ1Vad4JRK6cGq9qaEX2Wg7pMxnJ5mIpOPGNkA4nb3xhI5zK8z8WTeOTz
 pQTpkbQKUMLBxSxImUJP5f52du7GOcLpNV9jBAuW+JkPOiRCBihQWrHEAhqs1EP5oCXik5
 3Sihgbg6dEHP4AQjnGr9JHSXDq9b3G6RUMLO3/WVeI4PaMIA7kXHRlnCgmkpmw==
Received: from Test-PC-Jinli.lan ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 10:41:28 +0800
X-Lms-Return-Path: <lba+26af28459+5267c9+vger.kernel.org+jinli@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
To: "Hangbin Liu" <hangbin.liu@linux.dev>, <dsahern@kernel.org>, 
	<idosch@nvidia.com>, <shuah@kernel.org>
From: "Jin Li" <jinli@lanxincomputing.com>
Date: Tue, 10 Nov 2026 10:41:23 +0800
X-Original-From: Jin Li <jinli@lanxincomputing.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>, 
	<pabeni@redhat.com>, <horms@kernel.org>, <netdev@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, "Jin Li" <jinli@lanxincomputing.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0
Subject: [PATCH net v2] selftests: net: forwarding: replace bash brace expansion with seq
Message-Id: <20261110024123.535210-1-jinli@lanxincomputing.com>
Content-Type: text/plain; charset=UTF-8

{1..16384} is bash-specific brace expansion and will not work with POSIX
shells like dash or busybox ash. This breaks the flowlabel test when
/bin/sh is not bash.

Use $(seq 1 16384) for portable iteration. Fix the same issue in
custom_multipath_hash.sh, gre_custom_multipath_hash.sh and
ip6gre_custom_multipath_hash.sh.

Fixes: 555e5531635a ("selftests: net/forwarding: spawn sh inside vrf to speed up ping loop")
Signed-off-by: Jin Li <jinli@lanxincomputing.com>
---
v2:
- Add Fixes tag

 .../selftests/net/forwarding/custom_multipath_hash.sh     | 8 ++++----
 .../selftests/net/forwarding/gre_custom_multipath_hash.sh | 8 ++++----
 .../net/forwarding/ip6gre_custom_multipath_hash.sh        | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
index 5dbfab0e2..92940370e 100755
--- a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
@@ -224,10 +224,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
diff --git a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
index b4f17a5bb..19384be4b 100755
--- a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
@@ -319,10 +319,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
diff --git a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
index b24acfa52..d848e82d4 100755
--- a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
+++ b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
@@ -321,10 +321,10 @@ send_dst_ipv6()
 send_flowlabel()
 {
 	# Generate 16384 echo requests, each with a random flow label.
-	ip vrf exec v$h1 sh -c \
-		"for _ in {1..16384}; do \
-			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
-		done"
+	ip vrf exec v$h1 sh -c '
+		for _ in $(seq 1 16384); do
+			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
+		done'
 }
 
 send_src_udp6()
-- 
2.53.0
