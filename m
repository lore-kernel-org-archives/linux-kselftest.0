Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B700477E57
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543903; cv=none; b=NeWE17+Tnq2xAEzrez0qs4OVKOn7x7/MTfDo9+cXLgTWKCr8R6FMt5LDnztdk6CqkO1t2iIbWqIQ3f5T3HLIHl+IZnxzgkeuDgprmkhd4IfOpOvl35tyo79svtjt2kjh7J2n24b7bu7JJJw7yI5efn3P0TILkFMYF0HcIBug1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543903; c=relaxed/simple;
	bh=QxoyOPmnBP+2vXmnQmmz4vCdiQx0RF4yUXLxKepKWhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIrtJSBKrqGfvTjtYXU2RFhvhK60ZRbjUInvQPaQBMQA+qPa22OuZjUv+pgndkyVlB1z7vJmJ0wFO/9BCWt1pVuW9ffjrEcM/aa4bsbCDE3l4vVfKnZuSlROSS1uusSAHqozHyDc8ApEs2nyTGkRS9MJNeHlQ3fUzNiReY8l4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-483960225ccso379483f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 10:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543898; x=1789148698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4kzJ/kne5IQ47RkaKkc8cz1uyvHKgyGYe6SvCcVy1s=;
        b=DOypybtDVNqtnvoibpL12ZdQfcf9ZGPzB0FIhzrkoSY6GtmHznTkwHiDbyP20MFcmZ
         OkDK937gv+ozOAH2UDnnr7IBNhsmJAiE2n0sAJSaUBPSDrNxoRuS15xNtiyeix3kX3Eh
         7WELwSxU1/sZfpRxsuh+h1nfn4WQAP7jWFXAoOS+sYR/Bddqz/j4DMaZBDdUFgC2dULg
         Vz0Zj+hY7+bbIK7sBwO+6crOrVL+8iBVEFHVKRPOFeBlQBT8bSTktM/Y9Jrp6pIlOAaW
         Wf+ZbL1+STBxMXJGSzm08hTHErzrQcdpSFAYHXsxI/sFLabpd/0fVLqB1aqzdOsIJF+Z
         XXMg==
X-Forwarded-Encrypted: i=1; AKwUvByW5YVYY/07aAvZjzRsbIj44AGZgra1Ff/AU3ijv2ntioSOq0Q7i+gkJmUZcVzB+Bb3SFd8+WqhS10oJPNnb6k=@vger.kernel.org
X-Gm-Message-State: AFuF++nN+GNyzIqJlpGO9CREBS1VTHWUpVnEl2DX/peKEHPCcs847bWu
	u9rjW6WNXueVIyGbyHaQKn7sQkFqGEp2AdFEBW9UbjgIf46IxGxD4kl+
X-Gm-Gg: AYBFou3GcRM1Od5qL4NP991UTmA+XQJuZjpq4rgd0EpqE4UiN5EW2xCVwqU1Tg5bkzc
	JQSYZcpO6mLWJfDECCu3bu3uRUv/+mJJJ4clYWGVuvhv5PBrRqCdDxgpy33Rg5ueJizWLbm6mqm
	Oe2pooJENEkpMlwNqg9CwH+FhGnIZ2kdCIRoC309aWq5hyVR99ox8XtW68szAb/Kmu8HayUZ53c
	WwKvNtSiGv/uxsL/R6DcUgsNuHM1ku2nuhgfoio+ODGsGxixkvvQKGNigDPXm8BL0waNPracaOS
	Lcx8aBfO+c3wM2hCgsP2u8M71edKw+364/UolZFpz2GVKkstprgRsQ0jTJRbsLB9OH5dpVXFduE
	lq87i8QqTDdKvBGhHr/zZVAqSXQhhQ5jp9q7dfejDnE1yK/nsh3iMha1JdrYY+OYjfKSqvpzoiX
	j8RQPcF+4QYkwsF1tc1115VERi4KY4CTPZJVDODcnL7qNBRCgPZJyz5j87X9jVzGBqq80mfDHLv
	mPReAQrsQD0D7pVACY=
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr91107025e9.12.1788543897684;
        Fri, 04 Sep 2026 10:44:57 -0700 (PDT)
