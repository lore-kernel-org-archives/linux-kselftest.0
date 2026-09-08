Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE4038330E
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846714; cv=none; b=Tw0S47llbzVD9L8leNyVHYbxzMaYt0VgwGjZsEplha6qUkBdNnH96/CAr8wFwmTJiiEDhrS+AFIJMMJ7zo9boAGDZWJYsYqBUYdlq9iMIVSxRt/rfIc11RquC7kVS9AWNFKISH1fL3hMWCAQ8rYwvrxUy00RhFqgLTIyfEOFHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846714; c=relaxed/simple;
	bh=o3eeGsX+yszXtSqzF2DLz1DisqDubEqdKzbb+20VdL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBGrWh1zneq1mDdfvokVGPGGDQH8fhdtQ01wV7ukfy+iFnARj2D2PUQiw9ANlW5pOUa/WQCixwii5MElFPwh7QHNoHhy5TzvoN0OMDyeU0Yp/r2LKPakwmRJ71CDRpZRh3+dNm7hU67LzOMm9QgSq4l2EYBrqI92GujcvNOj6Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myf7IeX/; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myf7IeX/"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2791288a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846711; x=1789451511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eU2hqSZpbBss3ZrupUP6xipFsBQw4quqy4F00JT4x5Q=;
        b=myf7IeX/+05Y3Tn1izrcmERgQS8Vfx6CVF6FW3ngqTaIdFSiIdG16WmihxH0YLjCCX
         Gy5ceEaTSeNICeWToDHgXky4GkNV/P+0GHiJCu2v0PokfndhnE5qBcPjE4jcEIVVwkgv
         CAj9wlbIlc/uweyvXM+mZOx2mdYUbxWVbfBiUnZn+AprpUtRpjXLMT3QUUCtxs8OCfKe
         NzBtJmRAvJNrra8/hQ4X7VAz2+FTlXAzjgbFC7oiYBui0VffFPqUpQuOCuTSaBtLBG9q
         IY27exNrhER6cm0kNq6kana4Uqp5MOkgL8AQtzg7Ffj7J0gT5TkbeET83r+hXzwwH/kb
         UeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846711; x=1789451511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eU2hqSZpbBss3ZrupUP6xipFsBQw4quqy4F00JT4x5Q=;
        b=JBWI3UYxxqrKBClvE04WyQ6kidf0O+Nm3uruaqDaJVau2tMhbuW9KJy7x7eUHI1roE
         Fu6699tUD6XDpcTnSJ6uu1qOeEoYSxiBpVQ1NnsSYNVXf7dDbQjZ0y6CfuedRsVfbDyS
         reg0D03IUOgZjFeWiCsvf0Iqv9zUybmiJ/P4VcTUJm/G/z7SitJsm5jfrwBfZaSTUxMR
         XyZrd3lrINzTIUvb7TMyrB1ORtjZCBR4QzJ62PVAEvZsoxjUiMcg0PgRHw7xs+0IpvIZ
         7PXg366+NKOXgOnJmRHOw7qbxl2o/q8SqLO6sVmnRiiV3IKVOYz2geRncxPyMDxV4RCd
         CvsQ==
X-Forwarded-Encrypted: i=1; AKwUvBywIhlCwVblAEx3JWNP6tvZ5DzbJDlo24kmwfWOPWS+HWh5+gs7StpGznXLkzBZ9Zu0z9PQGATn4vZOjAiXHDg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOuqUoMrfH7xOGI6dPXL/dvaMjILkSPf55kiwZ+vZJh26ZMLb+
	XCmLeO7B1rJIIE8s+TfQgWwE1AlVJRzDaKWYpZVVgwzPl3LzdC+X2j7T
X-Gm-Gg: AYBFou23tlZOswoIJqqU9MgXOVJL1MOC4wpGcK2ZeuM2oDkCBVA8tNAId07pqeslicl
	mDGnKwPO7LbMnhB6dpnZ8G4ez9l3OSChenKX02ZMTYOF2pcW58qFhJl+sHrtWUlv0iDWDyfJrVc
	JnmJL80wUaQqSytfIy7DJsSDZ9q1lD5/GvEfYQBZ7uFIaKx3LsSR/RvasLlXYnNFktaFh9o2pwh
	I1OXbm5D7qVCQApRDHYB3B3fGSxlO4xG1UtMNWeHFF/g6YNHp3fZJ73+S6U98BZjPyib1wQXpSt
	JU+VP8ey/h28pNlSrqky08ypUigsnt/AFIs9nde/6WCY7wl51hj+62ceAc/O4dF7OYWloMok/5h
	LLM8iQE7YtgHCjQuih8VSTFJ+huhHLsFp+jUmBBe9FyT87fMkMSXdr3tNjn9SpKnSvgXByyn852
	yhp3a6aCZbFIYnPDxrNE2/mSTLWI/r7L0RlGhBnLsuLPXIBxcnTNRjrwYPX3Kq2NNx2c0nDvTiK
	qq/SSnDhfqlMQ==
X-Received: by 2002:a05:6a21:648f:b0:3d1:5c01:e6cc with SMTP id adf61e73a8af0-3da39f7bf83mr40842064637.10.1788846711161;
        Mon, 07 Sep 2026 22:51:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm37719041eec.7.2026.09.07.22.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:51:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc: fix repeated words in comments
Date: Tue,  8 Sep 2026 11:21:33 +0530
Message-ID: <20260908055133.16469-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908055133.16469-1-hemanth.selam@gmail.com>
References: <20260908055133.16469-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/powerpc/kernel/paca.c             | 2 +-
 arch/powerpc/sysdev/xics/xics-common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 0e263b97e016..2e0c5bac250d 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -101,7 +101,7 @@ static void *__init alloc_shared_lppaca(unsigned long size, unsigned long limit,
 /*
  * See asm/lppaca.h for more detail.
  *
- * lppaca structures must must be 1kB in size, L1 cache line aligned,
+ * lppaca structures must be 1kB in size, L1 cache line aligned,
  * and not cross 4kB boundary. A 1kB size and 1kB alignment will satisfy
  * these requirements.
  */
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index c3fa539a9898..c2486b43c5cc 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -384,7 +384,7 @@ int xics_set_irq_type(struct irq_data *d, unsigned int flow_type)
 	 * the corresponding descriptor bits mind you but those will in turn
 	 * affect the resend function when re-enabling an edge interrupt.
 	 *
-	 * Set set the default to edge as explained in map().
+	 * Set the default to edge as explained in map().
 	 */
 	if (flow_type == IRQ_TYPE_DEFAULT || flow_type == IRQ_TYPE_NONE)
 		flow_type = IRQ_TYPE_EDGE_RISING;
-- 
2.48.1

