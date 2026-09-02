Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCE0480946
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350570; cv=none; b=acelvxyS5LvqshbFl0Hfad3ypi+bS0jYTfPB95ilB4zmdRs6fcwJ0BrJLV3X4GzSaX3K76d3+4IkbOQX16SoJZsKuThWNyfcpNLyhLXfmQEQqe56MCCe2JVz8hI1t3LfPb12i8Rn1AJMkGOOzP/Zh4RiHJQmA+rOdhOQWmsylhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350570; c=relaxed/simple;
	bh=m0JjFRX4svUQp6KRJp+je69oUc0P9aiIdfo5Oe4XjWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8MeGxvVZ2repRPtccoLyGyJVnD+FkmJCFQ2GsOqqhgNe5jccwnYKYjiwA9Xkyx8D7fu7Qc50XFLvvOad98Xe25rbRujcF1+UqgGpB+Qw8TOzppJeemzdew60T/+U8/oGZH4YCLo3YYenZx7tQGPyH48hhLbe71BgooLC9njKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlfLTDO6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlfLTDO6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2120869a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350561; x=1788955361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6Md0+LJRDnI+rQO3Uvm4S5xh/BVG8Mf7Z6azFky85k=;
        b=QlfLTDO67GnAgA09KgHd6vVHj7fliwjQQUyglyoEwayG/r08elxySkq1ekNgPwn104
         WnThyK3v1QSVmvvxQncA2DWyIl+u0II8cQQtJzuwu9VY1Utz4DUQcI7MbDqdoO4S3sQO
         Uw2FH0WJ/NKQn0wnYIY0ltAtrZluB9lPkb+4R6pFhCO8zTrgUu8+5yFjN4Qp1ZeOOLuX
         zdY6YLyG9uk6BMBfXs0+EkjbFzUXum/KcHZWbwuqf8ETW0itqwZPm2nbXX9B5Ymq91dH
         nJLSfeuctDorDS3nZ5a9NlWFtSxltVlq2JYlZvGd3+FmgygTIxOGTnmA4NAnMNn5BOSf
         LB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350561; x=1788955361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6Md0+LJRDnI+rQO3Uvm4S5xh/BVG8Mf7Z6azFky85k=;
        b=b3NWCP977Op3bX79U3BzGe1DGxDRl0HRXxNOyU5H2wt+qr3ALZIyTVY1pYjMM9NbB0
         CJ+hORehogtLfqr98pr/HS8oFpf+452LOn5Tf4T6Vaf6vX9n/D44snExAElZbA877Jji
         SKuuP96Q41mHcV8Cr1CH5qgr2Z1SuhwontUIIiRxISURZO7j29FhYjDsjDIOyNt9lFmt
         uSxdvupV/JlGn8dru2YPvx3qf5jeLjxLuHvm5oLM9bWMBaH3fd8ZdIHw3D0gqcj/Vy+I
         SeRCo6CgvDBoucOYEphmnieFCooWQMBXG/Sd1zASSya3joOchX5k2cSJTUqGDhElvTs0
         jg7g==
X-Forwarded-Encrypted: i=1; AKwUvByH4tnbJmc/Uzpyl5eEXprcUuLWdpcuPVGZUhs90gPmFFkt3y615iFkwwdgEUk4aj8d0EJS7dPQWn5XsJbXWXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mCPoEPeAOG+6O/FvFFPpkQfqHMZSwD3l2NB/iqKOxI/oI2uX8K
	/VTX65qa7l99uoDnsECBkZbWKrVtlSPNnfIcAxUzPRoAD8k5FyFbJhmm
X-Gm-Gg: AYBFou0mjaowPn2s94YOqvy0TFrLnd4750qso4zgkaBVPxNzb8RCcaOvjgJW5loOvXt
	KVOL/EgbyNA1M8E5VCz7gbIbXzfVbqXuXuEaCWCYRddOlRaPA3eTvc3CxSv5T3uGvltYxJo5Vgq
	bvTN6pVkDIe76EdnoYowRUTVUqRFanrBplfuzRYhDOiWQ7EviHJpJa9I0NKST2s4HXt0+EWrg2J
	tXnRYyXU0S/1zEJJB7JUVYBwcDbBXFtQ1nZN1UJXqgTpATPKTkRwDF1ey1PDFOVcT1S4IFaq0L8
	WjKE//ug/SWi6sdh1eQFMvuUttz0noTkl6xluzWX39vg8q2lGbY3RviiuYCWMdU6FLs9DhVIJUx
	lmNUr8lLFrzLeoc5tzJ4g2xoF9YdMg0t3wZpKTh7Tf41Ti5Pgj3nF01PTLdNB94hkPNDMEBYA+N
	EX+aLsP0iBWP7ZroCrYxT0/8oeTeDg/kHkgg5dcc96DIxknilYd5zjIBw3D15I02aOyBrz6gJAP
	G3emY9Zacw=
X-Received: by 2002:a17:90b:3c09:b0:398:c0a2:8f8e with SMTP id 98e67ed59e1d1-39af64f9205mr2885148a91.26.1788350560968;
        Wed, 02 Sep 2026 05:02:40 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33e9sm6897044eec.4.2026.09.02.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:02:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] KVM: selftests: Verify sregs and events in sync_regs_test
Date: Wed,  2 Sep 2026 17:32:33 +0530
Message-ID: <20260902120235.18486-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sync_regs_test has never actually checked the sregs and events halves of
the kvm_run sync region.  compare_sregs() and compare_vcpu_events() have
had empty bodies since the test was written, so the checks run after
every KVM_RUN only ever compared the general purpose registers, and the
events half was never written to at all, hence the standing TODO in
set_and_verify_various().

Patch 1 fills in both comparison helpers.  Patch 2 exercises the events
half by masking NMIs through the sync region and verifying KVM applies
it.

To confirm the new checks catch something rather than merely passing,
the same faults were injected before and after the series on an AMD
host:

  fault injected                      before    after
  sregs.cr4 mismatch                  ignored   caught
  sregs.cs.dpl mismatch               ignored   caught
  events.interrupt.shadow mismatch    ignored   caught
  KVM_SYNC_X86_EVENTS left clean      n/a       caught

Every corruption goes unnoticed before the series and is reported after
it, e.g.

  x86/sync_regs_test.c:128: left->cr4 == right->cr4
  Register cr4 values did not match: 0x41221, 0x41220

Unmodified, the test passes 20/20 consecutive runs with the series
applied, each patch builds and passes on its own, and the remaining x86
selftests are unchanged either way (61 passed, 24 skipped, with
set_sregs_test failing identically before and after for unrelated
reasons).

Hemanth Selam (2):
  KVM: selftests: Actually compare sregs and events in sync_regs_test
  KVM: selftests: Verify the events half of the sync regs region

 .../selftests/kvm/x86/sync_regs_test.c        | 100 +++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

-- 
2.43.7

