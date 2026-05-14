Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D53D1CD4
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797597; cv=none; b=gSz7HERvt1jpJpdX/znGmQnICfsPpn5sYr6r/Q89r8XigaCp27Y/9dKjRZAFLKypfV435wY/66aFyxSPPiN3vPcFx/EQAIOP0LBlhSXKE525D9ByG33hFKibNEN1t7tgGOTNH1FAs9lJxD6gWqSUwCWsI74/IU5idtT6gb2fnUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797597; c=relaxed/simple;
	bh=77XZZZd7wZLWvAWz9Idgem9rTSNEdzau8xW9Scy7nx0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrxnUu3CKuMPElo0Hc5N5+0waCpzl1kQZsU6NKqieIBuLHaTtKHYKhWbLQhWvqS6Tyco0KMA/mlgDy6AeUnSVVjKZdBhnz3ByGB2sGuItb82CV0r+jYTnQUKuh+dSOcya4OlcciSbq+syphu7Krf3JMNsrbhIXbqikBCLajqYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gkj+Pif6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gkj+Pif6"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50fc496c8baso80336681cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797594; x=1779402394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j39P/d5rSho/yV0JzJL6Y2jMMbUZ/GwYCZvoLGL4UKQ=;
        b=gkj+Pif6WSaKbT3fHkMN7hAvBjBw681Va92PFw8scwpWG7FK0kwB0kIOrz1F+WEj/S
         JFvWzqCqpJOuarcqTWjtVHPOj0SZSzPLbd082BrONYD9+Hs74GYldcc1F56ofI4AomX9
         aCVTssAcEqIjlBUebxW3J6poG/RdKYuLIbBOaIj999OrL2Pqp1LLf3Icsl86rurj+zUY
         fkdn5+tNw4fBC81rqeusG9/c6cRwJu+nVhQ8pKq4Bs1pRGdwKOmQ1qM9pTsnet41TxYj
         86/BSCFXpSbMHNnOC+9WkZCFebZIcunlup0yEXX/MKwtWzg6Fv9LRseCY36yE1Bho575
         oFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797594; x=1779402394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j39P/d5rSho/yV0JzJL6Y2jMMbUZ/GwYCZvoLGL4UKQ=;
        b=mgYmGejTZLV6rrpUnDqtw5yyhC9qa/QY7y1oohBpFZ+CojCkmpzha6J3fDzjjl5i5L
         zT49f3B/CuV6gJ9+XpYDqFUUtWPPDS/6Xvqh97vW8ekgW99+4h1rj+3c/IprGUlK4v7E
         Lw8mcA9cn34J8fhXAGSNzR4Nn0ARcyiIr3uNbNF5GMzGrZWxZtA15utA5D3vodQjAPlI
         JONlmUi3Wz7Hv++sVl4v4ozkQLk3iA6kqe6Yz6rKLkgXgQiy4eyQdHNubqAMLcwAzJaK
         AHxJyEGaaYf1pYOClrlD14W6W952PeAll+QBdPA7r82EF7c0fenVgmUy/gK6s40Ir8ug
         vS8w==
X-Gm-Message-State: AOJu0YzrQBwrKpdlNdB2Vj2++19hC7H8fcP4qjM5VFFgEp0Am/ldW85x
	Fh9/Sck5YQ25uh/bMeABiOE2QAGoCjwhicpZCKoCTqauiWCLPI5ISpOt3jCibaXZIfcYQWL8oyc
	M45sjnOg=
X-Gm-Gg: Acq92OEb8E1Amux2Y2vGsqiQ2ckw2nDhEB4ro/IIOWSTyopN7gZ0cMVctpMLbvI2TBw
	W1LUtOBTQLSYifmkSomT7ehvMo+qT8BfK87RmqrJZcig4DrS8lV2Vm2o5MKiVwdoaZAcdpBNkqf
	gK22gX27V7inN0AF5Sd0wYXjasx4TNjhgFE91xSF97NDxtgOe1KNM9koqOgFp4C4cQPHAtJHf75
	n0nNWst6CamrxLf7lqpPMdorqFL3wVXh5h3O01prTed2Ua+6hyniAHIdsenKBFO/2rUK2yTsrYJ
	/FQH86rZDvtNCosCVWodtJn3XAz6uleRg7T4gQizWtQ9YNd2RL5V5BFEfuf2cMQpIObLQhU4CK3
	jecsPSRkCPSNKF4VScFKlT+MsC2g6wIz3JHSUPDfkuarLvyWP1whcHBiFiCUcIrM/l19Kj9MtE1
	72zMFLl3QdYJNDna4lSdnCCTSO86JnKIn6Yke4Jax9Wk4Tas+8XH3eEc3z6t0lrQ==
