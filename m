Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725119;
	b=hATG5cznnQ+8mnpVuEIqXwOE00OUZ5oxk6hraZKbb8gQGhkplBVK33JEFFBObg6AQ3v4
	 v5Aya4WqmprsZU1O04jl8qbKMcxcivTzUBcoshEZYE+r3J/ZvaBiLiWRg7E1dYU2pGnEM
	 TwK47rSasCTFJCzLNTtDesV6r4rP1ppXVcJFRv/cS/IDlnHzAt60yuYfcPNbCQ7ZBe3yO
	 qhw1CzBwGca+osMnwNjX4Dra0mYCAJIyaynWkrnwpf88tV27FB+/PpK8hqMLc3vDSxlAI
	 za0Oi6v2/wuwifotr+T2rYR9WfDojAIH6N10o1g3a4RqewTo4GtjImCu+o/d22Q3gow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0pH2zO8Y+wDHFAh0xWZZCbUUbHzL+XO1Q3bpqwy6tnw=;
	b=cX/VIWEDs8gYQkaWtkhvZ/zw3mtPukTXav6d1p0AMAXpUKk46w36vlxCAl7syjSvwa37
	 qN9Rmb6y2uczvy1NJDySxuJkE7bq1yNMaHgFdmKLA2ywow6jcobz7iJ5IrPPddUU4SozO
	 OW9umj5b61Dwu2cNnQk5tQ54bMzVJP+hDGj9Few6a8s1OnkslmP5LzboJQXRRmV6cUYmB
	 Lm/CQYhsQ8B51d17rOytepddAnPrJRvcCaxXDPxco7iA4amp53GecSy323TPsxpmmSLqk
	 LMnOU/ye2mh3k/BZziDrVagOHnqKxdLnAjv/vtJMpgWX5mbpNQv0loNHSuceEsw+OwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvo1BI51;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C3606A332
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 06:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvo1BI51
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49d64a88222so797081f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725117; x=1795329917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pH2zO8Y+wDHFAh0xWZZCbUUbHzL+XO1Q3bpqwy6tnw=;
        b=lvo1BI51xLx+UlUjoKGAS5jKdsWX393laUfFx0CN5qIR9C5RtfGOXgN8DoFGlXdWaN
         z26o3m+NGRNrQAvTu4vuhNZ52S95wWY8Ff/SpxVpnktLYogxh5XQ3It7kJ0vNH5/Qcfa
         QHjRxuUL39fhJRJCMATmL1/ZsV+t4GooJpSH0LMItRc9mDyyNS5PyIy2IpGqJIFLc7z1
         GK5fPA68iArw+V42zpZyWwpdZQa1zGap14CN6n9mfM5Cdq+AXjAOz9zQHwc9Cm2Q5s32
         uAfWs8MkJ400y5lQ5LRSAWzSCG745514AXDAw2QHUA6rUAMzU0Jk0sOd2u6c0oOPcLOb
         LiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725117; x=1795329917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pH2zO8Y+wDHFAh0xWZZCbUUbHzL+XO1Q3bpqwy6tnw=;
        b=MOUNM3cqaNazLuei6D7gDmfYsUgHdH8IE0ykYKohbofBeUfcCvDaFfQ3WSaMTMo6Lz
         Q5mx5H2vCPbLqJIzrsYYoWi0Nd9M/uR+21TdAUi/HzN8QCWiJPCAN46+ldZf8Qa73m2n
         UXj3Xu8XuDTMVqVcZ1TIgb6C4xYcwNj3eCwb4JFvnA2/KbL8TpL4yppB4dAIdpeo71w5
         yT5QIr3y4gNGTl/QgJymCbfxC7t7gz0a0vn68lpQ/pSOQPWDqmVKjzf2ftFWFh3ZJHaK
         NWPO5rMo5EFVMVEAcCm47maCdFDZmmTTkm8Te9kGoMTBC54Vxqsvc89NUr1ehe/bXS7Z
         eQwg==
