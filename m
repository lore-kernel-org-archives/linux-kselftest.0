Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C627E05F;
	Mon,  3 Aug 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756623; cv=none; b=R62CHf658cMpRL8cKatNdf10VqmuhelpFpJwrjOa4/Np9XkvYfG1F13FcI2vbOl2hMVWhZM7Wz9ew9QQP6rxftpgJRSnzAxur67oVt7TJCTzTMoSk9vCnl+srvst5v3G5x3wCwl1ESfyiJgjZxRfr4Q0GOeNZhVuJxzK5u7tHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756623; c=relaxed/simple;
	bh=Hs85dglrfAo/Uh5JedmOJRee71PJx6zwpCpXi46cqdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPTUE5e470TtywStfEpUT8Tl+3raELUalbrg3OAv5my0HSXkbejh1GHaknIyMGYVoTIGOf7yzjWjjm06a2OfVZtzVs3YGVc//Bq3Bj6si5Z3MLPmDE142O9tdIfiE+pUrI6B/2Nrov444b+1bHG+aAvkWPiXVK/TjzcdLvTNcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=PGYndcjS; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="PGYndcjS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=vR2SMvG3tXKazDEHCKt1Yd/rhEbVv3ddVI9ToE0+LfE=; b=PGYndcjS2LmSi1CKECT3xwfYNG
	mciq1htsC/q0yKQMmysVu2I1atarDXBRCTY6rLbX1+371v91enIQSW2iiZFE4RADUd1iFinukA+Pv
	LceZgyYJwSL/j0tSP0qdmgvLAyTpUt6646VgZkt/8+hTMR4/hC4e0G7Gbo70n3j2JW13toaf/jO6f
	xKAcJwtVMns2ZkNmNzJYKDSWu0j26VfFVpBskrNhhZvH4dwwWfdxi+FFG2k1JYLn0+8bGqDpvYI+l
	agc3dtUriT90S9jTeHSsVekHXs1gX4oP0Acgf8AVnAPWeNR8JBpXfZ6OW1Z79P8s7pLBbZl8aebzs
	FWrfzRpA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wqqs4-00CKNf-35;
	Mon, 03 Aug 2026 11:30:17 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 03 Aug 2026 04:30:03 -0700
Subject: [PATCH net-next 1/2] netconsole: publish the userdata payload with
 RCU
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-netcons-userdata-rcu-v1-1-1e5e6b62b75d@debian.org>
References: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
In-Reply-To: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=7936; i=leitao@debian.org;
 h=from:subject:message-id; bh=Hs85dglrfAo/Uh5JedmOJRee71PJx6zwpCpXi46cqdw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcHvARRRJnfCZOMQct3ZAHnxixZp6g+DjOX6QF
 6aVnCmtKguJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanB7wAAKCRA1o5Of/Hh3
 bfbYD/0TAYygFlwd+LB9KF765yVTVcqod/eYVxKiE9ya6/paUZT4Nu1JUb9SxRa6N4eG28GuVrk
 S6yNakpYQblpEjEEmsbz3smgDF+s7OgQdV/leKcWQngqwiZ0/bJGAP9d6gNOxCqZbAgG7m7NmyL
 DOogZePLzX57GRBpIPLPIyTtdmeZNvf8ADDEW4Am2N/EOJdEXuRwsJDJsB+V8MbPu1MaPAfupJr
 QVnk9YgzX6XjoBdbXf1e7gHkAZ19zfU6OT2PJUIUBLa8zdfund1t15F9wsY5cqv4vLjvvRNSfw0
 i2a0FLjxPA1B/VULedCka9gI5n8wiDQN1eLCnIx13lr1JegyflsflaMzhMLVlhAaAjNutH2D08J
 mEY8F5iSRG6C99Ca9QANlnnDg2uof5oImTm34UPpCGhfapneKs1h+KTV8TIvzO5XGOFF1rd2u/j
 Sa9Qqddyn1Tx9Ztp/UY1t8bS4dFZQH+FjntuBC8RFFymCnAEfY1aIHMviP3fN3BHUSh9SovFACx
 vmJkjqFiV6bv3F+o/PAIMrk4f1bwIkOghOEQKdchm18glkkp5MulOSwy+QT7xX1QhBihM/JQ6A4
 E65qC1do8kd7jFd6Zj3u4Wqk3OZjeaPfC8ul0KoZiMEDvlek/ZB7xnCWSPvUkGT0e92oFy3qJEa
 6HCZy0M8HccE9UA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

