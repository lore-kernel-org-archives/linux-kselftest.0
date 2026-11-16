Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816135;
	b=cMiesr7zaG4iyqVEFmw2xafnNzPXXL2YDZ/RRbU1vnaSaxjGZ3I4/Km4fZzSUkm4BRyg
	 j/hgwsStxtvlOCOIKHbkuxD5sLzSe0Ddqr9hYg9BX2yumuaKuVHDaZR9jRiU7ZVb+kwIB
	 Iqr+rG/Xb86aZWsZYkrH2dbyrJvy29T0zTrOGpzggdgivHV9sg3XZ0buNdOhHloT3tUsj
	 K1H+XgHC6Hws5jk8y8Hrc3mKiHz5t95FP4GJcjs0yzsasF/Y6E0L7fP3jY3KErzMS6Qa8
	 af77WRPcXXbTxcxGYyb24VEWxfQs6bfwI4GRjLmuqBfnUpZx84fDN6uXVRvPttK4SIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
	b=YdS6284eddm/bRxrA7uxzKLm8bOExOxxRKpdJoKRgez/rMAePXmWhtcDSNpzIfXTivGe
	 o9GvCe42+aAbMKZAbIQUMTIB3drab3EMwbV28z7ciB/9SkcCRqSgbzAWY/tVc3mUJ0uMA
	 hYhef2nOP1aR2Xa2zaEgvy/g2cqWzKSvI5aQk0ZQHeWBfw8J9TFvWYcIjJrrf/3tkjry+
	 jiDfrxENSmUST1/M5521YUlOAOFs42vUarhaVZaYTVdTw1YVBH7v8QCcxMQzHJo9K1/VC
	 XKR3m9U9Whs4YGPYYSj5JSSEfJQoKWmqsgCClUPK0crjPB080IXQmPPPvQJavhGkTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVXbaDc8;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB0606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVXbaDc8
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-36e795af1d4so2253212eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816133; x=1795420933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
        b=DVXbaDc8XBP/JgibrQeahOuWJ8zcSrAJjHgtZ1awZIzX79BBEb56eWf6mfho34oEMl
         qfQcTFJn6Pr7LC7Ge8I23zvvcHG7ZYHrl5cVlxv/mAbmXw+ikXIB4SE+p/u9llI+TOPr
         b+/T9CRlHS3xYKHH/1nHYz5Exak+fijotsQWMOnKlbIGf9X2ZcAO8GWG52qf/nz5CRyQ
         Dn2hkK1T1bmuU8BT30nXSQXDzrLs/IpnHOvjQwjKunin8sosiWeeqe7GH8bLV91Aj/Y9
         ncCioZaIFUGRouKcgbkGwe4E58X2iQ325qb9MYyJ0EguxTC5bRorwZYrJkvqUbNgQsTu
         VZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816133; x=1795420933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
        b=FsbgOOCF7zm22pziFmnwIpMEShRW2GBe1SOq5YOZEAa24ClOqeNDHv/PaYxcoX/znl
         HbZufoIGKKmjfGBD9eqk8AytthuXHLMY65QD3QQIVL7qiYVYIeR+vXcWsHDrdmbrrh82
         DFAFwsKysS2/vqG3xuk0sAIY62JguFBAyh507cs/0V4N09zifFzcdOF9rYWJGpcMn6Ub
         LphrYFliqoTT+ux5gr6u/98S6faMq8hESBUSuOvikfzm5uaezKc+5w9qqJk8Px7KjJeT
         dpciwi71QhlwYNfigGmUXbXnGQ6964GV/5qrwppoURGbmt4l/8eUEfsl28LjzUbzEr1b
         1dHg==
X-Forwarded-Encrypted: i=1; AL+hErE8kbCCaDF1nggr7RGSZwS96UgZ0irIOQ6csMsr+3CoDXrdWB8Plt9zPypQuQWCOyfI4/E/YaPhkCVhaTz0tbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YPJsPYypLDu4+TaVn5yFa+C6mb/8hDMN2dd2xmWzUUfshSVQH
	q27IMJZYuK0MZXesEtg5EN77WjrNL1ndEzBdTmsWdrcoWeHdnlvXqp5v
X-Gm-Gg: AYBFou0cOmLzMN2pflWeXQEwLXO9RLwfGLIMWxGATxrW9cGt808lC4gPXan0JTYK3oU
	XbsRdkH/TlHa25+jMDCqmZnQkbKhz0/pCJWxGn9jI1n3U2lfOOCcMXMCarCELTe5kYbz/HQuoL1
	hLIDY6hOeC3uDONSTK0CcKwiDomzpa1J7vwKOB5xhQV4Encv1bozNQUaoPpkkxRYt2z/C5Cm+2Y
	aG3wLpJqd8wPEAfAR332iJqAkA/ETnzW8JlU1g9uynwhOriXgYy/NBd+IDJPZp9gD88LH1xNaXH
	CtJqk1W7PQp43PhZobDJ/+/IdpZftrGEpjtKw9BczDpUwde3/5A4z+QlcGCYpHmyJr/NRUJPXtv
	RvAR6tVZL4+rK2BivszfHYxvHtPGYDJ3mDH0JFiJxMG62e1eSQecbraIpw3gXFjH+E6DsISaIwJ
	qgvhBXSXWeMX9i7kremUNSD2IyCCknzF+HU/nV0L815zypQshPcip50fFRyePBh4j9sk/msAXFh
	yCVqwJzPsvRBSXmhmYLd/RwIXD7trHFJj2kwvM3ufaoxT8z70E4PzMV+kyoqhCyy2dBhW2TbFl7
	e0PrXisZK+PijS3MfJUs+sMDXsBfslcKyz51WNbcXe5KC2jxG49pShACoQSmdUh+7NjWH5wSiCB
	7iKtba2quNQmgQFZqkwm0BNL/Jy/VcXKPyLRUpg==
X-Received: by 2002:a05:7301:182e:b0:367:a092:3c73 with SMTP id 5a478bee46e88-377e1016111mr11133410eec.12.1794816132853;
        Mon, 16 Nov 2026 00:02:12 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:12 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v3 0/2] Fix unaligned enum values in btf_dump
Date: Mon, 16 Nov 2026 08:01:49 +0000
Message-ID: <20261116080151.44860-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size, which shifts a
__u64 by 64. Patch 1 copies unaligned enum data into an aligned buffer
instead, as btf_dump_int_data() does. Patch 2 adds the tests Alexei
posted in the v1 review.

Changes in v3:
- Do the alignment check before the size check (David).

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v2: https://lore.kernel.org/bpf/20261115084923.53182-1-dennylin0707@gmail.com/
v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (2):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                          | 13 ++++---------
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 10 deletions(-)


base-commit: 8835113107b2cf75df33a71e265cdeec5d5d13e0
-- 
2.43.0

