Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0447206D
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449640; cv=none; b=g/FPkAFp/cb7PMwF+8yQ9VJlVOFQgWouFqhSM2cQn7WGQpy8p6ukRs4gT1us3zPLvkoC1f/Y4ywj+Hj25oYYj2bXmhZZvbUEzsQpxW4hINJFhmdcKlYUWQfjmEuYU+rQyEnSU8mNeoJ6AbfOZjWDREDoqeMZjuqWMJlj1P1OJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449640; c=relaxed/simple;
	bh=HLefPmBX47EFFJEHrgtmj8lWN4k9/YgWGOGt+gyhx2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWSmYAE/CFn8ZXCPbmQOax1H2G/DUsEkAUxJqA1yHDdJNDdxYDUy7LnKRtv7Bau4WxLlxP6QfRyaYKLnJddk8UE7goRWtKCVgXSePT2ESnYXZz5mem5cmaCAZTOV5NwzBliGGurqOv8eGMvojHk2wbyYcKAxA3bFaXuDbCPvURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVa7RWp0; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVa7RWp0"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35115b52125so3559064eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449638; x=1792054438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBRVu1PhaTpNiCczbgliHEJdpmg0aCx3TB2VjXS+OlY=;
        b=kVa7RWp0GbHwFZfi7LWMMuslV835wg93nsDbsItGFiC5KeHpXtQjeeO+mCQeUwiSEy
         mEVGxtlYpi233BPtwQIhL6+9sqbKEiPBOaFTdehwWIKClh6M9LMNFShJm0RZzCt0uE7r
         IArxxO/zctFDfRvigNxsuD9b+WAimwWmIvCabn0FURFkg/mnRdSSfMmEOdn23136xFut
         d2m3a5Pds7fLa90nFiKV2ZLQ8I0DgwxDFMVENc6b3Qi8de0ER8x+BZhyyEzn3I0DNg6w
         tyozLMjVi18b4cgSMmifkkh3LGBos1YMRPBmn6OoaQjw5IxQYE+Vr8pud39qKACCl7lN
         EBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449638; x=1792054438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBRVu1PhaTpNiCczbgliHEJdpmg0aCx3TB2VjXS+OlY=;
        b=D7ZqphkuP4MMo3iujE/Wuq9mz2tGyef/OhH6H6D+wTDOALGvbZ/XsQhDU9TBUwWDw/
         2tOIPY3d8uOzYyWMvbB96CwagaNldJux8rZ38PwRHRbyRSIGvTOVZjppnb3EPbreOs6J
         BIznDZzD8oNq11LzoBERIg+lu9rWGGI2g6a6UQUiShKruqGhGa/fhEsF3S3yr60VL7ZI
         VtDqI0isW5AOVTvNCWplanGfCScpdRNOrQSvoWzcp6uQUXkPQPTV53LoXA9qDEtoSLfO
         pyJU0VQY667VuHMqW04M4YsaVeOOOLwEuRzEuREaVXBBLb7HTM6gIApn8LYQg6Px8IRX
         jJJg==
X-Forwarded-Encrypted: i=1; AKwUvBz291giCuasaxpLCdIQNLYiSh5/L8LtA+O6BKABazzVggkt3204sRJaFnxLCUPk3Q1bKBDuLr5hlNTX3dJQgpk=@vger.kernel.org
X-Gm-Message-State: AFuF++kPLaDCEOBSHEsgMDj+YdUqzCyYgOtZsxQ2hY5v0gScjYSUWUu3
	CeWlgP8hPPitZE5c/9cIjPvQ4nYJU8MR3qH2uMBMj4ive/qklvACOR+r
X-Gm-Gg: AYBFou2G3NKYsdNgUlxYP6G0fMYKaDBPA88K8bq4dxKtONxuARmWoldx7vCdlevkfB8
	/5ELdalUJ7ApDGFEvSSPtKU/fqjfTpISXnstTBFO9KQc5C/mnNbmpfXAkDq7kgOqdx4nRhf/LR9
	zMcLGNccrtHBtsmwHaT2+/BnZ01VtBGOImU8vCOs3eYhFVXvMlXsJYAgI09+N/FT8BAsnWOkRqr
	yByXvH+nu23bifEGjOLB/fR2OKb9gmU9VWrm0lIH9CAvLUcwJeFPB5Ov5cDsuvSxHCt3A6uxMOT
	PQfhCjqgZ7G8Mha0L2gHkelXQQv29OhBr3FP+PSLQPkklPJdOrhu11Q9xbMZXneurK9O7b86YJ0
	xU8bt1Mmxm+Ik0Vh+lTfqBmjL0wCWenOi5upTwhvp0AaqDO84BHs7DbbODNmNdlu0L6vdIkA0/5
	kth4HY4k5Xxv+0tjVviOfDveg/Z2EK3RBy4KW/dCYuDE+aZBlXr//XnsLCtzBuu57IEPx6D1qvM
	bsveJdbh/bedAhXVNRHfeoD1go=
