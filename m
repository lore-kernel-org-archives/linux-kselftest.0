Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4737B40C
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488398; cv=none; b=JnVvdPLYFw91DmqkyQDhDbDVfpxez/qzLbhUlSTiVide4L7g+kwZ26XNGeLSosGoUnNe0qXrERfcqZyrpNMM9HygTfb8qKcNqs4kkxmueEDOLy6HNoVVqgPGfDaSoW5sbKTYAx2e0G3vhSbplKeSvNCPKgOf352N/zDU1JdIkAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488398; c=relaxed/simple;
	bh=p3+FAJ/9mFidjyr+eEcreaYdBMlN0e+7XIZVWS+Ja/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi6H/pv/ZBgWfahyfQDH0kgFof/15G52GPesB7I3AeQdgeQ70U6dQW8KlwAqv9LP0EX7h8UtAbPFjXjjvIy+Q4ZrBUvv4nkcEDYvSMOXyG1d+iSyVEp0GEfk4t0tppRYLejnmqegvgstF2fxd9rZ4efytIpUhHxzv2kuE2x+zAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niac6wvv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niac6wvv"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so571147a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 19:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488396; x=1789093196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH8hCql3slFtjql46/fGxJDpBGHTGfbVhDtVe9R8smo=;
        b=niac6wvvOL4Eq8box362ohv6ntOmpUvesj954DvolNMvVSwgeL9NoDH7kVY2e18baz
         C3Uu553MbcQDml1Ai5Tf/DWBHnGxr1Igya1Swhws+tVxkWdbsHi+e6u20FDZ9jxa2WVt
         QLS3IHL65UQtMGYGlE2nSmanweCssYF5G3nF4GQ3oO8+u5qEs06j/VBBYr9lLJLhyeN0
         mAdXzx/ppVmzaqysW9kawH1u3q90y+QJHD7o9PgWASnOCI5C9p5hrxIfCaApRwbif8Ur
         9yG6IesLH3DopA7VJ0VXF4xX3vpxz2gEmSrI8Cv29JonUFX/TmAXGgvxkTtsNdk9X2bj
         AS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488396; x=1789093196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH8hCql3slFtjql46/fGxJDpBGHTGfbVhDtVe9R8smo=;
        b=FjOq6hUP9Z0B6avyoa8pH+FfhryOgy/O7GP6ylZMWoiVy4QqCCfl0mg6527Y36SIBj
         OFnjzsLFOS1PdyQkD1LYXW6GWphFHsSsehwklSisgqM/oEY4wAARhyVnCJkMLJJlsMfU
         OhBdVegUSp3UTop8rcXDg4Ug4v2FoyiMV8pBxBJ0i2dVYemqmihIF6XAZZhr2u4ZFMeU
         aLa6kWReafYs0vvVgom9y+aEv58OZOrQCLjoUBTtynzwt/zUcn5E8b1d3jF9REUCIAXd
         5GwHP7hojaaItzqR7wETgAiAuuUOlhFq/M4AtMsFN0apyGE8qXsrTVF1lb6Q41FNekEQ
         L7/g==
X-Forwarded-Encrypted: i=1; AKwUvBxr+nFxH29ug4ycAkOpBCdwOjAhniCWf5+XaCnskht3HxPPaMgNAUTZVzHZPHLPnGMpMuh1zgbkYkTAPjycHyE=@vger.kernel.org
X-Gm-Message-State: AFuF++nalogqiZFLaxTLiWFo5cPO//f1Pgd3cVf4GrclLBH0tGWDANEy
	l6YLBxPkxfq0pLG+yL5fSFKWqllkEEaRAjMJ7P3dYUdoy/nlv/365xG32J3+Dvkd
X-Gm-Gg: AYBFou2Kdozy7IJFxAaXEwjFpi0YtOSmbE5kG4DDqYFuYgszwduLu5JyJDouNW8vJ44
	LyD8bMO2Q1tLJAq5hx1NW2va8r27aSoA8WEht4OjMZ8Y0FtlKr5+oxXyd+yqUMx72ZWOPnHajeK
	1dbmbCotUBC5ueBk67VRIt8d1axpJfwJ+oE6eJpi8U2yhv6PRZKTI0ezcf9wPnvoikS+lRszsZm
	tJsv8NzDFJ72i0ok1LTjtoPbhPJn8L44N/0E28WnovfcsRbZQ41ecgkoeEA7USV3daBpXFgGE6S
	QsKq4i7i8TlA4nfwTCa4INDLgEmzsSL3pLJGfpNZXpvyIBtiCWrDN9cga5iGD8cxyrw5Q8DjApw
	x3/lEgcWjoK1s0KvTiyaowR93g11QmYCCfUIbfp53grU/rmkaNzcR9D3YB5FeLsm5VEDvTnYuAO
	zPtl/isZUmUZdH5cTOX53GB+ybayAsbp7H7Jq40h88CMexWvxiuZ2LWbjSBFA6DbC1lwcC48wyV
	bRu8ldxi969dlZ43CVji5yw2rDkuilyR2ASKPmcNXeGMbkJsdpUtw==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr3809472a91.21.1788488395788;
        Thu, 03 Sep 2026 19:19:55 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm1731212a91.3.2026.09.03.19.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:19:55 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests/alsa: Test writes to IEC958 controls
Date: Fri,  4 Sep 2026 11:19:39 +0900
Message-ID: <20260904021939.149468-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

