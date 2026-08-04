Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900993D0932
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812370; cv=none; b=jJGN5AqARBNl1gw9BYLw7qPBqKHLdF7aTv1SJ0n3qbhuhfFFoaXfmBsnX69L5GQBAIhAYSLkL25/Y0wsvrC0d7A56KfhPAhnaKZusmGJkQAQMuOyQgnOYvQB+JhpBkLuD9FAAMh3rbjHsF8yYf/mmPF+2odOHG19btSOPEKaUug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812370; c=relaxed/simple;
	bh=Mdp4dHp9ElITnJAkU5a96KDXLwBwbM8y6FoOZ41QR4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQe9mtmQQIoBVU7b+W9MzH+7TCtFfm082fKiLIC7wZ8ngoLOSpIVJtz26RQds1EyTxWHFFWBYdyxFbnhqmJDtLukocw5wOBzPbX12DRG8HjdkXmoLvDLdCuby9hmDamIyhFglVEe6sD0iy2HdF7Iw3qTE/r0Gzsi4gSti+xh4eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1pbkyGS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1pbkyGS"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3280514a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 19:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812369; x=1786417169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEfsGt9zPkqCVw+2RikdWiSpY/gxVUvhARG2RcmaJAA=;
        b=i1pbkyGSLT6STFxwXLR9X1SzuHhHEz1A1f/+wDPJuzBzl3tNVAe4BUr5dqJ2qV73+/
         CbE5OvqtrmRgrGpT1qBUn8nnCzaZvFX2ojBffAk5vhEL3Dzu3uu3quWLzcBueA1LBXlc
         /drLcGsfdOpycxb6RX893Cwf/7wZdmDnwZmfoQMyV5sQGeKxs9QqGJjAbTNH91a4Iql6
         jtnz+EJuSqdm9wReKDGEDEYw5R2TEeXfXPz9T29TtaVF4H28JZxJ8aQaIb5QeaLkft2L
         iDaeeuFwnozaawLLzYUMcXmIzCMd4RQVxif5rgg+tpABnRYt6aiBKdlMvHBqvIyHHLPu
         Z5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812369; x=1786417169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEfsGt9zPkqCVw+2RikdWiSpY/gxVUvhARG2RcmaJAA=;
        b=VuqJlXzMBJg1CvnE+FiOPinp6uIAjP9q51v81HEfscJqeNvywQwf41cEMWwbUHsFxZ
         IF2NPx+h7oCLW7afrpmleppXwQ00XZ6fNjK2f7SEoRyztT50k6H/65sCDNbHAWTLDC8N
         W0Z2c2+OhMteKfNPVo4shlH9i3WibHwfF+mlfM2NyNepv1BOaGpwFPeiJf5KCVFdd6w7
         vUPTmipLJ2qLPR+pnEwW+Yy78rupcgLeQMHs4PlpWmGl8rtiivd4XfaPE42C6qzRxVJA
         OEjiOL7jNTbGjthlqK02KYtaKDlrPIQjOJd6+6c5XMSD+g4TgBJ/MQvNKGo5tuv/1wKS
         I/dQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro912icLG0FAvPu8EHeSV+qxe3uDyOlxLplkh+BYCno9JLF04wOVxCD73aayYIpbzptq8f/n4eCZY/lXvXmwXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CrjF/7VKbtAOdeUwH1wRaL9Xcs20wwn/OuQOmqfkNcnI+16N
	5V0gEB72aKTJ+VfhbVRjwCSHrFXtogKtkEcvzw8y8JdXr1EpeFPXOo23
X-Gm-Gg: AR+sD12xHyreeCxBAidSbZ3GGVTEgGz8Qld5nul47Nm9ZJ9Dh8/MXMWFQi/tIDeiunn
	S+yxEMjqtcX6MZ/KJ0uVQVKRUmWNnVtWiUoOcXCKKYFCYTtzOTrQuTN0ZJDJeFNAXPoiOvWmeOm
	n0QMUSlI8CRTKPBRe31M2wIJoH+Wcxy7DhvKKO8bnC65gs0IBcpEWAPHcMJ9Q2ZDDxuM1h26jx4
	NVU1IE5hophA9V2n4sKVeRss1gM6OzCBSgbqnWM+GqjqU7vlOsxLSUExgclgZAg3GQghuCtLCm6
	+qt4vpDCEgPxm/Mtu0gsQI0/lyyRDvIpQtEG13ufP92iFf7zGsxabNwoVwfindXewg/7Ln8DVbG
	umKHpXJxb0ft/qk2WJZs3dC3UAz5rjuWI+pqxKpmSpKaAzcf1huCrM8Ex07GiE7dQgNbafTSBRK
	4cJds8c2U4KWwEXIU07TspaqQQT44yPNPkTQraaQV9QnHPl8E/0Pn2u+ox3tJF2lXMxQ==
X-Received: by 2002:a05:6a21:3390:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c92a57baf2mr11133346637.30.1785812368880;
        Mon, 03 Aug 2026 19:59:28 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm35974758c88.8.2026.08.03.19.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:59:28 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v2 0/4] net: selftests: adjustments to ipv6_flowlabel_mgr
Date: Mon,  3 Aug 2026 23:59:06 -0300
Message-ID: <20260804025910.50145-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipv6_flowlabel_mgr test file was lacking coverage for the IPV6_FL_A_RENEW
action, and the IPV6_FL_F_REMOTE and IPV6_FL_F_REFLECT flags. The first
three patches from this set aim to add a proper test case for each.

The fourth patch proposes the adoption of "kselftest_harness.h" helpers,
improving code readability and conforming to the implementation of the most
recent selftests.

---
v2:
- Apply missing scripts/checkpath.pl fixes and other formatting
  enhancements
- Add new basic IPV6_FL_A_RENEW tests
- Put label after IPV6_FL_F_REMOTE test, freeing the value for a
  subsequent test
- Delegate flowlabel_consistency configuration to wrapper sh script
  instead of doing it on the main test code
- Skip IPV6_FL_F_REFLECT tests if flowlabel_consistency is set,
  instead of failing the test or attempting to change it
- Compare resulting error for failure assertions
v1:
- https://lore.kernel.org/all/20260727043516.93101-1-marcelospe@proton.me/

Marcelo Mendes Spessoto Junior (4):
  selftests: net: test IPV6_FL_A_RENEW
  selftests: net: test IPV6_FL_F_REMOTE
  selftests: net: test IPV6_FL_F_REFLECT
  selftests: net: adopt harness for flow label mgr

 tools/testing/selftests/net/ipv6_flowlabel.sh |   3 +-
 .../selftests/net/ipv6_flowlabel_mgr.c        | 504 +++++++++++++-----
 2 files changed, 387 insertions(+), 120 deletions(-)

-- 
2.55.0