update_userdata() takes target_list_lock to swap nt->userdata and
nt->userdata_length, then frees the old buffer. Since commit
7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
that lock is also the console's device_lock, so writing a userdata value
from configfs serialises against the printk core emitting messages.

The buffer is immutable once published, which is what RCU is for. Move
the string and its length into a single netconsole_userdata object and
publish it with rcu_replace_pointer(), freeing the old one with
kfree_rcu().

New userdata design:

0) Unify the userdata fields into a struct netcons_userdata
1) update_userdata() no longer needs target_list_lock.
2) writers stay serialised by dynamic_netconsole_mutex.
3) reading userdata needs an RCU read lock.

No functional change intended.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 88 +++++++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 862001d09aa84..c88c82f2136cb 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -135,13 +135,27 @@ enum target_state {
 	STATE_DEACTIVATED,
 };
 
+/**
+ * struct netcons_userdata - Formatted userdata payload of a target.
+ * @rcu:	Used to free the payload after a grace period.
+ * @length:	Length of @data, excluding the NUL terminator.
+ * @data:	Formatted " key=value\n" entries, NUL terminated.
+ *
+ * Immutable once published, so the transmit path never observes @data and
+ * @length disagreeing.
+ */
+struct netcons_userdata {
+	struct rcu_head		rcu;
+	size_t			length;
+	char			data[];
+};
+
 /**
  * struct netconsole_target - Represents a configured netconsole target.
  * @list:	Links this target into the target_list.
  * @group:	Links us into the configfs subsystem hierarchy.
  * @userdata_group:	Links to the userdata configfs hierarchy
- * @userdata:		Cached, formatted string of append
- * @userdata_length:	String length of userdata.
+ * @userdata:		Cached, formatted userdata payload. RCU protected.
  * @sysdata:		Cached, formatted string of append
  * @sysdata_fields:	Sysdata features enabled.
  * @msgcounter:	Message sent counter.
@@ -176,8 +190,7 @@ struct netconsole_target {
 #ifdef	CONFIG_NETCONSOLE_DYNAMIC
 	struct config_group	group;
 	struct config_group	userdata_group;
-	char			*userdata;
-	size_t			userdata_length;
+	struct netcons_userdata __rcu *userdata;
 	char			sysdata[MAX_EXTRADATA_ENTRY_LEN * MAX_SYSDATA_ITEMS];
 
 	/* bit-wise with sysdata_feature bits */
@@ -1059,12 +1072,11 @@ static int calc_userdata_len(struct netconsole_target *nt)
 
 static int update_userdata(struct netconsole_target *nt)
 {
+	struct netcons_userdata *new = NULL;
+	struct netcons_userdata *old;
 	struct userdatum *udm_item;
 	struct config_item *item;
 	struct list_head *entry;
-	char *old_buf = NULL;
-	char *new_buf = NULL;
-	unsigned long flags;
 	int offset = 0;
 	int len;
 
@@ -1076,8 +1088,8 @@ static int update_userdata(struct netconsole_target *nt)
 
 	/* Allocate new buffer */
 	if (len) {
-		new_buf = kmalloc(len + 1, GFP_KERNEL);
-		if (!new_buf)
+		new = kmalloc_flex(*new, data, len + 1);
+		if (!new)
 			return -ENOMEM;
 	}
 
@@ -1087,22 +1099,21 @@ static int update_userdata(struct netconsole_target *nt)
 		udm_item = to_userdatum(item);
 		/* Skip userdata with no value set */
 		if (udm_item->value[0]) {
-			offset += scnprintf(&new_buf[offset], len + 1 - offset,
+			offset += scnprintf(&new->data[offset],
+					    len + 1 - offset,
 					    " %s=%s\n", item->ci_name,
 					    udm_item->value);
 		}
 	}
 
 	WARN_ON_ONCE(offset != len);
+	if (new)
+		new->length = offset;
 
-	/* Switch to new buffer and free old buffer */
-	spin_lock_irqsave(&target_list_lock, flags);
-	old_buf = nt->userdata;
-	nt->userdata = new_buf;
-	nt->userdata_length = offset;
-	spin_unlock_irqrestore(&target_list_lock, flags);
-
-	kfree(old_buf);
+	/* Writers are serialized by dynamic_netconsole_mutex. */
+	old = rcu_replace_pointer(nt->userdata, new,
+				  lockdep_is_held(&dynamic_netconsole_mutex));
+	kfree_rcu(old, rcu);
 
 	return 0;
 }
