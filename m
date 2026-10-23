Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722880;
	b=UNXkf01TfrQIdWFjTMfvO9JohcPxDL2O4gttmAf3y0MMSlbiGPUfPIrtRisT/RMUwIQu
	 N7htVqG99yvjQdQ3h6CAcklgUW9jKlLwxx/C8YU+IOnKzfR1IrPILlZtIqiJh7XSYAo3X
	 edY50ZLu7+/jaD95BU9wEF68gEAIbbuQxw7nDKm1K7qD5zpXxvftA3uYBFRYwMsrgr9xj
	 pATiDsvHVaWvR17/a2LvsZi53yHEoEyt5M+T5e4qDne3KvkYB0KJz4kkRMxLPSYcF4nxM
	 dgyaH151H3k0VbHrmfqMs5/Dl/02E9D7lqIEOGiuUiRg0l/kGiDiX+G7tLXaOfGU6BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722880;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ENGSe2m1CO3BcyFxhjvqrceXTPMgR8/aby+eduOc4F4=;
	b=0GxEoNNIlbk1KOX8lIFKldNNf/2R+IszvYWHG/xZf0E+QuRC2OQaQOQSq//0uZTk3s+g
	 k3UPJDUGNrlGAA2XTLxcbsA1FsHg1jK2EiJVRlsWovGF7YcobxKP4ZpFzUJVOVfFJaDSO
	 8gVbQlrcmEFt+KC682kyKd/wkJSbqDdTQZ6AIzQflpZPtZW/boR1QgeuoS6KNz7oNmtHC
	 ZfTRryWtJWDEzhzx8pnIxr+tpCKFdanrGb3TMCSzdDxpsZWwnvS+MTDT8Du94DGWeOPjY
	 Ibu5b1aiani0V5MpJdNpMwRROOL+s7bDyXfUaohCpC1eZJvN7mi8EOwmHlPi2fKacfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d9zqeTzL;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFA606A320;
	Fri, 23 Oct 2026 02:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FFA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d9zqeTzL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=ENGSe2m1CO3BcyFxhjvqrceXTPMgR8/aby+eduOc4F4=;
	b=d9zqeTzLWKLCdpziA1Fl16+QTyfqBF1TRksLDGJiZUeqTynAJpdXGkbfBrdRS5
	9ObVPNcUt1sl5EsUX/n1VxeVkI0mZPgoqwztEYpu+x5dwx26GqQSB4a9B2W58qke
	m6VxS4c1bxwZY7sUmK3SarwbWs8WGxseZR2byw0HeWVRk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nyiZx9pqdsx3CA--.42253S2;
	Fri, 23 Oct 2026 10:34:02 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: hangbin.liu@linux.dev
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net v3 2/2] selftests: net: check veth carrier after changing channel counts
Date: Fri, 23 Oct 2026 10:33:50 +0800
Message-Id: <20261023023350.7225-1-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <atq8yKbnqtLBVucH@fedora>
References: <20261022085842.2527-1-yana06070@163.com> <20261022085842.2527-2-yana06070@163.com> <atq8yKbnqtLBVucH@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3nyiZx9pqdsx3CA--.42253S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRNb18UUUUU
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC+xpp72rax5r0+QAA3H

Hi Hangbin,

Thanks for reproducing the issue and reviewing the driver fix.

> Why do you do gro setting in rx/tx set ups?

I included GRO off/on to cover both queue reconfiguration paths.
No XDP program is attached in these cases. With GRO on,
veth_enable_range_safe() and veth_disable_range_safe() set up or tear
down per-RX-queue NAPI instances as the RX queue count changes. With
GRO off, those helpers do not need to reconfigure NAPI.

The carrier bug reproduces in both configurations, so the test checks
the same carrier state with and without the NAPI resource changes.

Best regards,
Xia Yan

