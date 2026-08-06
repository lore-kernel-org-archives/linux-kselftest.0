Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533C42A14C
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011168; cv=none; b=gH9jmFVadhPeUl8Ae8EMZChe+RIIGEco6N7PVwYHZUUdTnomTIl+nhBB2x4b1w2M1wchOgaR8HgRfXzB2NVzH7LiXlkFgXrLNfjZ19Txtn1E0FBHLp2xVopH7AL2liXQfhfCnx4nXV53BCfhmIh6Tj6KpGpa4/1/ryxOdu1cTDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011168; c=relaxed/simple;
	bh=tJZkQVtwb2qjjFvyr3KVCnCJ7+UJG/qi4Xu2JXjyjgU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqrWnOUH2wZun3oY/eTi6yQiZEmnbjTNWcCh0h2fObYQOvx5XfJILj4DvU8aGystkih9MjeVS3de8/z1xKgQKpeT1dPfiDBT4Y6Ru5FdstLiPFVdZivwpBEdypDm6GS7O3YpiXKlfUr2o29yoLY2BC91J2dlArQvwRoAuAMAsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MREQxzRY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MREQxzRY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso878603b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011166; x=1786615966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uyan3HYAysDdmSD1Jx4k3XmyCNsWmK9jFSOoc7MH43M=;
        b=MREQxzRY8v4WXkMZMbD1JzwklBY7hxvRGecGLm+nG654XrNM3nkoGtrxSbQQk/IhPR
         /pr1Up4S2UQ6p95kSGJD2+CnjlptWJRL1iFGVA5TB8uzYhdy6oTyxAjXwyCvxR//MqML
         EH+UdszWRAiXLzj0c/FjjQqpIpUqB3GRfYk4Rf6V9/k+ZPT2j7KIpqQLlpxeHucbBdvK
         ELryKOGM9JR9rOKgZ7/oEDmKMxhPDTCv79tOHv1JRRgNkBznSmPgINEfPlScINwf6eEF
         m9wz/7bxoDykhp4VERekbCaILosNeIfWzi8zs5trVNtH3jgWlFWGV4/8NyK1bDSRZRhV
         MBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011166; x=1786615966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uyan3HYAysDdmSD1Jx4k3XmyCNsWmK9jFSOoc7MH43M=;
        b=nYmzhC3qs1wkSRKppRmObZNUEzS7zB0CWGIsuGX3YIESHzd8PSkwi7Vbn68MdwoZ+r
         97AAgL8A7VdxsZLFKTfCov+WuUPaOoBmH64CPf7V8BuWkLzoxs+lyaUume1zlaVqmdnG
         7t59N3ERd1F8ycjEXmMfoMQ1U3uSYLMBTAiJXyBrGcpZLrrqGz1yTizk/vri1P9BUfwI
         eQ8XU35NCiWe6wjANDv/JKfFa4BFP3jVUTkSABzurCmvQtE443GsNxH1NlMtOZi5Id1z
         ry9XQpNSnVAw5Ocp+UgkAmc6pRhIASEquaJfKFINZp/LoLlBuvyDijGAETgOWzO6IOCB
         jisA==
X-Forwarded-Encrypted: i=1; AHgh+RqqzBDqMc7ibwY2XfeLTbKEbAwIP/dvTD48jQq+y2SDy58E7xRAPU7ehIozH+59RowA6ypj2JJZxyNy/+ETZ3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk09RyLSWtD9TX+rkGw75TwAEmFOyqC98w233OEaLHORo9S19F
	lrURsKiPjM6UZCtGNVCZVwrK1kbCyzObw/WGeiHRvVK4DR2i19dMT/3J
