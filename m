Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83525A2DD
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781974829; cv=none; b=WrcOD8PSdT0ojFn6A5BhZtR9z4YwsF8ornz1kodTFWZyuiYrGO2v1dUU09hQnkU9+vdVqiCTtIynDKrKiIqfK4p4XOszDe3A2Ea+/WB+aBl24P6l/FgXHp1VttfYzj1wbVMbnL9DTTqSp2migAgIQ6YctK4alPNBfCnQEuyrbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781974829; c=relaxed/simple;
	bh=svRBOWL8MZfz+g9m5f6+wJfribq2kSmACITax/l4AC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCOqXcH+8cO9rZtwCvHGf96y3VZJxKa0crHLWI424aDcEqDvH0pPxIZ5s/ZSjZfErl43hvXpFKUqN1amQImdADJJGuH8D+R5GHIJQBeTfZ+Fj4Tf74osO9nH/O71xuwjOS0/PeGFeMBgt24U/ukDebk00KiDuoTvURY9d33qeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1Q31ekt; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1Q31ekt"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bcdf8232fso6786791eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781974826; x=1782579626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aGp8kMYX1SRe/JccqrMbQNtydmMm9nryWBswctu9es=;
        b=h1Q31ektb0XkP6EuJkxH2k7fcjCVZgzNy4JD9Dpf1xO2AvgkezVk+laZPSKdRTpBHw
         xUFBPPblvEPKEsongeQYQyhUV+VHNGJ1Zr6zDG6btJ/z9mvtcX00qf3YaXyw/BO4wIhk
         eao0h+diyPkOkHIXBKArZlakz1P36lPDSGNkUzCj61hdRqSAF8UpJU3cOEOa7EJUvDgg
         8qVZLPRS5YOY4U9DRYyq5ksJeNGUcKAD058CojUZ/WiHml0ZfMsk6awvUygtx1OhRVgN
         DBt9/YNK7/Ss7QTlLOL6rUiAYSQ84s39Dj0BvOXXAGud7nJ+ucKAJcuNkb5XwZ4igkBl
         9u7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781974826; x=1782579626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1aGp8kMYX1SRe/JccqrMbQNtydmMm9nryWBswctu9es=;
        b=ddN1BfleoylPtQzTNcCi3Bl58uE2mYv3z+cPr2uKk3nQif9+t3zkNUZB4u4AVBfZuw
         p8RvyDCOuk9eAJ+PHJ1gupewOt2IQONYiSn/8FcBCtjOQxXw9JiSpwAK4DR4O9V1M8Iu
         zhoC9kLxmF8ES89zmysoejEA4uht8fNVAh46+WSnVMFnTi9VM9XmUUO7RUmJ2G4Y5E2Q
         8/pSxXqEphgpIbU6zOfchSdpqnUsYzL8Etgkp7GcbQTM0lne4JVvc9E9GSda3oh9QN8d
         xKDs7B8/AuAbP7Pz7ED9EIaBcdHXqg+qLeu3BNhpStYhxvsvtVqi641sWa4LxLFNNQFW
         cUmg==
X-Forwarded-Encrypted: i=1; AFNElJ8EFpLIc4o9mzGwbNl4R4KNpWaLIwXWsdrc0JrRTxAiZRehmq8pFchWBjhv+3EB1Blr1gA2mUvQCHN9Xpy3Gso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyzMGCCdcu5nNuHelDPjaQ90Fv7XTJvS4ViNNm4BC7osxrg7b
	CP3PT/YhxTJzd1vzCjQFxg/ez9FXYsi5XNweFNEQCarn9h1cSeL5JrPX
