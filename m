Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46834A791
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756416; cv=none; b=DSorF3/SjScoK52M95SoI6GlB0xKWMt0V455/7xtGYUHFFluYwBc0mQ+0CdqgTMaX/z8BfgZTBCiMjQwjgEB4I391CQwTiTlTkbuWYLWLHPbuHxf9BFlOZXP+qKPlCajDGNHx6k3N+lOf76DO1WT1wishDEQNHifB/s/eEOVF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756416; c=relaxed/simple;
	bh=6p6f+df7snFRvPwjOFv6KgfQzHYAQCGkqU2mMZozh8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5IYc/zsbuyif2tgTsl3b8vmB4P1r2UXo0NSRCDDeH/vxa/e9jPu7odBaq3MARpEkyb7BEyaLVYjxjRt5hsyCLZ6/qVWBqDsG5CPqdm72VaPSeGUl94woFNMsD9tIHkZYoRMFDYP/pOqzRUT6Phr2p4LkYxImpFrOOHy5c5tzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPcRYs0j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPcRYs0j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d58efc7356so38869795ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756415; x=1789361215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igwbwoIkm59vj4ArfYtMkHGEc2L+jTWh6hxW3NeB46o=;
        b=EPcRYs0jmy1DiFWPpHzhxGGDukqApEn75U15wXRo2Ds9Rgbb/RJVvr25gRmEmrVNpJ
         wLpAdzb707URL3dI0VbLqvZRDWieNlrQxIQntAE02QaxJAmn9+/MQGRAS95mODfW2h4p
         sMsYlkwd5cEq/6jlZQ7C127nxNqEUSue+KEuyOQ3hkAwcgpDhoEEoJhEkyXVyMWeDJUw
         D+I1e3N7wEnAhXmxFRA90o0DP2kzirfJNHKYS2nujJ6BhbEbaRWKavl27C5Bb/ID3uwI
         nmR15L+Z/oBs+jwyYorWKSnp++euNCt9acmt9S4xdPun5A8hgesdYsQLMRjODpcmtLsB
         biAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756415; x=1789361215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igwbwoIkm59vj4ArfYtMkHGEc2L+jTWh6hxW3NeB46o=;
        b=glCaBv4nPy2GtmWmojMTbwoJrszPtaUwR/gwCTEYtsBQF7dsYTm8pevbMMoZr+JHzr
         AX6q5Vj0+9ksyZ4nbLGolwSyBfSvKqxtTekPkuJMTd3ZHQU3mDtr6YCdVD24Jc9OCMvz
         Y/0wMhvgFtOKMLM7bfOnJeCgXuUlwh/BX9VUgJPnenc8cnfLGeUXDX6oFNkcUIQym3lJ
         ipPjDUJhSdKvJGWeJ1LkBThcXY7MXAmU71s3ftn40tyrwHWAb9kdZNA2J13kp4mXrUis
         BmXv+hLnR2PS1gV43Wqt2fdU88t4JtjBMQpzlTGkpeVz3JJVSG4S4MtIn6px4qx4/na5
         rRzw==
X-Forwarded-Encrypted: i=1; AKwUvBw0zSxPxIehMH9pYJlmqCxPZqSWtgUjFsSPaYvMPVOGIZaKnm1Azzw+2mV4E0RyDgVUEQinXotsTT7DrOZy92I=@vger.kernel.org
X-Gm-Message-State: AFuF++k7bJ3JFE9uSsA6gIZqxHzZXsKsJXLaLuGEmx1lUWwo0yBWllUf
	BPGkPM9odpse+RWjk8JIu/lBlk20k1TCRhMkdDoslfKupRmYhEuiqYx7
X-Gm-Gg: AYBFou0jPpMsdFmDWYi6CO1rflACYtJRiWPqC1SvyZyB9vfOHUVzzSWd2HdKHAUjtHE
	UJkFwFO9naNOD0XhzC4LVuBin/8UyC5KtV6ai8RWmhR/XKJZkM3gTgkN0oeyx4gMDemuxUIhcqT
	4BnoR5XGMjuY10GFSLxySdBoJyXM2ad5gfqU4NcmcdlzHJDW8vQHkgc/dN9F5BsdkP/mYcnBx8D
	J5sstPEtmvprEI9DT2LSIOFxkv9TCz4kmWNK4wjthBQI1ITZQoTY5q/M0yOl/q2TXLp9WZ3xfCH
	8tscMpDWyHceIzBMyTQ+sMR8p0hWxT9CMwlUySLlPKQ4IfSwzpF6o4Ao1hiRWTspjB2TJ9SYJyC
	MFMaM2YqzfjYZ2cOw5LfJsvrXm4wMAYqLVDzJTF+04lRmfbdJ3AkopJrr2C0/U85WAimvRVzz5Z
	6bfjdBQJGNswQQ2GRfepPNf/hS6NpRxy1fX9XqllKkjTaFS4/pLWKwlwx/jtngZzupFOxnHogjf
	/JJBj/g4da6OIttpqAu0QFl
X-Received: by 2002:a17:903:284:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2db125ca396mr284219835ad.5.1788756414805;
        Sun, 06 Sep 2026 21:46:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:46:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 2/6] net: broadcom: fix repeated word 'will' in comment
Date: Mon,  7 Sep 2026 10:16:31 +0530
Message-ID: <20260907044635.7141-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'will', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index a2050083048b..28ea4a33f245 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -280,7 +280,7 @@ enum {
  * (db_msg_sz 1 << 7 * cid + 0x40 DPM offset) it can come up with a valid number
  * We must avoid coming up with cid 8 for iscsi since according to this method
  * the designated UIO cid will come out 0 and it has a special handling for that
- * case which doesn't suit us. Therefore will will cieling to closes cid which
+ * case which doesn't suit us. Therefore will cieling to closes cid which
  * has least signigifcant nibble 8 and if it is 8 we will move forward to 0x18.
  */
 
