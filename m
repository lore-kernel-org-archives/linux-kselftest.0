Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310255505D5
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876258; cv=none; b=bPQaHDLKTWCCwLXfeIpifU0wW8NikhL5wuZdtQX7kXGHYiMErQawqGIUFOS+pRPlcXSL1hjpjqbSs9elDGsChW1Zh9JZkvpjNR5yBenb2BW52NEdDnfxlhIS9acmRIVfPEUZL/hORea/+KnpuCN6UrV6aDqmhWW5caAG5MtnZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876258; c=relaxed/simple;
	bh=o8OJDUsi1EblG4IemLkpTLGA2t32bXV44ss9aRsOqrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry+Hx6NPnw9us35ow424wAw2K1wjyWDuIeHAyhpmnbBv++EjlKy9zyjJ+2gu9T2EJVE7F5KDzpwmHasIO89ihA8Mh3LrT6xqlmu9v8M6VLoYcOLc+SPVGxWzhfyf5uNdhrIBuqDpdVtO3AM0gG0Mvepwm84/fHk+DUU3/BosPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=EsK1dTB3; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="EsK1dTB3"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 913753F610
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788876236;
	bh=widqTYp4xzFs2TnDgQ6LHpL+FeDKARGSWMUbVfZCj5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=EsK1dTB331kJ0nIWoKytpCmZCJYOzFY9znTHubt/bCDtFJ+E7l4mExKKspnm3pRZy
	 dCYchISt1xgleMUgwnufT9D8Er3c4rido+APkLQRNmr2sHDGfamulyx3FB2o3tD7Za
	 eKnM1iUK8kEuKvqMKwLlIRBZySGQfsEOlzgbG4a5Q2ruhUJWdsiiWFj+GEdxodQMpb
	 wpkcKObGXNRKADKpJZmaAKAGNejXpLEsnx35dP91/2cAO0dkDsntJqmGqj7T33bWAd
	 l30GsHeK5wUwlhRyzjmhuxbVoNiDeEkSWFAFvtX6k6kvMQaIdK/kp8+DiKJmXiJ/UF
	 /eJLIX2OyrfFitzHpThNZSEaCta+I/X5Nmtu+mwZxTsEl9QSsWivaTkrrnG6ivcnXj
	 GqixaMW8kv0aNkAeWwibihEfk4uLRQDJ/V/kx4hFx2DBRJjd5EcD9hOHEEoqOCf7EB
	 hyMr3hGmtdi/ryHSbv2lBWvJPEtZyS7QFlgTDljL4t6mt7TGt2WEmjPotXzECE2zyk
	 hEvlBC7pDJ7EweRMSuwem1K+OUBqD/elV6D0xYVO979WrPboedEBMtDB6nL3lruHuY
	 8TFp2RF8bT3arfw+NFbgdBu/rgURgRxETTeh1VqlqR+UZLpc/fVCpZBz4FVnLcr0j3
	 ZodoeRqxKdB1MpWqvzjTwzJ4=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1c232fa136so591252466b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 07:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876236; x=1789481036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=widqTYp4xzFs2TnDgQ6LHpL+FeDKARGSWMUbVfZCj5g=;
        b=dfIoDPRJspKJ+cHJzGAktzB2ezWN83pzbzVr7XLoTBCOpOGG/hHQxQmDN/wIQvkj73
         ESr6gVldUnmwLCL+bduEKIbltbnOsHxi4dDYCDmlwLcc4sooYySFlW92C81T/TPdyOLi
         TzYPjhzk1MnF4DjhO8zNkxLUvjOm+W0bds3CLmbf6qoUM6a5qVEhnLYGnpdQFo/MCjry
         eXWAWcRjVrh8+j66KGTAnoah2lDwVryv9n2SnBkOb5bna3Nk77HVrwQX/KDqUWHIbeAW
         4J9wkGOqIpV/UA4kLMuah+qCsS3lqUjAb+2JiZwPzDgWJ9mbJBU2Wp9a3uOIQ1sm8zLV
         inLw==
X-Forwarded-Encrypted: i=1; AKwUvBzqimqhR5XqaetfXVCMMwBjZqbYikOSCr5F9oYaZmf8pWHpPrWqP0g54ptsN+c3JT86yKMVTl9gjFB5dtv6Lxo=@vger.kernel.org
X-Gm-Message-State: AFuF++kPcXdThg68WzbsBJm7o8lCOk6R7NeYlL9NTyEf/AcONKK4bkhD
	va5jz3fFUX1lbGtZnbhpWHo2C1kjS3bVPiNBWspjFxUdVHKbnIzZIVp20G1NUAk7pRAsaHmoZcD
	4M0TtqqTuMINMLiAa4IGZcCFt/AoXVdzXuP2b5AUW6coQtvDKaeiYCUugyGj6bJ4nFYB0seP/sW
	qW7NwaINCHcw==
X-Gm-Gg: AYBFou0/www/Et0cf1lQ66wYsNgTqlZDs6e1x/oOrB6y7S216A5P8O4Ghnzvfz94ImD
	/hGNkaMWhnkU2ENV7gaWZPsXlthO7mDor5qEOAKl6qNESzug1uzxtQpRU42Pe39ToFWnNOWzqVa
	bQmf3JPKiA5aN9cnH2pTbpcPx9jkUJWRwcK2PTM1U114jF3jE78MfltPtSMVSXi1CPw/ApsgtO8
	BkQR2DihBxewL4fHxIWoYdS1QYRlI6+sZGnSQRrixAt1+VP7IRoijwrezph7TEMpgJ4/MJBJRTF
	4W36HzqgvrNmUKKyVaogS1xIwU4LiEVZLHBl2/JomnUIxvE/w2dFGC8N6w6Ki7xH5zR0dOsXOq/
	1O8xmnjfNs8M+zM2q8JEZOTZiqJN7HdtHsXOqwAQq8VLR1luOPuUeNH+PLtdYitaOgw==
