Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372B937A85C
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756429; cv=none; b=jpAyoFz35MgOm7IiqcaIQvaCahhV4el2V3xEu2hgkNHHV6kzgf38zN0Pj/uy0QAODmcqquOBTNnJrOe6g3mK3bP34qxHFNzfsrBB2kngENCC1O5EG3AAFI5kLZgK+zf7N6wjnVav2JoZXAZBUCNs/5iLomgZBCpkLkIAETxHSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756429; c=relaxed/simple;
	bh=mqVeKES3pdwH/jh4G6cxAfYNuya+EEG4nxksK9vib+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZjdSNKlwBb/aluERXuQaMCmqmfPmSzI4B5UrJXi6xKa6d2YYUAzWikWCTFjfK7SgH/qYko6bDzfUI82ElvtMJ07/GqYmPaftbThlnr5eyXvBHfjD2WJQZFYWomXD1h53FsEHbSaSsP8cn+29nVfy/ejBldmIeO5AITP5Sn5aoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4EQwyl2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4EQwyl2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-852c481415fso3556561b3a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756425; x=1789361225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd4+o9yzzziUj0BOqr+bTAQcA/BPcK7lKLgCO+CZvsk=;
        b=e4EQwyl2ek36l07R0wCaek/PVeqOKgQzXAhFKXoagVBSXb+vLw39B0G0h6eGzvUid2
         s0N5bwTUy7321QgYqvF2T5ov86/artqphsUUE9Ioe/xUCYjqz8kgdbc8WqdmlZsMYdVx
         4sbOK9MUEt9hTHI9EeUmdDVE+8HLYzGabbPmRt3XLA8k+GXQ5nBgY7a+Qjknc0h80NpA
         zS0o7ZVBg0wERHBjpEhRI5Mc5GZQH1RV9mW7APh9PFKLGrkKwHmdL2/pRHBKajP41Y+b
         IJv0pnPZRHuGmv2rDzlpaA32AGd/fGG4M1eoMv9re8o1+yf0qhsDEqPCWQ9iWi7hX7qc
         io1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756425; x=1789361225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rd4+o9yzzziUj0BOqr+bTAQcA/BPcK7lKLgCO+CZvsk=;
        b=HPjR7Z7U+CPgu1pctsXJSyGvKaO+nhoCIN5rc1v/u7tum5lgSC+rhiiCvdycvIuxWT
         p8NYmOd3ByIiFqxm4nIbSJu3uqYwU8zVlofRmgKrxXVDCOjrMxylZIqZHoJPW39pNIt8
         dIPQMIUSAHWkehYX6Dms7MoX56w8roe9eYtUOzltPLDekCa56PLGiuvQrPLGCPl2I0Pi
         6cnm1L2B1N/41Jf9cMQ9ia/Nw/9KCXDjWkQ+VKmaDxYTlXyamRUKZ24SG+cxW/53Jvml
         EiWRS7W+6CSUZWKNb/pmoqDMpD8VGKKAJtUhZwKG9WdaW+cMQ8uGKUIP0OAZ1DID7aGi
         AnMA==
X-Forwarded-Encrypted: i=1; AKwUvByRTHdeZcaQyclGIjFBgwhP/8W3K61r/2Ht7uWc+nXJiR4n+Ra6PyC7ZcLJbM2m20Zu3FtOVIHEKuu35T8C+Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++lpt/AKaFjYucOu+pLa2mH5Lx7fqCds6ZW69mVxVA4eMYTHFvHJ
	EX6+fNouAYUza2W/jFV+XwwquKXDKhtksefbjk4p+XuBkUVx9k4nc4Wp
X-Gm-Gg: AYBFou1HwiW1Nq0SZtUzY4qk97FhwngBdELS+WH9UgR/+hEDGIrplvUkWQXr0fURcrg
	rMRlzmz4zhwMmkfFGACnQA5b9RKeewqaE+kiLZrfjI5AFyxL5LtU2EGTP3LBSk50N38b4DrbCm2
	EcbCTXRKTWp00oI+dqIa4bLDesUVlECsfJNoXe5/3RJKFB144j6HURLBqGmvh1eD0b0f5geAhmJ
	PAjJzSounBY6D/nivYUYs7+Z9p2N+BfmtiY/ETvJdcZPOXSf/QTtiVXQf95PdngmbbpNXUw0bTZ
	qFxWIM0BlawtfYbFcyELp1MndIMBxgg/EJLbVVPwQ+Lp2Ex1IMvy9HOHhdNwulveZt4uF9gC8ue
	qt8GkcLDTnPgR7CieWh4m+J4/Ccxp4uYOmVCDzPMEaUYZCbzu1cFAhGg8EPKYUqabP0J1BgWGna
	P3ccQl0oas2MyqFLD3n5GG43dnuT4Z3NGgp8CPWBnmRMh8+rNHR95ih5zsxC11a8YUZEXGRF4aD
	cka8TkmFi61Kg==
X-Received: by 2002:a05:6300:6710:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3da3a15bfc3mr32442645637.23.1788756425319;
        Sun, 06 Sep 2026 21:47:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:47:05 -0700 (PDT)
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
Subject: [PATCH v2 4/6] net: sfc: fix repeated word 'the' in comment
Date: Mon,  7 Sep 2026 10:16:33 +0530
Message-ID: <20260907044635.7141-5-hemanth.selam@gmail.com>
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

Drop the repeated "the", reported by scripts/checkpatch.pl.  Only touches
a comment, no code changes.

The bitfield.h hunks from v1 are gone: "the relevant bits filled in in
the range" is correct as it stands, since "filled in" ends the clause and
"in the range" begins the next.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/sfc/mcdi_pcol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h
index b00e7c100566..976a96459075 100644
--- a/drivers/net/ethernet/sfc/mcdi_pcol.h
+++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
@@ -9560,7 +9560,7 @@
  * DMA synchronizaion. Always the last entry in the DMA buffer and set to the
  * same value as GENERATION_START. The host driver must compare the
  * GENERATION_START and GENERATION_END values to verify that the DMA buffer is
- * consistent upon copying the the DMA buffer. If they do not match, it means
+ * consistent upon copying the DMA buffer. If they do not match, it means
  * that new DMA transfer has started while the host driver was copying the DMA
  * buffer. In this case, the host driver must repeat the copy operation.
  */