Received: from im-t490s.redhat.corp (37-48-53-4.nat.epc.tmcz.cz. [37.48.53.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm36889475e9.4.2026.09.04.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:44:56 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netfilter-devel@vger.kernel.org
Cc: netdev@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	linux-kernel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH nf-next] netfilter: conntrack: make filtering by zone discoverable
Date: Fri,  4 Sep 2026 19:44:45 +0200
Message-ID: <20260904174452.1913072-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conntrack flush supports filtering by zone using CTA_ZONE, but this
attribute is really hard to use from user space applications.  The
reason is that it is not possible to tell if it's supported or not.

Older kernels silently ignore CTA_ZONE.  And in that case they just
happily flush all the entries from all zones breaking all the existing
connections.  So, applications have to infer support from the kernel
version.  While it works in most cases, it's not a particularly
reliable or desired way to check kernel capabilities from applications
that aim to be portable.  There should be a better way to probe or
discover features in the kernel.

The CTA_FILTER interface on the other hand is simple enough to probe.
We can check for NLM_F_DUMP_FILTERED in the dump to see if filtering
is supported.  And unknown sub-attributes in CTA_FILTER are rejected
explicitly since strict validation is in use there.

Let's add new CTA_FILTER_ZONE that signals that CTA_ZONE should be
filtered on.  It is a flag, since everything in the CTA_FILTER is a
bit mask, i.e., a form of a flag.  If set, it means that CTA_ZONE must
be present and be used for filtering.  If the flag is not set however,
the filtering on CTA_ZONE will still take place to ensure backwards
compatibility.  So, the flag doesn't really change the filtering
behavior, but it allows user space applications to properly discover
support for CTA_ZONE filtering without need to rely on kernel version
parsing or risk accidental flushes of the entire conntrack table,
and also without modifying the kernel state.

A new test variant is added to test with and without the new flag.
Since the setup code is moved into a shared function, expectations
replaced with assertions to bail early if the base setup fails to
avoid the cascade of secondary failures that can be misleading.
Error return is only for the SKIP cases.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---

One other alternative is to make CTA_FILTER_ZONE a U16 sub-attribute
instead of a FLAG and prioritize it over the CTA_ZONE.  But it feels
like a FLAG is better suited for the CTA_FILTER, even if it takes a
bit of extra space in the request.  Though I'm OK with reworking this
into U16 or some other mechanism that would make the feature
discoverable, if there are better ideas.

 Documentation/netlink/specs/conntrack.yaml    |   5 +
 .../linux/netfilter/nfnetlink_conntrack.h     |   1 +
 net/netfilter/nf_conntrack_netlink.c          |  11 ++
 .../net/netfilter/conntrack_dump_flush.c      | 143 ++++++++++++------
 4 files changed, 115 insertions(+), 45 deletions(-)

diff --git a/Documentation/netlink/specs/conntrack.yaml b/Documentation/netlink/specs/conntrack.yaml
index b1eb102ab8432..cfc113ba34029 100644
--- a/Documentation/netlink/specs/conntrack.yaml
+++ b/Documentation/netlink/specs/conntrack.yaml
@@ -371,6 +371,11 @@ attribute-sets:
         name: reply-flags
         type: u32
         doc: bitmask of tuple fields to filter on, reply direction
+      -
+        name: zone
+        type: flag
+        doc: filter on conntrack zone id; requires the top-level zone
+          (``CTA_ZONE``) attribute
   -
     name: conntrack-attrs
     attributes:
diff --git a/include/uapi/linux/netfilter/nfnetlink_conntrack.h b/include/uapi/linux/netfilter/nfnetlink_conntrack.h
index 43233af75b9d5..985f9c08d3e9b 100644
--- a/include/uapi/linux/netfilter/nfnetlink_conntrack.h
+++ b/include/uapi/linux/netfilter/nfnetlink_conntrack.h
@@ -285,6 +285,7 @@ enum ctattr_filter {
 	CTA_FILTER_UNSPEC,
 	CTA_FILTER_ORIG_FLAGS,
 	CTA_FILTER_REPLY_FLAGS,
+	CTA_FILTER_ZONE,
 	__CTA_FILTER_MAX
 };
 #define CTA_FILTER_MAX (__CTA_FILTER_MAX - 1)
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 9b4e29557ec33..ffc29a407749d 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -911,6 +911,7 @@ struct ctnetlink_filter {
 static const struct nla_policy cta_filter_nla_policy[CTA_FILTER_MAX + 1] = {
 	[CTA_FILTER_ORIG_FLAGS]		= NLA_POLICY_MASK(NLA_U32, CTA_FILTER_F_ALL),
 	[CTA_FILTER_REPLY_FLAGS]	= NLA_POLICY_MASK(NLA_U32, CTA_FILTER_F_ALL),
+	[CTA_FILTER_ZONE]		= { .type = NLA_FLAG },
 };
 
 static int ctnetlink_parse_filter(const struct nlattr *attr,
@@ -930,6 +931,9 @@ static int ctnetlink_parse_filter(const struct nlattr *attr,
 	if (tb[CTA_FILTER_REPLY_FLAGS])
 		filter->reply_flags = nla_get_u32(tb[CTA_FILTER_REPLY_FLAGS]);
 
+	if (tb[CTA_FILTER_ZONE])
+		filter->zone_filter = true;
+
 	return 0;
 }
 
@@ -1006,6 +1010,7 @@ ctnetlink_alloc_filter(const struct nlattr * const cda[], u8 family)
 	if (err)
 		goto err_filter;
 
+	/* CTA_ZONE is allowed without CTA_FILTER_ZONE. */
 	if (cda[CTA_ZONE]) {
 		err = ctnetlink_parse_zone(cda[CTA_ZONE], &filter->zone);
 		if (err < 0)
@@ -1020,6 +1025,12 @@ ctnetlink_alloc_filter(const struct nlattr * const cda[], u8 family)
 	if (err < 0)
 		goto err_filter;
 
+	/* CTA_FILTER_ZONE cannot be set without CTA_ZONE. */
+	if (filter->zone_filter && !cda[CTA_ZONE]) {
+		err = -EINVAL;
+		goto err_filter;
+	}
+
 	if (filter->orig_flags) {
 		if (!cda[CTA_TUPLE_ORIG]) {
 			err = -EINVAL;
diff --git a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
index 31b8250ddc53d..63f41356fe6d6 100644
--- a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
+++ b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
@@ -215,7 +215,22 @@ static int count_entries(const struct nlmsghdr *nlh, void *data)
 	return MNL_CB_OK;
 }
 
-static int conntrack_count_zone(struct mnl_socket *sock, uint16_t zone)
+static void put_zone_attr(struct nlmsghdr *nlh, uint16_t zone,
+			  bool use_cta_filter)
+{
+	struct nlattr *nest;
+
+	mnl_attr_put_u16(nlh, CTA_ZONE, htons(zone));
+
+	if (use_cta_filter) {
+		nest = mnl_attr_nest_start(nlh, CTA_FILTER);
+		mnl_attr_put(nlh, CTA_FILTER_ZONE, 0, NULL);
+		mnl_attr_nest_end(nlh, nest);
+	}
+}
+
+static int conntrack_count_zone(struct mnl_socket *sock, uint16_t zone,
+				bool use_cta_filter)
 {
 	char buf[MNL_SOCKET_BUFFER_SIZE];
 	struct nlmsghdr *nlh;
@@ -235,7 +250,7 @@ static int conntrack_count_zone(struct mnl_socket *sock, uint16_t zone)
 	nfh->version = NFNETLINK_V0;
 	nfh->res_id = 0;
 
-	mnl_attr_put_u16(nlh, CTA_ZONE, htons(zone));
+	put_zone_attr(nlh, zone, use_cta_filter);
 
 	ret = mnl_socket_sendto(sock, nlh, nlh->nlmsg_len);
 	if (ret < 0) {
@@ -261,7 +276,8 @@ static int conntrack_count_zone(struct mnl_socket *sock, uint16_t zone)
 	return reply_counter;
 }
 
-static int conntrack_flush_zone(struct mnl_socket *sock, uint16_t zone)
+static int conntrack_flush_zone(struct mnl_socket *sock, uint16_t zone,
+				bool use_cta_filter)
 {
 	char buf[MNL_SOCKET_BUFFER_SIZE];
 	struct nlmsghdr *nlh;
@@ -281,7 +297,7 @@ static int conntrack_flush_zone(struct mnl_socket *sock, uint16_t zone)
 	nfh->version = NFNETLINK_V0;
 	nfh->res_id = 0;
 
-	mnl_attr_put_u16(nlh, CTA_ZONE, htons(zone));
+	put_zone_attr(nlh, zone, use_cta_filter);
 
 	ret = mnl_socket_sendto(sock, nlh, nlh->nlmsg_len);
 	if (ret < 0) {
@@ -304,43 +320,40 @@ static int conntrack_flush_zone(struct mnl_socket *sock, uint16_t zone)
 	return 0;
 }
 
-FIXTURE(conntrack_dump_flush)
-{
-	struct mnl_socket *sock;
-};
-
-FIXTURE_SETUP(conntrack_dump_flush)
+static int conntrack_zone_setup(struct __test_metadata *_metadata,
+				struct mnl_socket **sock)
 {
 	struct in6_addr src, dst;
 	int ret;
 
-	self->sock = mnl_socket_open(NETLINK_NETFILTER);
-	if (!self->sock) {
+	*sock = mnl_socket_open(NETLINK_NETFILTER);
+	if (!*sock) {
 		perror("mnl_socket_open");
-		SKIP(return, "cannot open netlink_netfilter socket");
+		SKIP(return -1, "cannot open netlink_netfilter socket");
 	}
 
-	ret = mnl_socket_bind(self->sock, 0, MNL_SOCKET_AUTOPID);
+	ret = mnl_socket_bind(*sock, 0, MNL_SOCKET_AUTOPID);
 	EXPECT_EQ(ret, 0);
 
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID);
+	ret = conntrack_count_zone(*sock, TEST_ZONE_ID, false);
 	if (ret < 0 && errno == EPERM)
-		SKIP(return, "Needs to be run as root");
+		SKIP(return -1, "Needs to be run as root");
 	else if (ret < 0 && errno == EOPNOTSUPP)
-		SKIP(return, "Kernel does not seem to support conntrack zones");
+		SKIP(return -1,
+		     "Kernel does not seem to support conntrack zones");
 
-	ret = conntrack_data_generate_v4(self->sock, 0xf0f0f0f0, 0xf1f1f1f1,
+	ret = conntrack_data_generate_v4(*sock, 0xf0f0f0f0, 0xf1f1f1f1,
 					 TEST_ZONE_ID);
-	EXPECT_EQ(ret, 0);
-	ret = conntrack_data_generate_v4(self->sock, 0xf2f2f2f2, 0xf3f3f3f3,
+	ASSERT_EQ(ret, 0);
+	ret = conntrack_data_generate_v4(*sock, 0xf2f2f2f2, 0xf3f3f3f3,
 					 TEST_ZONE_ID + 1);
-	EXPECT_EQ(ret, 0);
-	ret = conntrack_data_generate_v4(self->sock, 0xf4f4f4f4, 0xf5f5f5f5,
+	ASSERT_EQ(ret, 0);
+	ret = conntrack_data_generate_v4(*sock, 0xf4f4f4f4, 0xf5f5f5f5,
 					 TEST_ZONE_ID + 2);
-	EXPECT_EQ(ret, 0);
-	ret = conntrack_data_generate_v4(self->sock, 0xf6f6f6f6, 0xf7f7f7f7,
+	ASSERT_EQ(ret, 0);
+	ret = conntrack_data_generate_v4(*sock, 0xf6f6f6f6, 0xf7f7f7f7,
 					 NF_CT_DEFAULT_ZONE_ID);
-	EXPECT_EQ(ret, 0);
+	ASSERT_EQ(ret, 0);
 
 	src = (struct in6_addr) {{
 		.__u6_addr32 = {
@@ -358,9 +371,9 @@ FIXTURE_SETUP(conntrack_dump_flush)
 			0x02000000
 		}
 	}};
-	ret = conntrack_data_generate_v6(self->sock, src, dst,
+	ret = conntrack_data_generate_v6(*sock, src, dst,
 					 TEST_ZONE_ID);
-	EXPECT_EQ(ret, 0);
+	ASSERT_EQ(ret, 0);
 	src = (struct in6_addr) {{
 		.__u6_addr32 = {
 			0xb80d0120,
@@ -377,9 +390,9 @@ FIXTURE_SETUP(conntrack_dump_flush)
 			0x04000000
 		}
 	}};
-	ret = conntrack_data_generate_v6(self->sock, src, dst,
+	ret = conntrack_data_generate_v6(*sock, src, dst,
 					 TEST_ZONE_ID + 1);
-	EXPECT_EQ(ret, 0);
+	ASSERT_EQ(ret, 0);
 	src = (struct in6_addr) {{
 		.__u6_addr32 = {
 			0xb80d0120,
@@ -396,9 +409,9 @@ FIXTURE_SETUP(conntrack_dump_flush)
 			0x06000000
 		}
 	}};
-	ret = conntrack_data_generate_v6(self->sock, src, dst,
+	ret = conntrack_data_generate_v6(*sock, src, dst,
 					 TEST_ZONE_ID + 2);
-	EXPECT_EQ(ret, 0);
+	ASSERT_EQ(ret, 0);
 
 	src = (struct in6_addr) {{
 		.__u6_addr32 = {
@@ -416,14 +429,51 @@ FIXTURE_SETUP(conntrack_dump_flush)
 			0x08000000
 		}
 	}};
-	ret = conntrack_data_generate_v6(self->sock, src, dst,
+	ret = conntrack_data_generate_v6(*sock, src, dst,
 					 NF_CT_DEFAULT_ZONE_ID);
-	EXPECT_EQ(ret, 0);
+	ASSERT_EQ(ret, 0);
 
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID);
+	return 0;
+}
+
+FIXTURE(conntrack_dump_flush)
+{
+	struct mnl_socket *sock;
+};
+
+FIXTURE_VARIANT(conntrack_dump_flush)
+{
+	bool use_cta_filter;
+};
+
+FIXTURE_VARIANT_ADD(conntrack_dump_flush, cta_zone)
+{
+	.use_cta_filter = false,
+};
+
+FIXTURE_VARIANT_ADD(conntrack_dump_flush, cta_filter)
+{
+	.use_cta_filter = true,
+};
+
+FIXTURE_SETUP(conntrack_dump_flush)
+{
+	int ret;
+
+	if (conntrack_zone_setup(_metadata, &self->sock))
+		return;
+
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID, false);
 	EXPECT_GE(ret, 2);
 	if (ret > 2)
 		SKIP(return, "kernel does not support filtering by zone");
+
+	if (variant->use_cta_filter) {
+		ret = conntrack_count_zone(self->sock, TEST_ZONE_ID, true);
+		if (ret < 0 && errno == EINVAL)
+			SKIP(return, "kernel does not support CTA_FILTER_ZONE");
+		ASSERT_GE(ret, 0);
+	}
 }
 
 FIXTURE_TEARDOWN(conntrack_dump_flush)
@@ -434,39 +484,42 @@ TEST_F(conntrack_dump_flush, test_dump_by_zone)
 {
 	int ret;
 
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID,
+				   variant->use_cta_filter);
 	EXPECT_EQ(ret, 2);
 }
 
 TEST_F(conntrack_dump_flush, test_flush_by_zone)
 {
+	bool filter = variant->use_cta_filter;
 	int ret;
 
-	ret = conntrack_flush_zone(self->sock, TEST_ZONE_ID);
+	ret = conntrack_flush_zone(self->sock, TEST_ZONE_ID, filter);
 	EXPECT_EQ(ret, 0);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID, filter);
 	EXPECT_EQ(ret, 0);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 1);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 1, filter);
 	EXPECT_EQ(ret, 2);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 2);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 2, filter);
 	EXPECT_EQ(ret, 2);
-	ret = conntrack_count_zone(self->sock, NF_CT_DEFAULT_ZONE_ID);
+	ret = conntrack_count_zone(self->sock, NF_CT_DEFAULT_ZONE_ID, filter);
 	EXPECT_EQ(ret, 2);
 }
 
 TEST_F(conntrack_dump_flush, test_flush_by_zone_default)
 {
+	bool filter = variant->use_cta_filter;
 	int ret;
 
-	ret = conntrack_flush_zone(self->sock, NF_CT_DEFAULT_ZONE_ID);
+	ret = conntrack_flush_zone(self->sock, NF_CT_DEFAULT_ZONE_ID, filter);
 	EXPECT_EQ(ret, 0);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID, filter);
 	EXPECT_EQ(ret, 2);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 1);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 1, filter);
 	EXPECT_EQ(ret, 2);
-	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 2);
+	ret = conntrack_count_zone(self->sock, TEST_ZONE_ID + 2, filter);
 	EXPECT_EQ(ret, 2);
-	ret = conntrack_count_zone(self->sock, NF_CT_DEFAULT_ZONE_ID);
+	ret = conntrack_count_zone(self->sock, NF_CT_DEFAULT_ZONE_ID, filter);
 	EXPECT_EQ(ret, 0);
 }
 
-- 
2.55.0

