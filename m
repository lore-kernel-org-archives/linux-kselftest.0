Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B22F7F10
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 04:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817277; cv=none; b=J8eIzFs20mMG3Mkru0usy8H+bB91a7MhkEqlvJq3HUVnWRvPXoNZeNGxnRKs7C6UgaoJ1A6ViVRtrdPWMq93NyW27ODKyjOKujyb80SDzurw8T17n1TT+yVcoip2iBJf6e/bOUDdnMAek8R5o0gW+sjKaoCIpjlD/Jyuub4rK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817277; c=relaxed/simple;
	bh=3hjC5tQGZaEndcSr0kknDCtu9P8kownNQ1aiLVGYqqE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J7Sr4MMSM7Ik25PlDQZU14V06SB2BRRxnvoEeAzRULwlEoTkobDxt3b8gtUe5LLncBbsAQ8SVrXSxJ1VZGczYX+3CVNgHHAesZzy4Ad5cKCx65nPfhklEsa0krHW4n+KizQUNKYkwHA/r+Dl24H8nNQfnTU2A3dEFbRO7c5eHts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eyJdLRvS; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eyJdLRvS"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so4293897a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 21:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785817275; x=1786422075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1EHxIenGghG1qcflV4x5EPNN6hTPv19+mMdXwN3odLs=;
        b=eyJdLRvSzL8o+XsyJv3kqOibISS4yrnT7HidF94M/kA7W1pVrMHHEGmkmAllvpsClg
         Lb3ZIksPw5kP4n0hpc8xTekVE5yhzoxv2I7K9Vx68+4i34nZTtXyCq9GOH/SKRHOm9fS
         O1e23yR7B7YV4a8C2R5qzrEM9tV6heKWuh/mwaFyHkZoRJiiAZadZHa6I1yB5VpNLLNg
         rZlWVKUMG390MLohJFCS4qrHmPWHd85bnwdy+JPHz58UQLnFfhtRyfdPKnW3FWOz5CJx
         9LWyxrBpYf/4gk7PnnVaTsuHObxJ8DGJWuOb/FsTfV3ahwvfQKmy91Y+r6gDpPDKRzCu
         28eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817275; x=1786422075;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EHxIenGghG1qcflV4x5EPNN6hTPv19+mMdXwN3odLs=;
        b=U0Dernc34TohPG55rsqgb8mxeB9N4kO4R6yniVHOdXTQ6FnkYhYm2HMlxsy/E7g/7P
         a5HOUa9qR47Jr+Mu/NxiPPYbjvAP26JykADpVkHDrFwEE5VJIS+ss0EmBiucakppp+NT
         OhWeIIPyLmkXdFSsBhkwmupfVdkzkM4chy8gRG/7odpREjsY6p8Yn7CZl8VSEMr/TZZu
         aj+eKPRg1lanPh8B6KBENwOyKR6ylladUby98hmpHMFQiVjlip7NbFzMCTaytqNwRGRq
         s9L/rQF9rDzD8Hjqbe5AnOyM+u6qw90hBsxNc0LoaXmyjI/4UrK6Ui1ZhlgL2VFOW4cv
         K7aQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL9gHyvtQg94cP4WqpX1b4kTZWpGBTOODr2dV5k+aArWIotBna2hwRf7MDWcjQKcX8AX+Kx+sB46F4udQ8NNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLr2IMkzBuPmqlzbJAJO+qgfnT+CnJXVh5+N2Uf2HmhOFGHLU
	z9wX336QRmMNHNmrktWAJpch5MzvZLOUl1XLy3uI3GNaDs1fy5iczl4oLacCTjqltnRREbxvYLi
	se4tHo03KXw==
X-Received: from pjot9.prod.google.com ([2002:a17:90a:9509:b0:38e:1db:751c])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:38e:7168:281
 with SMTP id 98e67ed59e1d1-38fbc424a3dmr10661157a91.10.1785817275127; Mon, 03
 Aug 2026 21:21:15 -0700 (PDT)
Date: Tue,  4 Aug 2026 04:20:43 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260804042053.56940-1-wfelipe@google.com>
Subject: [PATCH 0/2] selftests/cgroup: test_zswap: fix single-core flakes
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

When running the cgroup zswap selftests on a single-core VM (-smp 1) with
4GB of RAM, test_zswap_writeback and test_no_kmem_bypass reliably fail on
the initial run after boot due to timing and asynchronous tasks not
completed.

This 2-patch series fixes both initial-run failures:

  * Patch 1 fixes an EBUSY race in test_zswap_writeback() where writing
    "+memory" to cgroup.subtree_control collides with the kernel's
    asynchronous RCU removal of dead child tasks from cgroup.procs.

  * Patch 2 fixes an implicit unsigned integer promotion bug in
    test_no_kmem_bypass() where a small negative delta becomes large when
    compared to an unsigned size_t threshold.

Both tests now reliably pass on the initial run after cold boot on -smp 1
VMs.


Wilson Felipe Pereira (2):
  selftests/cgroup: test_zswap: retry subtree_control write on EBUSY in
    test_zswap_writeback
  selftests/cgroup: test_zswap: fix implicit unsigned promotion bug in
    test_no_kmem_bypass

 tools/testing/selftests/cgroup/test_zswap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--
2.55.0.571.g244d577d93-goog
