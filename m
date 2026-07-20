Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4621418A48
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576099; cv=none; b=RPH9dDUMPnTeVU6rxE++UwJ1rP2H57veI7L6YgB5sCwfPhYbp+CaOfvoMpZpO74KiUv2IFDbKSu2bcuSfFJhw9RfN6xuOxdmfq2I+twUe4sESr2jEeBoC6NBT9mZpM1pLGDvqlCMMq1gTdyv0ZiYG3A97WKQBYr7empNXZWWJck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576099; c=relaxed/simple;
	bh=YsoKo3cXHgH93neLpy3o6IszKmoV0YxgYYAN+UFPkrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXYuBJPJT3dTSR1CDE54TklgBlnWLpkccd3O3GKya1vA7zEuozhB4FR5ITDRJgU//unzqT/wErqteeyJP7TR9TmPcGy+LNZMFEZ94eP5n7Rdckz9i2N7+wHZhoUXavH60uNxeGLxNSqRL1QT/XkYyOI769HOIKo2ljbLB/OW43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=K3xGMZw8; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="K3xGMZw8"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e6391b114so567515785a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576094; x=1785180894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m4X8mdOzY8Hd25SBKdvyEitcu3reaQ/sG147Spw2gM=;
        b=K3xGMZw8L+kWA3YlWFQnjsHoCM8sw1LuKZSy6EmLVta9wCzYDt3z4X6mImpOqrxve/
         C/dTkKKfxuL14uZnknAwpQnfyaiSV2Lls428W2CTBMj2l9NWEh+EhnW7V3wDp1BdAnxf
         MOOb/Harjei9fux3cVEUkG++D5e8QehfmEz2N9cwJOy8W/gL/NJr62gGJjJdUivrCgPT
         VXrF/p4xbsYceK6EboxAoV4HPRZJ+OIoYcXNnTmIOfDCNDS47nxAY5TJfie1qn6T5+pK
         1kQGvq91sgGrRBsaIlK82BAXoNbs3bEW+fkwHRZwyJUQBMbGMrQ9VyBK2eGWDxxg9PRB
         Sb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576094; x=1785180894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9m4X8mdOzY8Hd25SBKdvyEitcu3reaQ/sG147Spw2gM=;
        b=HAIK79HPSz7yCjTYDnQzIKUjxUbKDVtcY1cwEXTqQtAIgm64ESef5wlpmxpuecDyc8
         wbvYevzrwtymB9A5Vr0U6m7lBmYyE4Y9NDs4tHCtsTCfbsmgLEjx6Nn+Mbnu9Oy/y491
         F09DTC9YMFsLS/C8qjB0hd3dtdeeZU/PWF1leomoR/YPhJJHD+Lo/NNvX8e7HecrIz3x
         omyN8e39lfvLYqTN32x8tiFwe/IpvXgLBoojjLBNDe8ar+RJjFvjX/Lh+tfBuOGL4+E2
         pZYE/6zpHa+GfiTCP+GweyhZVZi4GHDsIU7EaHM0ZwaBSu2/0H6eiiG7GtDF28f3XejI
         B6Yg==
X-Forwarded-Encrypted: i=1; AHgh+RriR0uHv6lcXwiZ8vIurGqEsv6XCbaXdTC3T0brP0ZN0gFbZRj3DYZPHy4oPK0wVyURlR9xbkgDxH9VBqFu7k0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3pmiL6rTLwHsqnJz/W+Lsrsy8ZKCJVrK9qonz/HleVFB4cH+z
	aHhQKnjMOqDXzQ/ndBkkPBLEtN5P/KVqbOcgBnJadOZp0jVjPWCFc8M1IWXaNSmP61E=
X-Gm-Gg: AfdE7ckwHEWWmYoOCt4WZOdDjprEASVVuaxxwX/Y+Cu+N8QHCwKtO+36P01iXnPfYzU
	7EuHZtuYGyXb1emwtRf17Dh+65zYB7WfOlDvQb1WVL7lITkperegL1uaDzJ5lt0c+MALa/OWyfu
	/gFlimlL1pv/TWdecCkFE54p1VAFH1xTadosnDmILjMaX5gsAJtXSQzXc+0Wednt0Od/vyuI+Fa
	TxWawMI2LCMK2k3HMhRQRdr38NOepUMrAwsseMVs0uzMiw+TXYRiNxQ71pnCrrps1+dfkazt4/I
	a0bAeYZGfuberDKwjAtCrvZnpePoJUwu9eEa1KZboQ7nfqmZlYG+SwR8d4MiMU7Y81oYQRf/+kz
	58CN2EPhGuiVIGUmA4kucfftDV3wXNFxdxKB0R2oww9sqIy9A2jpOI3c6TngVVrV8MIk9ud2bdV
	GRgWBVb4ATf/xElSazQm/nhcewd4aMOWR1YNLwLl/JY/cXlThvMU4g3ItKHEcNvok=
