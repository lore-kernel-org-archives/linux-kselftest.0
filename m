Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708247;
	b=zgOpmnVpo7wdW3ak3DO3n6JuUvvv/d9cLV+41fGJqhW/WNL4Ea+eEN1L7YP5ytTtgZ22
	 BTWYUvL4FBLqD+uDXcAyiJbNXQz97vfV8NXBJFsqREZYTLLT3wLlhm/mJz/YKyhciDRgx
	 bqShEPfNA+MoFlTkdaJSCKcP6abNHEcJv2blEVsysjjSqrlUDj2YEwfLHfSrl0JYAXEKX
	 c1LRwmEFDaILzL9MPJlrt5DOcGpry0ZggzG2XHnVuVbUhnIwRBUMunddpe51a/Q7gpgaQ
	 iQwO1pgxgf7M+D4yDxuKmjPcjY6QLJyRhWtBanU1sv3v9sF55bXu21OQfo3Bhpjfljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=saUUCKIqoj1R1jMdOizyAkqU4jCHeGRF/gsnJ9kvDUE=;
	b=vgP38j95n+BOmlHZLvmjn4azjdHsjPCenVO+Y0BIuH/BIKA0jpIh2oGFmLD5KYQVYiJi
	 9hv1J6bgucoDFfcpvbqCkIyTIpNhoyaQP3kQ1sZaBtma9pyYuK8CGpCip2vazR85kIkUU
	 mTpdvoaB9B3KYYe+4xqunVf/V3HIqrS3bDHZ12vrLIQXbxCK+QSmHC5TOKa1XGk7atoi0
	 QGr7+l84/dUwihRhJVa9bnyjNTnlGaNo6auIbaT3L3iLslL3zYTB3pjSwryUOQdg+vwnW
	 kJqCeXOQE7OmPiFMc8vMg82oNVdV8ZfLBPVGmFfx765Ruika2GmiWRiOxdXcpNwKsfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="ca/+PKke";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA17606A319;
	Thu, 22 Oct 2026 22:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA17606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ca/+PKke
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMDfVm1680881;
	Thu, 22 Oct 2026 15:30:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=saUUCKIqo
	j1R1jMdOizyAkqU4jCHeGRF/gsnJ9kvDUE=; b=ca/+PKkeE8ndbxpe+DSkQK2kV
	ahwyGl6IYKFb7CvKszlCixKdBvenawdSjs9592CXChGkiLwOYyoJNMTLcJf8nABh
	JbqKpRy48VsXzi95G04m0RHAML5onLZlbwGq3KXY6VKJLncIpnolCoYXslWBpdal
	zHnVJDU5N72gWHJTg4HNt27LjsEWWgTgCvocM7HDobAzxGJaFVjwOK41iUFKhNYt
	onimdD9ldOEF4uppKDylMwi5HqRrUhAMyycdeHsfdm065fjYMyEecC/QnZJrE5yc
	fRRGWwmAsQwP8S3dweZHIYE2Elk/Ack830nvIJWn8vhzipgKz0SAHweYTQScg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf6m6bs-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 15:30:36 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 22:30:34 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: Daniel Zahka <daniel.zahka@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>, Raed Salem
	<raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Cosmin Ratiu
	<cratiu@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@kernel.org>
Subject: [PATCH net v2 0/2] psp: fix transport mode with ipv6 extension headers
Date: Thu, 22 Oct 2026 15:30:12 -0700
Message-ID: <20261022223014.556388-1-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
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
Content-Type: text/plain
X-Proofpoint-GUID: 3ULil5fqgAv3mt7l56K3OyMbC0JWKg5J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfXzoIS1XY62bJp
 0+1qFsEbe7aNfmXV0JpA100ePLcYHjQRoNe/dvk9YhAqdrvHtjG+ROFHjYRLvWDrY4K9UC6dCfW
 5Z+a60DcyH9XoUYz+iDFXwX5FJbiDD0=
X-Proofpoint-ORIG-GUID: 3ULil5fqgAv3mt7l56K3OyMbC0JWKg5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4OSBTYWx0ZWRfX4SfbhkGttDwq
 dYoCUGPpOExfpEdp+SebbJreBodQC4WoLqSWHDMTGY4a46CTGvaqJ2rerClgv+y+UyICdg0i7o0
 QRAsD9IONHogBfCM8JS1BMMwbCCDnn2/9KFkUOMerk8EpxCOdZkmhH3z8TkxHPEmk2czj6ojWFD
 lN38xn0fa5vgU3OawMotd3VZ0sYdxRfDOZmcnxXG9rqHFa+Si+pgrvGqPIsdMf2KeTWgErqRSai
 NpKxo0ux0PvfpHVQJI1i3JA3xcv4bA/MjSzgGCrCGVnbKpEsdKWJBLvS49Yst1biLOGV5q5is7c
 hh3Ci8r28QKRJcKlD3o1fd2D4jSa2iIQr1KiphdHd6GEYLVG/vGVbeILw9WoZLog2qxDr6UQkBD
 AV4MIZ9zi68re644EyaISR6K9jPBIFtBN4eqXXNFpZ6iGG9O4wAEqdTYMRIWKcXC1DUHp+h7vwc
 AVcWgockLO07f13qFAg==
X-Authority-Analysis: v=2.4 cv=HOVWhYtv c=1 sm=1 tr=0 ts=6ada8e8c cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=gYlc90bweUbmYayN_AcA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01

While working on adding support for socket-less psp associations, I
noticed that this case was not being handled correctly. It will be more
relevant with that series, because it adds udp support, for which the
psp nexthdr will be taken from the inner packet.

Since the tx association encodes intent to send encrypted packets, but
because of other configuration (socket options, routes) the packets are
sent unencrypted, sending this change as a fix.

The first patch adds the requisite code to walk the ipv6 extension
headers chain, and stamp the last one to UDP instead of the fixed hdr.
The second patch adds selftests for this case.

Note that no test case is added for ipv6 fragment headers. As far as
I can tell it's not possible to tx fragments from an ipv6 tcp socket.

v2:
 - walk the extension headers instead of dropping (Daniel)
 - reject fragment headers (Bjorn, Daniel)
 - reject routing headers
 - psp_dev_rcv() handle the rx case as well

v1:
 - https://lore.kernel.org/netdev/20261021210200.788191-1-toddfreed@meta.com

Todd Freed (2):
  psp: fix transport mode encap with ipv6 extension headers
  selftests: drv-net: psp: test ipv6 tcp socket with extension headers

 net/psp/psp_main.c                         |  78 ++++++++++--
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py | 138 ++++++++++++++++++++-
 3 files changed, 207 insertions(+), 10 deletions(-)

-- 
2.53.0-Meta
