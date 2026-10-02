Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4B502576
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961060; cv=none; b=Xt7k/Yq8p+x+4Gl2b87PO+kd7e5ltIQ7ktdNNDxDjomeSu/jHjqrP/O3vtD5feRryvfw6T7vHCJVwzEU/6f4Xt37dhkjGb8bnxXeyn2Xh++/Wdoeawo268HuCzqo1lvxGbHfIVIKDVKZcJ37pMONE+UoZ5iRbruOL9yMO6XuCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961060; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3nSodqhk+gQ90vgLumb/SQoah0q1l8ymEVEVlYyKytzKBtrkh6Idx0Wrr0G0gSpjLzvWFsAb9J1jJAXJBVWISSPvUfwpT3ajsUsOd+EBnzcgnoywmUDvxC5BGqaH0GRlUd4mD6ezowRH8+msqhw4dxn3DAZ5ctU0V/DuZJMoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT5MgHF4; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT5MgHF4"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso120529a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961050; x=1791565850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=PT5MgHF4yyEUUQ+6sF7B7UQBFmhWMgpeWvlxpmjhS5yqEywN50roF1rRY+bflK48kp
         7uoFyOQWZk3RRJpObvmHVnDzjkkwFCeAKSyawrdXj4dSbIESpMBR/PkMEw4m7YiQe2Cm
         7bnm01mMLCCRkjMe/2qkkmRJ2XofwwtFbI2Zo2DtOAL1OVPfanUPZ9KWKJ7Y+bP/Fmlg
         qJxCc/bqWmjrPs3Q/v5KIWa1oW0mvS7fpdJUb3SKpw5eFuf1LsXxBNnXulikuWI68E7r
         mv674X7M255u41gG2lp710eyVDqLkb21cuqu3LfBXDZaSFQM05CGMkgu1bCDb4EIkHLU
         p2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961050; x=1791565850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=rXkXpxtKO1sZ9SRg1rhYwtOIYOOfhTwhi7p1bDrlPyIf247tyWEFl3/U7eiWeTLdAE
         az8RzWO1LmbCynqunhAn/e1Rzz50MXjzcIh/aPWL4+3iV/k3s1/2a5oC077Sds+35c9h
         c1g7hiBKVhNVIIiFsHjDKpRSDqFazWqlCZyj9bjN6hVugoVzb4fbWHI3W6xDvY/ElmyG
         heMBK5407+A80zitMsqmGYWGJ790Op+vyPKyEhjJJYbxe2/mbQago/O+Elo8a/8lN2Yv
         UwBNVv2k7bzeZdyzqZPHZU+buoS5ARHpgN4KT0wpxQS1Q5V3XNBT/jJRUxOMHNtM14JW
         H6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwIgZZOR+s3+xB5CGXo34PiNz9MthZFXxSszerVFopcNpErHtHON+0qr7AW6Ysf54CU7E8ALz9cpTLUKFsUcJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFEoYGSRuMPDMO1tuMv83bbXftSWXw6eXI8jjfnFkq4Dqp6Nj2
	I/qlbsYOmntbaPKJNL2hdkA3bT/ITE2jFVV5R6K5eibRGWzs+0joFFPC
X-Gm-Gg: AYBFou0RdlC00PrNwLBq+wyWnkk6Z3acowEZjgvaqRO05vDChgwhy8O9kfwNTsY+g+f
	BaNH0584JucdIR83FFCW+tAjinDkQ5eezUS7iGFzd1reu0t+6NGJlEQhyGsjU56FXdoe+XTIaDo
	WwZCeS30hsYuWjzzP98VG1kPj9FxCT5fW+aiIxfZ9/itpmspfZJaNo2p5CLhYgAZLIVHcmFB3Tt
	clNbyNvWtTuKkzFZOEU+2iJDzJ7P6NMUm4tXabgMjOvnEAimysV74DMyKYSnu9rxHf68DiOsgJV
	1zfBtlcPZfKlOIz64u5DGl9Qz+4IKejjSxPoTVNsHRfl+OVQO3uSmhaGAsbFLo0u/jZxX+2S3Ie
	ASq0fdFHORR9qb6yQmT7SLQMZTZhmzW4YiJpSW6Wkm7M9SJKhQVSV7oQuc/U/8oZcCDta5MTMZI
	0vwKWvRUTYYQsskZ1z6knwsMx9h9W0r/t3QGmCDY14tuTmBkump7r+4thGZfwu50Euna+oHjfz0
	oCFhbvztrRrUI2ANe/39rRettXe
X-Received: by 2002:a17:90b:28c4:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a6cecb5167mr2765857a91.42.1790961050063;
        Fri, 02 Oct 2026 10:10:50 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:49 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Sat,  3 Oct 2026 01:08:42 +0800
Message-ID: <20261002170847.3653663-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fix the kernel-doc header to match the API.

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 4ee02d23abc9..07f5d9ef5a6d 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -293,7 +293,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