X-Gm-Gg: AR+sD12IyfEToZSo4r20I5G0hbWBRk/ViNsg/q0ryIL7nxbY63/X31UPVEHa00YK9wW
	UeGBcbCGSo4fEeC/aXwpDgaWtdfjfFp0q2vTYf+kFx0vp60nkjH1RmjOKrh5pKRyMPoX7os+jJG
	lXxAqy/+ik6vjPwF4qjINjzfCKwrj06WSbSpDXPPl+KLBwIkuRfeeXZUBMhbAoqM5OKDlq4sm7A
	3+WVUi+58QhcoGIjKrmF+fKU+BYqc7nJVHQLbBrsgxr8stEP3Q0fGx2hjSoMzveiXZZHF1Wd+WX
	uhrNABLwDMNbiJnW1fugRQdIkdhcG4taVJoBWiB9kICbPXoV0b9taUm3ZIJBpHrTojY/sKa05BZ
	o0MFPYby/kneS9fMQYXT3xoEW3tA4mKENRU13+yioulbLmEcaLkQT6aUNj6EJhkTSnyYsBRkBma
	EnlNZqudLGOYYk2yrqDAYQfL0idhwaWV05shpho6OMZFHxBr7rPm+B5AwH6Nb7hXKPnnnvFKG9X
	5rNTwJqdBCO6CssyiSsrsU35PQK4oJR289AU+Y=
X-Received: by 2002:a05:6a00:2e14:b0:842:446a:4cb5 with SMTP id d2e1a72fcca58-84f418a3e81mr6318346b3a.0.1786011166071;
        Thu, 06 Aug 2026 03:12:46 -0700 (PDT)