X-Received: by 2002:a05:620a:2b9c:b0:915:83f3:780d with SMTP id af79cd13be357-930b3ec55e3mr1402108585a.32.1784576094094;
        Mon, 20 Jul 2026 12:34:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:34:53 -0700 (PDT)
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
Subject: [PATCH v5 06/36] cpuset: exclude private nodes from cpuset.mems (default-open)
Date: Mon, 20 Jul 2026 15:34:00 -0400
Message-ID: <20260720193431.3841992-7-gourry@gourry.net>
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

N_MEMORY_PRIVATE node access is gated by per-node capabilities and
the zonelist.  Isolating by cpuset offers no functionality and
creates issues on rebind when a cpuset loses access to that node
(in particular: it generates migrations that may not be supported).

Do not partition private nodes via cpuset.mem, instead treat them
as globally accessible resources.  Do not engage in silent background
operations on these nodes due to cpuset.mem membership changing.

The result: cpuset operations checking for node validity always
allow N_MEMORY_PRIVATE nodes.

On hot-unplug, we still need to rebind memory policies if the
private node has left N_MEMORY_PRIVATE (i.e. no more memory).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 kernel/cgroup/cpuset.c | 26 ++++++++++++++++++++++----
 mm/memcontrol.c        |  2 ++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index dfd0f827e3b92..05468f95c10bd 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -26,6 +26,7 @@
 #include <linux/mempolicy.h>
 #include <linux/mm.h>
 #include <linux/memory.h>
+#include <linux/node_private.h>
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
 #include <linux/sched/deadline.h>
@@ -3867,7 +3868,8 @@ static void cpuset_handle_hotplug(void)
 	static DECLARE_WORK(hk_sd_work, hk_sd_workfn);
 	static cpumask_t new_cpus;
 	static nodemask_t new_mems;
-	bool cpus_updated, mems_updated;
+	static nodemask_t prev_priv_mems;
+	bool cpus_updated, mems_updated, priv_shrank;
 	bool on_dfl = is_in_v2_mode();
 	struct tmpmasks tmp, *ptmp = NULL;
 
@@ -3890,6 +3892,14 @@ static void cpuset_handle_hotplug(void)
 		       !cpumask_empty(subpartitions_cpus);
 	mems_updated = !nodes_equal(top_cpuset.effective_mems, new_mems);
 
+	/*
+	 * Private nodes are not partitioned by cpuset, but if one leaves
+	 * N_MEMORY_PRIVATE we still need to run mpol_rebind_* to clean up
+	 * mempolicies that are binding them.
+	 */
+	priv_shrank = !nodes_subset(prev_priv_mems, node_states[N_MEMORY_PRIVATE]);
+	prev_priv_mems = node_states[N_MEMORY_PRIVATE];
+
 	/* For v1, synchronize cpus_allowed to cpu_active_mask */
 	if (cpus_updated) {
 		cpuset_force_rebuild();
@@ -3922,9 +3932,12 @@ static void cpuset_handle_hotplug(void)
 			top_cpuset.mems_allowed = new_mems;
 		top_cpuset.effective_mems = new_mems;
 		spin_unlock_irq(&callback_lock);
-		cpuset_update_tasks_nodemask(&top_cpuset);
 	}
 
+	/* Rebind task mempolicies if any memory node changed state */
+	if (mems_updated || priv_shrank)
+		cpuset_update_tasks_nodemask(&top_cpuset);
+
 	mutex_unlock(&cpuset_mutex);
 
 	/* if cpus or mems changed, we need to propagate to descendants */
@@ -4155,11 +4168,13 @@ nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
  * cpuset_nodemask_valid_mems_allowed - check nodemask vs. current mems_allowed
  * @nodemask: the nodemask to be checked
  *
- * Are any of the nodes in the nodemask allowed in current->mems_allowed?
+ * Are any of the nodes in the nodemask usable?  N_MEMORY nodes must be in
+ * current->mems_allowed, while N_MEMORY_PRIVATE nodes are always valid.
  */
 int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
 {
-	return nodes_intersects(*nodemask, current->mems_allowed);
+	return nodes_intersects(*nodemask, current->mems_allowed) ||
+	       nodes_intersects(*nodemask, node_states[N_MEMORY_PRIVATE]);
 }
 
 /*
@@ -4223,6 +4238,9 @@ bool cpuset_current_node_allowed(int node, gfp_t gfp_mask)
 
 	if (in_interrupt())
 		return true;
+	/* N_MEMORY_PRIVATE nodes are not partitioned by cpusets.mems */
+	if (node_is_private(node))
+		return true;
 	if (node_isset(node, current->mems_allowed))
 		return true;
 	/*
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8319ad8c5c23a..f0dde52dc9e0e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6069,6 +6069,8 @@ void mem_cgroup_node_filter_allowed(struct mem_cgroup *memcg, nodemask_t *mask)
 	 * mask is acceptable.
 	 */
 	cpuset_nodes_allowed(memcg->css.cgroup, &allowed);
+	/* N_MEMORY_PRIVATE nodes are not partitioned by cpuset, include them */
+	nodes_or(allowed, allowed, node_states[N_MEMORY_PRIVATE]);
 	nodes_and(*mask, *mask, allowed);
 }
 
-- 
2.53.0-Meta

