Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0E476078
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525228; cv=none; b=h4GipMh3zutXbIWZKtw5+GKrjBDApv+VIpq3SQd+R/JKP4micfxixVSgsWk0Dheq2zwyVUYr0Nno2bL44yLmYfVL43ZIM/3IR+ryDKEgww/SUIbxsq1h+Bc+0DpiXFZ/1RR44svArwd7HDP3DRoeioOzWsOh9hTwOlQGjqoDMQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525228; c=relaxed/simple;
	bh=CGlCoOFuxSCMcRhRdG1IJe+APgQJjnuSqJcxoLP2+64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdBmBahu1ECUmwzsnFoKtmUvM72SUbJAIF5lj4b8Vgoq8USBhBoix+7hxSx8tUvTecejTyTVTmNG4g43cU+wtqcvVPTHL7HETcSI1p3J15HzfCNz+fDqP1Q2+PQG33m1SwznCin4k5ryTyR0ZQ50VPwORRNhbUNunw6rfG/4Uz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8Qw06xc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8Qw06xc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d01663d816so6742035ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525226; x=1789130026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOIRIOEdEBxt33f2KxOmtEgiCZX540U4icvOGMNo9bc=;
        b=H8Qw06xc/KU0A/S8sOimYf8Of5Dr2R1R0rZ7AEOOKKvLy0U2Z9OpWqyRjEupHqpW47
         0tl9+9Yh8ltSD2bmbnMOQPaBJfEy/l/ogGS7X/wy2pvZflHtrYevDSTrNIU/CKahu3W+
         z9fQBPCehAUJHnVRMSNPZtUUdZvFLSPmGGow6aD2+9DTgu9EcQCTSSsGWqKevAtSlPr6
         zquQk/fur7F+3UxbyN/QdQSuEsZ+DikOcS3b5YQ4r77FZnCJ5tibCA6KMLJ1bLaHDka3
         dY7SLvV92hRn1sjYs4wVGlOmbRt2q4ij6R8XI8GBCsUKTzaLqhoZQTFscLRU4rWLQ1Wv
         TEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525226; x=1789130026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOIRIOEdEBxt33f2KxOmtEgiCZX540U4icvOGMNo9bc=;
        b=W0WArZOI7+Zk3n8CJUHzJELzsz9sRgUnR6imCtHekqvSOEUcWTIqrjHabaEnOMjYLW
         tuEdA9cHuIt6yiuxjZH1K7JByRG0EyN8eSO1DcnG4sDQEhaxhbiOL0Zs4LTcPNkaluQl
         eMGa0Da7EYQkgdmdzmMHCrgKY03JP/AWqgohEPmQrZqD7LU3OpozOHJJHDQaucKND2YV
         ORrD+oMNvfU/HZdLC86yZC3tVU42Yv5NcSKGfAQ2GfGn8IDPNhoUvLOfNJu0IZ0ywSyO
         /EXpohFl64ztc07gAx9iZboES4PFDDnP0pENlfnjgLhZ00P1BDQD+b2THD9w/+sTVrA8
         Qc2g==
X-Forwarded-Encrypted: i=1; AKwUvBz9IgoeWxZl7oQenGpY2qM+LS+GYgEPllsveBDnbOvu/LmLWv92MsEq6UUpTHEmbNI6ZSJgI0sZ+AL5iHzeU2g=@vger.kernel.org
X-Gm-Message-State: AFuF++m/0kbxDYLoNLt19fSPh6Sk1XwU2CY6xdia3CCSpfLI3XSNcIt/
	3IjeyPgP1TsuSRo7zMMbe4V6eyt6oEZQcKnuI9h08ODnkiNivM1A2eRK
