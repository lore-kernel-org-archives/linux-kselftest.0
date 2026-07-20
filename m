Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7228481256
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576133; cv=none; b=XeXksbCVwvkvMmC5FL8j5sTdnxhdvKdO5DKttctfBFd9T+xK2nxBQPsRpKrdWIsswbYjZVm+ui6Bnpxs6N5bZc98uK6w5APf/njFnOWIATHo7QUGrl5gZ0QZ3mb7TDgcGmDBcDCjEdnEVIbHYC7ZleK1yzKzR3taWYkT8uc+DHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576133; c=relaxed/simple;
	bh=ifqNq225nfRuO77jzr3XXyC27iYCrW1SGYAlShFLthM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2+6kU13uscks9vSfz10RlWOBH39CTftaNBb4pl/mifZy9YW8GkkXYU/4OyQHc1nCXNgUZ7oxZJCW/g3IdWBvitZlAubv3clZe3ijk2CX82Y2BOuF+JfDoWL1D7GR6BXqsRy9NypY5WEVwT9fMgQXQP+0Vxl7/P7Nv7dQ7JVPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=E/tVcDgT; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="E/tVcDgT"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8eefd4a8057so64827186d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576128; x=1785180928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU1C1BFWfSEqKvrRpWFHlkg4mZCsJC5WSVAsWkbzWmY=;
        b=E/tVcDgT7y3NoVzZT7KLiwOlpQ4lPhdrtRWlcd6UazdA1KnoL0/AcgEJde/VKvVnvR
         9a27bQ6CG2k0BynXRV1oZJm+gbcC3PRfMyPuDPNeQKNNxSBl+8QNLpd5N7tenhHUZAQW
         uKlTpoew9Z9c68rFnaKLd42GcnY1Mw/5obLt5lMUycLHXXUawWA+Mt6imP5jTJ7St4ou
         Pe7F+HZ6xgxH0aI2vQZSjH1/u7YoNxL1+yPxwNFR6dGAsOnJ9iDQi0Uc0p7uI+e2AqVc
         hURqDn72udUMRAxtkt6hLGro63G54FuIhq78FKTxdPqGU38Wan2INfREa70twQnfUTsS
         LmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576128; x=1785180928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KU1C1BFWfSEqKvrRpWFHlkg4mZCsJC5WSVAsWkbzWmY=;
        b=GRGTgNJ17nw6tdiIprJ8FAoMj04pnFhJok3HZzVTchn5fUtJoRL93g1+1YEDNy7UF4
         2E00cAMBVpb4epuD7kUavfurO1zKp38fdbt6RwifXhLfwYWCyD1p9EmM1K/hXvTkjKW9
         LrXqbOcLoUVSaVf7woxopEd1HHaBEUoY3m5F/tWoyRxC0jKsS153EKB15C1np1kk0Efz
         N9R/UvLp+GiCAAt/bBk6y/8nhaBShalfnzh3jUf7lBLbSTvX0jUAXcs1iCfhkvWN6aoa
         5WwyQZqXGUks2ZXQTNX2uXl5yZnh8ZEEU/Duf/6hjBgl6vcKMfzeb3MWwolkVh31AaqF
         xYaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2A/tnMDRKaq4jixls0gsKLObNZZO+1P21hmnhvlLQo1V7rM+YZB0AGsZVKXe149t2NBAeebmcvBJYXVc43CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzznCwB7JBnd09wGR2SYyEkt7xbwYGxc/tVt6z0DkZaXooyb494
	yHVrbE73rkMmdIlZFez53mVBunqYBTIgZLhBeCKkpZLQeHzuCHShLPnxtQeoW9hXicg=
X-Gm-Gg: AfdE7ckZ2b8BGg4zKJK0c+/hIjF4+w8knblj5VWDJ2pBUGnWieAgktQpdpsIOF8ycRi
	p+YZtz0QptNY6O8Y01GhgvrQO4X5RSLfJsuJwLZTBHTRsnCgD2Wz48/i16nGkmzhFms1C77xtEp
	Er7dE5OsfEafkBo7mD+DNXGKlqbu315QCLDqkOocf7itkY5oIlJWvBS/G+toqXhv6fRma2csrD3
	NRV012TFUiTRGLF1unBSpT/pg+a0jL5UuOXEqzbnt/mudXfJazAM8Z5xL7SHhLES2sU4Wst89ka
	GMniTG/GxvRa21brTRR2xFHYiLgJbNhL5QnvtITB71DIuAIaR9xRJ0hhtCO6e6bRPhNO7+IiimY
	PwflSa+3WYFMvE+6bV9ZmmI/P/GufxKV9Ld08/Ct0xRce72MM2uHNj+Cizg7kLmYnNMls8C+CBm
	CNyFb5R0LkNjgdU+HfmeeZdtAiuldBVW7J/nT8Kg97koShsD4GsPaYion/pDab0DE=
X-Received: by 2002:a05:620a:4588:b0:92e:4e88:f453 with SMTP id af79cd13be357-930b41a0726mr1469051085a.52.1784576127960;
        Mon, 20 Jul 2026 12:35:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:27 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 19/36] proc: include N_MEMORY_PRIVATE nodes in numa_maps output
Date: Mon, 20 Jul 2026 15:34:13 -0400
Message-ID: <20260720193431.3841992-20-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_maps collects per-node page counts in the page-table walkers
and emits them in show_numa_map.  All three filtered by N_MEMORY,
so pages on N_MEMORY_PRIVATE nodes were never gathered/printed.

Accept N_MEMORY_PRIVATE pages in both walkers and emit private nodes
in show_numa_map, so private-node mappings are visible in numa_maps.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 fs/proc/task_mmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 817e3e0f91943..e116cd5f157b9 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -3389,7 +3389,8 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
 		return NULL;
 
 	nid = page_to_nid(page);
-	if (!node_isset(nid, node_states[N_MEMORY]))
+	if (!node_isset(nid, node_states[N_MEMORY]) &&
+	    !node_isset(nid, node_states[N_MEMORY_PRIVATE]))
 		return NULL;
 
 	return page;
@@ -3414,7 +3415,8 @@ static struct page *can_gather_numa_stats_pmd(pmd_t pmd,
 		return NULL;
 
 	nid = page_to_nid(page);
-	if (!node_isset(nid, node_states[N_MEMORY]))
+	if (!node_isset(nid, node_states[N_MEMORY]) &&
+	    !node_isset(nid, node_states[N_MEMORY_PRIVATE]))
 		return NULL;
 
 	return page;
@@ -3602,6 +3604,10 @@ static int show_numa_map(struct seq_file *m, void *v)
 		if (md->node[nid])
 			seq_printf(m, " N%d=%lu", nid, md->node[nid]);
 
+	for_each_node_state(nid, N_MEMORY_PRIVATE)
+		if (md->node[nid])
+			seq_printf(m, " N%d=%lu", nid, md->node[nid]);
+
 	seq_printf(m, " kernelpagesize_kB=%lu", vma_kernel_pagesize(vma) >> 10);
 out:
 	seq_putc(m, '\n');
-- 
2.53.0-Meta

