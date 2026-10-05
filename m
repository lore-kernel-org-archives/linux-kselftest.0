Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33D519929
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220692; cv=none; b=c9lwRVaG8ZWvM47BWSaHxuEhS3ArvaQBn0Q4SN7+Qjk88Jv9GoSdffTBEE2vTYClvYvQ+i1yQ3FwWMY7J1+7KD/thvQjdinFYoBirMHHkXVIGYbOPqs8rvTsN/4Zhr4ZaMp1q0dgADR8E/qHZf3tA/I7b515+HaXdvvtq2V6+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220692; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCQdA3i9dpNNb6Kg2YUBgjZyUwIiZW3ZZctRY+MiT3xF6PxSxnSDtC14ka9LJoGFe42Yq6jV1GL2dK1uvqxzfoM13OeuZpYFOmOYAPpoY6qDcxfScqY3+X+zDplO0Nx9CMGM+MM8gihrk258ygU83IJVsHkYTlSaJhkqVaBTXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzdOK2rw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzdOK2rw"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1339159a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220690; x=1791825490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=CzdOK2rw2houwTVvYfMKl3+SKEK/ihH6hDvN1POzG0hHGMmj1V7diGb9/0cCdjin5z
         wQaSvpY27r/WP24Dt9YKJmZYyPaX3kT2PV4xFmcvA9I+o/ASy7ZVytXpErgnJa/pqL4h
         PiHA33DlgPfJ1ug4qhmQ6EftR1lwvbcWC472W0St/HXatjK0iH+ZvJuTQ9kPSpAloE63
         1i2LkGmjv5ZOslybuTrgx6fp9wUhYeGWNQchLtLaiMuNwed7IqSLOVcZGOujP40J3cbC
         Ry/jJZ/3HpRDZU9wtgdnR1b+18cprBnIbJ/BR2WuPbL3mk/IRJace7igt0cDQoZ8eecv
         XCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220690; x=1791825490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=gZx8uTvizCyIqOJOqHq13guvxofKphOFsIPEPG0d+29CZWcjIV1Fz23oCLKpLtbo1V
         pVK/9bXbtPlQygotqwIppsVPNb5CN6V1bsO4k7SC5lKwVILL9drDdEo32j5GBzeEIpzv
         +y7jqwO3WOB5wklYQUWmsWtPo6YidAiIQ5lS9FetKOBEaUQ9LAvmMniBR4sdcN9gIw4o
         wSSuX/5+hLRTjmh0f/VSvao8nQGzx60rHNOF6XPnKo19tE4W7FWQrWKDc4GBS9d5UEoa
         wb0SpF9eiv11l5tcGxxBfBnbJ/1/B/cGMWz/aFFc1m5SP1nhWbP2aZthOI5Zt2hp8C7/
         FgAQ==
X-Forwarded-Encrypted: i=1; AKwUvByN8rFjq2agwl3ULGR7pEo9MRe1oAYmZT5JNlKF0vUkwloa2ADk8AZX+Z8e5/fXS5dzN4U/451HCP6daQunxus=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/XuGYetfcVAes26sHJJ8GRspqaflhr0eG1PpGLAFKctVL/Jdo
	eloHg+s7/m8nHeQLvbuUVt53n7H0mMa0MHsP6Fg2bNC7TVAd3NPO6uqk
X-Gm-Gg: AYBFou2VVVD47DtkE307obcQmPV1UiT6FrAf26wS3Ih7CrZx7O/edYxIejmXuuDSJhc
	7tnMB6S2ypYDcU+scI0ObK7f6eHFKbyDVqL13KkN2K3Bu1Fa2s3bj6Lw3xxeADxvnT9++lRbkfS
	IgWBlAslGOZrvUb1tLD2Xaa9vthbyCDGBpHN7MUn+gDG+0Cpxsqmd4MTbyrPcA2U4nPj3TiSF7P
	CgjB9toJsbjnzY4dDuVPbWeRtWYunaGWLB/Iw+gSm9OTqTxqvyWPFmx6vYdpiT2Co7W0kYWho0j
	j4KhgSyg19ZzpQ6FFIzjSkSzoYl3h9lGwRTHKiix2vaU0HNkLOO8bN9xKerzBEh+fIRIKb8ALi1
	jmpAtjAcwbYSwisNLY6maHChV4lpYN8tscEBDDMVOB+Vw7ZshA4FajIZswqJk9XGoSbrq66AtBd
	N43xxlph9NBM8OP8TZcdAr3kY3LBFZabn7V20PrqaYlUMUDS19ye59KFkSJL9Wf5C+aO+KgnT6k
	9JsHJzyTDsVBnMzz29tOIWYkhWEng==
X-Received: by 2002:a17:90b:3846:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3a6ce996924mr10923539a91.62.1791220689796;
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
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
Subject: [PATCH RFC v3 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Tue,  6 Oct 2026 01:15:24 +0800
Message-ID: <20261005171529.1378809-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
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

