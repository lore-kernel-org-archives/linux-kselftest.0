Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6225335074;
	Thu,  5 Feb 2026 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329242; cv=none; b=TFkZXVHIf3cZCVaVQbX7nWIvb7sgpKCqHCiaG54zS7u0P55aO4towxl4FD7qZM9vhTb31v6S9qW67wWXzx8FS9i+kRCm4tFPWwf8q6E3Ea1LeGiH2cv75TNVscCiZYlHmlibObhR/2jhb/VeOy4N8j3vRVJMBmBTeXTrr0uSRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329242; c=relaxed/simple;
	bh=SA8xgVVX2Z/9mc/xt3jUtk/vo0OJYVHCB0vHX+1fIsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgZQCoCFbAro28FaQgTRDY1zg1eEz3QMCNFv5UeYcZZ8dnUtC7s/YFl9gos6Imk7D03CZfI+Q4u/ekGtskN+cnhoDQEL1Mm4d4Y4AzxVX/h75JojaAR8IafwBCZhhB375Ds4Y9FuxdQGbv17WI+EPdX+Oe6S+2T5etrd8O+HRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2pXmL/5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2pXmL/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26ACEC19424;
	Thu,  5 Feb 2026 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329242;
	bh=SA8xgVVX2Z/9mc/xt3jUtk/vo0OJYVHCB0vHX+1fIsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2pXmL/57AB51JqzhrPr2hmfZ8MiwWdiGwst0jdlSpWQQJrToTAYm2Qwxt/5MsVag
	 eP5p4/TP7ubCqDNvqmq3bMJITf2wfuksy6NOI8yQPn21G9wmr77rQJo+1vO8DC5N8U
	 UPGtkMIlx2G3juuy0o43KYktYi8AnhNai77RaxJXs+E/rLoEmMORavGWwYzQ/0qgCI
	 nMIBjq+AZ1mZHlODlJS/W5casZWKF+RI+TvZadOhqDscZt8e2KqrvxaDmJtqF0c0iu
	 zS18AQzlQcQ0MWPg59XxRiATFhXWhXDpXwqGwLBvc05gXfqSHHYajPW0LHuWoHtBie
	 T8xcOJKphqqsA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	donald.hunter@gmail.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 2/9] tools: ynltool: factor out qstat dumping
Date: Thu,  5 Feb 2026 14:05:34 -0800
Message-ID: <20260205220541.2992807-3-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205220541.2992807-1-kuba@kernel.org>
References: <20260205220541.2992807-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to open a socket and dump the queues is the same
across sub-commands. Factor it out, we'll need it again.

No functional changes intended.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/net/ynl/ynltool/qstats.c | 95 +++++++++++++++-------------------
 1 file changed, 41 insertions(+), 54 deletions(-)

diff --git a/tools/net/ynl/ynltool/qstats.c b/tools/net/ynl/ynltool/qstats.c
index 31fb45709ffa..d19acab0bf2a 100644
--- a/tools/net/ynl/ynltool/qstats.c
+++ b/tools/net/ynl/ynltool/qstats.c
@@ -237,13 +237,47 @@ static void print_plain_qstats(struct netdev_qstats_get_list *qstats)
 	}
 }
 
