Return-Path: <SRS0=0NEm=3X=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75406C35247
	for <linux-kselftest@archiver.kernel.org>; Mon,  3 Feb 2020 23:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46EF520732
	for <linux-kselftest@archiver.kernel.org>; Mon,  3 Feb 2020 23:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PaZqVy3m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgBCXJ1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 3 Feb 2020 18:09:27 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:37452 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgBCXJS (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 3 Feb 2020 18:09:18 -0500
Received: by mail-pf1-f202.google.com with SMTP id x10so10271051pfn.4
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Feb 2020 15:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xl3tRCmUg9jAOtg3vbIi0aqmSxX/oTR7vaT6w//vy0o=;
        b=PaZqVy3m4rRoeYHHiMgnmO1X9LwxYioJlrNTA2svqHK3hggJWYYvBA2MEeaFhf2KVy
         5M+xCl2G5eH8vcm3GcKXUqyewxqVrV4gi93BhUegaQhtPnPRZIiXZfDiNxnYm+B9HfCu
         2yh7HmUwERA28LMmG7wDFzUkMRuNZzrK8OlMHR/CLeqCm7hlvE2/yrMuFGYDDeb9VanP
         xVJ1Ts5xwFXU4agYgO2nocbjenLFEsEurFlcz/MWzFplIWT6QJz1VSv3m0NowHglNymJ
         9phvS4l+TLdRDuMXHoEKuuniTmtfIkweuh5zbgHAey03inGXaQsSSTXC1adRs1670O1i
         W/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xl3tRCmUg9jAOtg3vbIi0aqmSxX/oTR7vaT6w//vy0o=;
        b=XAXqZ0SWTMqBJNcvKhgcbYv2gXquzbeIo2FrMuUljDTr3uS8QfhoPKeeAGW6z1ewhK
         70/bcb4eSB3JC6aSxRfKmuigHTrAI7+Y7fXmhJVyrjnFVfmD7doHXQ9gFsJQFd7lZm4S
         537rOxOfyjmy+BBwkwEUTsDF0bmkNxIJEUW5Vq31Q/FDC1ERlXxpKHe+tVbnCMCdvhfO
         iSrDXe3E3/VXy/5cYiQMLWXXUSJiUJ8RnpBJ+EjsNFFukhgbJzMAUOm/06RzFT1SUU6p
         IAP3/G8o66qYaa126VvBRt/CVQOsuhYBLgV2/7hlXXT5ps+22/TzIg0PliTvPHdNrUJ6
         lTzQ==
X-Gm-Message-State: APjAAAWNZe0Ghcl3VB6w+Z8irLHkzGvSCD9YJxGyTf1lZ/dAYnZ5WGjc
        F0t3QOjbGVrBMEg5KFlq9tpPqAkcabJL
X-Google-Smtp-Source: APXvYqyWlUjXcJEzuDtebyMcW/5VXbpWItEPNtkEANzEhxDbZ/L228ZficS0209NBH9onSObxOq8XT0lzWXX
X-Received: by 2002:a63:2a06:: with SMTP id q6mr26394796pgq.92.1580771358048;
 Mon, 03 Feb 2020 15:09:18 -0800 (PST)
Date:   Mon,  3 Feb 2020 15:09:10 -0800
In-Reply-To: <20200203230911.39755-1-bgardon@google.com>
Message-Id: <20200203230911.39755-2-bgardon@google.com>
Mime-Version: 1.0
References: <20200203230911.39755-1-bgardon@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH 2/3] kvm: mmu: Separate generating and setting mmio ptes
From:   Ben Gardon <bgardon@google.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Separate the functions for generating MMIO page table entries from the
function that inserts them into the paging structure. This refactoring
will facilitate changes to the MMU sychronization model to use atomic
compare / exchanges (which are not guaranteed to succeed) instead of a
monolithic MMU lock.

No functional change expected.

Tested by running kvm-unit-tests on an Intel Haswell machine. This
commit introduced no new failures.

This commit can be viewed in Gerrit at:
	https://linux-review.googlesource.com/c/virt/kvm/kvm/+/2359

Signed-off-by: Ben Gardon <bgardon@google.com>
Reviewed-by: Oliver Upton <oupton@google.com>
Reviewed-by: Peter Shier <pshier@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9c593dec49bf..b81010d0edae1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -451,9 +451,9 @@ static u64 get_mmio_spte_generation(u64 spte)
 	return gen;
 }
 
-static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
-			   unsigned int access)
+static u64 make_mmio_spte(struct kvm_vcpu *vcpu, u64 gfn, unsigned int access)
 {
+
 	u64 gen = kvm_vcpu_memslots(vcpu)->generation & MMIO_SPTE_GEN_MASK;
 	u64 mask = generation_mmio_spte_mask(gen);
 	u64 gpa = gfn << PAGE_SHIFT;
@@ -464,6 +464,17 @@ static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
 	mask |= (gpa & shadow_nonpresent_or_rsvd_mask)
 		<< shadow_nonpresent_or_rsvd_mask_len;
 
+	return mask;
+}
+
+static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
+			   unsigned int access)
+{
+	u64 mask = make_mmio_spte(vcpu, gfn, access);
+	unsigned int gen = get_mmio_spte_generation(mask);
+
+	access = mask & ACC_ALL;
+
 	trace_mark_mmio_spte(sptep, gfn, access, gen);
 	mmu_spte_set(sptep, mask);
 }
-- 
2.25.0.341.g760bfbb309-goog

