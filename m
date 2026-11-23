Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446607;
	b=1zyzwdmBwn+KoHqc0pn4sTpOY7h26dT40F1nyA66TIhixOYVRBRczrotJF7gI13Xx6jw
	 4p5cbZi5Y8/RlwcV7umtJqwZKA/ULBRenRjrsXSKqSaEKCF33mhK9Y0tLjOTckdNUpdx5
	 xJCjyR4rrsHrYVKtgpRbB9tTsMm/ZDcqQwsOwQcPhy2loajnoCFPQg8rV/eHEEXLdWh7o
	 EuWj12h0WqCzuxSpjfJDCc0GLhsPPShjy6h38mrVg0+u9bGLLyLV4Y7bhmustPsnX98+a
	 1dOxUnjFL07+zHdMvnj3wqo9Ds3m5EQB4JZKux8eXGhWIYouFpCqWsuQCN8Dmoi7bjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
	b=s/WMhT3OYiVfxcIWk2eVgmnwGMpfF5INspHoOg0cmJ7QOGheoBnTfrjCjv01Xho8Wa7m
	 EhS6hF4R2kV07om1sUNKO08qx9v/1elArBbHNjWbn9OafWE1E95kdaAZOEDxfBIT+IblI
	 xvs13WedzOjojnqGhVbyIC3XQJ90HA5TlC4KwvMfbt/S1cVsoElnjKjC5Nu7fwKZAnTFN
	 fCJGpxr7FxQRypy+rdryoYWhbiQaXpdHF9RkfLmglZmznCtojzqhTA+c5MAIMzi5uSLf9
	 PU7aJwqZUQ5RMUaJqD1+mTBJaq67Itbz5NQH/nLpWl/D96NZ9Q96+Ffzmb7UE5gmXBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlLoUKzr;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64E606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC64E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KlLoUKzr
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b2f59de176so2747710b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446606; x=1796051406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
        b=KlLoUKzrAGBBjUKAIUzd57PO8Cutrhk/YnNNmvLeoU8J31Qs8DD54B8ZjCOkDLESRr
         6emwUFKoeBsortM28AeKr0oQoZPg1di8fYgh/gAVQrMYMilfo+Dw+N4/5P9SCkzixzvA
         vdIQ62ZfNnXfgGfYzkmxCR/gKLkHtcX4v6cMggVulMnBKIwxnkAiazOZlqft8gahmHhD
         a5twDQyC/AxYuV2jp4FUXCxpHwxQ3ffDeBVS0lD1+wD8ECPwVGWDv/1XT8TyeuwShEUT
         n1jSSigjcGSjbDB6fFqpvWuNMP3ZANkq4U6efkTHBFvP10Mg5E/3S67np9oTHQqoFnLy
         bhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446606; x=1796051406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dz52cAd06DhrS+w2eA1gjA1iPlJT/ApD0Ocp67pISs8=;
        b=EVFKE1RPxlCmI8EiFVXBaeaXvyftn22YtOwla+hs14JGyWkJxRBzedAGZW72U4X0V2
         Sz8sRmAxJnnkAwHYyCufcz32Crx4q+dzoEThdWM9ttasi9VHjBdqVGV8QoY+r6HpJUaA
         bXQSzfEsRybQgUACtep6EF+DeoiZnq1HibMfvUiL4jA08PlMduC1lrTdGqWJ3rZ1LI6P
         p25NPQTu8s+JDMUdGCnsUyMBQExVYDmRTvQovgbClGhy9Ap8qNDkiKt6VC6v7Bw9F96g
         ShC8pZvS6K4vBBO8KTLlybkBmlJxRhp/FLPYUZDYDETDD/SNRlQK6vsEkqAJNUQ2QNFX
         nmFw==
X-Forwarded-Encrypted: i=1; AL+hErERca2M29uO2j9kCxHNmvc98EtPymOUL9OLTNZFBpzX0zEiU9nMFL/BNaVQt67jihI9imxDJ37ftsaGmCEVTbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C++xKrB5bFZHA47I7T/bJEsJo96kzQPNMkrwu+G2IGdvGPUtm
	hJxeF+rOMnz01PmTfaV7WLlxyguBlAtFdtqm91ze5gchYToke+CmA0pE
