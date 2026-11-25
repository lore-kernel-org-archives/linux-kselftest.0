Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588882;
	b=i1GH//1wT27Y2I/lBPKY3tgeQp1aCwNxszj39U02K1D7qReGpnpHEfneDZ9s/0ygCKXC
	 83xm0T/vJvaV5nvE6892YYUvnjGdCNR8fZ3nTXeeRfXxvqqO+GOXZgqAqAHWUY1CUg1sG
	 Z8VWuAizy8CR5RUIDABZUS2dmTyoSqfR8Bxh/8hKcItfC5WwYXE+vS9lqa6jsXEcthwsA
	 VwZKbi6FSswAQENZoQHDc900SBQxsk0pva/vji/qag2nEPEzkE0b9+57CJY9as9fiAibW
	 2hmPY3m8MAQbiECGyVVejPTkW++xWddMJgo7/ovNUJcBD9f8u5YPgSbaZTacCPjWCbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588882;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wDVenBXdr7GUpwlsR6qSZ2r5Xjjh+eiFHRJk70fmxMM=;
	b=1LZQuihuinc8oMnGUckVlEN/9FeySiaBmk58P17QeXORXABSvdJJMxYn12skhmtYR0KK
	 fanM4skw/s+b+58v73Jegv1NgvjhRg+zjJu1quiEQQ8OwbSXB7As3rkcZvIi5weUE6Rhz
	 MDAEXuuOLlh9ynNcPyWS6/ZJ/AN1safJU+t5aWGJ3Nrxf13VucZB50lNqunb772pCh7ti
	 Ad4yRRwc66Pq/dBoAaljE2aQCF46OrJItIIdhq7G27vW+BeZ1mGuC7qzcWvemJSsOErzs
	 rnm5GvH5XZxCjjQakQ7/Z8cohR6V55nzjVuyVr+a7C6uqAS+WJvBFx6IdYbZq6XGCGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BTdNZRP9;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240D2606A335;
	Wed, 25 Nov 2026 06:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 240D2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BTdNZRP9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BTdNZRP99VFOsHMWOUylrm6TFPHDH99B5jnEeDV84ahQFSDe0qq9DxIysc+PpCyPEHxhiLjHzxAtM
	 FnjFi0BlFTueVw7cdVjEI2oRq/NXtRiSdKE99vbXEZdGQbwW+fESQmrpr/JTDNCdjO0bBA7lhxlRay
	 7dl16bzr52INkTlM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b068308582-eef66;
	Wed, 25 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee86b068308582-eef66
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b068305c60-3c15e;
	Wed, 25 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee86b068305c60-3c15e
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	annaemesenyiri@gmail.com,
	idosch@nvidia.com,
	hangbin.liu@linux.dev
Subject: [PATCH net-next v2 3/3] selftests: net: cover zero receive mark and priority
Date: Wed, 25 Nov 2026 06:41:10 +0000
Message-ID: <20261125064110.1396439-4-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
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

Exercise SO_RCVMARK and SO_RCVPRIORITY with zero values as well as the
existing nonzero values, for both IPv4 and IPv6. These cases catch using
the expected metadata value as the ancillary-message enable flag.

With the new tests and the original listener, four of eight cases fail
and the corrected script exits with status 1. With the fixed listener,
all eight pass and the script exits with status 0. The original four
cases also pass with the original listener. Verification used real UDP
sockets in isolated network namespaces; discovery and testing were
AI-assisted. No kernel instrumentation or fault injection was used.

Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/test_so_rcv.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
index ae01fa3c5329..3263ba2d1a67 100755
--- a/tools/testing/selftests/net/test_so_rcv.sh
+++ b/tools/testing/selftests/net/test_so_rcv.sh
@@ -11,6 +11,8 @@ FAILED_TESTS=0
 declare -A TESTS=(
 	["SO_RCVPRIORITY"]="-P 2"
 	["SO_RCVMARK"]="-M 3"
+	["SO_RCVPRIORITY_ZERO"]="-P 0"
+	["SO_RCVMARK_ZERO"]="-M 0"
 )
 
 check_result() {
base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
-- 
2.53.0