X-Gm-Gg: AfdE7clfdpm7BFcIQrcu4XmRG7s3fGaEgKrbxb6Aduu4bERNDuR6/tIms7t4DM6Hxol
	CPiVdAUeW+ZGCddr2xHoq8eQt0/U2oR+4qnk+FmAPbW6i1iavznBZdsbasmKchGPAaJUTGlxZ+s
	kcvJnNZdsOJTviCueUnJ22cH9D9VVsdH+GDtEUig0Wp1DtQQmZJYlozugmVmJ1iEldzRzS1tDnp
	MuIi7+tdnkEmSKTw29KoIJSKgcAln5mCHtjsL0xxlsWUJtWQ5zC9kBP4GryLYYBO29b9WdEUjS7
	K83hCG3vQP6NUY114macZb0Rh5vAUXkvi73drnk4K5aFHmsnceG8HvAsy8CYnKh61L9/LdfXF11
	AQYpPOsDBlwUb8Atl96WAFHhOEj+KDytXANhJFDbXh96aryGM7seH/SxnHShU6cuKnde5YY9Cwl
	Vc+OG9KmxLU6L1+kJj35gvF/3TzVSR/d6PNisWm8XLguS57nCpF5oMiYh6kwcsgKP+UeGx
X-Received: by 2002:a05:7300:4353:b0:2ed:e12:3773 with SMTP id 5a478bee46e88-30c0709c909mr6027092eec.35.1781974825935;
        Sat, 20 Jun 2026 10:00:25 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be7eeb7sm4139594eec.30.2026.06.20.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:00:25 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Starke, Daniel" <daniel.starke@siemens.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] tty: n_gsm: fix use-after-free in gsm_queue() control frame dispatch
Date: Sat, 20 Jun 2026 09:56:16 -0700
Message-ID: <20260620165616.354233-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620165616.354233-2-bestswngs@gmail.com>
References: <20260620165616.354233-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive worker (flush_to_ldisc -> gsmld_receive_buf -> gsm0_receive/
gsm1_receive -> gsm_queue) reads gsm->dlci[address] and dispatches the
frame via dlci->data() without holding gsm->mutex.  The control handlers
reached through dlci->data() then re-read gsm->dlci[]: gsm_control_reply()
re-reads gsm->dlci[0], while gsm_control_modem() (MSC), gsm_control_rls()
(RLS) and gsm_control_negotiation() (PN) re-read gsm->dlci[addr] for the
DLCI named in the command - a different channel from the one the frame
was addressed to.

Concurrently GSMIOC_SETCONF -> gsm_config() -> gsm_cleanup_mux() takes
gsm->mutex and releases every DLCI via gsm_dlci_release() -> dlci_put().
When the last reference is dropped the destructor gsm_dlci_free() clears
gsm->dlci[addr] and frees the object.  If the worker dereferences one of
those DLCIs while it is being freed, it touches freed memory.

A peer that drives DLCI 0 control frames (e.g. CMD_TEST) while the mux
owner reconfigures the line discipline with GSMIOC_SETCONF can therefore
trigger a use-after-free:

  BUG: KASAN: slab-use-after-free in gsm_control_reply.isra.0
  Read of size 8 at addr ffff888029ae9000 by task kworker/u16:2/46
  Workqueue: events_unbound flush_to_ldisc
  Call Trace:
   gsm_control_reply.isra.0 (drivers/tty/n_gsm.c:1494)
   gsm_dlci_command (drivers/tty/n_gsm.c:2477)
   gsmld_receive_buf (drivers/tty/n_gsm.c:3616)
   tty_ldisc_receive_buf (drivers/tty/tty_buffer.c:398)
   tty_port_default_receive_buf (drivers/tty/tty_port.c:37)
   flush_to_ldisc (drivers/tty/tty_buffer.c:502)
   process_one_work
   worker_thread
   kthread

  Freed by task 5110:
   kfree
   gsm_cleanup_mux (drivers/tty/n_gsm.c:3161)
   gsmld_ioctl (drivers/tty/n_gsm.c:3415)
   tty_ioctl

Pin each DLCI across the dereference with its existing tty_port reference.
gsm_dlci_open_get() looks gsm->dlci[addr] up under gsm->mutex and, if
present, takes a dlci_get() reference before dropping the mutex; the
caller releases it with gsm_dlci_unget() once it is done.  While the
reference is held the kref cannot reach zero, so gsm_dlci_free() cannot
run and the object stays live.  gsm_queue() pins the addressed DLCI for
the UI/UIH dispatch, and gsm_control_modem(), gsm_control_rls() and
gsm_control_negotiation() each pin the DLCI they operate on; the addr
range check stays at the call site so a malformed frame cannot index
gsm->dlci[] out of bounds.