X-Gm-Gg: AYBFou0JOILAj4x1TWf/xWFDJX108U3WF07/cJDYh+QFhcl+iD7S8Tz3a/lVLvRmkOJ
	YB3if4EOAfxpXKwnR08R6xBC5QLhpcmHQ8axqEL2c+Ht1T8mfdA8WQKsSRCyYSIqvXJk+qgQL7o
	SiXpO1MkgdPfR7gQ7zAVYvvzw/48yq4UWRLzlsf1BWn209a/5aJmGlRlEmNNtp41wTE95upNOHV
	LQtJcaQDIOB7IcvMvDCISI6B/s47s6tSm00Jc6iTGO1rR1lPjS27Iv3lvufKr88FdGks5eCvdGl
	BquISIghcF1WQI1OVYCXaXmDvzhm8gptbg/7kx8G8l4tOzY+ZNUVCb6/RKkTOn17JZiGf9d8k6r
	KoYujbe5jcLg6MezWJxGbddbpJKMGuMeKY4/TL7Hh7r9b6fb+Z3fEFeCvtNP+8Ygn2VxAZmvPN4
	KNX0kkUFsC16eTGt0f2F2cBeufrpfV6itrMmtLeCd/cV70t5Dvn8DgoZ3PWLxWe6Tf59hZD4clf
	DTmTU9qPbXv5ZgYOtB/EzcejxDhKqTKVVXuTXbD7x/fAfZLR17l
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39b262a3cf7mr9939535a91.24.1788525225307;
        Fri, 04 Sep 2026 05:33:45 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc081sm10681112a91.6.2026.09.04.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2] selftests/alsa: Test writes to IEC958 controls
Date: Fri,  4 Sep 2026 21:33:34 +0900
Message-ID: <20260904123334.1505003-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904021939.149468-1-sammiee5311@gmail.com>
References: <20260904021939.149468-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing checks that the put() callback of an IEC958 control reports a
change, because write_valid skips these controls.

Toggle one channel status bit and look for the event. The bit comes
from the Con Mask, Pro Mask or plain Mask sibling where there is one,
non-audio by preference because it means the same thing in both
layouts. Bit 0 of the first byte picks the layout, so leave it alone.

Write the value once without grading it first, since a device need not
implement the bit we picked. The graded write then compares against
what the device gave back, so it can only fail on the notification.

That probe and the restore after it are not graded, so nothing consumes
the events they make and the graded write would find one of those
instead of its own. Drop them first. The other write_valid tests write
only through write_and_verify(), so they have no ungraded write of their
own to drop after.

On an HDA card with four HDMI PCMs:

  -# Totals: pass:212 fail:5 xfail:0 xpass:0 skip:56 error:0
  +# Totals: pass:216 fail:5 xfail:0 xpass:0 skip:52 error:0

A driver whose put() never reports a change now shows up as
event_missing rather than as a skip. hdmi-codec, img-spdif-out and
uniperif_player store the value and return 0, so boards using them
should report a new failure.

write_invalid stays a skip. Every bit pattern is a valid channel
status.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/all/317fc80e-ec80-477d-80f6-53c395de4b4a@sirena.org.uk/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
v2: No code change.  The changelog now says why the test drops the events
    from the two writes it does not grade.  It is bookkeeping for this
    test rather than a general change - the other write_valid tests write
    only through write_and_verify(), so they have no ungraded write of
    their own to drop after.

Link to v1: https://lore.kernel.org/all/20260904021939.149468-1-sammiee5311@gmail.com/

 tools/testing/selftests/alsa/mixer-test.c | 225 ++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index a329f901c5ed..0f5750edcd98 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -30,6 +30,12 @@
 
 #define TESTS_PER_CONTROL 7
 
+/* Suffixes of the SNDRV_CTL_NAME_IEC958() names, not exported to userspace */
+#define IEC958_DEFAULT		"Default"
+#define IEC958_CON_MASK		"Con Mask"
+#define IEC958_PRO_MASK		"Pro Mask"
+#define IEC958_MASK		"Mask"
+
 struct card_data {
 	snd_ctl_t *handle;
 	int card;
@@ -842,6 +848,221 @@ static bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
 	return !fail;
 }
 