X-Received: by 2002:ac8:57cd:0:b0:50d:b33d:bc6b with SMTP id d75a77b69052e-5165a026958mr19386901cf.20.1778797593734;
        Thu, 14 May 2026 15:26:33 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:33 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 01/10] liveupdate: centralize state management into struct luo_ser
Date: Thu, 14 May 2026 22:26:19 +0000
Message-ID: <20260514222628.931312-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transition the LUO to ABI v2, which centralizes state management into a
single struct luo_ser header.

Previously, LUO state was spread across multiple FDT properties and
subnodes. ABI v2 simplifies this by placing all core state, including
the liveupdate number and physical addresses for sessions and FLB
headers into a centralized struct luo_ser.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h      | 91 +++++++++++---------------------
 kernel/liveupdate/luo_core.c     | 59 ++++++++++++++-------
 kernel/liveupdate/luo_flb.c      | 65 ++++-------------------
 kernel/liveupdate/luo_internal.h |  8 +--
 kernel/liveupdate/luo_session.c  | 57 +++-----------------
 5 files changed, 93 insertions(+), 187 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 46750a0ddf88..1b2f865a771a 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -30,52 +30,25 @@
  *   .. code-block:: none
  *
  *     / {
- *         compatible = "luo-v1";
- *         liveupdate-number = <...>;
- *
- *         luo-session {
- *             compatible = "luo-session-v1";
- *             luo-session-header = <phys_addr_of_session_header_ser>;
- *         };
- *
- *         luo-flb {
- *             compatible = "luo-flb-v1";
- *             luo-flb-header = <phys_addr_of_flb_header_ser>;
- *         };
+ *         compatible = "luo-v2";
+ *         luo-abi-header = <phys_addr_of_luo_ser>;
  *     };
  *
  * Main LUO Node (/):
  *
- *   - compatible: "luo-v1"
+ *   - compatible: "luo-v2"
  *     Identifies the overall LUO ABI version.
- *   - liveupdate-number: u64
- *     A counter tracking the number of successful live updates performed.
- *
- * Session Node (luo-session):
- *   This node describes all preserved user-space sessions.
- *
- *   - compatible: "luo-session-v1"
- *     Identifies the session ABI version.
- *   - luo-session-header: u64
- *     The physical address of a `struct luo_session_header_ser`. This structure
- *     is the header for a contiguous block of memory containing an array of
- *     `struct luo_session_ser`, one for each preserved session.
- *
- * File-Lifecycle-Bound Node (luo-flb):
- *   This node describes all preserved global objects whose lifecycle is bound
- *   to that of the preserved files (e.g., shared IOMMU state).
- *
- *   - compatible: "luo-flb-v1"
- *     Identifies the FLB ABI version.
- *   - luo-flb-header: u64
- *     The physical address of a `struct luo_flb_header_ser`. This structure is
- *     the header for a contiguous block of memory containing an array of
- *     `struct luo_flb_ser`, one for each preserved global object.
+ *   - luo-abi-header: u64
+ *     The physical address of `struct luo_ser`.
  *
  * Serialization Structures:
  *   The FDT properties point to memory regions containing arrays of simple,
  *   `__packed` structures. These structures contain the actual preserved state.
  *
+ *   - struct luo_ser:
+ *     The central ABI structure that contains the overall state of the LUO.
+ *     It includes the liveupdate-number and pointers to sessions and FLBs.
+ *
  *   - struct luo_session_header_ser:
  *     Header for the session array. Contains the total page count of the
  *     preserved memory block and the number of `struct luo_session_ser`
@@ -109,13 +82,26 @@
 
 /*
  * The LUO FDT hooks all LUO state for sessions, fds, etc.
- * In the root it also carries "liveupdate-number" 64-bit property that
- * corresponds to the number of live-updates performed on this machine.
  */
 #define LUO_FDT_SIZE		PAGE_SIZE
 #define LUO_FDT_KHO_ENTRY_NAME	"LUO"
