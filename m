Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5623AA1A5
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805819; cv=none; b=T1r5WG7LzwCfxiEwZnk9qoxooDLKxrviyXwGWDvfR8c37pjuqjz6EYiMwFZpI09DbAkECDYy0Vrd8ykG4oapFak/SVMy0uJtuaPEsp1UK/kIPFQBlTEv0Qc9D3y8SrJJf9LeliTALH7gVrCIBIsUGtSdpVMRMfRVu6I1gtROHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805819; c=relaxed/simple;
	bh=0OeY0xReBFL8eCyB/FrdWjGk3Mhp+R/qkHPO1eyeEZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAXsNblIPhXxNakhxdLx162EF8bZ0fppBSTXMDiCsvwhrVCMuV/XSsfAPfDhYAF7VLDYkO7lmD6YfVyEAg9INAArADmBhKPLht/2RJ0vVtAdYZIXziUwvqDmGANgPWiXzh04+mm/XWslCJNb5aZfQNPhH/VZCT+yxzTHu4Dxd2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inGOAYTi; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inGOAYTi"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c738fecf349so718405a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805818; x=1773410618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usOL8l/KNsMfxD0BXV4D931Ky3sdKsa4TTa5Fbius5w=;
        b=inGOAYTiu0w+RDHWpGxcxVszoD/K/YwzQok9zuj/mp60hMxZbb57QW9DHATR3j11ga
         r6Y9miONheE85UdyAIH+yCidFPX8lctxyvmg7GeAWBclocK57RzhjLwy7daoLZJTuK0t
         JLP1QYUsMyrXfhJQlUZdvWTgWQ0kLSpwy3qmS/dgdp7QnPGsAjt68Ada80azYANzDRqu
         78oCnMny0jYYDTLp9/JVuQOhkmQ/KVv8SNTjyBPhC3Bs0yBHAAgx2cYzYpyhPB29bEpq
         agbzgWws8qPb6Hk0llYm1i9qebzRd8CWp8K0YWNMzFkQiGtzgZuyJ2pJNx6+MjT6dhwA
         NX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805818; x=1773410618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=usOL8l/KNsMfxD0BXV4D931Ky3sdKsa4TTa5Fbius5w=;
        b=OyeqSEG+MxiT53tMauMlJQYBCbWRuTslXOM+F66oz611NqANE3qxNLMihaeRGSQas5
         wsZAXgOlQZI/oldY9Jxirel5lGG2kO/3Ix/q6G1RvX7bcPfvpbVy9aMp1aPSz+eONapf
         NWtZmmoePFt96ycib751Oe1dr6thMdGofyJi996aK0TjDqARLqvLHWKD0zxhPsS3Iy73
         NLBVxVcD71wOI+FlQWce3dTbqgfSMVaoXyCRIEdiCpG08GSOIw4LInW5a4Crof8Gaih7
         2SyiXuiKnTI0XuSvwVB5uPOto3NHXAh1wtTerWCfBhneQc026fTOo3sz6OVWyJlfrHoF
         mDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8FJ5oyfkuB1/G6Ndm/ar24bOn/vtUueghg3cHPzV/25cq59H5rRfEZbeTwpVE5zGwoHgC5DNwCgdIUAqo8gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4CwaJrJPTZUmlusfIg5P4iuEI20Hb89fOe+C0ipKJs4f68fA
	6FDN6lQ6nHSNkN9pWJDodOzBQl6gRKJnP9ak87P7A0ie8c84EvlRXvLU
X-Gm-Gg: ATEYQzxMoi5OD6bAHOAQA6UMR8Uk1zpzxkNOI9xShgFey2AsAuPe6VTL51vMC4MXtn5
	FbmSgEK2mRO8siHRqK1gJYLD2vMyMv8GGRi+4j4kgVzCyYNAQyIuWoJUOt+R44QkdnnqOUlnssy
	LkkKB0teYhloLrY9fxFaWTSTWl8nmMTi4S44cqeZZz62b1pQ6z6UbLeW5ZRcWBuVI4wQUuzA55O
	r9hYj2EohghLIp/ci1WmlwGJJQv6jwZYyJeK6/s4Bjh8nA9pEOcTaZyqzARMgBUyBt//B6uh915
	K5tl9WKhcFjtyK1sfR6igXk+XE9PB55B1x4kdSSYPEshn7fMWr4AsHO4bYB3OdFz3aE3PbXgPKf
	zlALy44oPRMTAP97LNxDdXfGyJXycuPmKi9yQplB62SNrvgLNxcMfVt7NYD+JTW+vx6+xG6/rDo
	vqbK3MTkBRrs2wMMlMNbO6+jYgeIPAlq5eFgscjmCJQBDVnzUCAoVK5H84/7SseLyjsrwBfYvtJ
	Cg=
X-Received: by 2002:a17:903:3a8b:b0:2ad:da28:8c7a with SMTP id d9443c01a7336-2ae829622bemr21398275ad.8.1772805817813;
        Fri, 06 Mar 2026 06:03:37 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:37 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: [PATCH 2/5] sched_ext: Add comments to scx_bypass() for bypass depth semantics
Date: Fri,  6 Mar 2026 22:03:22 +0800
Message-ID: <20260306140325.2710927-3-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306140325.2710927-1-suzhidao@xiaomi.com>
References: <20260306140325.2710927-1-suzhidao@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

The bypass depth counter (scx_bypass_depth) uses WRITE_ONCE/READ_ONCE
to communicate that it can be observed locklessly from IRQ context, even
though modifications are serialized by bypass_lock. The existing code did
not explain this pattern or the re-queue loop's role in propagating the
bypass state change to all CPUs.

Add inline comments to clarify:
- Why bypass_depth uses WRITE_ONCE/READ_ONCE despite lock protection
- How the dequeue/enqueue cycle propagates bypass state to all per-CPU queues

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 56ff5874af94..053d99c58802 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4229,6 +4229,14 @@ static void scx_bypass(bool bypass)
 	if (bypass) {
 		u32 intv_us;
 
+		/*
+		 * Increment bypass depth. Only the first caller (depth 0->1)
+		 * needs to set up the bypass state; subsequent callers just
+		 * increment the counter and return. The depth counter is
+		 * protected by bypass_lock but READ_ONCE/WRITE_ONCE are used
+		 * to communicate that the value can be observed locklessly
+		 * (e.g., from scx_bypass_lb_timerfn() in softirq context).
+		 */
 		WRITE_ONCE(scx_bypass_depth, scx_bypass_depth + 1);
 		WARN_ON_ONCE(scx_bypass_depth <= 0);
 		if (scx_bypass_depth != 1)
@@ -4263,6 +4271,10 @@ static void scx_bypass(bool bypass)
 	 *
 	 * This function can't trust the scheduler and thus can't use
 	 * cpus_read_lock(). Walk all possible CPUs instead of online.
+	 *
+	 * The dequeue/enqueue cycle forces tasks through the updated code
+	 * paths: in bypass mode, do_enqueue_task() routes to the per-CPU
+	 * bypass DSQ instead of calling ops.enqueue().
 	 */
 	for_each_possible_cpu(cpu) {
 		struct rq *rq = cpu_rq(cpu);
-- 
2.43.0