The reference is taken only under the mutex, around the lookup; the mutex
is released before dlci->data() and before the data-path work
(gsm_process_modem(), tty_flip_buffer_push(), gsm_data_queue(), ...), so
the receive/transmit path is not serialised by gsm->mutex and its timing
is unaffected.

Attaching the n_gsm line discipline requires CAP_NET_ADMIN (gsmld_open()
uses capable(), not ns_capable()), so this is a local denial of service
for a privileged mux owner whose control channel is driven by an
untrusted peer on the serial link while it reconfigures; harden the
receive path regardless.

Fixes: 6ab8fba7fcb0 ("tty: n_gsm: Added refcount usage to gsm_mux and gsm_dlci structs")
Cc: stable@vger.kernel.org
Reported-by: Xiang Mei <xmei5@asu.edu>
Link: https://lore.kernel.org/all/DJ7OKN8EMAK8.22CE0B8NZXD73@gmail.com/
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/tty/n_gsm.c | 73 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index c13e050de..771b49000 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -453,6 +453,8 @@ static const u8 gsm_fcs8[256] = {
 #define GOOD_FCS	0xCF
 
 static void gsm_dlci_close(struct gsm_dlci *dlci);
+static struct gsm_dlci *gsm_dlci_open_get(struct gsm_mux *gsm, unsigned int addr);
+static void gsm_dlci_unget(struct gsm_dlci *dlci);
 static int gsmld_output(struct gsm_mux *gsm, u8 *data, int len);
 static int gsm_modem_update(struct gsm_dlci *dlci, u8 brk);
 static struct gsm_msg *gsm_data_alloc(struct gsm_mux *gsm, u8 addr, int len,
@@ -1695,9 +1697,8 @@ static void gsm_control_modem(struct gsm_mux *gsm, const u8 *data, int clen)
 
 	addr >>= 1;
 	/* Closed port, or invalid ? */
-	if (addr == 0 || addr >= NUM_DLCI || gsm->dlci[addr] == NULL)
+	if (addr == 0 || addr >= NUM_DLCI)
 		return;
-	dlci = gsm->dlci[addr];
 
 	/* Must be at least one byte following the EA */
 	if ((cl - len) < 1)
@@ -1711,12 +1712,18 @@ static void gsm_control_modem(struct gsm_mux *gsm, const u8 *data, int clen)
 	if (len < 1)
 		return;
 
+	/* Hold the DLCI until we are done; see gsm_dlci_open_get(). */
+	dlci = gsm_dlci_open_get(gsm, addr);
+	if (dlci == NULL)
+		return;
+
 	tty = tty_port_tty_get(&dlci->port);
 	gsm_process_modem(tty, dlci, modem, cl);
 	if (tty) {
 		tty_wakeup(tty);
 		tty_kref_put(tty);
 	}
+	gsm_dlci_unget(dlci);
 	gsm_control_reply(gsm, CMD_MSC, data, clen);
 }
 
@@ -1746,15 +1753,22 @@ static void gsm_control_negotiation(struct gsm_mux *gsm, unsigned int cr,
 	/* Invalid DLCI? */
 	params = (struct gsm_dlci_param_bits *)data;
 	addr = FIELD_GET(PN_D_FIELD_DLCI, params->d_bits);
-	if (addr == 0 || addr >= NUM_DLCI || !gsm->dlci[addr]) {
+	if (addr == 0 || addr >= NUM_DLCI) {
+		gsm->open_error++;
+		return;
+	}
+
+	/* Hold the DLCI until we are done; see gsm_dlci_open_get(). */
+	dlci = gsm_dlci_open_get(gsm, addr);
+	if (dlci == NULL) {
 		gsm->open_error++;
 		return;
 	}
-	dlci = gsm->dlci[addr];
 
 	/* Too late for parameter negotiation? */
 	if ((!cr && dlci->state == DLCI_OPENING) || dlci->state == DLCI_OPEN) {
 		gsm->open_error++;
+		gsm_dlci_unget(dlci);
 		return;
 	}
 
@@ -1765,6 +1779,7 @@ static void gsm_control_negotiation(struct gsm_mux *gsm, unsigned int cr,
 			pr_info("%s PN failed\n", __func__);
 		gsm->open_error++;
 		gsm_dlci_close(dlci);
+		gsm_dlci_unget(dlci);
 		return;
 	}
 
@@ -1785,6 +1800,7 @@ static void gsm_control_negotiation(struct gsm_mux *gsm, unsigned int cr,
 			pr_info("%s PN in invalid state\n", __func__);
 		gsm->open_error++;
 	}
+	gsm_dlci_unget(dlci);
 }
 
 /**
@@ -1800,6 +1816,7 @@ static void gsm_control_negotiation(struct gsm_mux *gsm, unsigned int cr,
 
 static void gsm_control_rls(struct gsm_mux *gsm, const u8 *data, int clen)
 {
+	struct gsm_dlci *dlci;
 	struct tty_port *port;
 	unsigned int addr = 0;
 	u8 bits;
@@ -1817,14 +1834,18 @@ static void gsm_control_rls(struct gsm_mux *gsm, const u8 *data, int clen)
 		return;
 	addr >>= 1;
 	/* Closed port, or invalid ? */
-	if (addr == 0 || addr >= NUM_DLCI || gsm->dlci[addr] == NULL)
+	if (addr == 0 || addr >= NUM_DLCI)
 		return;
 	/* No error ? */
 	bits = *dp;
 	if ((bits & 1) == 0)
 		return;
 
-	port = &gsm->dlci[addr]->port;
+	/* Hold the DLCI until we are done; see gsm_dlci_open_get(). */
+	dlci = gsm_dlci_open_get(gsm, addr);
+	if (dlci == NULL)
+		return;
+	port = &dlci->port;
 
 	if (bits & 2)
 		tty_insert_flip_char(port, 0, TTY_OVERRUN);
@@ -1835,6 +1856,7 @@ static void gsm_control_rls(struct gsm_mux *gsm, const u8 *data, int clen)
 
 	tty_flip_buffer_push(port);
 
+	gsm_dlci_unget(dlci);
 	gsm_control_reply(gsm, CMD_RLS, data, clen);
 }
 
@@ -2711,6 +2733,35 @@ static inline void dlci_put(struct gsm_dlci *dlci)
 	tty_port_put(&dlci->port);
 }
 
