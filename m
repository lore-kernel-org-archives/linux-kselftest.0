Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762E3F9281
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417458; cv=none; b=KmS71ZX02xljqTketHDGN/dPclBedngtiTU+gLKi7o2OAI+cqrwRh4NDparLjb/XrCKc3SXOsT0BqjnQxF8pKjwtdxkyYFUVK/Yp4i9dIvb+hCKa4v+TlqIkpLGFMrHU8csX440xO6MVwTodRiflgheTxy7i6whpKHjDmDPdv2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417458; c=relaxed/simple;
	bh=MMDykQzy7x7p66o0iMs9Sx0TXt7mVPc64bBKVA3boHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2ufEZowvjfkKV3gsO8oRjrYr3Q8EMuprVeQv/o7qnzLSYI0Qv2vLHSuua7sIXrNJy64LFqG3Dm6WBsiMR+xEFA2mihSr3vXanTvohvcgU1DrtnttFep19wC+SB+YgAqDhk7U/fFEg+URf5DzTSPs4OsvSEbAzxBfZkBMQ3FhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N2vfOasd; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N2vfOasd"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so3334512a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417456; x=1790022256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=FiW7eUtEnDkfeyEG6AfuLcR35u6cakzSkHau2giSz0DqYOoJNN+5QzzSCSnhC4/auN
         0VVnVuc+N97xbInX7PTMnRuZldEtxLXkoVxoV/vWL75Pn56hOO3c/Y4RHghqyJ3tD0LY
         uz+pdLxErO5bL3aLcMroPtMRRNv2wtUHE5f+1rFmiZn4ujpWrNk0icT+Tmtd7LqXlWcV
         suhMuc6/lvKtRM5j1KSLnKVkHi2+j9JKkYnr0pBZCY4PLGXSHOqS/dNRH8ki88OlPBhe
         DZ1IE9/TFYGS0/81XiUUSxsZ2QffeaRr5IAP0mZRq1M+mBhfuJQsq8Mqz/F0BFL0M1Zj
         d1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+aEMr5PHSfLXHbhkkF8tYLO8qpEOM9/Lf2QV7upeP/CZaL13ADKGWndTI2f9Q9CE7MXyjWNPIrNeaUnp51xM=@vger.kernel.org
X-Gm-Message-State: AFuF++kqtRj7pskEctHpVUNQvZtz1SVJgak+2mbZDdXe2nFoAUM1herA
	x7nSB5lkgsG0pCs9Rs74mDr5eJp3xzjJNhxixpW6+SfS0DeD3Y3RBzoZBEmsZZ3B2ezIJpGNHa6
	7/LQSxSbJKUCX+X1AB2c5ki9phgMYRxDf4mz3DP71pBfjIVIoBQEZelbnZdG3gShYJTgDK+N5ti
	PKfIfD+MvfZalnzR4x26/nPZ5TYWlvp1zDhD5iVk2XcZYKog/eQpAUX8uHI7IfwaxpyNYMQVu/h
	86dWhRqkMLngDrCHVgjcp8o+Q==
X-Gm-Gg: AYBFou1c3T25bnmPoTvUS47dC0p/CL5QnPr+K7b+6OE/Cz/LRu0snI7qwJ9aUDmVoLF
	dQU0wkktCq3tR/wH1nMuF/CCtxH7vOxuBdiCG7gYooyFb2zqEpJVQorEGpa1dec+2kevBm1Ls8E
	eYPm8NdHoX2xLeF2h3cu//6ltvwsLKIFsAKp3CZHmVvXJDRmkaV/Priu2ph744cVgBfD4ZdvAnp
	FqZtkrj147LjLWTs4ZuB+0rqGhm8RKvLr+alYNcXcXw0xLhi76n3ye4sFYfSCCJT79b8u9hfhV6
	ROoihz3eWKCX/8PQvSW53P1eFR1fHxHhRjDywDJ8xbrAlOdV2I67wA6Px9WCBNRAMU2Sjy87OMW
	HCrVWWy3XoMvO1kxvg20e5n4LQdiWTw+jXVc+1WC+77pAf+DFtepryIL8dpQXUa5Ld+FM/Vkkg+
	3Ut0yoqGk1dIPgFJlJacunFzVSpTgXDdgfrLbt2A==
X-Received: by 2002:a17:90b:498c:b0:39b:57c6:e280 with SMTP id 98e67ed59e1d1-39debf9af56mr8311691a91.7.1789417455830;
        Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfde93c92sm290447a91.5.2026.09.14.13.24.15
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80139a2495aso6680792a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417454; x=1790022254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=N2vfOasd4ydiiXseUAyfMvu+f2SOD+azwX8jQMco300eQf3Gqz2YWgHVTnft5iE/ib
         Y3DGvARLnLXKkfhf0GigdijG61I1/Y5RxQ/rNOuT/9owto0Cg+FBftqSURHGFqd8Kddp
         Y0oOHyR4dDfV78GLVcDrkLdgOk3VFC/KEVX38=
X-Forwarded-Encrypted: i=1; AKwUvBzm3Nnwnx7jx4hgysExgQpbuYbL9NPW4nF4p2G4/oo2u2WCQc1mCp+zV3goI56ostKipawsU6prw4RvQSvKgIg=@vger.kernel.org
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393522eaf.17.1789417454611;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393506eaf.17.1789417454184;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 1/4] misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer sharing
Date: Mon, 14 Sep 2026 13:22:06 -0700
Message-ID: <137107b03a5e76ec39a0a7f453db892044ccb108.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add VMCI_VMWZC_DST_RID to the reserved hypervisor datagram resource id
  enum and bump VMCI_RESOURCE_MAX accordingly

The hypervisor-side zero-copy buffer sharing service occupies its own
resource id in the hypervisor datagram namespace. Reserve a name for it
alongside the existing entries rather than leaving callers to open-code the
number, following the procedure described in that enum's own comment: the
set of resource ids available in the hypervisor is fixed and statically
known, and a new caller extends it by incrementing the maximum.

VMCI_RESOURCE_MAX has no in-tree users, so the bump does not affect
existing code. The new entry likewise has no in-tree user until the
vmw_zerocopy driver, added later in this series, references it.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 include/linux/vmw_vmci_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index 60c9eacd2cf3..4435d2ff1241 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -179,7 +179,8 @@ enum {
 	VMCI_UNITY_PBRPC_REGISTER = 14,
 	VMCI_RPC_PRIVILEGED = 15,
 	VMCI_RPC_UNPRIVILEGED = 16,
-	VMCI_RESOURCE_MAX = 17,
+	VMCI_VMWZC_DST_RID = 17,
+	VMCI_RESOURCE_MAX = 18,
 };
 
 /*
-- 
2.52.0

