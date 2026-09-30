Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106404C8C5A
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766962; cv=none; b=SMT0uUUoqDGy86ota+85QhE/2HxplXAfS6gip3lm7sqlZ7yKm9GsyPSi5gsdyGoAsaGXgljrzRESPl9VBbEP/p2ED2eQq8xzzPayk0SBl9yABtliPovApicEv/eLO6vzxc41HA87rOxmAr06F4mC3LNZAbDky/7/LgHQgQavt00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766962; c=relaxed/simple;
	bh=OHyIrfC6/g8nZExoO7wMFMUIcgOG6AVe297m0V7aoi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmdSaoWvu4wH8P4f+7+pTSu40MgRlOpkqpD3luMYalsAId5VmxOUFWGAbx/7YFdsOFl/nWnDDr7JmCHOF28y6I9q0XBsOkUT4SSY24j/fq3+V0JWUrkbP8DMrQb3CkHhLeHMtroAyIx2m8Lkl0Mk3LlgrdaM4iIzuK7M+uFVOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy9lAOx4; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy9lAOx4"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4037000b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766959; x=1791371759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nisUZPVpQBuB1msHwbTQNJCMTlKHq/EFYPJBlHcyEkc=;
        b=Gy9lAOx4F1K84oDxtdxiGoqF4ShrZKIaPX8X43b81RS65Y4uvCXaDqoQzHruvTxJ06
         W97J4vzDWtVkwFZ7ebB94t485cgmm6SW2wGfqhWPsVYQWD2CTBqmnauRGTjfLNb213tb
         nhEv6pyuGCOoLNuaeUhIF76K02psX9ych5PyxjdqWFrRv2fnX3HmUTwImsxuqqx5TfWb
         I+U+g0ppDx5m/A/hOMsk6TaVmQ/tG7H4wFpGxObZH4QkpWGqPJmoHBJ/1aj98fRU3mlP
         3HVDOZwGBJ2PQFwcb03sylijHK+0DDzlwgmu1zmhaTUnbxlBmm3n/ysIDkGBJcVB2XgN
         FoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766959; x=1791371759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nisUZPVpQBuB1msHwbTQNJCMTlKHq/EFYPJBlHcyEkc=;
        b=ntBCJi0wVdKioNR2X43w3Lgg8YL1wf6VucjN+xKqdQyn2bBEenRFXJKOz0cQK8ePrM
         jL8iWUT2/oioC/agDt30p4AXgKN9DHcT0CZZyEPp8/AaW0VpMwIo1ljlVvrNiLWqau8K
         yb32AmncnD8RJ1hnAZwsPUVn3z6+g2l0amCeBGuMIyKnDDTxGJaRp3yPG4szBAmZl2Ml
         Afq0t7IAAo7olyDBgIvnCYoRqtQu9oXJnKlCPhcDPkvITCKPEIGz2gKFCsutyed4Dbhh
         qbW3GX76vj/6q6IXoWsGrQkvbiXJlnt5a0ZwtzvK4oWdxJUBi+HHrwHedac8wfMSmyvI
         EXjA==
X-Forwarded-Encrypted: i=1; AKwUvBxNeYxMyuYBE8PPlmtuB6XHutyxEMN7fDaRHuWf/3qQvyGs0KlppHkjCRJhfH2QEQtzURAkVL6QcZPyjj+Var8=@vger.kernel.org
X-Gm-Message-State: AFuF++nzZjgHOcAK+zpzoNAg8gswYmSTL+kwPHy8MHQyDTGw44DdhrsV
	AsE6KP6IAkHPAH4h4g6y9JGBEwXXRSDCwmk56+ncgo4k7N388KPm3fRQ
X-Gm-Gg: AYBFou3WRN/JcakMAiFSJairHmGaip27imKGKLtJ9A2jP/wddAOplhmgcNvo2nBkuSR
	rbcqfOgfaVAOuoRY3Eub1/j8o1Mq61P1h1sfG/dEEwqfgSbXvzNk1vkino4lc835EVYTI6LHhuq
	xuRHUQFaUkvxtfk0CZcfTVRonTWDyMyk+3W8nHSFeRgtzNYONbpOOSjr1tByOiRNnY70Wq+D4IC
	c6cFWrOZ/GbgEUEP41YbyT32oYNU7GqlGZrrkMd08X2r6H+EjDPzAPK3ny9epvSmBqztAF1IxKk
	y8q4WHBaif2f4OQg4Cf7X6QKTYbF27mI54w4TZkTV8F6N1Z8kub5tA69uLanYK92QUEtUJfYgi/
	ku2tI2k//O+a4okORmei7USARo6sXyhIqWQhr5gAawTqIYV1Q5ZLx0fHekifDIEk1sgdBb3PTqt
	0XEfwKA8SBRJ7vib7Uk6iYdTaNIAOTfNRvxM+MikCMjmdGCPKYk3lod6ALutaJGgg6SM6c6N9tD
	EHq8npxljjGGAsxPpQzObdVG/mE4YkYOz/P7FTBf6KbHQOnPANapJXkYWlAnptmS6Jn98ZKlatm
	QR8xN0PJqQ==
