Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048215;
	b=W1xD3QOnp1Gfvx6r7OhFyMOsxXmAmdqz/IM1m/lKnqk4X66A0gbv5DRSENLhX6T+PFoI
	 ZiLq6pVJ1qPhhUfh5gdPCfIZpI+Y/3vOroen6WZPl5+1eMoWR6birDbruS7hXUVEMU79/
	 ml9C/XwLYP7nS78tQ472zTtyqTeyZJ9DFD4tHpBFECkpKiyr6OBCht4Rs8SikRZoiIkBA
	 GbvSEplcimQXfot1uQm6TLaTgt5YQinpPHZjWGZvxwVej8pHSC2ItupuXXLcgP4kfbAup
	 snsgrQa0j1tjN9fqQ4bRAmNYu/mRgIEspMUpNSm7TUf7JL4AToW6Kf9DRu29fceGxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
	b=Dc459bIBJn5Q6evIv073uCwZ0C5PuLnIwMo/KUvDfR8FdEkMStTb0K66t8HvT2ybZvWT
	 55bkIl0dE7H0xzz6HgyeQBCOqi/cx7GaClMX3ViHGEPjIpF0ciJp53cHvL/z/aPYJhTH5
	 WGyvk8KBUXWdeA9l/F9gBVana8472Dvg7+cvzcObqEi+/qAdGNvh/Y6Jn3xlaJlhyoVK4
	 UODNfhkK5emjQe9hCf13Hs7MmBBUJ8xMJatE5BcWVrucY0CHOQ0phlt7RHAKZDJY9hx3a
	 hkE3rJ/IvZlfHNqeIFKLSC8W6fD3YmRnfd2NVUnzG4/xpcaZV83L5CLBI72pgpOzxVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UG3Eh/SQ";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126760A2607
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5126760A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG3Eh/SQ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50686daf9cso40439566b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048214; x=1795653014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=UG3Eh/SQUGCBKdVHe8THw0oF1joQ0Y2EbkldtFzyon8Ud1qfZ0vF/2rOG1imp6Qfoi
         3nsJXuyQpPY6pzvC1NxI6mC/O/aTjVMnen4tckd1G1//jAAaTMzyh1dg+48lNNgoxZ7m
         rTcMET2GtgASluuAmA24qN0JrCrcQ9A0gVze2pVC3lofr5fe7ha+OqUh/nBnpR1DOvXz
         9nanKjn7kn8z1Z7eFpcAirXsfjLAyftZCmJHa/zHCjnQwfmYBhiCXcj/LPAcuXFA2zx8
         tmXPC6sqQKl6MbKwMOs0bNaWEd5ysoAkI/KUs5I/lgvxDF4bnA2JXCLz3KAaNb36nEvH
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048214; x=1795653014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=dkpoX9g41p7xTA4llSDZojLtHVtGfOE8xt72fBlrp/GjxI9shS1NPn7VMsZgKBszeT
         QJLt70OmwhAxTP0cc2Szd1hC6/oMrfapKhBBXaUGesh0McCF3lwzfSkAfasoxi6h0a9j
         b4ELdnHlHgG9SudBEAiwzD/5GLNIxNapD9Rf82Gz+eZcZ/vYRlDNJOkvq+6mhl/Fec4t
         gcq0AYLQq+Tq1gTGn1Ev9sFtBr01TUwIiF1BbAzXNPVXyljBhZqGQ+XuoFSX7j3AWzo0
         fwI3IS1uNQHGByVyXealrLRzZr/6UrBeRLlSR/9opt1AZgPAQiFjvzD3qnJrOdZmf0wV
         SVYg==
X-Forwarded-Encrypted: i=1; AL+hErHe5a/149AWB3VcYSYMWRKc+znZFcpmNQ4pYgoQPoJkGcagRCAk/EuRjTGwuHDV92Nv/lTvrnlkc1v4NPt3CJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//GIxJys47LEsTcENNG1SW6PkVxGghXzYrVCD/dHeJYFZmMFUB
	AJA1kWs4d1asClpjlw3bLNZBsQWZNj1Qfjm2pY+6wpbPf2F8i1UQ11gR
X-Gm-Gg: AYBFou3s83t8U0CTNH530+wSsgS9c5tl70nVd9dG8E/pNja1+JYzWB3VtDDnxe6rT7v
	oC2ngLbt7LphAh/RjbH5aMMcMi883VLCLmWUStvvkE51siiSimwmgIYcExvr5UqLdxHUEGKCqnM
	/h1b/aiP49RxZAwgDzcpaM2qyBl0ZLDo0W7XkgueULEJHgSqHbZvSj4Qiyt1dR6LWp6qvTLSWD0
	lgonsoaXU+rnonB28szCexL4N0vao1upoaLaoL8HCStDCjtJrNmBC9jfrI0DMP+6FARWhw3WooI
	I53JYGMM6osvO3H8g9m/rcBhW9KRNWWjbltsX1kQqDoGYr8nJYAMAmeQ198IP19aeZI8EJHBJCd
	fnXjjbtNtVdSpRQiv6htb2pErpFcXzhzc30++WELC4bkZgRGuOO41byHMftwpCc743hHZaIdwWU
	iXlAqG3qwAbuhmFlqt8VbzbYZrVEijvKUnaTfIlAbcq0NzrLCEvC9ZGgsaUMSMfLt8x85Ex1X3X
	l5iqUdmpHFBtdzNUtDlRCtXTQmz3AVCW8UYcslnC2U7QDeXLzIxaHGOrTY/6jYDobp7UwH8u4eU
	RCfoteRyhMmu0OKwxeVimdtuQ2yK5/o4OlVsPPZh96Lgr02ayhIHUA==
X-Received: by 2002:aa7:d152:0:b0:6b8:7d2e:838 with SMTP id 4fb4d7f45d1cf-6b887c69449mr3774897a12.1.1795048213632;
        Wed, 18 Nov 2026 16:30:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:12 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Thu, 19 Nov 2026 01:29:59 +0100
Message-ID: <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 3 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

Changes v3 -> v4:
- Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
  lines within 80 columns (thanks Tianyi for the review).
- Add patch 3 deriving the invalid tx value from the kernel maximum.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status
  selftests: net: veth: derive invalid-tx test value from kernel max

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

