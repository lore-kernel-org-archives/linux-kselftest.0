Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985648;
	b=hjQles0Fau3ypD6wmBgW9QHMumjueDQwZMHJ4e/7qsQz7558VypeKf19gi0B97QMzQ39
	 JNAqWbkw1hxKKtLCY2N01CoIFfqGN4X6iy7en7hB6YRk5iITR2585TEYkmE/bxiTLOtRf
	 +tinAmwRTSPPUaGftMt5p5MEGNXMxzgc9khFuCuR6FJqQlur20A9XTkgYaJJ8f0MoOYrT
	 ytQg5iEC6SFRt4kSchlUEVFAM/OL1mTzcsA1Buq3u7mjG2/Es6Ck6iIxzJ2Ni3h38Uwao
	 yyVitl/54oNWgmgUQ0YtXb7IBS52MisbBJU8HxKcxNaDy0PYB5fdeYjyt9JjztkmWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985648;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=HOMB46FaXOpquuAn/2bTfQsNhQ9lVa4wMoEdUfqxF+w=;
	b=Uonk0YexuqmYkFjHenhvi/UA8DYavjTFyiUK1yHEfeniUAyVSLt2vm/T8CG6wQVCK2nd
	 J8yMYZMvj5zjhCvtwRnMjySYu47pzOtKvV+oF9BRdSgGwpfcuUAuS+UwAgj+Ya1oKnSco
	 H63jxgHNfv6unbd6rnJ/G9hwJeDbRTKkhO0qyWpgpMSiryqbQW1ZaxuJEVpgtIvYXz24v
	 qFFdhP5YoL2K9rkFnvJO/QaboS0m34S2mI3PRQYfN9ltMUgO/ql56cY6FwJy1vLpjcEMB
	 QJQQW4GX39tuky+VRo63+NmiXeaI4ydvMXELo2PTc2qXzLQvbCrfTpMiOTncr8zRNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=G7ZVU5I6;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF2606A31A;
	Mon, 26 Oct 2026 03:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=G7ZVU5I6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:Content-Type:
	MIME-Version; bh=HOMB46FaXOpquuAn/2bTfQsNhQ9lVa4wMoEdUfqxF+w=;
	b=G7ZVU5I6JUq8beuP9V2UV/5vGzRLM1Dgt4QB+B0IgSUqEkjScefIH9dzL4KVyu
	3uRH4E11vlRn14WnUa8VSofKylS346pbRh/vIz4c0dMbiszI2E3Nh1Z38IMZdQ+I
	Kt2VSPesF0qs1Gg9lUNCPZ7Zqq7iP37JV/VYtAmLakQRA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3VEAJyt5qVHyJCA--.4364S2;
	Mon, 26 Oct 2026 11:33:30 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: hangbin.liu@linux.dev
Cc: yana06070@163.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Subject: Re: [PATCH net v4 2/2] selftests: net: check veth carrier after changing channel counts
Date: Mon, 26 Oct 2026 11:33:17 +0800
Message-Id: <20261026033317.15680-1-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <at6_pw9Ng-UEFVB6@fedora>
References: <20261024093007.12981-1-yana06070@163.com> <20261024093007.12981-2-yana06070@163.com> <at6_pw9Ng-UEFVB6@fedora>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgD3VEAJyt5qVHyJCA--.4364S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRNb18UUUUU
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC4AoHjWreygrGQgAA3Q

Hi Hangbin,

Thanks for testing and reviewing this.

> Which single-value arguments do you mean?

I meant variable expansions used as command arguments, such as
"$BASE$target" and "veth$target". "Quote variable expansions" would have
been clearer wording.

> Nit: there is an extra "" quote.

You're right, the literal up does not need quotes. I'll drop those
quotes and clarify the changelog if another revision is needed.

Thanks,
Xia