X-Received: by 2002:a05:7301:6186:10b0:351:27f0:e411 with SMTP id 5a478bee46e88-3515de5a17fmr5307836eec.20.1791449638121;
        Thu, 08 Oct 2026 01:53:58 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af26f10sm16351759eec.13.2026.10.08.01.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:53:57 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/net: test generic-netlink policy dump operation ID
Date: Thu,  8 Oct 2026 14:24:34 +0530
Message-ID: <20261008085434.3681647-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that a generic-netlink policy dump reports the requested command's
operation ID rather than zero.

Request the policy for CTRL_CMD_GETPOLICY from the control family and
verify that the response contains operation ID 10. Register the test as
a generated net selftest and ignore its built binary.

Tested: reproduces the missing operation ID on 7.0.0-34-generic and
passes on fixed 7.3.0-rc6-00063-g0c2669a9f4a1 in QEMU.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/netlink_policy_dump_opid.c  | 223 ++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 tools/testing/selftests/net/netlink_policy_dump_opid.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index dacd36ed8455..5fa1c6024672 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -20,6 +20,7 @@ ipv6_fragmentation
 log.txt
 msg_zerocopy
 netlink-dumps
+netlink_policy_dump_opid
 nettest
 proc_net_pktgen
 psock_fanout
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 590b33e16d9f..09960735cb1a 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -186,6 +186,7 @@ TEST_GEN_PROGS := \
 	icmp_rfc4884 \
 	ipv6_flowlabel_mgr \
 	ipv6_fragmentation \
+	netlink_policy_dump_opid \
 	proc_net_pktgen \
 	reuseaddr_conflict \
 	reuseport_bpf \