X-Received: by 2002:a17:907:9288:b0:c25:3e36:acc8 with SMTP id a640c23a62f3a-c25efbe1685mr1400566066b.4.1788876235932;
        Tue, 08 Sep 2026 07:03:55 -0700 (PDT)
X-Received: by 2002:a17:907:9288:b0:c25:3e36:acc8 with SMTP id a640c23a62f3a-c25efbe1685mr1400562466b.4.1788876235454;
        Tue, 08 Sep 2026 07:03:55 -0700 (PDT)
Received: from localhost ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm522959766b.9.2026.09.08.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:03:53 -0700 (PDT)
From: Andrei Gherzan <andrei.gherzan@canonical.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Andrei Gherzan <andrei.gherzan@canonical.com>
Subject: [PATCH net 1/2] netdevsim: print IPsec salt/key in network byte order
Date: Tue,  8 Sep 2026 15:03:24 +0100
Message-ID: <20260908140325.13367-2-andrei.gherzan@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908140325.13367-1-andrei.gherzan@canonical.com>
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nsim_sa.key[] and nsim_sa.salt hold raw key material in network byte
order, but are typed as plain u32 and printed with "%08x" in the
debugfs read handler. This prints host-endian, so output differs
between little- and big-endian hosts for the same key:

  little-endian: salt=0x61626364 key=0x34333231 38373635 32313039 36353433
  big-endian:    salt=0x64636261 key=0x31323334 35363738 39303132 33343536

This breaks selftests/net/rtnetlink.sh's ipsec_offload subtest on
big-endian (e.g. s390x), which hardcodes the little-endian output.

Retype key[]/salt to __be32, matching ipaddr[], and convert with
be32_to_cpu() before printing. Output is now network-order on every
host, independent of endianness.

A similar fix was proposed in 2022 but kept the u32 typing, so sparse
couldn't validate the added ntohl() calls and it stalled in review.
Retyping first avoids that problem. `make C=2` on netdevsim reports
the same zero warnings as before this change.

Selftest update follows in the next patch.

Fixes: 7699353da875 ("netdevsim: add ipsec offload testing")
Reported-by: Kleber Sacilotto de Souza <kleber.souza@canonical.com>
Link: https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@canonical.com/
Signed-off-by: Andrei Gherzan <andrei.gherzan@canonical.com>
---
 drivers/net/netdevsim/ipsec.c     | 10 +++++-----
 drivers/net/netdevsim/netdevsim.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/netdevsim/ipsec.c b/drivers/net/netdevsim/ipsec.c
index 36a1be4923d61..5722837bcda36 100644
--- a/drivers/net/netdevsim/ipsec.c
+++ b/drivers/net/netdevsim/ipsec.c
@@ -50,11 +50,11 @@ static ssize_t nsim_dbg_netdev_ops_read(struct file *filp,
 		p += scnprintf(p, bufsize - (p - buf),
 			       "sa[%i]    spi=0x%08x proto=0x%x salt=0x%08x crypt=%d\n",
 			       i, be32_to_cpu(sap->xs->id.spi),
-			       sap->xs->id.proto, sap->salt, sap->crypt);
+			       sap->xs->id.proto, be32_to_cpu(sap->salt), sap->crypt);
 		p += scnprintf(p, bufsize - (p - buf),
 			       "sa[%i]    key=0x%08x %08x %08x %08x\n",
-			       i, sap->key[0], sap->key[1],
-			       sap->key[2], sap->key[3]);
+			       i, be32_to_cpu(sap->key[0]), be32_to_cpu(sap->key[1]),
+			       be32_to_cpu(sap->key[2]), be32_to_cpu(sap->key[3]));
 	}
 
 	len = simple_read_from_buffer(buffer, count, ppos, buf, p - buf);
@@ -87,7 +87,7 @@ static int nsim_ipsec_find_empty_idx(struct nsim_ipsec *ipsec)
 
 static int nsim_ipsec_parse_proto_keys(struct net_device *dev,
 				       struct xfrm_state *xs,
-				       u32 *mykey, u32 *mysalt)
+				       __be32 *mykey, __be32 *mysalt)
 {
 	const char aes_gcm_name[] = "rfc4106(gcm(aes))";
 	unsigned char *key_data;
@@ -117,7 +117,7 @@ static int nsim_ipsec_parse_proto_keys(struct net_device *dev,
 
 	/* 160 accounts for 16 byte key and 4 byte salt */
 	if (key_len > NSIM_IPSEC_AUTH_BITS) {
-		*mysalt = ((u32 *)key_data)[4];
+		*mysalt = ((__be32 *)key_data)[4];
 	} else if (key_len == NSIM_IPSEC_AUTH_BITS) {
 		*mysalt = 0;
 	} else {
diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index 55aec41237b9b..a82a685384e6d 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -42,8 +42,8 @@
 struct nsim_sa {
 	struct xfrm_state *xs;
 	__be32 ipaddr[4];
-	u32 key[4];
-	u32 salt;
+	__be32 key[4];
+	__be32 salt;
 	bool used;
 	bool crypt;
 	bool rx;
-- 
2.43.0

