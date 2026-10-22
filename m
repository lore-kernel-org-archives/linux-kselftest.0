Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659558;
	b=kLxTyT4QIsfXqN78y+zI5zcN+QSCNZt39qSgxW3ZlueOUg5j4Z+kUajzbue3RrKL3jzT
	 unq/71dLSvxZw0pYYRLb+Og+N15wrCnm4NDOpqb/RA0AldRojYiuCMKTLwIKembt5tHHW
	 dRA3J+eRq+jNlB3dRgFMqrazw/qmgHoM72PMEo1THlirjOoBYf1s9zlvHf8Y1cEPvI0+e
	 p9D/bol0qM7IjzuLDDvgu9o/iN8FCC9i28dFqviBxMKjoMq/SkPvGVtVEbQtH9P2+wpZ1
	 ALmEtj4JQ7dtp43rBRwDGa8UKOYcTPvcX6HybYC3NOua6Je9Jw/x+OU8/Asv7xxY1HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659558;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=FQeZgAUXtef+J+GP1s6g1k7TeZ5pvSDFx7WHDGCVFkw=;
	b=MXHcYwFmqTReUIKT3PzmXWAZ8tksyMCNeUCwXnBQuWvV5UBnYxBC3DBXat7A9o5jAgvq
	 L8y971FFMB4uVa96u5NIwTwRv2xUJ5oLSEYZQTh0/JBhzRcSBH3tLKIxkQVRsPvWB98r6
	 aHRTj4NhmthBYekXDw+gHNiciScbGMAs5n9NQhMz4H1S6mU1U/SuX89PUDhL1Je8XgXRy
	 Yiy647UUWMncn6dwmPYcsCPMClXYi7/z9ghjkrxV19PWFjuqsnNqGft8BgDzJFQNlPcgF
	 7bvQh7rQcysWyOsbtK8FUWOojf8zEh5SR86Nto8MiTcpZHskbxFXg8dNE69HXBkasow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="gq1yO/Lz";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F8606A319;
	Thu, 22 Oct 2026 08:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gq1yO/Lz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=FQeZgAUXtef+J+GP1s6g1k7TeZ5pvSDFx7WHDGCVFkw=;
	b=gq1yO/Lzh24LT+GiMQlTEV78EN4zpbtOCNBypS1jIDMAr5hNN+5H+ifNvVym3e
	vSaGpTF8UVE+sqS6Sx2zegHvQygxeXRxFGl1z4TmOvSl0ke9RsxPSKOkSjowmrU8
	h2b1uUQydNgigq5cMCEJ+yZ1dh3sZ1LqQoP7nKW3eHzaE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnbwpC0Nlq2JtSCA--.64708S2;
	Thu, 22 Oct 2026 16:58:43 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net v2 2/2] selftests: net: check veth carrier after changing channel counts
Date: Thu, 22 Oct 2026 16:58:29 +0800
Message-Id: <20261022085829.2514-1-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261020135544.24441-2-yana06070@163.com>
References: <20261020135544.24441-1-yana06070@163.com> <20261020135544.24441-2-yana06070@163.com>
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
X-CM-TRANSID:_____wDnbwpC0Nlq2JtSCA--.64708S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRK_M3UUUUU
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC4ARW3GrZ0ES0cAAA3N

The Sashiko board (automated patch review) suggested putting the
carrier cases in veth.sh [1]. I've done that for v3, reusing its
namespace setup and cleanup.

The six up/up and mixed up/down cases, with GRO on and off, are kept.
The driver change is unchanged.

[1] https://sashiko.dev/#/patchset/20261020135544.24441-1-yana06070%40163.com

Best regards,
Xia Yan