X-Received: by 2002:a05:6a00:420e:b0:880:78ca:8400 with SMTP id d2e1a72fcca58-8874c4dce2cmr827228b3a.12.1790766959051;
        Wed, 30 Sep 2026 04:15:59 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c07f4asm634108b3a.59.2026.09.30.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:58 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests/alsa: Check that a write does not silently change other controls
Date: Wed, 30 Sep 2026 20:15:34 +0900
Message-ID: <20260930111534.3782264-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111534.3782264-1-sammiee5311@gmail.com>
References: <20260930111534.3782264-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A control whose register mask is wider than its field clobbers the
field next to it. No event is sent for the neighbour, so nothing
notices. The es8316 bug fixed in
commit 6c1bb4031729 ("ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control")
was one.

Add a test that writes each control's minimum and then its maximum.
After each write it compares the other controls on the card with a
snapshot. The minimum clears the field and the maximum sets its top
bit, which is where a mask one bit too wide lands. Some drivers link
controls on purpose, so a change announced with a value event is only
logged. A silent one fails.

On an HDA HDMI codec and snd-dummy, 39 controls in all, it reports
nothing. A snd-dummy copy with an injected silent overlap fails, and
the same overlap announced with a value event passes.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 tools/testing/selftests/alsa/mixer-test.c | 233 +++++++++++++++++++++-
 1 file changed, 232 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 02136c436e16..966ef83354b9 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -28,7 +28,7 @@
 #include "kselftest.h"
 #include "alsa-local.h"
 
-#define TESTS_PER_CONTROL 7
+#define TESTS_PER_CONTROL 8
 
 /* Suffixes of the SNDRV_CTL_NAME_IEC958() names, not exported to userspace */
 #define IEC958_DEFAULT		"Default"
@@ -52,9 +52,14 @@ struct ctl_data {
 	snd_ctl_elem_id_t *id;
 	snd_ctl_elem_info_t *info;
 	snd_ctl_elem_value_t *def_val;
+	snd_ctl_elem_value_t *snapshot;
+	bool snapshot_valid;
+	bool moved;
 	int elem;
 	int event_missing;
 	int event_spurious;
+	int side_effects;
+	unsigned int ev_mask;
 	struct card_data *card;
 	struct ctl_data *next;
 };
@@ -159,6 +164,10 @@ static void find_controls(void)
 			if (err < 0)
 				ksft_exit_fail_msg("Out of memory\n");
 
+			err = snd_ctl_elem_value_malloc(&ctl_data->snapshot);
+			if (err < 0)
+				ksft_exit_fail_msg("Out of memory\n");
+
 			snd_ctl_elem_list_get_id(card_data->ctls, ctl,
 						 ctl_data->id);
 			snd_ctl_elem_info_set_id(ctl_data->info, ctl_data->id);
@@ -207,6 +216,20 @@ static void find_controls(void)
 	snd_config_delete(config);
 }
 
+/* The control on the same card that an event's numid refers to */
+static struct ctl_data *find_ctl_by_numid(struct card_data *card,
+					  unsigned int numid)
+{
+	struct ctl_data *ctl;
+
+	for (ctl = ctl_list; ctl != NULL; ctl = ctl->next)
+		if (ctl->card == card &&
+		    snd_ctl_elem_info_get_numid(ctl->info) == numid)
+			return ctl;
+
+	return NULL;
+}
+
 /*
  * Block for up to timeout ms for an event, returns a negative value
  * on error, 0 for no event and 1 for an event.
@@ -265,6 +288,17 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 		mask = snd_ctl_event_elem_get_mask(event);
 		ev_id = snd_ctl_event_elem_get_numid(event);
 		if (ev_id != snd_ctl_elem_info_get_numid(ctl->info)) {
+			struct ctl_data *other = find_ctl_by_numid(ctl->card,
+								   ev_id);
+
+			/*
+			 * Remember that the driver announced this one.
+			 * test_ctl_write_side_effects() uses that to tell a
+			 * deliberate link from a silent register collision.
+			 */
+			if (other)
+				other->ev_mask |= mask;
+
 			ksft_print_msg("Event for unexpected ctl %s\n",
 				       snd_ctl_event_elem_get_name(event));
 			/* The loop condition must not see the other control's mask */
