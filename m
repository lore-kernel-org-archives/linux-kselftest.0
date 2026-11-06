Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977517;
	b=KyFVou4+U2T875PehhhiVJJd8vBObLtUr7TmxJZkK6a+7CRcgKyI8ABa85lRGPQy97lR
	 qXhu/TmwSSSyf7J16PlhWnsoKPO87Q2O58WT6jHJ0N2XNHFa7iSw80PizZ9q+ms/6T8Vr
	 4jH8sbm6dqMSopuoPhHluj4w6th0ztGatd1FWmQG1EKx4UMtvYqcNKqR9QKCBnKTpWYh3
	 EvftIZamHTqeKteo33sT+z/5ydR67bvHrY0e57ksR5Lfn+7Xqw43UoewmI6bvMLAxZDHi
	 Q45gt+4erQKBMCj6N4d1C8qvRQuqqZ7Z/XlkDhaFdl/gAiHePXQGOPtmWe053LIrrmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
	b=ISZrkLkZIiRNHsi9OcqRxXnUhpbS9R+yuSVpoRllLFDBpz4zbr7YgG8Vglvz3N0m8eBg
	 7G+bXOoM/IFVZ71mu8883TBYJB8z31tk6WF4UqTxSx1xoNg6Ghs0sK61dZm0ydeoTmJi9
	 Knb2vFqMGe2+yuwQK/iI4VFRyc3RnyV1TvrDSgJoEQwIAlWMoUum7miayn3H67fPFZ/R3
	 GJmaQVB1BOzzPkMSf7utDXMQAhEhthez3A0in2eaJWqBmg+oV2w+Yr4K4gore4oZERfdg
	 zjG3jxJmwsiR35lDts3mtN12ObBmTlDCkaEFS3pJqJDezw9PkkfTS6V8O9KlM+W+RHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwgv8l4Y;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E5606A32D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 15:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48E5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwgv8l4Y
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso1969605e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977515; x=1794582315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
        b=rwgv8l4YyYaxXg7OKRyBgrec81Wj2XRwnaT2rX8+mqtfax8O3c03Ic+U6aSBpJFY/y
         nEX6ZIKAh8Hy0TtrYwI42iVJNpvaZ2IIV5tUt4HtUnH+sT1wC7AQ0iNp3EAyp3Gmr8GP
         l8YnNTZXAS1lYleXsSzw1Y0s3hmfDNFcfEbZYItGu7ifEmssnowHZydjvWZX0E6QMr4r
         A5F0ujiGz5jePPpCxhU2Si9nuQnGXmtB6kcC8Yof08dPSbjmd3mykchA0YN71qFfuGmn
         PGihV1cs315CtZkT5pUcmSSGN6hc+qN7LbHV3x852jEyiFM9Tm5dBKKa5SgZmjcnFSTg
         VHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977515; x=1794582315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
        b=hutjyfAvhQJKqESDWb6FFPkQG04bhypp1RALFHA2gNjwsHnQnPH8854CDei/rYvjrJ
         fhc18961A61+qEMT4wADNtuEt720TYTWBG5RNay2GgJ6WGfqmwSnlUBcEh1TuKam2SpW
         TW6oYL7WUyt0wwxm75DUFXjoh5Omi0/SXW6HDnFulnRZVfPz8xRAoxTLwRTla0egJuEE
         iNXYFKsW4XofUV8plOqa7nR8cvg0Jz3weYMHmEEfortFdtR3eSimNxl4K2T1EhyTxt2l
         zhgS8GNWyKlPx2wB3bhtaI+8zaBVgql3zKjpfSUuNS7esofu32D36KljtcV1/3a34Ur7
         b38w==
X-Forwarded-Encrypted: i=1; AKwUvByapzfaV2LhpxbrGWdkFsRa1P+u+dxRmDnZpUT4efxz/58jX0jOTWn0solsc6ojWjW+aN0IJwBPkTkTFhS9FDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zttbUmJtbpzW5j4gQcSZqtIgJB1t7wZ+9fRDfu+fBaj8BdT9/
	1Qql8huv7d/+OMIi5ZwkUiiXBRAQfHL4bQTw/ZnnOvWaRhSrRYBsjOYM
X-Gm-Gg: AYBFou0Xvcyw8B3398jnvC8jnlpDVWHHwnc2NLCUWjb4xf1w28gIwn4/n6TjBSLJNvb
	19TPV1KLjwy3l8m+xw7wkeawR8OXSfcnr836b3kr5mepd4bMllX1qaYNdsd+r03wTXGZYAUHYVG
	+AD9EykMYIuFDEDH6R5U9VfFYN8EfW9gXARLc9jzVqUVizcICGwnfSAT0P72uSNeNiBqAg/NCFp
	MEedkvbfXj9aMZYMcPUhYy+hmUlfxdk8rICSw0wrHJSq7Rvo+MjXxjf4PHWxngo2qpv+JY1LM1o
	6O8vh/IkLe/wZHQgjSDhRW0pZG+KA8hxwfCxKNJdAGG8JNzmgjLwHoCQpZCWg18epOxZB2LFNcc
	hOUPBssqj479u2uQlQa0JWI8ow3QI2g586SsZ1LRS9uWqBjSL/vJ9Zo+reWA5gNH8/f3Hghez83
	rZs5Gvr3TB6waTXyKK/SZRCW5pBRe8Xftry5I1wrf9RIbkWwdFTVAX0NVEcI/JrZoT3YSAFvih4
	k/LDnb0d1eveMkZGXUQzHbaPY6/WMHi26YCrC3/8Bnb/bOt7GEuOSh3/inmJogruLgIy0wO4te/
	0iGyi0/bR7rXUVS6e2mDNYh+dvvx8qDc0CqJaastej/FU9RsxnjeFDs3kobj9sZsUUo+ov8/
X-Received: by 2002:a05:600c:c111:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4b6dcf861ebmr36412065e9.1.1793977514681;
        Fri, 06 Nov 2026 07:05:14 -0800 (PST)
Received: from localhost.localdomain ([193.255.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm260950305e9.2.2026.11.06.07.05.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 07:05:14 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	hmohsin@meta.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net 0/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Fri,  6 Nov 2026 18:05:07 +0300
Message-ID: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
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
also supports the ethtool channel query. Drivers without a
get_channels op, such as e1000e, return -EOPNOTSUPP for it, and the
resulting NlError makes all three tests fail.

On a ThinkPad T480 with an I219-V (e1000e) "ethtool -g" works while
"ethtool -l" returns "Operation not supported", and running the test
functions through the in-tree YNL library against the device shows
the three failures.

Patch 1 skips channels() and lets ringparam() continue without the
optional channel reduction, patch 2 skips reconfig_tx_stall(). Only
EOPNOTSUPP is handled; any other error still fails. The patches are
split because the affected code came from two different commits.

Testing: there is no remote endpoint for the T480, so the full test
was not run. The test functions were run against the real device
under ksft_run with a stub environment and all ethtool set requests
blocked: before the series all three fail, after it two are skipped
and the channel helper returns after the query. They were also run
against an emulated ethtool family (unsupported channels, other
errors, devices with combined or separate rx/tx channels, failing
channel set and restore) to check that other errors still fail and
that behaviour with channel support is unchanged. pylint and ruff
report nothing new. Not tested: the full test with NETIF and a remote
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

Bilal Yazıcıoğlu (2):
  selftests: drv-net: ring_reconfig: handle devices without channel
    config
  selftests: drv-net: ring_reconfig: skip tx stall test without channel
    config

 .../selftests/drivers/net/ring_reconfig.py    | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.56.0

