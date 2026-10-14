Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957C5650E2
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003630; cv=none; b=daRv/Rwp3rj08Y3n4s6ApDx8TlF8XeE06uza93MBJ32spFZy0RKA8oVfpvMfhkqueopXOT36AglXn/wBTYhFwmhOGVFXRhM8/myMCGbOtDr4uIfjlgAHdzkjyx7ykwfwcjwmmbqGj3C8dRkkhV6F85xP2oSJeD0wUxHaA13W1N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003630; c=relaxed/simple;
	bh=suiRUnyroocuk12grD5LSkD20Wp++sZxWYm4G3hH8zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SRBJVQXBrKk9jIZ69z5A/u9A/2CxABlDtRW6Rs54N38CAv7/Ja+rfiyXufOD8X8V/+wer0yDTAfkvzA0cqRrR7qpGnXoLvlJFyDg97/Z7BHon89vZQ4iY6yShW2cebmYSUrYXgQQ1t+2yTIcMu9XjXQvvRbeoW1+sW9F5ub8Y64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=FPIOsqjv; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="FPIOsqjv"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6fe4372c5f3so260891eaf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 11:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003628; x=1792608428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud4UQpU7GXwKVtHEzNn/aXQljAT04341tSRIlnW7qwM=;
        b=bZUEGn1SrL8JF4AzwFqYyCEypGGPc93cMUsLW0MTB5laUbgn/qNp46VR/zPT+SJisz
         0TN1+pNzv97noLbrsV/sf+MwB1Z2H1zL8xEcaNLHl0J4VFK6LEZFADD7lv2bDG+zqKIF
         bPwmDv5E3Y/fF8rrp8IJM8A+ki3vNlZqIVEP/7EKFqr+SITDKKVZIDLl1SJSKGavpcgB
         +QsDUh7dJyqIprt2pzNWqtH9ZMQ8FcDejFc7Ul0fQlRVOqHSgd79uIka+cE34Ny6c/0D
         ZPrdD0MDhswTkf60A1mTzG/mY3RY/qXf2gSWp3lSGAn9+G9HVM0/w6t0Kffi5CnjX2NH
         Eohg==
X-Forwarded-Encrypted: i=1; AKwUvBy9PzBFD9SxQLtHkuXw+VmLz3Z+/gQnOzKf/2Js5yQ6RcXnmzufuhUPFqGbjVjn7RLT0K8yZwmhAG7czG0uwvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3i8QrkGA0tBjEtVDefd3ZBVz3vvTuf9t6tDcG/CHRDDhGmt7r
	cXbZsOHKyI1FhRHSDXzIflv4MOq1LXkPs7Z70QQGTMtar7/NUlpYHnqoOGkY1JtPMtU=
X-Gm-Gg: AYBFou3ffpqFlwHOqiH2WlRxW737QRWzKQbuSS5gieZ85v712qF/KW7L/gxZGTlK+cO
	an6L6H3N63SxvolD8xiuVUgrpPTJ5w7CfLPCIK+Hds525zsNxKRBos6bVQXdhHo1h2Hxoixq7iC
	k2kM7OI5QF/LaFQ5O5p61WkytVGTtvEtZgfyqYTfSYmlMcCmQDcfZYZmQwXEgd26Fi9co6clYNB
	D9VjrratLNQwtXg+ql5dg/jI4SFEyVy5MmUddk7oayCeSd/G8LHI5pv/7VHQL7vrXT13769A1DW
	DsJ5gHUvWPpMrKp/6RJvHw8cI7mHXNFDFq7/W2znVRxVPv4MRlX/B94uRPVHR/0wRRZjyTwS7fx
	Rq3+YW/PsUXJrbiFcVfX6wN5aTKUVRFMJN6hPSLW9KhW2BoVun153K1rTVnbtTQw0Ypk16J2u4E
	q7Qcty/epKq9V+ebwjp7eHhz3l+V7u3tfgNk2LYxr8ZdVNPPXW8xrTUquBYsUmyrsAhck9xTsDZ
	8nB/+7LKDZEDjiuf+dTQricd9iOGIlKD6oBvxBD0oeCyvwKVMrUrt9D02YwSdCgIyhGPV1/H95w