Received: from BOOK-P74QMIQ7E8.localdomain ([220.73.18.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm1090371b3a.59.2026.08.06.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:12:45 -0700 (PDT)
From: Hyunjung Ko <hj351016@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tao Liu <taoliu828@163.com>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net/sched: act_ct: fix sk_buff leak when the header checks reject a packet
Date: Thu,  6 Aug 2026 19:12:34 +0900
Message-Id: <20260806101235.809370-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcf_ct_handle_fragments() runs its header sanity checks before handing
anything to the defragmentation engine:

	if (family == NFPROTO_IPV4)
		err = tcf_ct_ipv4_is_fragment(skb, &frag);
	else
		err = tcf_ct_ipv6_is_fragment(skb, &frag);
	if (err || !frag)
		return err;

tcf_ct_ipv4_is_fragment() returns -EINVAL or -ENOMEM;
tcf_ct_ipv6_is_fragment() adds -EPROTO when ipv6_find_hdr() fails. None of
them frees or queues the skb, so on that path the caller still owns it.

tcf_ct_act() however funnels every non-zero return into the
ownership-transfer exit:

	err = tcf_ct_handle_fragments(net, skb, family, p->zone, &defrag);
	if (err)
		goto out_frag;
	...
out_frag:
	if (err != -EINPROGRESS)
		tcf_action_inc_drop_qstats(&c->common);
	return TC_ACT_CONSUMED;

TC_ACT_CONSUMED means the action took ownership of the skb, so no caller
frees it - sch_handle_ingress(), sch_handle_egress() and
tcf_qevent_handle() all deliberately skip the free for that verdict. The
skb is therefore orphaned: one sk_buff plus its data buffer is leaked per
malformed packet, unbounded. Note the drop counter is already incremented
for these errors, so the statistics claim a drop that never happens.

Three different ownership states reach out_frag: today - the skb may be
queued by the defrag engine (-EINPROGRESS), already freed by
nf_ct_handle_fragments(), or still owned by us. Tell the caller which of
those it is, and free the packet ourselves in the last case, which
restores the TC_ACT_SHOT behaviour that predated the Fixes: commit.

Reproduced on v7.2-rc6 with a 54-byte frame carrying a 40-byte IPv6
header with nexthdr = 0 (hop-by-hop) and nothing after it, on a
clsact ingress chain with "action ct". kmemleak reports one leaked
232-byte skbuff_head_cache object plus its 704-byte data buffer per
packet; with this patch it reports none.

Fixes: 3f14b377d01d ("net/sched: act_ct: fix skb leak and crash on ooo frags")
Cc: stable@vger.kernel.org # v6.8+
Assisted-by: Anthropic-Claude-Code:Claude-Opus-5
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 net/sched/act_ct.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

v2:
 - add a tdc selftest (patch 2/2), as requested by Jamal
 - add Assisted-by: tag
 - no functional change to the fix itself
v1: https://lore.kernel.org/netdev/20260805095539.204356-1-hj351016@gmail.com/

Reproducer needs CONFIG_NET_ACT_CT, plus CONFIG_DEBUG_KMEMLEAK and
kmemleak=on to observe it:

  ip link add veth0 type veth peer name veth1
  ip link set veth0 up; ip link set veth1 up
  tc qdisc add dev veth0 clsact
  tc filter add dev veth0 ingress matchall action ct

then inject at veth1 a 54-byte frame: ethertype 0x86DD, a 40-byte IPv6
header with nexthdr = 0 (hop-by-hop) and nothing after it, so
ipv6_find_hdr() fails with -EBADMSG and tcf_ct_ipv6_is_fragment()
returns -EPROTO.

Before, one sk_buff plus its data buffer per packet:

  kmemleak: 50 new suspected memory leaks
  unreferenced object 0xffff888103ed13c0 (size 232):
    kmem_cache_alloc_node_noprof+0x2f1/0x3e0
    __alloc_skb+0xe5/0x860
    alloc_skb_with_frags+0x82/0x750
    sock_alloc_send_pskb+0x658/0x7e0
    packet_sendmsg+0x1833/0x4860
    __x64_sys_sendto+0xe0/0x1c0
    do_syscall_64+0x102/0x5a0

After: kmemleak reports no unreferenced objects.

Note /proc/slabinfo is not a usable check here on a KASAN build -
skbuff_head_cache active_objs still grows because the quarantine holds
the freed objects. kmemleak is the reliable signal.

Patch 2/2 turns the same case into a tdc test, using the clsact drop
counter as the discriminator: before the fix act_ct returns
TC_ACT_CONSUMED, so tc_run() never reaches its TC_ACT_SHOT arm and the
counter stays at zero while the skbs leak.

diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
index be535a261fa0..e250969c84ac 100644
--- a/net/sched/act_ct.c
+++ b/net/sched/act_ct.c
@@ -840,8 +840,15 @@ static int tcf_ct_ipv6_is_fragment(struct sk_buff *skb, bool *frag)
 	return 0;
 }
 
+/* On error, tells the caller whether it still owns @skb and must free it
+ * itself.  @skb is ours only when the header checks below reject the packet
+ * before it is handed to the defragmentation engine; once nf_ct_handle_
+ * fragments() has been called the skb is either queued (-EINPROGRESS) or has
+ * already been freed by it.
+ */
 static int tcf_ct_handle_fragments(struct net *net, struct sk_buff *skb,
-				   u8 family, u16 zone, bool *defrag)
+				   u8 family, u16 zone, bool *defrag,
+				   bool *skb_is_ours)
 {
 	enum ip_conntrack_info ctinfo;
 	struct tc_skb_cb cb;
@@ -859,8 +866,12 @@ static int tcf_ct_handle_fragments(struct net *net, struct sk_buff *skb,
 		err = tcf_ct_ipv4_is_fragment(skb, &frag);
 	else
 		err = tcf_ct_ipv6_is_fragment(skb, &frag);
-	if (err || !frag)
+	if (err) {
+		*skb_is_ours = true;
 		return err;
+	}
+	if (!frag)
+		return 0;
 
 	cb = *tc_skb_cb(skb);
 	err = nf_ct_handle_fragments(net, skb, zone, family, &proto, &cb.mru);
@@ -977,6 +988,7 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 	int nh_ofs, err, retval;
 	struct tcf_ct_params *p;
 	bool add_helper = false;
+	bool skb_is_ours = false;
 	bool skip_add = false;
 	bool defrag = false;
 	struct nf_conn *ct;
@@ -1012,9 +1024,18 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb, const struct tc_action *a,
 	 */
 	nh_ofs = skb_network_offset(skb);
 	skb_pull_rcsum(skb, nh_ofs);
-	err = tcf_ct_handle_fragments(net, skb, family, p->zone, &defrag);
-	if (err)
+	err = tcf_ct_handle_fragments(net, skb, family, p->zone, &defrag,
+				      &skb_is_ours);
+	if (err) {
+		/* The skb is still ours only when the header checks rejected
+		 * it; returning TC_ACT_CONSUMED for such a packet would leak
+		 * it, since no caller frees an skb it was told it no longer
+		 * owns.
+		 */
+		if (skb_is_ours)
+			goto drop;
 		goto out_frag;
+	}
 
 	err = nf_ct_skb_network_trim(skb, family);
 	if (err)
--
2.43.0
