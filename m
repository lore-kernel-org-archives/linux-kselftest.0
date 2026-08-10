Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223663B05B1;
	Mon, 10 Aug 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354611; cv=none; b=qzDWuiC25GiItkE38KZLvUA3C5PdjUfsyKbOaAgMs2RDNzeixROxAtp5fb07gjK1bhAljT0tx7Eg4O3+BXcyhRTvbBbMGngIRxoW5Vrs5e2Gm7kkrz67S+3LZCPm6VgSU6AQedKVPnKBYtCfEaSgCUOp7ApP6uNCA553Odt/uhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354611; c=relaxed/simple;
	bh=vKbjKe1HE2MAiHlQZFokB6bRsYyXcyfEH5cZ5DTELQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kM4/bYZrTJh3cmJuXL5RphPz9lyNHCGFvHNLPN3KrOb0gDn+PGrtGer62+8gTMGfEeF7MxrpLp9J3s+TxO1rFlj1RtYnbq//2leGMUhGA+mC0fEtcFYrLYHXHZD/8wT9LvX1mg/TGElW2UrWKE8q1zXusxQ5+5u9crkXZf0TpiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=K7S1pNI4; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="K7S1pNI4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ThB16b2l/ecU5ZNLgYbx+Ptb320sPXok0jByQBpK68s=; b=K7S1pNI4WA972G8ExWsbT8ray4
	d53w79H2GZAZ77cRBz2x2Nvd9NPVEsVVU0SoShdZPr+gvpODRsAzEDPymK8yofv70BADmnTCj9ure
	PJVBhV2YiI1zJBBhS/YLeyeLUaSKIghjL36mnv3GRbpxM99roT7dsO12kXQjW3lRDfhFy7fWCtlPx
	Vc9g++wIsEzFfj4IFsRJ4Bdqf4emArlOtERbDeUEOqeDbOC2H8HDXUcNUH9YotpgpedCiPl7p5wqZ
	8d7raCAepN4t3R1cMv1TLwzgjjG+2p6RfTRNSLiWshAhZoJXfgEYu1BKVbPjZ7nx1ianr+G3dzc96
	hQJXxgnQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtMR3-002eje-0C;
	Mon, 10 Aug 2026 09:36:45 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 10 Aug 2026 02:36:11 -0700