+/*
+ * Find the read only mask control for an IEC958 value control.  The two
+ * share device, subdevice and index but not always the interface.
+ */
+static struct ctl_data *find_iec958_mask_ctl(struct ctl_data *ctl,
+					     const char *suffix)
+{
+	char name[64];
+	int stem;
+	struct ctl_data *mask;
+
+	stem = strlen(ctl->name) - strlen(IEC958_DEFAULT);
+	if (snprintf(name, sizeof(name), "%.*s%s", stem, ctl->name, suffix) >=
+	    (int)sizeof(name))
+		return NULL;
+
+	for (mask = ctl_list; mask != NULL; mask = mask->next) {
+		if (mask->card != ctl->card)
+			continue;
+		if (snd_ctl_elem_info_get_type(mask->info) !=
+		    SND_CTL_ELEM_TYPE_IEC958)
+			continue;
+		if (snd_ctl_elem_info_is_inactive(mask->info))
+			continue;
+		if (!snd_ctl_elem_info_is_readable(mask->info))
+			continue;
+		if (snd_ctl_elem_id_get_device(mask->id) !=
+		    snd_ctl_elem_id_get_device(ctl->id))
+			continue;
+		if (snd_ctl_elem_id_get_subdevice(mask->id) !=
+		    snd_ctl_elem_id_get_subdevice(ctl->id))
+			continue;
+		if (snd_ctl_elem_id_get_index(mask->id) !=
+		    snd_ctl_elem_id_get_index(ctl->id))
+			continue;
+		if (strcmp(mask->name, name) == 0)
+			return mask;
+	}
+
+	return NULL;
+}
+
+/*
+ * Read the bits the device says it implements.  Bit 0 of the first status
+ * byte picks which mask applies, some devices publish only a plain Mask.
+ */
+static bool read_iec958_mask(struct ctl_data *ctl,
+			     const snd_aes_iec958_t *cur,
+			     snd_aes_iec958_t *mask)
+{
+	int err;
+	struct ctl_data *mask_ctl;
+	snd_ctl_elem_value_t *val;
+
+	if (!strend(ctl->name, IEC958_DEFAULT))
+		return false;
+
+	if (cur->status[0] & IEC958_AES0_PROFESSIONAL)
+		mask_ctl = find_iec958_mask_ctl(ctl, IEC958_PRO_MASK);
+	else
+		mask_ctl = find_iec958_mask_ctl(ctl, IEC958_CON_MASK);
+	if (!mask_ctl)
+		mask_ctl = find_iec958_mask_ctl(ctl, IEC958_MASK);
+	if (!mask_ctl)
+		return false;
+
+	snd_ctl_elem_value_alloca(&val);
+	snd_ctl_elem_value_set_id(val, mask_ctl->id);
+
+	err = snd_ctl_elem_read(mask_ctl->card->handle, val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_read() failed for %s: %s\n",
+			       mask_ctl->name, snd_strerror(err));
+		return false;
+	}
+
+	snd_ctl_elem_value_get_iec958(val, mask);
+
+	return true;
+}
+
+/*
+ * Pick one bit to toggle.  Bit 0 of the first status byte selects the
+ * layout the others are read in so leave it alone, prefer non audio.
+ */
+static bool pick_iec958_bit(const snd_aes_iec958_t *mask, unsigned int *byte,
+			    unsigned char *bit)
+{
+	unsigned int i;
+	int j;
+
+	if (mask->status[0] & IEC958_AES0_NONAUDIO) {
+		*byte = 0;
+		*bit = IEC958_AES0_NONAUDIO;
+		return true;
+	}
+
+	for (i = 0; i < sizeof(mask->status); i++) {
+		for (j = 0; j < 8; j++) {
+			if (i == 0 && (1 << j) == IEC958_AES0_PROFESSIONAL)
+				continue;
+			if (mask->status[i] & (1 << j)) {
+				*byte = i;
+				*bit = 1 << j;
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Throw away the events from a write we are not grading, one left behind
+ * would make a missing notification look like a notification we got.
+ */
+static int drop_events(struct ctl_data *ctl)
+{
+	int err;
+
+	do {
+		err = wait_for_event(ctl, 0);
+	} while (err > 0);
+
+	return err;
+}
+
+/*
+ * Toggle a single channel status bit and check that userspace is told about
+ * it.  A device need not implement the bit we picked so write the value
+ * without grading it first, then grade against what it gave back.
+ */
+static bool test_ctl_write_valid_iec958(struct ctl_data *ctl)
+{
+	int err;
+	unsigned int byte;
+	unsigned char bit;
+	snd_aes_iec958_t iec958, mask;
+	snd_ctl_elem_value_t *orig_val, *val, *read_val, *w_val;
+	snd_ctl_elem_value_alloca(&orig_val);
+	snd_ctl_elem_value_alloca(&val);
+	snd_ctl_elem_value_alloca(&read_val);
+	snd_ctl_elem_value_alloca(&w_val);
+
+	/*
+	 * The bytes past the ones a driver implements are compared too,
+	 * so start from a read rather than building a value here.
+	 */
+	snd_ctl_elem_value_set_id(orig_val, ctl->id);
+	err = snd_ctl_elem_read(ctl->card->handle, orig_val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
+			       snd_strerror(err));
+		return false;
+	}
+
+	snd_ctl_elem_value_get_iec958(orig_val, &iec958);
+
+	/* With no mask to go on all we can do is try non audio */
+	memset(&mask, 0, sizeof(mask));
+	if (!read_iec958_mask(ctl, &iec958, &mask))
+		mask.status[0] = IEC958_AES0_NONAUDIO;
+
+	if (!pick_iec958_bit(&mask, &byte, &bit)) {
+		ksft_print_msg("%s implements no settable status bits\n",
+			       ctl->name);
+		return true;
+	}
+
+	iec958.status[byte] ^= bit;
+	snd_ctl_elem_value_copy(val, orig_val);
+	snd_ctl_elem_value_set_iec958(val, &iec958);
+
+	/* Writing can modify the value so keep a copy to write from */
+	snd_ctl_elem_value_copy(w_val, val);
+	err = snd_ctl_elem_write(ctl->card->handle, w_val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_write() failed: %s\n",
+			       snd_strerror(err));
+		return false;
+	}
+
+	snd_ctl_elem_value_set_id(read_val, ctl->id);
+	err = snd_ctl_elem_read(ctl->card->handle, read_val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
+			       snd_strerror(err));
+		return false;
+	}
+
+	/* Put it back where we found it, then forget both writes */
+	snd_ctl_elem_value_copy(w_val, orig_val);
+	err = snd_ctl_elem_write(ctl->card->handle, w_val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_write() failed: %s\n",
+			       snd_strerror(err));
+		return false;
+	}
+
+	if (drop_events(ctl) < 0)
+		return false;
+
+	if (snd_ctl_elem_value_compare(val, read_val)) {
+		/* Grade against what came back, the event check still runs */
+		ksft_print_msg("%s does not implement status[%u] 0x%02x\n",
+			       ctl->name, byte, bit);
+		return write_and_verify(ctl, val, read_val) == 0;
+	}
+
+	ksft_print_msg("%s toggling status[%u] 0x%02x\n", ctl->name, byte,
+		       bit);
+
+	return write_and_verify(ctl, val, NULL) == 0;
+}
+
 static void test_ctl_write_valid(struct ctl_data *ctl)
 {
 	bool pass;
@@ -878,6 +1099,10 @@ static void test_ctl_write_valid(struct ctl_data *ctl)
 		pass = test_ctl_write_valid_enumerated(ctl);
 		break;
 
+	case SND_CTL_ELEM_TYPE_IEC958:
+		pass = test_ctl_write_valid_iec958(ctl);
+		break;
+
 	default:
 		/* No tests for this yet */
 		ksft_test_result_skip("write_valid.%s.%d\n",
-- 
2.43.0

