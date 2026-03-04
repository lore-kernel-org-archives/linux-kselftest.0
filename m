Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5603C16DC28;
	Wed,  4 Mar 2026 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597021; cv=none; b=IqCldKQo7zjNjI5tV2D1B6x6MZw1O6yJhN9LOI62zWft72KvtPBSWlDEjw05BlsCVWugRTA4/NC+UnkeakIpeuIw0WjxtXY6FuzSeQGm3UcOWAMg9oN55F5g1IaXBI4T+5I5AKwImQjK0QLOfKMaXgEXrSrH6dqLknmfQa+j9dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597021; c=relaxed/simple;
	bh=Iy1gzv8iu8sEalneLbR6M5vpvEpvRKihFwTnlkgYNkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aCeWjwYb3RiN1EV6CHDg5cJDZVNJ42oQWrDMEAd9oWxLhirCCQCbfEs2pZTO43pSXmiPMUCkKwLLEapXiDKZuzSyoYnAzxIuu/OMleFGzQR/Y6pgomLd/MaVsHxoOgntujisk8stMdeL6dNlRScXyMfbhYFSEZDFHJ6KfQ63l+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uG6ROz7c; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uG6ROz7c"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jfNz3GxGoDicW62LZuiyKNWvvB4I0Mdzip6nEjCed84=;
	b=uG6ROz7cG1SynSOcfxqOG9HUk2PTlsNNoxEW7RwuCF0Rk3Ry0gZI7HyadMMq6O35RceCou0V0
	GftDMr0ZwkWuOJW7isoWqHn0/I1I2Qoc1Gtu0+6OpQsKT2oxtGYbBBMA9lGROXuPs+/DmjVCKV5
	L7N/1ujn1Zue5106n5FY5yY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6Y3NDhz1cyPw;
	Wed,  4 Mar 2026 11:58:45 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3380D40562;
	Wed,  4 Mar 2026 12:03:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 1/9] selftests/resctrl: Move CPU affinity and resctrl FS setup to child process
Date: Wed, 4 Mar 2026 12:03:26 +0800
Message-ID: <20260304040334.765860-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Currently, the resctrl_val() function sets CPU affinity and writes
the parent process's PID into the control and monitoring groups in the
resctrl file system before forking the benchmark child process. This
causes several issues:

1. Writing the parent process's PID into the resctrl control group
unnecessarily affects the behavior of the parent process, while the
control group should only apply to the benchmark child process.

2. Writing the parent process's PID into the resctrl monitoring group
introduces the parent process's activity into the bandwidth measurement,
affecting the accuracy of the monitoring, which should only monitor the
benchmark child process.

3. Since only the child process is monitored, the CPU affinity should
also be set only on the child process to ensure that the PMU (Performance
Monitoring Unit) can count memory bandwidth from the benchmark process.

4. When the parent and child processes are scheduled on the same CPU,
the parent process's activity may interfere with the monitoring of
the child process. This is particularly problematic in some ARM MPAM
implementations, where memory bandwidth monitoring real-time values. When
the child process is preempted off the CPU, this results in inaccurate
monitoring.

This commit moves the CPU affinity and resctrl FS setup to the child
process after fork(), ensuring these settings only affect the benchmark
process, thereby maintaining measurement accuracy and making the
implementation more portable across platforms.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 68 +++++++++++--------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 7c08e936572d..85ac96c7cb8f 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -545,7 +545,6 @@ int resctrl_val(const struct resctrl_test *test,
 	cpu_set_t old_affinity;
 	int domain_id;
 	int ret = 0;
-	pid_t ppid;
 
 	if (strcmp(param->filename, "") == 0)
 		sprintf(param->filename, "stdio");
@@ -556,22 +555,10 @@ int resctrl_val(const struct resctrl_test *test,
 		return ret;
 	}
 
-	ppid = getpid();
-
-	/* Taskset test to specified CPU. */
-	ret = taskset_benchmark(ppid, uparams->cpu, &old_affinity);
-	if (ret)
-		return ret;
-
-	/* Write test to specified control & monitoring group in resctrl FS. */
-	ret = write_bm_pid_to_resctrl(ppid, param->ctrlgrp, param->mongrp);
-	if (ret)
-		goto reset_affinity;
-
 	if (param->init) {
 		ret = param->init(param, domain_id);
 		if (ret)
-			goto reset_affinity;
+			return ret;
 	}
 
 	/*
@@ -586,10 +573,8 @@ int resctrl_val(const struct resctrl_test *test,
 	if (param->fill_buf) {
 		buf = alloc_buffer(param->fill_buf->buf_size,
 				   param->fill_buf->memflush);
-		if (!buf) {
-			ret = -ENOMEM;
-			goto reset_affinity;
-		}
+		if (!buf)
+			return -ENOMEM;
 	}
 
 	fflush(stdout);
@@ -605,11 +590,26 @@ int resctrl_val(const struct resctrl_test *test,
 	 * terminated.
 	 */
 	if (bm_pid == 0) {
+		bm_pid = getpid();
+
+		/* Taskset test to specified CPU. */
+		ret = taskset_benchmark(bm_pid, uparams->cpu, &old_affinity);
+		if (ret)
+			exit(ret);
+
+		/* Write test to specified control & monitoring group in resctrl FS. */
+		ret = write_bm_pid_to_resctrl(bm_pid, param->ctrlgrp, param->mongrp);
+		if (ret)
+			goto reset_affinity;
+
 		if (param->fill_buf)
 			fill_cache_read(buf, param->fill_buf->buf_size, false);
 		else if (uparams->benchmark_cmd[0])
 			execvp(uparams->benchmark_cmd[0], (char **)uparams->benchmark_cmd);
-		exit(EXIT_SUCCESS);
+
+reset_affinity:
+		taskset_restore(bm_pid, &old_affinity);
+		exit(ret);
 	}
 
 	ksft_print_msg("Benchmark PID: %d\n", (int)bm_pid);
@@ -619,23 +619,33 @@ int resctrl_val(const struct resctrl_test *test,
 
 	/* Test runs until the callback setup() tells the test to stop. */
 	while (1) {
-		ret = param->setup(test, uparams, param);
-		if (ret == END_OF_TESTS) {
-			ret = 0;
+		pid_t wpid = waitpid(bm_pid, &ret, WNOHANG);
+
+		if (wpid == -1) {
+			ret = -errno;
+			ksft_perror("Unable to waitpid");
 			break;
 		}
-		if (ret < 0)
-			break;
 
-		ret = param->measure(uparams, param, bm_pid);
-		if (ret)
-			break;
+		if (wpid == 0) {
+			ret = param->setup(test, uparams, param);
+			if (ret == END_OF_TESTS) {
+				ret = 0;
+				break;
+			}
+			if (ret < 0)
+				break;
+
+			ret = param->measure(uparams, param, bm_pid);
+			if (ret)
+				break;
+		} else {
+			goto free_buf;
+		}
 	}
 
 	kill(bm_pid, SIGKILL);
 free_buf:
 	free(buf);
-reset_affinity:
-	taskset_restore(ppid, &old_affinity);
 	return ret;
 }
-- 
2.33.0