X-Received: by 2002:a05:6820:c2c8:20b0:6f4:ae96:c59b with SMTP id 006d021491bc7-6f4ae96ccdcmr6553693eaf.5.1792003628127;
        Wed, 14 Oct 2026 11:47:08 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm9548549eaf.1.2026.10.14.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:47:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 283216061E;
	Wed, 14 Oct 2026 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1792003624;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ud4UQpU7GXwKVtHEzNn/aXQljAT04341tSRIlnW7qwM=;
	b=FPIOsqjvI9KwWd8TDkBUXyQASuIwYvkymEHQbt7eA3vYTcc+QbYh7fpFXA2/SeJxafJZBR
	GH0srJnkwqT3w9MGG/AnWN8R7TzJNy63q76UWYHjemYZ2I3zvJrLqJQiktQGgOeppwuQNE
	fC9R2T24tUdjYBOSe7RPPbih2dytIgLjsq50IzNB7mVtUrISDQBn0JD2U3S1/aml8H5jzH
	f3iz9SHZ7TICCUk8Y8Zq8ZF7BKNuCy7ro6pJdUQp7fdNchflAtapa0RePn3gwoKKx25O5V
	Aqeyrw5iu3ur3zcR5BFZnoEcRSn3/VGrNTuREDwAIw4pxK/n6TyJoVeOrdX34w==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Wed, 14 Oct 2026 15:46:46 -0300
Subject: [PATCH] selftests/mm: mremap_test: Validate the preamble region
 before mapping it
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-selftests-mm-mremap_preamble-v1-1-2e97f501cb56@marliere.net>
X-B4-Tracking: v=1; b=H4sIABXOz2oC/yWMUQrCMBBEr1L222ATtahXEZFNu2lXmrTsRhFK7
 26qX8ObGd4CSsKkcK0WEHqz8pQK2F0F7YCpJ8NdYXC1a2xtj0ZpDJk0q4nRRKGI82MWwuhHMqd
 wOWPXuJIHKIoyBP789Lf7n/Xln9Tmzbk9PCoZL5jaYasm4Z7TPqJmEljXL+N+uOGgAAAA
X-Change-ID: 20261014-selftests-mm-mremap_preamble-5f98ad625f93
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792003619; l=2090;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=suiRUnyroocuk12grD5LSkD20Wp++sZxWYm4G3hH8zM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMvzTA1Be/AaPv+icYSQObP6ZSepseS099c1IS7GWL5yRAlaiDjRXKqF7qK+kLROsQ0b2JWSCxZ
 Qwfn01UPNwg8=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

remap_region() checks that the destination region is free before mapping
it, but not the preamble region placed right before it, so mapping the
preamble can intermittently fail with EEXIST:

  # Failed to map dest preamble region: File exists
  not ok 15 5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble

This happens when the kernel's heap ASLR (arch_randomize_brk()) lands the
process heap inside that unchecked range. Confirmed by correlating
brk(NULL) at startup with pass/fail across 60 runs: every failure had brk
land inside that range.

Fix it by including the preamble in the free-region check.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Hi, this sporadic issue has been found in openSUSE CI:

https://openqa.opensuse.org/tests/6270334/logfile?filename=serial_terminal.txt#line-6760
---
 tools/testing/selftests/mm/mremap_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 131d9d6db867..8d4fa3025a9d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1006,8 +1006,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	if (!((unsigned long long) addr & c.dest_alignment))
 		addr = (void *) ((unsigned long long) addr | c.dest_alignment);
 
-	/* Don't destroy existing mappings unless expected to overlap */
-	while (!is_remap_region_valid(addr, c.region_size) && !c.overlapping) {
+	/* Don't destroy existing mappings unless expected to overlap. */
+	while (!is_remap_region_valid(addr - c.dest_preamble_size,
+				      c.dest_preamble_size + c.region_size) &&
+	       !c.overlapping) {
 		/* Check for unsigned overflow */
 		tmp_addr = addr + c.dest_alignment;
 		if (tmp_addr < addr) {

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-selftests-mm-mremap_preamble-5f98ad625f93

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