diff --git a/tools/testing/selftests/net/netlink_policy_dump_opid.c b/tools/testing/selftests/net/netlink_policy_dump_opid.c
new file mode 100644
index 000000000000..4b53a8853109
--- /dev/null
+++ b/tools/testing/selftests/net/netlink_policy_dump_opid.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <errno.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <unistd.h>
+
+#include <linux/genetlink.h>
+#include <linux/netlink.h>
+
+#include "kselftest.h"
+
+#define REQUEST_SIZE 128
+#define REPLY_SIZE 4096
+
+struct genl_request {
+	struct nlmsghdr nlh;
+	struct genlmsghdr genl;
+	char attrs[REQUEST_SIZE];
+};
+
+static int add_attr(struct genl_request *request, size_t size, uint16_t type,
+		    const void *data, size_t data_size)
+{
+	size_t offset = NLMSG_ALIGN(request->nlh.nlmsg_len);
+	size_t attr_size = NLA_HDRLEN + data_size;
+	size_t aligned_size = NLA_ALIGN(attr_size);
+	struct nlattr *attr;
+
+	if (offset + aligned_size > size)
+		return -E2BIG;
+
+	attr = (struct nlattr *)((char *)request + offset);
+	attr->nla_len = attr_size;
+	attr->nla_type = type;
+	memcpy((char *)attr + NLA_HDRLEN, data, data_size);
+	memset((char *)attr + attr_size, 0, aligned_size - attr_size);
+	request->nlh.nlmsg_len = offset + aligned_size;
+
+	return 0;
+}
+
+static int next_attr(const char **cursor, size_t *remaining,
+		     struct nlattr **attr)
+{
+	size_t length, aligned_length;
+
+	if (!*remaining)
+		return 0;
+	if (*remaining < NLA_HDRLEN)
+		return -EBADMSG;
+
+	*attr = (struct nlattr *)*cursor;
+	length = (*attr)->nla_len;
+	if (length < NLA_HDRLEN || length > *remaining)
+		return -EBADMSG;
+	aligned_length = NLA_ALIGN(length);
+	if (aligned_length > *remaining)
+		return -EBADMSG;
+
+	*cursor += aligned_length;
+	*remaining -= aligned_length;
+	return 1;
+}
+
+static int find_op_id(const struct nlattr *op_policy, bool *found)
+{
+	const char *cursor = (const char *)op_policy + NLA_HDRLEN;
+	size_t remaining = op_policy->nla_len - NLA_HDRLEN;
+	struct nlattr *attr;
+	int ret;
+
+	while ((ret = next_attr(&cursor, &remaining, &attr)) > 0) {
+		if ((attr->nla_type & NLA_TYPE_MASK) == CTRL_CMD_GETPOLICY)
+			*found = true;
+	}
+
+	return ret;
+}
+
+static int parse_policy_message(const struct nlmsghdr *nlh, bool *found)
+{
+	const char *cursor = (const char *)nlh + NLMSG_LENGTH(GENL_HDRLEN);
+	size_t remaining = nlh->nlmsg_len - NLMSG_LENGTH(GENL_HDRLEN);
+	struct nlattr *attr;
+	int ret;
+
+	while ((ret = next_attr(&cursor, &remaining, &attr)) > 0) {
+		if ((attr->nla_type & NLA_TYPE_MASK) == CTRL_ATTR_OP_POLICY) {
+			ret = find_op_id(attr, found);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int check_policy_dump(int fd)
+{
+	struct genl_request request = {
+		.nlh = {
+			.nlmsg_len = NLMSG_LENGTH(GENL_HDRLEN),
+			.nlmsg_type = GENL_ID_CTRL,
+			.nlmsg_flags = NLM_F_REQUEST | NLM_F_DUMP | NLM_F_ACK,
+			.nlmsg_seq = 1,
+		},
+		.genl = {
+			.cmd = CTRL_CMD_GETPOLICY,
+			.version = 1,
+		},
+	};
+	char reply[REPLY_SIZE];
+	const __u16 family_id = GENL_ID_CTRL;
+	const __u32 op = CTRL_CMD_GETPOLICY;
+	bool found_op = false;
+	struct sockaddr_nl kernel = {
+		.nl_family = AF_NETLINK,
+	};
+	ssize_t sent;
+	int ret;
+
+	ret = add_attr(&request, sizeof(request), CTRL_ATTR_FAMILY_ID,
+		       &family_id, sizeof(family_id));
+	if (ret)
+		return ret;
+	ret = add_attr(&request, sizeof(request), CTRL_ATTR_OP,
+		       &op, sizeof(op));
+	if (ret)
+		return ret;
+
+	sent = sendto(fd, &request, request.nlh.nlmsg_len, 0,
+		      (struct sockaddr *)&kernel, sizeof(kernel));
+	if (sent < 0)
+		return -errno;
+	if (sent != request.nlh.nlmsg_len)
+		return -EIO;
+
+	for (;;) {
+		ssize_t received = recv(fd, reply, sizeof(reply), 0);
+		size_t offset = 0;
+
+		if (received < 0) {
+			if (errno == EINTR)
+				continue;
+			return -errno;
+		}
+
+		while (offset + NLMSG_HDRLEN <= received) {
+			struct nlmsghdr *nlh = (struct nlmsghdr *)(reply + offset);
+			size_t aligned_length;
+
+			if (nlh->nlmsg_len < NLMSG_HDRLEN ||
+			    nlh->nlmsg_len > received - offset)
+				return -EBADMSG;
+			if (nlh->nlmsg_seq != 1) {
+				offset += NLMSG_ALIGN(nlh->nlmsg_len);
+				continue;
+			}
+			if (nlh->nlmsg_type == NLMSG_ERROR) {
+				int error;
+
+				if (nlh->nlmsg_len < NLMSG_LENGTH(sizeof(error)))
+					return -EBADMSG;
+				error = *(int *)NLMSG_DATA(nlh);
+				if (error)
+					return error;
+			} else if (nlh->nlmsg_type == NLMSG_DONE) {
+				if (nlh->nlmsg_flags & NLM_F_DUMP_INTR)
+					return -EINTR;
+				return found_op ? 0 : -ENOENT;
+			} else if (nlh->nlmsg_type == GENL_ID_CTRL) {
+				if (nlh->nlmsg_len < NLMSG_LENGTH(GENL_HDRLEN))
+					return -EBADMSG;
+				ret = parse_policy_message(nlh, &found_op);
+				if (ret < 0)
+					return ret;
+			}
+
+			aligned_length = NLMSG_ALIGN(nlh->nlmsg_len);
+			if (aligned_length > received - offset)
+				return -EBADMSG;
+			offset += aligned_length;
+		}
+	}
+}
+
+int main(void)
+{
+	struct sockaddr_nl local = {
+		.nl_family = AF_NETLINK,
+	};
+	int fd, ret;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	fd = socket(AF_NETLINK, SOCK_RAW | SOCK_CLOEXEC, NETLINK_GENERIC);
+	if (fd < 0)
+		ksft_exit_fail_perror("opening generic-netlink socket");
+	if (bind(fd, (struct sockaddr *)&local, sizeof(local))) {
+		close(fd);
+		ksft_exit_fail_perror("binding generic-netlink socket");
+	}
+
+	ret = check_policy_dump(fd);
+	if (close(fd) && !ret)
+		ret = -errno;
+	if (ret == -ENOENT) {
+		ksft_test_result_fail("missing policy op id %u\n",
+				      CTRL_CMD_GETPOLICY);
+	} else if (ret) {
+		errno = -ret;
+		ksft_test_result_fail("GETPOLICY dump failed: %s\n",
+				      strerror(errno));
+	} else {
+		ksft_test_result_pass("policy dump identified command id %u\n",
+				      CTRL_CMD_GETPOLICY);
+	}
+	ksft_finished();
+}
-- 
2.43.0

