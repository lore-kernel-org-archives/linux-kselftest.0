Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E43DEAEB
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338734; cv=none; b=ZlDU5GEECr2++pegcIj/SARCVtjU+8RYIvaJmFxTOWw3/WyB+o1JJ9/FjvlIHz703jZvCoYkXSHontCxymR48VUOtreiljJAZk3RBMNFxWmnIZ08ZXtO+YgI1vsyCupBxAgfV5fmbDDB/zZW70NtgODwvIBI64Zllrb0CpZ8/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338734; c=relaxed/simple;
	bh=rkPzVVDgoOEfaKV2nREKbkjAXfc0pbvyd/oIWLflpYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubyV+IjFY6g7V2RztiycGGibTlFkxbKoj/iLYb9KUNwLb2DxqPq2AxI7KKKpfONKHlPwck1lfN3TNhDvtaZ7qu95rZNFRkF4xyOKUwzs13trdoKFhOSvSW8Ftp/YdRcthKEC0U3+8ukYKrg0V5Yfkb2S2SdDYS4z8JWNP/wc95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EpRdos2x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rxlCG2kq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpRdos2x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rxlCG2kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
	b=EpRdos2xkUe53ajV23IT2T38uI2SY0VKV+ZPg7kR2WV53ZCIFciBSmitJYILLDKZFU9hxr
	JIBK6AJS8ay7uhJM6Wepo5i+jDw31/MQDRyyJVcSCfDqTYGOqOjqcJvZXBXpbeSN0w2ZHh
	+QGfA0TdXptmwE5fsv1DwCFDn5ULGmE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-9sWEHHFVMs-Ybk0xPcWmWw-1; Fri, 21 Aug 2026 14:58:17 -0400
X-MC-Unique: 9sWEHHFVMs-Ybk0xPcWmWw-1
X-Mimecast-MFC-AGG-ID: 9sWEHHFVMs-Ybk0xPcWmWw_1787338697
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so10354066d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338697; x=1787943497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
        b=rxlCG2kqriWBMcgab2d3GVQ2Te0Knk3Gk4AHZpf0049aZuDbpX0tXN239B8k7QTrqf
         iUaUtwvyPYN9SDqseT28lrdjCReapuR89ef8EWveh8gf+P4A4HhjwpVuuoI0jfRLcWZH
         rYuCF/eh/pEk+Bh+a3g3VmCdp4cf7wAqOBoNF0Lae4Y765+br/2ZntD1Br8pvineUH82
         Wvk9lHF5TCtAJYcNB6ofA4I/aukQMANFbZ0YKPY/uZ+GKlcwT4TBeJC5B5zzLyDQHF/C
         zB/f72Q1qqGRI5/FZyI2qKM5tb98p4fOoZo2lHutQ+Q3byGFmJJQsD7JSR45gfqRa3CS
         9yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338697; x=1787943497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
        b=VjyACY6wt5t5sriFs5wxqgWBCq4f4F2WeIQRBYMauI/tfNdH7D2xL49x7TVz2RlWKJ
         rY0OS6MeD44StaeAV2uRrVqRLsK3eeHgbWC3hvORfB27Bb40JYRLGWzrp6LCAMpwoBkQ
         4LKG0oOUcotOTmItPkEXatiHKLUejtSAk8HQKW/8mYC1CKo8ztXPGp15sJbU11/3deOp
         EQyWy6+arCPqpWNnxlET63TjCC3HkLy0lP9xk78ctD+e2ard9PEqjg+WvtkHQKlgFrjJ
         a2/8oIz54Zo1wehtDGQ+FbcPjnldTl5IGuXIzNZuzwcUlk4Lh1C/zcF1Zrtn9XMR6WwG
         KHfw==
X-Forwarded-Encrypted: i=1; AHgh+RpIuNnhejeqfaSQZ73PqEzuC5YWtyqjQvHetAcwEUThN3sH8ArjWN218G1dfgud2/W1xUCPpZidZFUi/5wWYm4=@vger.kernel.org
X-Gm-Message-State: AFuF++n69bLrYR7yjQHNPT3IXuhQ6EvtOVBvD5p9S49BIDA9qwXFAbvj
	TVBtgNtjoQMTLgmIg1UcDt0jp+nxUx2yQbOhHRrfiEGq1PIE56DBs3aKmObryPAcQ3sEZBh5DnG
	LruoWCe/3n7VoAi5zrtXcxRMIVBNlCOLLo+MEW5gwJHdWc7cUwXenY9OdAWMXmC/jmftRXA==
X-Gm-Gg: AR+sD13j1h3Q5p7W/o61KlLO5TU5JgE8ok3/XwsBZ2hh4Uq/G/RLLFBqHujXVohF/ab
	3bnKGrdNBu52tj0sbubthNhSu6AhfQtBBNy2dB5vHrqSPV2q8LHCQm++aiSwXMwPJIVxlNeSzjq
	7RyNINfqOrvJB7DvsxZx8N/XzYOguIzc6UUTg9eStVvBmLCQmVOGK3Q/00KPs5fFGiolsTy0jYR
	D4zRTfR2otqODOildAhQJKCNTF3S3BnhjazRLFJ3hgQZ8c6Joc8DfKzZ6v+K3mabAhcms/HuznP
	ncgJz2Jj2GzizUpGTFO52lyKEbhXENV305D4g0bWTo2O68Ur3yG2ET/FhI/f+9LqTZm8BhXpvft
	1Vr6+KRbGKZm2pkbrXxSfbxLXzRxOGSvZVAfmQjQBAq4a
X-Received: by 2002:a05:6214:21cb:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-90c8098e804mr82074886d6.9.1787338697349;
        Fri, 21 Aug 2026 11:58:17 -0700 (PDT)
X-Received: by 2002:a05:6214:21cb:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-90c8098e804mr82074206d6.9.1787338696872;
        Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2905d6sm68917236d6.29.2026.08.21.11.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:57:03 -0400
Subject: [PATCH 11/11] selftests: cgroup: amend vmtest-memcg to run the
 hugetlb cma tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-11-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Add HUGETLBFS to the selftest configuration. Amend the vmtest script to
pass hugetlb_cma=1G and hugetlb_cma_only=1. In order for hugepages to be
available, ask qemu for 3G of memory so the CMA reservation succeeds.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/config          | 1 +
 tools/testing/selftests/cgroup/vmtest-memcg.sh | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selftests/cgroup/config
index c4f7df4f1b24..1c9034017682 100644
--- a/tools/testing/selftests/cgroup/config
+++ b/tools/testing/selftests/cgroup/config
@@ -8,3 +8,4 @@ CONFIG_CMA=y
 CONFIG_DMA_CMA=y
 CONFIG_DMABUF_HEAPS=y
 CONFIG_DMABUF_HEAPS_CMA=y
+CONFIG_HUGETLBFS=y
diff --git a/tools/testing/selftests/cgroup/vmtest-memcg.sh b/tools/testing/selftests/cgroup/vmtest-memcg.sh
index b19b96731784..534a95ef5e07 100755
--- a/tools/testing/selftests/cgroup/vmtest-memcg.sh
+++ b/tools/testing/selftests/cgroup/vmtest-memcg.sh
@@ -116,7 +116,8 @@ vm_start() {
 		--qemu="$(command -v "$QEMU")" \
 		--user root \
 		--ssh "$SSH_GUEST_PORT" \
-		--append "cma=64M" \
+		--memory 3G \
+		--append "cma=64M hugetlb_cma=1G hugetlb_cma_only=1" \
 		--rw &>"$logfile" &
 
 	local vng_pid=$!

-- 
2.53.0