X-Gm-Gg: AZFdTZeiJkDeXzR7aaOvCQNXaNpAxh8P8hcUJdsjGcvdfsd1+kaolePOresPRPC10b8
	EXhOaPfsW/5eamQo2SMU3BVyfbpSGMbkJhRre/B8p9DVXBeZJL64Im5kLoKfYbAgap5dai/l+Ju
	K8Q1CToOF7cxsPMDTPERW790BE0r3+vvhd7S+5tUe+6wTwRAGDjeTaJntfpunZlCKEEklKU08C3
	AfVtvcHggUTTRB0UjQgdvml84AlB480fy1VXXHV1a2G57l/w24MAMyewqSdGvZYytoWHjnMVz0+
	GdKJoQbBWLAqfWNGECadcsX9W8NpyhjR7M7Wf18nFauXjJ1SfyQOiUMT7cV0eVYCemxgFociZNY
	DqdkLotIKPlOHvMtsl692+ER9WM2jaDs5QxYsW4GXUyY/QCGTryOBwUqpPdkNMyacKUVYfQNCML
	5dziTu9x87hu6Rx3tNx7I4xwA13HXMz+hs1p3UWKnZ/2DdeiOihLGJlvj1NE4ePPmIfAosjnQu4
	WxWkxzDncec+iupI59K/bR38oFHX7HXsTwaPGfwfh44iKeoi7e7WUppB8g/O3VD+2K9LWYJns7d
	i2KR4lBs7yX8oubNBuDLDOohV4yUUhDBR5VPc4Yhy4GJxYcUHaERVy7+O05UqlPVK1OXtJl4qdz
	/SiF6Wy5qc4EjyCkC
X-Received: by 2002:a05:6a00:928a:b0:89e:6bef:70f9 with SMTP id d2e1a72fcca58-8c87bfa8116mr10077691b3a.27.1795446606284;
        Mon, 23 Nov 2026 07:10:06 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm5956464b3a.0.2026.11.23.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:10:05 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Song Hu <husong@kylinos.cn>,
	Mina Almasry <almasrymina@google.com>,
	David Hildenbrand <david@kernel.org>,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation scenarios
Date: Mon, 23 Nov 2026 23:09:58 +0800
Message-ID: <20261123150958.2212229-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <apqBn7tWDHQeMrzB@kernel.org>
References: <apqBn7tWDHQeMrzB@kernel.org>
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

On Fri, Sep 04, 2026 at 11:30:23AM +0300, Mike Rapoport wrote:
> And this code breaks our CI e.g:
>
> https://github.com/linux-mm/linux-mm/actions/runs/33040981840/job/98414290236

The hugetlb category in that run hit its 300 s timeout inside
charge_reserved_hugetlb.sh.

With the stray 'continue' gone, the "more than reservation" and "more
than cgroup limit" cases run. They expect the write to fail, but
write_hugetlbfs_and_get_usage() still waits for the full reservation,
so most of these cases spend 60 s in wait_for_file_value() before
moving on. The CI log shows this: hugetlb.2MB.rsvd.current stays at 0
for 60 polls in three cases, and the run is killed during the fourth.

Skipping the wait when a failure is expected, on top of this patch:

--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -252,7 +252,7 @@ function write_hugetlbfs_and_get_usage() {
       "$cgroup" "$path" "$method" "$private" "$reserve"
     local write_result=$?
 
-    if [[ "$reserve" != "-n" ]]; then
+    if [[ "$reserve" != "-n" ]] && [[ "$expect_failure" != 1 ]]; then
       wait_for_hugetlb_memory_to_get_reserved "$cgroup" "$size"
     fi
   fi

takes the script from over 600 s to 64 s in a virtme-ng guest, with
all 56 cases passing (only 28 ran before), and run_vmtests.sh -t
hugetlb to 83 s.

Song, would you like to fold this into a v2, or should I send it as a
separate patch?

I found and tested this with the help of an AI coding assistant.
