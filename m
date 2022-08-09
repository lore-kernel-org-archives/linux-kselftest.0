Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE238C19F2D
	for <linux-kselftest@archiver.kernel.org>; Tue,  9 Aug 2022 04:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiHIEGS (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 9 Aug 2022 00:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiHIEGR (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 9 Aug 2022 00:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EB5AB7E6
        for <linux-kselftest@vger.kernel.org>; Mon,  8 Aug 2022 21:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660017974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZjK0GuZ2alM35iqhgJkEaVdZNKEdFOR/rEWuzOn8N5o=;
        b=IRm72Q3otQ10mZtg+MYqO93C/GgeNSO8iu8VIKaSr6KUJfBWPloTdVUXrGp0RfmwRCT5Ml
        JcuRBGuZwV98LqREb/AonzrW79VV4ORRB4lLms+k2xypKPjW2R7LYeuPM96xbTJpGDQKnN
        akgV23TXCFV7IYiyLxIa7LhrQ7qH2sk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-HpMhBOelPCOEFVO_l6NS2w-1; Tue, 09 Aug 2022 00:06:11 -0400
X-MC-Unique: HpMhBOelPCOEFVO_l6NS2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46DF080391B;
        Tue,  9 Aug 2022 04:06:10 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D19482166B26;
        Tue,  9 Aug 2022 04:06:05 +0000 (UTC)
From:   Gavin Shan <gshan@redhat.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, pbonzini@redhat.com, maz@kernel.org,
        oliver.upton@linux.dev, andrew.jones@linux.dev, seanjc@google.com,
        mathieu.desnoyers@efficios.com, fweimer@redhat.com,
        yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 0/2] kvm/selftests: Two rseq_test fixes
Date:   Tue,  9 Aug 2022 14:06:25 +0800
Message-Id: <20220809060627.115847-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

There are two issues in current rseq_test implementation and the
series intends to fix them:

- From glibc-2.35, rseq information is registered by TLS. It means
  rseq_test is unable to register its own rseq information. PATCH[01]
  fixes the issue by reuse TLS's rseq information if needed.

- sched_getcpu() relies on glibc's implementation and it can simply
  returns the CPU ID cached in the rseq information. In this case,
  it's pointless to compare the return value from sched_getcpu()
  and that fetched from rseq information. PATCH[02] fixes the issue
  by replacing sched_getcpu() with getcpu().

Gavin Shan (2):
  KVM: selftests: Make rseq compatible with glibc-2.35
  KVM: selftests: Use getcpu() instead of sched_getcpu() in rseq_test

 tools/testing/selftests/kvm/rseq_test.c | 62 ++++++++++++++++++-------
 1 file changed, 44 insertions(+), 18 deletions(-)

-- 
2.23.0

