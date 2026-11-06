Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989212;
	b=khUTbHsabIW3v56EwIqiEY5hVYjMm7vlMqeB6//gp85kvFK73QD9aSIWAa/zd+mVPkvV
	 P1yFrA3553tbEMbBV34eAohPMdoKS+nOk/r3Xw+I5icp0nlCYXhnMlZ2xDzf/+fakCq83
	 YbdHdUmcN1tZ1mNIk8aGbtINRWMIQP5tpEeQtC//rT5xZB3eWd1WYw3btKmOvJx4oF7yO
	 bC7gbqlP0QaBzkFsJMku3+vPH4KceDJNXQn44ZyRQ6WFbtyIGW6yxR873QmfoHPP+0C0t
	 w7KTfheSxH0pjCRFIoEiQIEmibW5QZzf6hSdW8UVPJEHjauX1L3b1MnHifPIKMYtH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=71V+AIGlLe9tGQsH861SMnNvz1v73B93HY2pNoIeulM=;
	b=GjhiqD5yRTDyzRzDXwP/d1Rn/Rh/2+KBnHkh2lOmzKaviP0Rh43O2xiAr+wUenL91ODE
	 Dj8svuzsApr/v7XmvkUZbKYKET+zzzI552Fz1bbufvt1x5SuD1k06yNOmnzlcwsyf7PUX
	 X+ZxW99pSj6UVmz/199AHtiCf47zdtKkqw2QJ3yYPQTI2b/FigG+kgu0TpEvRC5U3Mltg
	 UXyrYM3JyfFj3VI4UTX+FnS8M2xFb46WWSS1jArn7cRpjsyR9IfnVpfBjp3OG6/GMmAhR
	 KpxJC+ujMVBpDxF/S2OnJ3vYSifBqljV545yxv87su6u//Rr0ZjH/7RzStBbUNMRmWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o9R8LNPX;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E4606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o9R8LNPX
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so475040a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989211; x=1794594011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71V+AIGlLe9tGQsH861SMnNvz1v73B93HY2pNoIeulM=;
        b=o9R8LNPXDoSkSXW8WPh7f/AW7td6ABkMNhmRoubPFNbzsbnFVhrDENiceq4Xf5oC4s
         ZZAVoa1CLfXOtqOqy3rIxWYPLvuywa5adD5y5xsokdCJGVw74+MkYiacMnBBnhEkl2xF
         QCfz5zH2ByBLXlXp6lzPknqlMs2MuM2SrdAIMT3uG0ySoI0/82T/GLF6fI/DH3LH5Xpd
         Y/EsM8R3aYaEKaysndTpHUQAjWWITShqbY2ccW+Us1u2QUA4voZNRVcCSC/4uGCAcvUB
         ul1+3PFMVhqCNfJmNUficMF5yYVW2MMeJkUVpbzdqr2oBsYap2Tao+4+onELr1pwQ5k9
         SH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989211; x=1794594011;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71V+AIGlLe9tGQsH861SMnNvz1v73B93HY2pNoIeulM=;
        b=YBtR8bk9sKoixY05q/uUCGcNSPPXcGoRuxJskgguvaOj9ANS00YskDr5ACvzwB4cuM
         y4IiOmlxNtPpJx321ikrFN8DVOpu/6OJfzvvIKyccPk4zfL47HGxF+GUffBsdaQ+XGk0
         J0p63iODtZ1wO4+SC3Q77H68bf3+ePSx/oCEe4Tsu/zJ59v/3SAcOCAeEIy4kbVC4rYg
         A5DDqKCfpiiqVEM8JOFuce9rronq10MRiCNeYSpeoYEE4uVOLmZ/c85o1MSD4aT4qk6D
         F+j4ZuRaSXw+2p8xRz3fKuoiB8dfqnOmxbMly8MpLCqae49jEjno341RIdpz7mziyNK+
         r/LQ==
X-Forwarded-Encrypted: i=1; AL+hErGYSQOeDa74zWN+NY28dSJQ3y+dM5uzN5Ms43ubVDEr0HPKqz7ASlFhYLVhIptKNortWtjHbMtBMgvlaMu8rY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z82NE9ixSwW00cX8kqU4TeUTUsJLxcYx6/kdDJlN1fNatow6sdb
	DWmmYpsAmprC33GcaMMCtyBlEkLWEJR0c8WOYgcl1ebMKwNzfI2lJBLHYH7CWIOL7zOMxy07iOk
	/EP5Ycg==
X-Received: from pgq6.prod.google.com ([2002:a63:1046:0:b0:cc7:cad8:ada5])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52cf:b0:3b0:ae41:2706
 with SMTP id 98e67ed59e1d1-3b0db5f60efmr3709018a91.4.1793989210913; Fri, 06
 Nov 2026 10:20:10 -0800 (PST)
Date: Fri,  6 Nov 2026 18:20:05 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106182007.374660-1-weiwan@google.com>
Subject: [PATCH net v3 0/2] net: psp: preserve SKB_EXT_PSP across packet scrubbing
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

When a virtual interface such as netkit is associated with a PSP device
in another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
decapsulated on the physical device lose their SKB_EXT_PSP extension
when scrubbed during redirection (e.g. skb_do_redirect() or
netkit_xmit() calling skb_scrub_packet()). As a result,
__psp_sk_rx_policy_check() rejects incoming PSP-encrypted TCP data
segments at the socket layer.

This gap slipped through the existing psp.py selftests because both
_data_basic_send() and _data_basic_send_netkit_psp_assoc() only sent a
unidirectional data stream from the test socket to psp_responder; the
returning pure TCP ACKs had SKB_EXT_PSP stripped by skb_scrub_packet(),
but were still accepted by __psp_sk_rx_policy_check() while peer_tx was
unset.

Patch 1 (originally from Jakub Sitnicki's BPF skb extension series [1])
introduces skb_ext_scrub() to selectively preserve SKB_EXT_PSP during
skb_scrub_packet().

Patch 2 updates the psp.py selftests to exercise bidirectional PSP data
transfer using psp_responder's "data echo" command in both direct and
netkit dev-assoc test cases.

Changes in v3:
- Patch 1: Move tmp = *pse; after the fast-path early return, just
  before skb_ext_reset(skb).
- Patch 1: Do not clear skb->decrypted if skb_ext_add() fails so
  sk_validate_xmit_skb() still drops socketless decrypted packets on
  egress.
- Patch 2: Replace s.settimeout() in _check_data_echo() with
  non-blocking _recv_careful() and _req_echo() helpers.

Changes in v2:
- Patch 1: Replace the skb_ext_del() loop in skb_ext_scrub() with
  skb_ext_reset() + skb_ext_add() (and a fast path when SKB_EXT_PSP is
  the only extension in the skb_ext buffer) so shared skb_ext buffers
  with refcounted extensions (SKB_EXT_SEC_PATH / SKB_EXT_MCTP) are not
  left half-deleted.
- Patch 1: Make skb_ext_scrub() static in net/core/skbuff.c and drop
  EXPORT_SYMBOL() / public header prototype.

Link: https://lore.kernel.org/netdev/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com/ [1]

Wei Wang (2):
  net: Make PSP skb extension survive packet scrubbing
  selftests/net: psp: test bidirectional data transfer

 net/core/skbuff.c                          | 30 ++++++++++++++++++++--
 tools/testing/selftests/drivers/net/psp.py | 22 ++++++++++++++++
 2 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog

