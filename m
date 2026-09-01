Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55259488755
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283577; cv=none; b=KuG8o+85m9Sz5maG+j0ycyWN/R1RYQhQj0X7vsJPLiEkpm90+JFaQV0H9ER8hi+zRznYvbA0UM1uvsd3PH/HKamfwaubNwZQtoYvKxv9KODOu3IUgpR9FfLAg9aNPzbhNSsY9jnz7kMGZpAQpUxCFlvEpcqBf/uthd6WFtdsYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283577; c=relaxed/simple;
	bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb/8PVF29XL52XGKdR/XK0FM0EZYMyHyqGlguzXsP+CbrtvRmJRTikZe8941HTPLvcMrK7neycoipBfbjx+NSDrL4rudy4AuNSXMeC1rpVjbRVPABR4vDJWymvkWnoCSVxm0iX7kraWr1rkSV7zyVSaiftHuR7cN0Od7OGNAO6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayImy4gS; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayImy4gS"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso125724a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788283576; x=1788888376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
        b=ayImy4gS60tAKn5zDNGMxB+uyyQEGmwPuhuIAnQOGhfpEcUjaeo7HWUgxbfk4C9nwO
         o2KYNKwkNuaIJ8L+mlhY7QgIhBGbFGeM05x10FZk4zuENKjyNuzHBg9Ko2hnaMN8w2Lc
         7H/ny9b/CJ2SL4PLdlYTt+4UzxYrKovuO+FmqN0MovQR+slyE9GDUzdLxEYHlo6/cCVQ
         Vhr51RbMH9BBbrTIjNK8amAARvfvp0wpHldLP8nm8yJ7apEOmEvgUaV/hytNsTkqmHXl
         VzgelCIraNrKPpSwV4uPxv0nsvqS0AcP3PctfzCgyyGHxDGxyhWgxyNPmFKlmg/3N6Ch
         mBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283576; x=1788888376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
        b=DjDnzbavx9mEIISjZK/1g2rVMFcSzyY7uSZaTt8YxT/IGaO0lx0Tx8bCmRvKp75RtV
         cpb91v+EQTinW8OFidYw8TUXPaSuSpB7G94RviBrBipow8llWrwGfq9w546v6HeMj2nF
         TJa491LS+4WAAAHEVMqipCANIkSTUrnhWOFjHJsAI6WdqhSh4TysjDZEqnsx8GBoubTG
         aUs1jhYdW/yd5Xuy4NxIti8LsVDdmXdzE2lPRN2AepvLMswsJITU65BlVE0RHoyN1C3U
         2uKtYS3JLVIHxs5I1ZvKUymGoxvusPaGJm0xW5pbHjEKtoaJEAxZrK/7o+WdzUk0+wEg
         0WHA==
X-Forwarded-Encrypted: i=1; AKwUvBzCWu+/LGTktbJAu+hekh8IabdhBhrLt9DgbIMIWHJhxmZq1fcp7Y5FwzJm1M5JXaA8PNBX/O4HIgQxCH7XR8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mIIuWRMK53LnmiRFwJcNqKKGXss3+Oeity11HOgf3kGWJuFl4J
	4l+cOarjFUcl6GmkJ4nwaxkAmcMNkm8o+g6M77QpWnJpsGOGiSupS1Bv
X-Gm-Gg: AYBFou1/2aMmTS2cAFuCXW6EEDfWZKmQyCFgKMrqxR+qAxLzLkmgBM7JNXrpstMhTsF
	7/2ShU9cau2OpKNxlsGVpcbMIJ6+C33LaqeiZQJWdbi8Tiq+XCPIkxNmV0gl8bDTfMq37Aco54m
	bzVZ4u0xM1e6OcRA8+00HL2zM8L4egD4sZFpL0VsowT/cBCh1+rUxhonFkNfTcdqb3YveuVkmtn
	2Ce9wxXllaCipiSz3BoXBmkEXZHLGb/YtOipd/txdpaLgAY0/5lqKXdg8ytldvEM7ATCI82cmLi
	ziW520MnCKMrZnw1o2E2pUS7xeVvmKExizaycRdfG8EYjbT7XZG/G6G61lEm0gxfzUbAMhdx77H
	uVIvgw0wsAk9UdoHHbfzJuwOO0jb1eRVOEnEuQSw1tsOgSTFsZzdg2DFpGtxVLrihvNwlj+zQ/v
	RKjsZO0ec/5xnsSRu2qna8kof57zEQ0Qvs4voNfK1eGHxEIiuuQCL85MTrQ+A71ItTO+0oxnVuG
	6YXRuaeq1/e0pQFKkpD4RRhRkR6vsAR+4FIkXe4tv5idZE+jiW525N94RZiFgObtPU=
X-Received: by 2002:a17:90b:4a02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39907ab0960mr12275784a91.2.1788283575571;
        Tue, 01 Sep 2026 10:26:15 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:246e:2cba:1e3e:e617])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea0b459sm158262c88.5.2026.09.01.10.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:26:15 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: horms@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v4 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Tue,  1 Sep 2026 22:55:24 +0530
Message-Id: <20260901172524.39650-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731095635.GG51943@horms.kernel.org>
References: <20260727164056.106203-1-hemendranaik@gmail.com> <20260727164056.106203-2-hemendranaik@gmail.com> <20260731095635.GG51943@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Simon,

Thanks for the review and for the Sashiko pointer. We have been through
all six findings and are working on v5. For each item below, a short note
on what was raised, then what we plan to do:

(1) [High] Filter attachment and TC_ACT_CONSUMED — Sashiko noted that
adding cl_ops with .tcf_block would let users attach tc filters to fq_pie
for the first time, but fq_pie_classify() has no TC_ACT_CONSUMED case
(risk of double-free if an action like ct consumes the skb).

We will remove .tcf_block, .bind_tcf, and .unbind_tcf from cl_ops.
We only need walk/dump for tc -s class show; filter attach to fq_pie
should stay disabled as before v1.

(2) [Medium] tc_fq_pie_xstats layout — Sashiko asked whether appending
type/class fields after the nine qdisc counters breaks userspace, compared
to fq_codel's type-first union layout.

We plan no struct change. fq_pie already shipped a flat 36-byte struct;
we will keep appending after those counters so old tc binaries keep
working. Class stats still need the matching iproute2 update.

(3) [Low] Empty tc_fq_pie_xqd_stats placeholder — Sashiko flagged the
empty placeholder struct and unused union arm in pkt_sched.h.

We will remove the placeholder and the union; class_stats will be a
direct member.

(4) [Low] Class handle at flows 65536 — Sashiko noted that with
flows_cnt == 65536, fq_pie_dump_class() uses TC_H_MIN(cl) and the last
flow's handle wraps to minor 0 in userspace.

We will cap flows at 65535 in fq_pie_change() and update selftest 83be
to expect flows 65536 to fail.

(5) [Medium] Selftest case 83c0 — Sashiko noted v4 used matchCount 0
with no traffic, so the test passes even without class ops and never
checks per-flow stats output.

We will rewrite 83c0 with real traffic (TBF + fq_pie, ping on $DUMMY)
and matchCount 1 on tc -s class show (prob/delay/deficit).

(6) [Low] tools/ UAPI mirror — Sashiko noted patch 3/3 also touched
tools/include/uapi/linux/pkt_sched.h, but that copy is already stale in
layout; comment-only edits there do not help.

We will drop the tools/include hunk from patch 3/3 and touch only
include/uapi/linux/pkt_sched.h there.

We will post v5 with these changes once ready.

Thanks,
Hemendra