-#define LUO_FDT_COMPATIBLE	"luo-v1"
-#define LUO_FDT_LIVEUPDATE_NUM	"liveupdate-number"
+#define LUO_FDT_COMPATIBLE	"luo-v2"
+#define LUO_FDT_ABI_HEADER	"luo-abi-header"
+
+/**
+ * struct luo_ser - Centralized LUO ABI header.
+ * @liveupdate_num: A counter tracking the number of successful live updates.
+ * @sessions_pa:    Physical address of the first session block header.
+ * @flbs_pa:        Physical address of the FLB header.
+ *
+ * This structure is the root of all preserved LUO state. It is pointed to by
+ * the "luo-abi-header" property in the LUO FDT.
+ */
+struct luo_ser {
+	u64 liveupdate_num;
+	u64 sessions_pa;
+	u64 flbs_pa;
+} __packed;
 
 #define LIVEUPDATE_HNDL_COMPAT_LENGTH	48
 
@@ -147,15 +133,6 @@ struct luo_file_set_ser {
 	u64 count;
 } __packed;
 
-/*
- * LUO FDT session node
- * LUO_FDT_SESSION_HEADER:  is a u64 physical address of struct
- *                          luo_session_header_ser
- */
-#define LUO_FDT_SESSION_NODE_NAME	"luo-session"
-#define LUO_FDT_SESSION_COMPATIBLE	"luo-session-v2"
-#define LUO_FDT_SESSION_HEADER		"luo-session-header"
-
 /**
  * struct luo_session_header_ser - Header for the serialized session data block.
  * @count: The number of `struct luo_session_ser` entries that immediately
@@ -165,7 +142,7 @@ struct luo_file_set_ser {
  * physical memory preserved across the kexec. It provides the necessary
  * metadata to interpret the array of session entries that follow.
  *
- * If this structure is modified, `LUO_FDT_SESSION_COMPATIBLE` must be updated.
+ * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
  */
 struct luo_session_header_ser {
 	u64 count;
@@ -182,7 +159,7 @@ struct luo_session_header_ser {
  * session) is created and passed to the new kernel, allowing it to reconstruct
  * the session context.
  *
- * If this structure is modified, `LUO_FDT_SESSION_COMPATIBLE` must be updated.
+ * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
  */
 struct luo_session_ser {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
@@ -192,10 +169,6 @@ struct luo_session_ser {
 /* The max size is set so it can be reliably used during in serialization */
 #define LIVEUPDATE_FLB_COMPAT_LENGTH	48
 
-#define LUO_FDT_FLB_NODE_NAME	"luo-flb"
-#define LUO_FDT_FLB_COMPATIBLE	"luo-flb-v1"
-#define LUO_FDT_FLB_HEADER	"luo-flb-header"
-
 /**
  * struct luo_flb_header_ser - Header for the serialized FLB data block.
  * @pgcnt: The total number of pages occupied by the entire preserved memory
@@ -205,11 +178,9 @@ struct luo_session_ser {
  *         in the memory block.
  *
  * This structure is located at the physical address specified by the
- * `LUO_FDT_FLB_HEADER` FDT property. It provides the new kernel with the
- * necessary information to find and iterate over the array of preserved
- * File-Lifecycle-Bound objects and to manage the underlying memory.
+ * flbs_pa in luo_ser.
  *
- * If this structure is modified, LUO_FDT_FLB_COMPATIBLE must be updated.
+ * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
  */
 struct luo_flb_header_ser {
 	u64 pgcnt;
@@ -231,7 +202,7 @@ struct luo_flb_header_ser {
  * passed to the new kernel. Each entry allows the LUO core to restore one
  * global, shared object.
  *
- * If this structure is modified, LUO_FDT_FLB_COMPATIBLE must be updated.
+ * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
  */
 struct luo_flb_ser {
 	char name[LIVEUPDATE_FLB_COMPAT_LENGTH];
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 803f51c84275..9bd649b22029 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -82,9 +82,11 @@ early_param("liveupdate", early_liveupdate_param);
 
 static int __init luo_early_startup(void)
 {
+	struct luo_ser *luo_ser;
+	int err, header_size;
 	phys_addr_t fdt_phys;
-	int err, ln_size;
 	const void *ptr;
+	u64 luo_ser_pa;
 
 	if (!kho_is_enabled()) {
 		if (liveupdate_enabled())
@@ -115,27 +117,29 @@ static int __init luo_early_startup(void)
 		return -EINVAL;
 	}
 
-	ln_size = 0;
-	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_LIVEUPDATE_NUM,
-			  &ln_size);
-	if (!ptr || ln_size != sizeof(luo_global.liveupdate_num)) {
-		pr_err("Unable to get live update number '%s' [%d]\n",
-		       LUO_FDT_LIVEUPDATE_NUM, ln_size);
+	header_size = 0;
+	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_ABI_HEADER, &header_size);
+	if (!ptr || header_size != sizeof(u64)) {
+		pr_err("Unable to get ABI header '%s' [%d]\n",
+		       LUO_FDT_ABI_HEADER, header_size);
 
 		return -EINVAL;
 	}
 
-	luo_global.liveupdate_num = get_unaligned((u64 *)ptr);
+	luo_ser_pa = get_unaligned((u64 *)ptr);
+	luo_ser = phys_to_virt(luo_ser_pa);
+
+	luo_global.liveupdate_num = luo_ser->liveupdate_num;
 	pr_info("Retrieved live update data, liveupdate number: %lld\n",
 		luo_global.liveupdate_num);
 
-	err = luo_session_setup_incoming(luo_global.fdt_in);
+	err = luo_session_setup_incoming(luo_ser->sessions_pa);
 	if (err)
 		return err;
 
-	err = luo_flb_setup_incoming(luo_global.fdt_in);
+	luo_flb_setup_incoming(luo_ser->flbs_pa);
 
-	return err;
+	return 0;
 }
 
 static int __init liveupdate_early_init(void)
@@ -156,7 +160,8 @@ early_initcall(liveupdate_early_init);
 /* Called during boot to create outgoing LUO fdt tree */
 static int __init luo_fdt_setup(void)
 {
-	const u64 ln = luo_global.liveupdate_num + 1;
+	struct luo_ser *luo_ser;
+	u64 luo_ser_pa;
 	void *fdt_out;
 	int err;
 
@@ -166,27 +171,45 @@ static int __init luo_fdt_setup(void)
 		return PTR_ERR(fdt_out);
 	}
 
+	luo_ser = kho_alloc_preserve(sizeof(*luo_ser));
+	if (IS_ERR(luo_ser)) {
+		err = PTR_ERR(luo_ser);
+		goto exit_free_fdt;
+	}
+	luo_ser_pa = virt_to_phys(luo_ser);
+
 	err = fdt_create(fdt_out, LUO_FDT_SIZE);
 	err |= fdt_finish_reservemap(fdt_out);
 	err |= fdt_begin_node(fdt_out, "");
 	err |= fdt_property_string(fdt_out, "compatible", LUO_FDT_COMPATIBLE);
-	err |= fdt_property(fdt_out, LUO_FDT_LIVEUPDATE_NUM, &ln, sizeof(ln));
-	err |= luo_session_setup_outgoing(fdt_out);
-	err |= luo_flb_setup_outgoing(fdt_out);
+	err |= fdt_property(fdt_out, LUO_FDT_ABI_HEADER, &luo_ser_pa,
+			    sizeof(luo_ser_pa));
 	err |= fdt_end_node(fdt_out);
 	err |= fdt_finish(fdt_out);
 	if (err)
-		goto exit_free;
+		goto exit_free_luo_ser;
+
+	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
+	if (err)
+		goto exit_free_luo_ser;
+
+	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
+	if (err)
+		goto exit_free_luo_ser;
+
+	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
 
 	err = kho_add_subtree(LUO_FDT_KHO_ENTRY_NAME, fdt_out,
 			      fdt_totalsize(fdt_out));
 	if (err)
-		goto exit_free;
+		goto exit_free_luo_ser;
 	luo_global.fdt_out = fdt_out;
 
 	return 0;
 
-exit_free:
+exit_free_luo_ser:
+	kho_unpreserve_free(luo_ser);
+exit_free_fdt:
 	kho_unpreserve_free(fdt_out);
 	pr_err("failed to prepare LUO FDT: %d\n", err);
 
diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
index 8f5c5dd01cd0..7ccc59981297 100644
--- a/kernel/liveupdate/luo_flb.c
+++ b/kernel/liveupdate/luo_flb.c
@@ -159,8 +159,8 @@ static void luo_flb_file_unpreserve_one(struct liveupdate_flb *flb)
 
 static int luo_flb_retrieve_one(struct liveupdate_flb *flb)
 {
-	struct luo_flb_private *private = luo_flb_get_private(flb);
 	struct luo_flb_header *fh = &luo_flb_global.incoming;
+	struct luo_flb_private *private = luo_flb_get_private(flb);
 	struct liveupdate_flb_op_args args = {0};
 	bool found = false;
 	int err;
@@ -551,27 +551,15 @@ int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp)
 	return 0;
 }
 
-int __init luo_flb_setup_outgoing(void *fdt_out)
+int __init luo_flb_setup_outgoing(u64 *flbs_pa)
 {
 	struct luo_flb_header_ser *header_ser;
-	u64 header_ser_pa;
-	int err;
 
 	header_ser = kho_alloc_preserve(LUO_FLB_PGCNT << PAGE_SHIFT);
 	if (IS_ERR(header_ser))
 		return PTR_ERR(header_ser);
 
-	header_ser_pa = virt_to_phys(header_ser);
-
-	err = fdt_begin_node(fdt_out, LUO_FDT_FLB_NODE_NAME);
-	err |= fdt_property_string(fdt_out, "compatible",
-				   LUO_FDT_FLB_COMPATIBLE);
-	err |= fdt_property(fdt_out, LUO_FDT_FLB_HEADER, &header_ser_pa,
-			    sizeof(header_ser_pa));
-	err |= fdt_end_node(fdt_out);
-
-	if (err)
-		goto err_unpreserve;
+	*flbs_pa = virt_to_phys(header_ser);
 
 	header_ser->pgcnt = LUO_FLB_PGCNT;
 	luo_flb_global.outgoing.header_ser = header_ser;
@@ -579,53 +567,18 @@ int __init luo_flb_setup_outgoing(void *fdt_out)
 	luo_flb_global.outgoing.active = true;
 
 	return 0;
-
-err_unpreserve:
-	kho_unpreserve_free(header_ser);
-
-	return err;
 }
 
-int __init luo_flb_setup_incoming(void *fdt_in)
+void __init luo_flb_setup_incoming(u64 flbs_pa)
 {
 	struct luo_flb_header_ser *header_ser;
-	int err, header_size, offset;
-	const void *ptr;
-	u64 header_ser_pa;
-
-	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
-	if (offset < 0) {
-		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
 
-		return -ENOENT;
+	if (flbs_pa) {
+		header_ser = phys_to_virt(flbs_pa);
+		luo_flb_global.incoming.header_ser = header_ser;
+		luo_flb_global.incoming.ser = (void *)(header_ser + 1);
+		luo_flb_global.incoming.active = true;
 	}
-
-	err = fdt_node_check_compatible(fdt_in, offset,
-					LUO_FDT_FLB_COMPATIBLE);
-	if (err) {
-		pr_err("FLB node is incompatible with '%s' [%d]\n",
-		       LUO_FDT_FLB_COMPATIBLE, err);
-
-		return -EINVAL;
-	}
-
-	header_size = 0;
-	ptr = fdt_getprop(fdt_in, offset, LUO_FDT_FLB_HEADER, &header_size);
-	if (!ptr || header_size != sizeof(u64)) {
-		pr_err("Unable to get FLB header property '%s' [%d]\n",
-		       LUO_FDT_FLB_HEADER, header_size);
-
-		return -EINVAL;
-	}
-
-	header_ser_pa = get_unaligned((u64 *)ptr);
-	header_ser = phys_to_virt(header_ser_pa);
-
-	luo_flb_global.incoming.header_ser = header_ser;
-	luo_flb_global.incoming.ser = (void *)(header_ser + 1);
-	luo_flb_global.incoming.active = true;
-
-	return 0;
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 875844d7a41d..4b6c18348d9b 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -81,8 +81,8 @@ extern struct rw_semaphore luo_register_rwlock;
 
 int luo_session_create(const char *name, struct file **filep);
 int luo_session_retrieve(const char *name, struct file **filep);
-int __init luo_session_setup_outgoing(void *fdt);
-int __init luo_session_setup_incoming(void *fdt);
+int __init luo_session_setup_outgoing(u64 *sessions_pa);
+int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
 
@@ -104,8 +104,8 @@ int luo_flb_file_preserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_finish(struct liveupdate_file_handler *fh);
 void luo_flb_unregister_all(struct liveupdate_file_handler *fh);
-int __init luo_flb_setup_outgoing(void *fdt);
-int __init luo_flb_setup_incoming(void *fdt);
+int __init luo_flb_setup_outgoing(u64 *flbs_pa);
+void __init luo_flb_setup_incoming(u64 flbs_pa);
 void luo_flb_serialize(void);
 
 #ifdef CONFIG_LIVEUPDATE_TEST
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 1caaa7886ec6..915ab9ce0f34 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -458,75 +458,34 @@ int luo_session_retrieve(const char *name, struct file **filep)
 	return err;
 }
 
-int __init luo_session_setup_outgoing(void *fdt_out)
+int __init luo_session_setup_outgoing(u64 *sessions_pa)
 {
 	struct luo_session_header_ser *header_ser;
-	u64 header_ser_pa;
-	int err;
 
 	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
 	if (IS_ERR(header_ser))
 		return PTR_ERR(header_ser);
-	header_ser_pa = virt_to_phys(header_ser);
-
-	err = fdt_begin_node(fdt_out, LUO_FDT_SESSION_NODE_NAME);
-	err |= fdt_property_string(fdt_out, "compatible",
-				   LUO_FDT_SESSION_COMPATIBLE);
-	err |= fdt_property(fdt_out, LUO_FDT_SESSION_HEADER, &header_ser_pa,
-			    sizeof(header_ser_pa));
-	err |= fdt_end_node(fdt_out);
 
-	if (err)
-		goto err_unpreserve;
+	*sessions_pa = virt_to_phys(header_ser);
 
 	luo_session_global.outgoing.header_ser = header_ser;
 	luo_session_global.outgoing.ser = (void *)(header_ser + 1);
 	luo_session_global.outgoing.active = true;
 
 	return 0;
-
-err_unpreserve:
-	kho_unpreserve_free(header_ser);
-	return err;
 }
 
-int __init luo_session_setup_incoming(void *fdt_in)
+int __init luo_session_setup_incoming(u64 sessions_pa)
 {
 	struct luo_session_header_ser *header_ser;
-	int err, header_size, offset;
-	u64 header_ser_pa;
-	const void *ptr;
-
-	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_SESSION_NODE_NAME);
-	if (offset < 0) {
-		pr_err("Unable to get session node: [%s]\n",
-		       LUO_FDT_SESSION_NODE_NAME);
-		return -EINVAL;
-	}
 
-	err = fdt_node_check_compatible(fdt_in, offset,
-					LUO_FDT_SESSION_COMPATIBLE);
-	if (err) {
-		pr_err("Session node incompatible [%s]\n",
-		       LUO_FDT_SESSION_COMPATIBLE);
-		return -EINVAL;
-	}
-
-	header_size = 0;
-	ptr = fdt_getprop(fdt_in, offset, LUO_FDT_SESSION_HEADER, &header_size);
-	if (!ptr || header_size != sizeof(u64)) {
-		pr_err("Unable to get session header '%s' [%d]\n",
-		       LUO_FDT_SESSION_HEADER, header_size);
-		return -EINVAL;
+	if (sessions_pa) {
+		header_ser = phys_to_virt(sessions_pa);
+		luo_session_global.incoming.header_ser = header_ser;
+		luo_session_global.incoming.ser = (void *)(header_ser + 1);
+		luo_session_global.incoming.active = true;
 	}
 
-	header_ser_pa = get_unaligned((u64 *)ptr);
-	header_ser = phys_to_virt(header_ser_pa);
-
-	luo_session_global.incoming.header_ser = header_ser;
-	luo_session_global.incoming.ser = (void *)(header_ser + 1);
-	luo_session_global.incoming.active = true;
-
 	return 0;
 }
 
-- 
2.53.0

