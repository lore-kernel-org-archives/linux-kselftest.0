Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327271;
	b=DEXEAIu4leDCe6/93xPF2mWnAQGmISL9fk28U69LLDgq0/dC0M9lFXVTguvUccIqKlZr
	 fRc5rdfwP3lzuczWsbYn6gfGYoTGIO7/XI1I1dzyS2hOAqBW/cT8Njzttntsa6C7MvXEU
	 7Co7c4Ldx61omJ9Eujzlt+c3FsAs3aqqIK7FvJ8mpgBIfHO2s6DXk1KoYN+czQ3BMOQmQ
	 l9huLQRJlP05VlsKD0+D33c5k70BBlPquWR3c20nZadmt/DQrzEmXPBRWJN7xHEULdpWK
	 a4I2pUAKQqnw+1Sb+oUYKGgsgLrzjViOoQIoP0ueXBj1VR6cvvA43am584rASFnmd4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e25FFx/VLY9F8YuTS9P6G9MrlhtdZ/ItqJ/kjUZtCXA=;
	b=dpPVi/Xd9CgRQiBRZxfb3eluaEliGJrrRg6a8m0yo9lJP8hUEFMioNAjyQj1+w6rweuz
	 DR95cwC5yZV5P8LB51FW7xpHB4YThFMBRFPAloYkrLhA7I5QYosKQL/2YmJd/uD/GA1W6
	 ASHZrAL8bXMuVdUVOmHWh5AyVSifS+x2HQS+UtEoEGEL3Q9wSeky9hEgQ6mtJPS3sSO1T
	 GT4Z+5Wy3VtgHKh0lFi/Uo0EfEpYCr6JldY4XH69Bfnj3xGTjbwbBciVgSVDHZtrytrWD
	 6nlw6gBGcXwUm0fDME9Uj2MplPqljzjU+VVK5dfjyDWla1rezLDWS4/H9W+q/s2V6Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiQ+0au2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DA60A2608
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027DA60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiQ+0au2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ae34ad9bb6so2488475e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327269; x=1794932069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e25FFx/VLY9F8YuTS9P6G9MrlhtdZ/ItqJ/kjUZtCXA=;
        b=LiQ+0au2fs2AIYPO+t0gImjc29SqZKC3KSmiSxIxXFAkNaE9g6FBmYxZHplOSsvdnm
         68B2t+fVzRayt41s78HAW3sdj6z92DwiDP19/EpDNsh+piKfg+/b8is9DD5Zb/hkxnfV
         jo/ewZ5DuOeBBlDmxkGbHn7HtIoFIMtOQMn2z31V1sJL1n6d0bqf7S0A39KLnV+IdKbg
         VKvNXuhPuPfctkuX+UhverVPrndgILqwhT7GCDLtd6vsxQlBIHIO66VN6uSrpQzyFRkS
         vPFCpjMIpJCoPUXXG6dC3ux5v1HcmOTWtpcMrQXxDVzUOaosJQ18XMld9WW+z3e1fC8q
         maUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327269; x=1794932069;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e25FFx/VLY9F8YuTS9P6G9MrlhtdZ/ItqJ/kjUZtCXA=;
        b=xLvwa/hvIuAQ5p8ZFgzX3J9swPGnnGnptjy6pv/gUEbwnhQf2VhWdKKldwOOxDRYJQ
         3F7RyQAk3E7W/b6vCqvpnkjgp/p/sEjwGbCFJHLRID7H0KNDd4RC4GM4S2ucJyW0efyX
         VcPJHg9r4iqPgi1zjFjfn3NQtjOK29ZWEkWnVtktEbfkAktxUH021vzr8IHwrm/YaTKV
         Joh+s2wkVlbGEfHPjjXJVZpfzdB+QHJhTDRpvi3P7M+6j8GphUeuUL1TYOjZwAGw4otG
         AtvrL/5nuUZOS26CwOnhPv4YjA1ITXpgWC3FYa46bqcnD8d7FEEeLb3znU1IX4f6h24G
         W9HQ==
X-Forwarded-Encrypted: i=1; AL+hErG5sOCu1vXzBLhN9Mw3ZnTAV7WifGA57Ypwxxrgi19fV2itVntXRE9mpH5FChyPbDrw13hsCHv2r3J7bSF7mmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BiHPOvwiMr080381kqbN78T3odkCRV8r4LKcN36whhNAPY6rD
	KPJLQPV++df3o6DcaIhdxVudAWZhzAvBPtOhiz4bcRdIvOVjigx88h0F