+/**
+ *	gsm_dlci_open_get	-	look up a DLCI and take a reference
+ *	@gsm: GSM mux
+ *	@addr: DLCI address
+ *
+ *	Look up gsm->dlci[addr] under gsm->mutex and take a reference. Returns
+ *	NULL if not present. Release with gsm_dlci_unget().
+ */
+static struct gsm_dlci *gsm_dlci_open_get(struct gsm_mux *gsm, unsigned int addr)
+{
+	struct gsm_dlci *dlci;
+
+	mutex_lock(&gsm->mutex);
+	dlci = gsm->dlci[addr];
+	if (dlci != NULL)
+		dlci_get(dlci);
+	mutex_unlock(&gsm->mutex);
+	return dlci;
+}
+
+/**
+ *	gsm_dlci_unget		-	drop a reference from gsm_dlci_open_get()
+ *	@dlci: DLCI to release
+ */
+static void gsm_dlci_unget(struct gsm_dlci *dlci)
+{
+	dlci_put(dlci);
+}
+
 static void gsm_destroy_network(struct gsm_dlci *dlci);
 
 /**
@@ -2839,11 +2890,21 @@ static void gsm_queue(struct gsm_mux *gsm)
 	case UI|PF:
 	case UIH:
 	case UIH|PF:
+		/*
+		 * Pin the DLCI so gsm_cleanup_mux() cannot free it during
+		 * dispatch. The mutex is dropped before dlci->data().
+		 */
+		mutex_lock(&gsm->mutex);
+		dlci = gsm->dlci[address];
 		if (dlci == NULL || dlci->state != DLCI_OPEN) {
+			mutex_unlock(&gsm->mutex);
 			gsm_response(gsm, address, DM|PF);
 			return;
 		}
+		dlci_get(dlci);
+		mutex_unlock(&gsm->mutex);
 		dlci->data(dlci, gsm->buf, gsm->len);
+		dlci_put(dlci);
 		break;
 	default:
 		goto invalid;
-- 
2.43.0