Subject: [PATCH net-next v3 1/2] netconsole: publish the userdata payload
 with RCU
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-netcons-userdata-rcu-v3-1-f65557f769ce@debian.org>
References: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org>
In-Reply-To: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=8444; i=leitao@debian.org;
 h=from:subject:message-id; bh=vKbjKe1HE2MAiHlQZFokB6bRsYyXcyfEH5cZ5DTELQ8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqeZujZMfqd89lI4vCo9iaSw6CCEVhUnEQxrhOo
 XaFnKZq/6GJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanmbowAKCRA1o5Of/Hh3
 bXDZD/4r+yV4avypNhAkYtkyF2qyn8zezwz67IMBywzPLk54k3nWKj+67n2Ec3thmYNySSlIqwa
 yvsCdKmkpJl5MLyw3eeH5+N2dJexSxZoMckl5tmN79qefmIQBVYLOljPP5sloeupo6BFW6yInuz
 AHDtHzteg6EwikXKlF5Hd6ncGFSd/r6FBIXK6vKbk5dnk+DKrnoXvSSCJ07m8+BkOaJpxwnw1fg
 lx7AJSQZPDj5KzrRJ6X1HriVatHH/VwZDJ7bbKefCyoXm7ygpWzbHstIz3lTM9pKZFqgnhH+QkE
 eHelHe6CO0Zr4U7JD+oFhg2zqASR37RULnUcxAbOlXJ61T70zKI6h9troXpJU2M3yzxxPsL1lHh
 ia4ixGMObRQbj3i9gJ52Ln5wqm5tdzwtNnnBnW1LnfIMQnUGqaM0lKp3ez8gGW00zy08xMtgHvA
 iWxrIBmmBzcEGNORKEI+jfj131f9Na9KxKEkVDZe1DxXgZsKZ2dVH9eCzZyXDIQz+Lh85YiNixn
 073w+VEerQnfy0xnoPUo+drYcFiNdgusbsjj7FMsNlJh7SluYsTtA8abGAvsqpMH3yxIOTkfF1F
 7+O/dyYPnZQ8Ke5c90Q6HSp8MUOcJgi5WKS4s7EHG+s+IPRqIQdwrnRD/Uz64QnBDy05P42iiew
 Rjx+cKbPrqWSNtg==
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
index 03913302328cc..b358e5c367351 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -151,13 +151,27 @@ enum target_state {
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
@@ -198,8 +212,7 @@ struct netconsole_target {
 #ifdef	CONFIG_NETCONSOLE_DYNAMIC
 	struct config_group	group;
 	struct config_group	userdata_group;
-	char			*userdata;
-	size_t			userdata_length;
+	struct netcons_userdata __rcu *userdata;
 	char			sysdata[MAX_EXTRADATA_ENTRY_LEN * MAX_SYSDATA_ITEMS];
 
 	/* bit-wise with sysdata_feature bits */
@@ -1351,12 +1364,11 @@ static int calc_userdata_len(struct netconsole_target *nt)
 
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
 
@@ -1368,8 +1380,8 @@ static int update_userdata(struct netconsole_target *nt)
 
 	/* Allocate new buffer */
 	if (len) {
-		new_buf = kmalloc(len + 1, GFP_KERNEL);
-		if (!new_buf)
+		new = kmalloc_flex(*new, data, len + 1);
+		if (!new)
 			return -ENOMEM;
 	}
 
@@ -1379,22 +1391,21 @@ static int update_userdata(struct netconsole_target *nt)
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
@@ -1684,7 +1695,7 @@ static void netconsole_target_release(struct config_item *item)
 {
 	struct netconsole_target *nt = to_target(item);
 
-	kfree(nt->userdata);
+	kfree(rcu_access_pointer(nt->userdata));
 	kfree(nt);
 }
 
@@ -2227,14 +2238,13 @@ static void send_udp(struct netconsole_target *nt, const char *msg, int len)
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
 
@@ -2251,7 +2261,7 @@ static void send_msg_no_fragmentation(struct netconsole_target *nt,
 	if (userdata)
 		msg_len += scnprintf(&nt->buf[msg_len],
 				     sizeof(nt->buf) - msg_len, "%s",
-				     userdata);
+				     userdata->data);
 
 	if (sysdata)
 		msg_len += scnprintf(&nt->buf[msg_len],
@@ -2271,7 +2281,8 @@ static void append_release(char *buf)
 
 static void send_fragmented_body(struct netconsole_target *nt,
 				 const char *msgbody_ptr, int header_len,
-				 int msgbody_len, int sysdata_len)
+				 int msgbody_len, int sysdata_len,
+				 const struct netcons_userdata *userdata)
 {
 	const char *userdata_ptr = NULL;
 	const char *sysdata_ptr = NULL;
@@ -2282,12 +2293,12 @@ static void send_fragmented_body(struct netconsole_target *nt,
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
@@ -2364,7 +2375,8 @@ static void send_msg_fragmented(struct netconsole_target *nt,
 				const char *msg,
 				int msg_len,
 				int release_len,
-				int sysdata_len)
+				int sysdata_len,
+				const struct netcons_userdata *userdata)
 {
 	int header_len, msgbody_len;
 	const char *msgbody;
@@ -2393,7 +2405,7 @@ static void send_msg_fragmented(struct netconsole_target *nt,
 	 * will be replaced
 	 */
 	send_fragmented_body(nt, msgbody, header_len, msgbody_len,
-			     sysdata_len);
+			     sysdata_len, userdata);
 }
 
 /**
@@ -2408,25 +2420,33 @@ static void send_msg_fragmented(struct netconsole_target *nt,
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
@@ -2669,7 +2689,7 @@ static void free_param_target(struct netconsole_target *nt)
 		netconsole_skb_pool_flush(nt);
 	netpoll_cleanup(&nt->np);
 #ifdef	CONFIG_NETCONSOLE_DYNAMIC
-	kfree(nt->userdata);
+	kfree(rcu_access_pointer(nt->userdata));
 #endif
 	kfree(nt);
 }

-- 
2.53.0-Meta

