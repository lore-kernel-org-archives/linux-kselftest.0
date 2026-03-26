Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B0322C6D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568220; cv=none; b=ttsGFexMZHgSMWfBZXM+hiTxGQzVVFF0VPouIkFeqROI2XCEo3C8Iais888VqWvqkknL/NSeNDZHhLHJBzIX1H3NHwoGKkmKiyxBTFqNJYedTDgUZOUI7TFr0pKfh512UgOl8MMTZ1MfGPGv0kkrAlhtOJHq6M5tv0Z03cgg5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568220; c=relaxed/simple;
	bh=F4F0fC/fb8Buu2CY08Nu1pjRrsmhaG6N9M4V+dSU6GA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nLpXBBCBJb4emvLCD/yXy9cwRdXt2qkk5rb3Tfk7sAk1IICRfsQ5JUHj13EHi/y46I4ahEhLnIJVPB+g+U7plHTZcUCiAE7j5R3cS4BqCvmsl4oejEuTqShV0Pau04plO4IU9LBrBAqGeaxYCpcFrG2t/b5KBEy1aTaDUB8+ViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rFn7hXIK; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rFn7hXIK"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so1773548a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774568219; x=1775173019; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HFvOjUtymmKlW6mv6haGIZI39TLsFlaNWWSpopNMudM=;
        b=rFn7hXIKMqD927d5bElYsxtQfyUKYq+Z22i7UmMa63m1YOq0S4wzI+QNd4FUdsWPr3
         xwsEfLd0mZaarxZtAVEe+woSG8QoTP+jjoT/S3Wp3LAOkPUpTOPGUM6vwAY2KThrF3lD
         e5f34YSSEv82o96wV39TF/Ua9LmfNEnHokyShXT/4XrPhuRVseBaU/s0mbvcD0MWeG4g
         0JAc1C1Vb161dqaGTqDcqGbD3PlniYTzi77RaQZz1MP3sllutztunFq/3XnzKnkL8xXA
         pCraFTYWRJFQnDu6hvgx2j4I9hjZ29p1Mu9vN4kY4qT0yLnoihSf/I71T3dVfm+eBivp
         oq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568219; x=1775173019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFvOjUtymmKlW6mv6haGIZI39TLsFlaNWWSpopNMudM=;
        b=KPOEq3opkSbnB8AA7FvMU6YZt/Ix3ctIdbAPuHPg6NyYavQ6NgCd+HoveT//nOK+Um
         CRKIIH77SMXfyIx1H/1XKQoAwX1rHqxf/N/UyQ8Mmcb7MNmIco3AhMinXBzkkHS0+1Qu
         l6098Fvv3kO1QeX0QvgxlUW9t/Au53yUiQ8X08npmNYd/7eHzilKvVXwE7Hh+xNfEsQq
         FHHfT23Yw5jwv9nXaK85erSgF3ZIc4TpQPiL5ziM+IHVZ2vvq+voH0kbczQF/Nu2krEV
         Q6xT0oSB6A9x7Uf4SddPVJAvTllV9KJauux3Dj7q81PqcF8eYH70wgJipQTkTAdgvWsH
         ZKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPohZQ6gXnDDznEJuDVBk5gGup77NOrP4cJ09bBuCql6FX3kNz705xqoiSR8jAzPta7EIBDQRgKkrNPGZutD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvfQEW8bH/wpR00BxZm7PDKqNcMdLR+5ls6QlxaIDCl84CYg2B
	yBFmWhC+fblkQEfHXzfCd0sSwnAzmJFOCOUo9y0f5jcZhJOzYoKV3T8zl6fCkn0eui/LLnPmB5C
	frBvYxL065gD16KXY0v6Cfmo2TA==
X-Received: from pjbcp9.prod.google.com ([2002:a17:90a:fb89:b0:35c:1a37:ace])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e8e:b0:35c:d98:d682 with SMTP id 98e67ed59e1d1-35c2ff8b101mr403470a91.9.1774568218647;
 Thu, 26 Mar 2026 16:36:58 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:36:38 -0700
In-Reply-To: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <cover.1774568083.git.ackerleytng@google.com>
Subject: [POC PATCH 0/6] guest_memfd in-place conversion selftests for SNP
From: Ackerley Tng <ackerleytng@google.com>
To: ackerleytng@google.com
Cc: aik@amd.com, akpm@linux-foundation.org, andrew.jones@linux.dev, 
	aneesh.kumar@kernel.org, axelrasmussen@google.com, baohua@kernel.org, 
	bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, chrisl@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, forkloop@google.com, 
	hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, jmattson@google.com, 
	jroedel@suse.de, jthoughton@google.com, kasong@tencent.com, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, rostedt@goodmis.org, 
	seanjc@google.com, shikemeng@huaweicloud.com, shivankg@amd.com, 
	shuah@kernel.org, skhan@linuxfoundation.org, steven.price@arm.com, 
	suzuki.poulose@arm.com, tabba@google.com, tglx@kernel.org, 
	vannapurve@google.com, vbabka@kernel.org, weixugc@google.com, 
	willy@infradead.org, wyihan@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

With these POC patches, I was able to test the set memory
attributes/conversion ioctls with SNP. The content policies work :)

Ackerley Tng (6):
  KVM: selftests: Initialize guest_memfd with INIT_SHARED
  KVM: selftests: Call snp_launch_update_data() providing copy of memory
  KVM: selftests: Make guest_code_xsave more friendly
  KVM: selftests: Allow specifying CoCo-privateness while mapping a page
  KVM: selftests: Test conversions for SNP
  KVM: selftests: Test content modes ZERO and PRESERVE for SNP

 .../selftests/kvm/include/x86/processor.h     |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  13 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |  35 ++-
 .../selftests/kvm/x86/sev_smoke_test.c        | 255 +++++++++++++++++-
 5 files changed, 295 insertions(+), 22 deletions(-)

--
2.53.0.1018.g2bb0e51243-goog