X-Gm-Gg: AYBFou0s0Y5AXvkkcqgf2dHUXFpssrP4DHYW05ipT7FPeJIhvIAfLuxXh4eLs3mgySg
	xh3UjiXr6n+7qVj2IpfydGKwV1al8H89Taf1wceBn4pc7VPXygRXZNBxSXdv3NNJ0ivxi/zCG3v
	701zzRVz/u8YLW7QWUzduDcUhU5/ng8zneBPMksV/aQguHltHHEUxSidWxh8rJ1nPW0pRZ5Bg0P
	WDGEmRP+U3a6RFCU5xaT8hQGva7plbEU9vKdfT7eyCVpG0Usr5lNDIeg/RrzHtx2VDGBj4+ISo5
	phifWqLWUySmpMNLK6ys3b/J9AwearmkPSUagIsFSsHniS4FqaSkgWoBtCQJzjXv4dfSdV6Rs5S
	us+9oIu2T7CG0SLY9Z/g3sQXZPdT5WN1+1Pj09nV/fcW/5g/UhzU/yGPWiqjBIEIKz4Fo+UZLwX
	UZo2TYgC7Jrwmi5LQVz3QCrt5uq5wW6nD4ZQHtLrDcGVn6xY7jDHfWHo4S5o+rIwXLUSw3ZZnvf
	1JosYyDNS6ZEBy/g7SMAlsfo5AkzTppi72h1yfv0mLzqbgU9cpdnCrFJXpDDcy3z5XB0sBarV8S
	oD6dKSC9mieSU28Tj9sIHSXoIRZId0N1rNlIXgaC46MW8FM931HOly6Rag5a2f+nrrrOLmUEcHb
	aLWDAosMpL03jLeq0sw==
X-Received: by 2002:a05:600c:6085:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ba02320c8dmr51972045e9.1.1794327268945;
        Tue, 10 Nov 2026 08:14:28 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46825525e9.2.2026.11.10.08.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:14:28 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net v2 0/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Tue, 10 Nov 2026 19:14:21 +0300
Message-ID: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit

ring_reconfig.py assumes that a device which supports ring parameters
also supports changing its channels. Drivers without a get_channels op,
such as e1000e, return -EOPNOTSUPP for the channel query, and drivers
with get_channels but no set_channels, such as vmxnet3 and r8169,
return it for every channel change. The resulting NlError makes the
tests fail instead of skipping them.

On a ThinkPad T480 with an I219-V (e1000e) "ethtool -g" works while
"ethtool -l" returns "Operation not supported", and running the test
functions through the in-tree YNL library against the device shows
the three failures.

Patch 1 skips channels() on such devices and lets ringparam() continue
without the optional channel reduction, patch 2 skips
reconfig_tx_stall(). Only EOPNOTSUPP is handled; any other error still
fails, and restores are only dropped when nothing was changed. The
patches are split because the affected code came from two different
commits.

Testing: there is no remote endpoint for the T480, so the full test
was not run. With v1, the test functions were run against the real
device under ksft_run with a stub environment and all ethtool set
requests blocked: before the series all three fail, after it two are
skipped and the channel helper returns after the query. v2 was not
run on hardware; its new code is only reached after a successful
channel query, which never happens on e1000e. Drivers with
get_channels but no set_channels were not available; that part, and
devices which support changing channels, were checked against an
emulated ethtool family (unsupported query or change, other errors,
drivers rejecting only some layouts, failing restores) to check that
other errors still fail, restores still run after a change, and
behaviour with channel support is unchanged. pylint and ruff report
nothing new. Not tested: the full test with NETIF and a remote
endpoint, and the rest of ringparam() on e1000e (see the note in
patch 1 about ring size clamping).

I found this while looking for kernel tests I could validate on my
ThinkPad T480. I investigated and validated the issue on that
hardware, defined the scope of the fix, reviewed and refined the
implementation, and extended the regression tests used to validate
it.

This work was AI-assisted: OpenAI Codex helped with the initial
source analysis, and Claude Code drafted the implementation,
changelogs and test tooling. I take responsibility for the submitted
changes.

Changes in v2:
- patch 1: also handle -EOPNOTSUPP from the channel change in
  _configure_min_ring_cnt(), for drivers with get_channels but no
  set_channels (reported by the Sashiko review of v1)
- patch 1: skip channels() when every channel layout it tries is
  rejected with -EOPNOTSUPP, dropping the restore of the unchanged
  counts
- patch 2: skip reconfig_tx_stall() when enabling a second combined
  channel is rejected with -EOPNOTSUPP, dropping the restore for it
v1: https://lore.kernel.org/all/20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com/

Bilal Yazıcıoğlu (2):
  selftests: drv-net: ring_reconfig: handle devices without channel
    config
  selftests: drv-net: ring_reconfig: skip tx stall test without channel
    config

 .../selftests/drivers/net/ring_reconfig.py    | 65 ++++++++++++++++---
 1 file changed, 57 insertions(+), 8 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.56.0

