Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F57525A69
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064071; cv=none; b=C7Q966FiwO0rUmqXD1KUf952d9/ZUt2SADT+yx9WzFillNjXPYRbhQIQGL2cK7j803AyGaXC4ULU0VBpkGxznTGdwf0R+lbc5ysYzyPHsyGsEWZzu95SYeTtkGPibLzmDQReuPAYr2EWLfulpZig5U3YEv5nSNuwDm2P+KmhGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064071; c=relaxed/simple;
	bh=Kz0+Gm3KFWWMIgbjBI3C3yS7MzZWyY5UKhB8HQObcAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHwe/hMW+57WljXe4+TN8xlX6fgTExIQHzmZbyIgbtidzTtKNV8R/sCBYSBzjuJp6bmdmtQ+mSjhSuwdoyGOMTqpFnJ+PefcsrGW4KFL5DjPuZdU5ZASGQytN+G4DO0i/IxIEuoOBG/87fNQwj4L4EfK56aUDU6quw/IEXLbzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhdPOZ6N; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhdPOZ6N"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so830447b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 01:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064057; x=1790668857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjOpUlt+UjJ6VV4ZayWYwJ5pQEbpQ8Gjw+EW35MyDL8=;
        b=WhdPOZ6NhZ7nD8bHQQqKf6PAEIH3DtQMCFp4FLChYekJ4Cud/5MZFUe0RymNlhZ4z1
         FpIMq8eWR19hCsKxSygMVN9ODy80/KJN4/BL8XV9tTQ/q0uyFQIJIedzt4QNzLL0KQQe
         O2DKPnOXXXIqII3h6vA/eoWh/pjiI/Lb4zWRT/wnaD4pryKIWcfAQCbNcXIqS0QDNFs2
         htNxsN2EepS6YTtbj0Hh9qOydKgZ1f8Krwt/OQXpIGWrSHhlzgcr5vq++zVkTDWl5vJL
         dMA+zYd1MQj/SByVe2raNQwd8AyaHK5CV68uZxhjgVbIJtTT4BZlJ28/Vbg7P0uUMGRh
         zYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064057; x=1790668857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjOpUlt+UjJ6VV4ZayWYwJ5pQEbpQ8Gjw+EW35MyDL8=;
        b=I31TUEM59prPnunITquCQ0RUqhhD3uI/vqg9ATyzBb4j1HSkC5/cYeWypz8mbR6awM
         ccubF9QZE2aCXiGn9LAgg7iHr4kNgV5dSo2vdtYdcqNyzLl4cAI3i/ikXc6zRbXuUE5/
         KNO8iH0T7orHyQaPss+3/jVUX85ggWCmspyFJUG5U89Uy0yBT52lDQwf4wifYBFnmkVx
         wjFvkLPKzGvvBuP1MZ7fU09oXl9JlY6HAB3hblLmk3X+E1tW9NtTgOl81F2V6AS4CFlM
         HhtmaUDJu4xEb3CLl3GfbJM1LIvTiYvkhQRpOsx7EjmKJOphx9bKyv36y+AicQX0OqG5
         J4cA==
X-Forwarded-Encrypted: i=1; AKwUvBwP2E6OQptmGKiDl5mo0ykgInth0BowwHbFySrUy5vH6QicMh5iNqB45EZPohgHD0gd7Y1MyhUnJxN57g7+FuU=@vger.kernel.org
X-Gm-Message-State: AFuF++l6TYr3ESfExjA/IhSahhQD9bcAiu8ropoBRedP/bSEm/uZeLQd
	6USwlxZm9yGSa2lbmnqII/qWEUh/bDv2JbywTHV5+AIHE8GnZaTcywv5
X-Gm-Gg: AYBFou11ekqa/Oc0kxkkKlaQviq4Z+nA0jpMnzceWRKUqxp9sQS7D4XhwlXXxnGTbQ+
	NMlC+rsXNYWt/AGdz129/79w93fajBGjZu4stON09gd0i4IG2EV7oXqo+YfgVjPjcD7ozkBKr8q
	4MzDP50ouw1LJ6dls0SQKF49YUVnqHSKeLhW8fdiAoMfxARrS+jb3DifSqzqfDGBfYROxfTO81j
	ZigDwLFZXqPZnlioNNpx34ym1197HSKjuM/LFtRW4xufXnh/35JtpQm4HxDAjtRRKqS3AlZeJ/7
	EncwXq8Bpdpthf4dc5O9pzbAr8fF3l4SCWBkuljGqidXT/ZbdwwqHTandtvLgJVplkbslVlw38O
	DKOYwQZ3evTG82IO+oVp+Qug1aIaWsAa1Ni9Lhtm9xg6RLdbTnYgMu9isIrkIyUW1O/izx+Pb7T
	3tklmB0epcpeZTYeTTh0YPhDxR/H1qKJV5DYzoVZahw+yDm45bHvaUryt51gCqMQlxE62P1fusR
	nA93fYSHVtruuH2G7DP4fzcaiA1KVudYyjkW6yOIaYSoyiRg9D0ysmWUgk9Zul2H6a0toMg0Dmx
	0whwEJj+ag==
X-Received: by 2002:a05:6a20:6a1c:b0:3dd:85a9:55a2 with SMTP id adf61e73a8af0-3ddec7aef29mr380694637.36.1790064056935;
        Tue, 22 Sep 2026 01:00:56 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756b4239fsm494006a12.19.2026.09.22.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:00:56 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: Re: [PATCH v3 1/3] cgroup/cpuset: return PERR_NOCPUS in remote_partition_enable()
Date: Tue, 22 Sep 2026 08:00:54 +0000
Message-ID: <20260922080054.3895080-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <a00dbaaa-99f1-4172-b337-911ff45ae71e@linux.dev>
References: <a00dbaaa-99f1-4172-b337-911ff45ae71e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 03:08:55PM +0800, Ridong Chen wrote:
> What is going on here?
>
> Please do not reply with a new series. And I think the changes should be listed
> in the cover letter. Otherwise, it will get very confusing.
>
> ...
>
> I cannot apply this patch. It seems quite different from v2.

Hi Ridong,

Sorry for the confusion and the noise. Two mistakes happened when I
prepared v3 after splitting patch 2/2 per Guopeng's feedback:

1. I mistakenly passed --in-reply-to pointing to the v2 thread and
   omitted the 0/3 cover letter.
2. Patch 1/3 was accidentally overwritten with a broken diff instead of
   the remote_partition_enable() hunk from v2 1/2:

@@ -1591,10 +1591,11 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	 * above it or remote partition root underneath it is not allowed.
 	 */
 	compute_excpus(cs, tmp->new_cpus);
-	WARN_ON_ONCE(cpumask_intersects(tmp->new_cpus, subpartitions_cpus));
 	if (!cpumask_intersects(tmp->new_cpus, cpu_active_mask) ||
 	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
 		return PERR_INVCPUS;
+	if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus))
+		return PERR_NOCPUS;

Would it be OK if I post a clean, standalone [PATCH v4 0/3..3/3] series
(as a new thread with a 0/3 cover letter listing the changelog and with
the v2 1/2 diff restored in patch 1/3)?

Best regards,
Hui
