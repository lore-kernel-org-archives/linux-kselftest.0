Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015003D9545;
	Wed,  5 Aug 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927557; cv=none; b=F/D5gvhL1pEj4R4cwU8FrMd9n8DsR/lr5re7Vx2Rg+XTNjyARfm5mwA3vxzYQWnSTsCCgCqtrEtvN0OyCTMVtnv9Um/KbY4GEjTnt5rJWZV5XPD3KPJJh5cdxmT7FX7d9gcbq9Sn3jONU5wWZTjSssREoTMR0Pq7m+sMtJ2pehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927557; c=relaxed/simple;
	bh=wLGKCNog8+m8abD/kjwLtMo1+vBYXg7HqfBu+BVQlhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVyNEXhlty/wvmoQffhKvM0Qg6RByhSsqKvGKwYPsU71diiEMVPCRUMEL0X2uBF7i2bZ3W8NvB0rzwkq+N2hVfYeKTnd+uq9P4CLM/Tw1p54ed6UdmdzXuK+PzypaDhgs7IOVw2RbqaZ5wDQqllX5NcdSRYMLxevdFL0wy7pXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=rLrqYqYw; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="rLrqYqYw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=gNVUO/AfyFVjoPlB6G7IBcBKUi8NdH5E7PNb7ECR5qs=; b=rLrqYqYwSUtb+OKaJ2lk4xPDRL
	ZD6YRWPZtnZbUywf0P2BKFniIajBpl4U7y/rEI9YZvH360UO1lgFU6cUrG/RWI04Fh5BNwfZk+TpO
	CrsxZeY7EEju4QVFb56wciH1u6JR59jElrEsxLKu73yj50GgTBcGiJEtim/R4szLc2ErAjm/g95dm
	spqCnrVJnXiqzQ2vTqR9BQFBwMHbr65aFi8hn8r93nAEyxgUwwrmmDCXDFLQk+qh+wLYz/16yi6ky
	gy168fEoE0aAr2IR0ofDnmtW8cCmgsSIFPMLGIT5M96L7s5+IFvopmMxnks0gM2C2dICjUW5mzzom
	Ui0hb4Iw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrZL2-00Drzs-1V;
	Wed, 05 Aug 2026 10:59:08 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 05 Aug 2026 03:58:19 -0700
Subject: [PATCH net-next v2 1/2] netconsole: publish the userdata payload
 with RCU
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-netcons-userdata-rcu-v2-1-c5e80f6a7a46@debian.org>
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
In-Reply-To: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=8446; i=leitao@debian.org;
 h=from:subject:message-id; bh=wLGKCNog8+m8abD/kjwLtMo1+vBYXg7HqfBu+BVQlhY=;
 b=owEBbAKT/ZANAwAIATWjk5/8eHdtAcsmYgBqcxdyf54+EOKh3YdxSFJ0vrx0oHlHf7q+3Gg3+
 KN8qV4Rg82JAjIEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanMXcgAKCRA1o5Of/Hh3
 bdV6D/id2gANdUoavcPxE9kS6WOZcoSOm7zajfEMnR9v0pQf35Bh1iK793km+6zlWc1A82ujYu7
 dQVp5WWN7UVXbY9l5DTBdPnELYHOQevecuMPMSTb9tIGJkj/OKmMUDAouoTuGuFi/L/MmlURYIP
 hAejKK71WXkQWxoEIsm99WMr8bi8hHCHuwONIn04v/JfELfNmpStNzbjwiIK9v9MpIZEsD9BtlQ
 Er2ifw4CgOvZd+H744+fzKc1WRE14PSIhXNZUvc0F0zoc8t8z/HpVFW9Yhg/hWFGOrofhacFLoh
 6BT/6gwwiawWQeV0Us4KxjlwzRoxTzAnjQr/Feu0ouUa4fCTawZabC+D3zReBJWUGIx+WTMOnqB
 vgRSY3FeCFPqvP/Dp+gwzP+mOfP2Q98ni77qM/LBJUdKHWnHAXNFUvpKPW77deswaHuUcUI2XAH
 4KhQZDlOK6Takpxrktqx04dGxb3rsxvK8EZribXB3oDN2YQaIhGdvHrE+N5eZhuLpDQlfRcr/f8
 +FLbtVdnsoWHux/0ufpZBLupbt9nzKeZk3bVZ+/TM09p+x3XcxUP7aIAdjmqR0LKx5xr48mqAFL
 4B9PndI47FVixLSJ0ruWRBUXznXpi9I2JAMdAagUIimeeiYp91aIdR0rUDTTEr919Vad6PYPlZK
 ZnRaFrbhK0RNv
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

update_userdata() takes target_list_lock to swap nt->userdata and
nt->userdata_length, then frees the old buffer. Since commit
7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
that lock is also the console's device_lock, so writing a userdata value
from configfs serialises against the printk core emitting messages.

The buffer is immutable once published, which is what RCU is for. Move
the string and its length into a single netcons_userdata object and
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
 drivers/net/netconsole.c | 92 +++++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 36 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 862001d09aa84..14092fb15f6d0 100644
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
@@ -1392,7 +1403,7 @@ static void netconsole_target_release(struct config_item *item)
 {
 	struct netconsole_target *nt = to_target(item);
 
-	kfree(nt->userdata);
+	kfree(rcu_access_pointer(nt->userdata));
 	kfree(nt);
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
@@ -2357,7 +2377,7 @@ static void free_param_target(struct netconsole_target *nt)
 	cancel_work_sync(&nt->resume_wq);
 	netpoll_cleanup(&nt->np);
 #ifdef	CONFIG_NETCONSOLE_DYNAMIC
-	kfree(nt->userdata);
+	kfree(rcu_access_pointer(nt->userdata));
 #endif
 	kfree(nt);
 }

-- 
2.53.0-Meta