@@ -1926,14 +1937,13 @@ static void send_udp(struct netconsole_target *nt, const char *msg, int len)
 static void send_msg_no_fragmentation(struct netconsole_target *nt,
 				      const char *msg,
 				      int msg_len,
-				      int release_len)
+				      int release_len,
+				      const struct netcons_userdata *userdata)
 {
-	const char *userdata = NULL;
 	const char *sysdata = NULL;
 	const char *release;
 
 #ifdef CONFIG_NETCONSOLE_DYNAMIC
-	userdata = nt->userdata;
 	sysdata = nt->sysdata;
 #endif
 
@@ -1950,7 +1960,7 @@ static void send_msg_no_fragmentation(struct netconsole_target *nt,
 	if (userdata)
 		msg_len += scnprintf(&nt->buf[msg_len],
 				     sizeof(nt->buf) - msg_len, "%s",
-				     userdata);
+				     userdata->data);
 
 	if (sysdata)
 		msg_len += scnprintf(&nt->buf[msg_len],
@@ -1970,7 +1980,8 @@ static void append_release(char *buf)
 
 static void send_fragmented_body(struct netconsole_target *nt,
 				 const char *msgbody_ptr, int header_len,
-				 int msgbody_len, int sysdata_len)
+				 int msgbody_len, int sysdata_len,
+				 const struct netcons_userdata *userdata)
 {
 	const char *userdata_ptr = NULL;
 	const char *sysdata_ptr = NULL;
@@ -1981,12 +1992,12 @@ static void send_fragmented_body(struct netconsole_target *nt,
 	int userdata_len = 0;
 
 #ifdef CONFIG_NETCONSOLE_DYNAMIC
-	userdata_ptr = nt->userdata;
 	sysdata_ptr = nt->sysdata;
-	userdata_len = nt->userdata_length;
 #endif
-	if (WARN_ON_ONCE(!userdata_ptr && userdata_len != 0))
-		return;
+	if (userdata) {
+		userdata_ptr = userdata->data;
+		userdata_len = userdata->length;
+	}
 
 	if (WARN_ON_ONCE(!sysdata_ptr && sysdata_len != 0))
 		return;
@@ -2063,7 +2074,8 @@ static void send_msg_fragmented(struct netconsole_target *nt,
 				const char *msg,
 				int msg_len,
 				int release_len,
-				int sysdata_len)
+				int sysdata_len,
+				const struct netcons_userdata *userdata)
 {
 	int header_len, msgbody_len;
 	const char *msgbody;
@@ -2092,7 +2104,7 @@ static void send_msg_fragmented(struct netconsole_target *nt,
 	 * will be replaced
 	 */
 	send_fragmented_body(nt, msgbody, header_len, msgbody_len,
-			     sysdata_len);
+			     sysdata_len, userdata);
 }
 
 /**
@@ -2107,25 +2119,33 @@ static void send_msg_fragmented(struct netconsole_target *nt,
 static void send_ext_msg_udp(struct netconsole_target *nt,
 			     struct nbcon_write_context *wctxt)
 {
+	const struct netcons_userdata *userdata = NULL;
 	int userdata_len = 0;
 	int release_len = 0;
 	int sysdata_len = 0;
 	int len;
 
+	/* Keeps the payload picked below alive until the last send_udp(). */
+	rcu_read_lock();
+
 #ifdef CONFIG_NETCONSOLE_DYNAMIC
 	sysdata_len = prepare_sysdata(nt, wctxt);
-	userdata_len = nt->userdata_length;
+	userdata = rcu_dereference(nt->userdata);
+	if (userdata)
+		userdata_len = userdata->length;
 #endif
 	if (nt->release)
 		release_len = strlen(init_utsname()->release) + 1;
 
 	len = wctxt->len + release_len + sysdata_len + userdata_len;
 	if (len <= MAX_PRINT_CHUNK)
-		return send_msg_no_fragmentation(nt, wctxt->outbuf,
-						 wctxt->len, release_len);
+		send_msg_no_fragmentation(nt, wctxt->outbuf, wctxt->len,
+					  release_len, userdata);
+	else
+		send_msg_fragmented(nt, wctxt->outbuf, wctxt->len, release_len,
+				    sysdata_len, userdata);
 
-	return send_msg_fragmented(nt, wctxt->outbuf, wctxt->len, release_len,
-				   sysdata_len);
+	rcu_read_unlock();
 }
 
 static void send_msg_udp(struct netconsole_target *nt, const char *msg,

-- 
2.53.0-Meta