-static int do_show(int argc, char **argv)
+static struct netdev_qstats_get_list *
+qstats_dump(enum netdev_qstats_scope scope)
 {
 	struct netdev_qstats_get_list *qstats;
 	struct netdev_qstats_get_req *req;
 	struct ynl_error yerr;
 	struct ynl_sock *ys;
-	int ret = 0;
+
+	ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+	if (!ys) {
+		p_err("YNL: %s", yerr.msg);
+		return NULL;
+	}
+
+	req = netdev_qstats_get_req_alloc();
+	if (!req) {
+		p_err("failed to allocate qstats request");
+		goto err_close;
+	}
+
+	if (scope)
+		netdev_qstats_get_req_set_scope(req, scope);
+
+	qstats = netdev_qstats_get_dump(ys, req);
+	netdev_qstats_get_req_free(req);
+	if (!qstats) {
+		p_err("failed to get queue stats: %s", ys->err.msg);
+		goto err_close;
+	}
+
+	ynl_sock_destroy(ys);
+	return qstats;
+
+err_close:
+	ynl_sock_destroy(ys);
+	return NULL;
+}
+
+static int do_show(int argc, char **argv)
+{
+	struct netdev_qstats_get_list *qstats;
 
 	/* Parse options */
 	while (argc > 0) {
@@ -268,29 +302,9 @@ static int do_show(int argc, char **argv)
 		}
 	}
 
-	ys = ynl_sock_create(&ynl_netdev_family, &yerr);
-	if (!ys) {
-		p_err("YNL: %s", yerr.msg);
+	qstats = qstats_dump(scope);
+	if (!qstats)
 		return -1;
-	}
-
-	req = netdev_qstats_get_req_alloc();
-	if (!req) {
-		p_err("failed to allocate qstats request");
-		ret = -1;
-		goto exit_close;
-	}
-
-	if (scope)
-		netdev_qstats_get_req_set_scope(req, scope);
-
-	qstats = netdev_qstats_get_dump(ys, req);
-	netdev_qstats_get_req_free(req);
-	if (!qstats) {
-		p_err("failed to get queue stats: %s", ys->err.msg);
-		ret = -1;
-		goto exit_close;
-	}
 
 	/* Print the stats as returned by the kernel */
 	if (json_output)
@@ -299,9 +313,7 @@ static int do_show(int argc, char **argv)
 		print_plain_qstats(qstats);
 
 	netdev_qstats_get_list_free(qstats);
-exit_close:
-	ynl_sock_destroy(ys);
-	return ret;
+	return 0;
 }
 
 static void compute_stats(__u64 *values, unsigned int count,
@@ -406,10 +418,7 @@ static int cmp_ifindex_type(const void *a, const void *b)
 static int do_balance(int argc, char **argv __attribute__((unused)))
 {
 	struct netdev_qstats_get_list *qstats;
-	struct netdev_qstats_get_req *req;
 	struct netdev_qstats_get_rsp **sorted;
-	struct ynl_error yerr;
-	struct ynl_sock *ys;
 	unsigned int count = 0;
 	unsigned int i, j;
 	int ret = 0;
@@ -419,29 +428,9 @@ static int do_balance(int argc, char **argv __attribute__((unused)))
 		return -1;
 	}
 
-	ys = ynl_sock_create(&ynl_netdev_family, &yerr);
-	if (!ys) {
-		p_err("YNL: %s", yerr.msg);
+	qstats = qstats_dump(NETDEV_QSTATS_SCOPE_QUEUE);
+	if (!qstats)
 		return -1;
-	}
-
-	req = netdev_qstats_get_req_alloc();
-	if (!req) {
-		p_err("failed to allocate qstats request");
-		ret = -1;
-		goto exit_close;
-	}
-
-	/* Always use queue scope for balance analysis */
-	netdev_qstats_get_req_set_scope(req, NETDEV_QSTATS_SCOPE_QUEUE);
-
-	qstats = netdev_qstats_get_dump(ys, req);
-	netdev_qstats_get_req_free(req);
-	if (!qstats) {
-		p_err("failed to get queue stats: %s", ys->err.msg);
-		ret = -1;
-		goto exit_close;
-	}
 
 	/* Count and sort queues */
 	ynl_dump_foreach(qstats, qs)
@@ -576,8 +565,6 @@ static int do_balance(int argc, char **argv __attribute__((unused)))
 	free(sorted);
 exit_free_qstats:
 	netdev_qstats_get_list_free(qstats);
-exit_close:
-	ynl_sock_destroy(ys);
 	return ret;
 }
 
-- 
2.53.0