@@ -1149,6 +1183,202 @@ static void test_ctl_write_valid(struct ctl_data *ctl)
 			 ctl->card->card_name, ctl->elem);
 }
 
+/*
+ * Build the smallest or the largest value the control offers.  The smallest
+ * clears the control's register field and the largest sets its top bit, which
+ * is the bit a mask one bit too wide puts in its neighbour.
+ */
+static bool set_limit_value(struct ctl_data *ctl, snd_ctl_elem_value_t *val,
+			    bool max)
+{
+	int i, count = snd_ctl_elem_info_get_count(ctl->info);
+
+	snd_ctl_elem_value_set_id(val, ctl->id);
+
+	switch (snd_ctl_elem_info_get_type(ctl->info)) {
+	case SND_CTL_ELEM_TYPE_BOOLEAN:
+		for (i = 0; i < count; i++)
+			snd_ctl_elem_value_set_boolean(val, i, max);
+		return true;
+
+	case SND_CTL_ELEM_TYPE_INTEGER:
+		for (i = 0; i < count; i++)
+			snd_ctl_elem_value_set_integer(val, i, max ?
+				snd_ctl_elem_info_get_max(ctl->info) :
+				snd_ctl_elem_info_get_min(ctl->info));
+		return true;
+
+	case SND_CTL_ELEM_TYPE_INTEGER64:
+		for (i = 0; i < count; i++)
+			snd_ctl_elem_value_set_integer64(val, i, max ?
+				snd_ctl_elem_info_get_max64(ctl->info) :
+				snd_ctl_elem_info_get_min64(ctl->info));
+		return true;
+
+	case SND_CTL_ELEM_TYPE_ENUMERATED:
+		for (i = 0; i < count; i++)
+			snd_ctl_elem_value_set_enumerated(val, i, max ?
+				snd_ctl_elem_info_get_items(ctl->info) - 1 : 0);
+		return true;
+
+	default:
+		/* Nothing sensible to write for the rest */
+		return false;
+	}
+}
+
+/* Note every control on the card that no longer reads as it did */
+static void find_moved_ctls(struct ctl_data *ctl, snd_ctl_elem_value_t *val)
+{
+	struct ctl_data *other;
+	int err;
+
+	for (other = ctl_list; other != NULL; other = other->next) {
+		if (!other->snapshot_valid)
+			continue;
+
+		/*
+		 * The buffer is shared and compare() looks at all of it, so
+		 * clear what the last control left in the slots this one
+		 * does not use.
+		 */
+		snd_ctl_elem_value_clear(val);
+		snd_ctl_elem_value_set_id(val, other->id);
+		err = snd_ctl_elem_read(ctl->card->handle, val);
+		if (err < 0) {
+			ksft_print_msg("snd_ctl_elem_read() failed for %s: %s\n",
+				       other->name, snd_strerror(err));
+			continue;
+		}
+
+		if (snd_ctl_elem_value_compare(other->snapshot, val))
+			other->moved = true;
+	}
+}
+
+/*
+ * Write one control and look for others on the same card that moved with it.
+ * A driver that links two controls on purpose tells userspace about both, so
+ * only an unannounced change is counted.  That is what a control whose
+ * register mask covers bits belonging to its neighbour looks like from here.
+ */
+static void test_ctl_write_side_effects(struct ctl_data *ctl)
+{
+	struct ctl_data *other;
+	snd_ctl_elem_value_t *min_val, *max_val, *read_val;
+	int err;
+
+	snd_ctl_elem_value_alloca(&min_val);
+	snd_ctl_elem_value_alloca(&max_val);
+	snd_ctl_elem_value_alloca(&read_val);
+
+	/* Without a readable default there is nothing to put back */
+	if (snd_ctl_elem_info_is_inactive(ctl->info) ||
+	    !snd_ctl_elem_info_is_writable(ctl->info) ||
+	    !snd_ctl_elem_info_is_readable(ctl->info) ||
+	    !set_limit_value(ctl, min_val, false) ||
+	    !set_limit_value(ctl, max_val, true)) {
+		ksft_test_result_skip("write_side_effects.%s.%d\n",
+				      ctl->card->card_name, ctl->elem);
+		return;
+	}
+
+	/* Drain first, a stale event would look like the driver announced it */
+	drop_events(ctl);
+
+	/*
+	 * Record what the rest of the card reads as.  A volatile control can
+	 * move on its own so there is nothing to compare it against.
+	 */
+	for (other = ctl_list; other != NULL; other = other->next) {
+		other->snapshot_valid = false;
+		other->moved = false;
+		other->ev_mask = 0;
+
+		if (other == ctl || other->card != ctl->card)
+			continue;
+		if (!snd_ctl_elem_info_is_readable(other->info) ||
+		    snd_ctl_elem_info_is_volatile(other->info))
+			continue;
+
+		snd_ctl_elem_value_clear(other->snapshot);
+		snd_ctl_elem_value_set_id(other->snapshot, other->id);
+		err = snd_ctl_elem_read(ctl->card->handle, other->snapshot);
+		if (err < 0) {
+			ksft_print_msg("snd_ctl_elem_read() failed for %s: %s\n",
+				       other->name, snd_strerror(err));
+			continue;
+		}
+
+		other->snapshot_valid = true;
+	}
+
+	/*
+	 * Compare against the snapshot after each write, before anything is
+	 * put back.  Restoring the control we wrote goes through the same
+	 * mask, so doing it first would hide the change we are looking for.
+	 */
+	err = snd_ctl_elem_write(ctl->card->handle, min_val);
+	if (err >= 0) {
+		drop_events(ctl);
+		find_moved_ctls(ctl, read_val);
+		err = snd_ctl_elem_write(ctl->card->handle, max_val);
+	}
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_write() failed for %s: %s\n",
+			       ctl->name, snd_strerror(err));
+	} else {
+		drop_events(ctl);
+		find_moved_ctls(ctl, read_val);
+	}
+
+	for (other = ctl_list; other != NULL; other = other->next) {
+		if (!other->moved)
+			continue;
+
+		if (other->ev_mask & SND_CTL_EVENT_MASK_VALUE) {
+			ksft_print_msg("Writing %s changed %s, the driver said so\n",
+				       ctl->name, other->name);
+		} else {
+			ksft_print_msg("Writing %s silently changed %s\n",
+				       ctl->name, other->name);
+			ctl->side_effects++;
+		}
+	}
+
+	/*
+	 * The control we wrote goes back first so its mask stops moving the
+	 * rest.  A plain write keeps this out of the event counters, they
+	 * belong to the tests that check them.
+	 */
+	snd_ctl_elem_write(ctl->card->handle, ctl->def_val);
+
+	for (other = ctl_list; other != NULL; other = other->next) {
+		if (!other->snapshot_valid ||
+		    !snd_ctl_elem_info_is_writable(other->info))
+			continue;
+
+		snd_ctl_elem_value_clear(read_val);
+		snd_ctl_elem_value_set_id(read_val, other->id);
+		if (snd_ctl_elem_read(ctl->card->handle, read_val) < 0)
+			continue;
+
+		if (snd_ctl_elem_value_compare(other->snapshot, read_val))
+			snd_ctl_elem_write(ctl->card->handle, other->snapshot);
+	}
+
+	/* Our own restores queue events, the next test must not see them */
+	drop_events(ctl);
+
+	if (err < 0)
+		ksft_test_result_skip("write_side_effects.%s.%d\n",
+				      ctl->card->card_name, ctl->elem);
+	else
+		ksft_test_result(!ctl->side_effects,
+				 "write_side_effects.%s.%d\n",
+				 ctl->card->card_name, ctl->elem);
+}
+
 static bool test_ctl_write_invalid_value(struct ctl_data *ctl,
 					 snd_ctl_elem_value_t *val)
 {
@@ -1392,6 +1622,7 @@ int main(void)
 		test_ctl_name(ctl);
 		test_ctl_write_default(ctl);
 		test_ctl_write_valid(ctl);
+		test_ctl_write_side_effects(ctl);
 		test_ctl_write_invalid(ctl);
 		test_ctl_event_missing(ctl);
 		test_ctl_event_spurious(ctl);
-- 
2.43.0