X-Forwarded-Encrypted: i=1; AL+hErEl3zjYg14XYlyFJPbp9RiSlfti1Sc1Le3Cv5B/rccVG+0W1G/M8TqafxdIosNnm5sQWbNdCNtoI4F0J72F0m4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82jq/hK5Xrn5iMJsEyiQI7IiEH6+tcmLncl0QewNII0BzXLYmF
	f4G3yNd6qyhQ2oUGz3782XiYqN4+WwBZ/IQXypofBXcFr1t4Fq0MeMy/
X-Gm-Gg: AYBFou1jk4Gc9UpM+nZnFfdmafgBlLUNjcCVgioxQmbNKJutsxdyNUJuj3Q4LAB4YIU
	c0zMMB+DAzgvu10QwLUKPKJ9pydO6EfFgmyUzFwZb/HMgywtYdJrit+CboYKPzKHl3130BYdkkn
	tM3MLB3ll9TO/bJD/xGVR+eMpmhFmilBB2Zl5pOoYLQ5Cxes53ZmhX4Prhu+FFwgpohVe531lcy
	pUVOMxZ6c/ztmEwtUX/WdlbbGJNgHNrsk3EMFYkFM/7Bl01C3o0GM/9SXLGQ0f1+SeaYBrELueE
	jSZurnt4kgCM1Gn0weIY35ABT7plRYSRRzzkNl7EF5uUB7J844OWuuPCtMCGm51B+N6GeMqKuhv
	28iNlg1ed1ELoTF69rRPYJUrRVLnoAefDcklwsFbn0nat6AmkG7W7VE3dpzUqG7n+d/3/Rql3hm
	QyfUHdl+aKI6sA9dI0pL57Q9i444hyyAoxpdaNywYJLHPA1OrP4b1SBWVCKLT8/XHeQhqfZsUmH
	OUI3oy98ilJlBuw3zhBXOiqJG8xJXV0qXOhTrnN4QPE7v77VOToYg4c+bWxVoivYpvlammGSZyS
	g8pRa4X2h8hQukOyUqm1IjaPIMiwuP+41BDU
X-Received: by 2002:a05:6000:41d7:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49c70824309mr15696644f8f.20.1794725117343;
        Sat, 14 Nov 2026 22:45:17 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:dc0a:bc51:e26f:5cf8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm14073284f8f.34.2026.11.14.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:45:17 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	houtao1@huawei.com,
	linux-kselftest@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH bpf 1/2] bpf: Clear invalid tail bits when populating a cpumask
Date: Sun, 15 Nov 2026 08:45:11 +0200
Message-ID: <cdb1367b32ba590c822461688e96660b1ce2d035.1794724099.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794724099.git.thnkslprpt@gmail.com>
References: <cover.1794724099.git.thnkslprpt@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_cpumask_populate() uses bitmap_copy(), which copies the full last
word without clearing source bits above nr_cpu_ids. Those bits do not
represent valid CPUs, but cpumask operations that scan a whole word
can still observe them.

With CONFIG_NR_CPUS=64 and four possible CPUs, populating a bitmap
filled with 0xaa makes bpf_cpumask_weight() return 32 instead of 2.

Use bitmap_copy_clear_tail() to mask off the unused bits in the last
copied word.

Fixes: 950ad93df2fc ("bpf: add kfunc for populating cpumask bits")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/bpf/cpumask.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/cpumask.c b/kernel/bpf/cpumask.c
index 1336a4efa755..203f93077a0c 100644
--- a/kernel/bpf/cpumask.c
+++ b/kernel/bpf/cpumask.c
@@ -467,7 +467,7 @@ __bpf_kfunc int bpf_cpumask_populate(struct bpf_cpumask *cpumask, void *src, siz
 		!IS_ALIGNED(source, sizeof(long)))
 		return -EINVAL;
 
-	bitmap_copy(cpumask_bits(&cpumask->cpumask), src, nr_cpu_ids);
+	bitmap_copy_clear_tail(cpumask_bits(&cpumask->cpumask), src, nr_cpu_ids);
 
 	return 0;
 }
-- 
2.43.0

