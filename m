Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9B39FCE
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 02:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181680; cv=none; b=ZQkQdB8IaC6OOXZh56Ykt/4NfU2KgdGcg/41cg2jq9c29KPPEBD+Rld6L1kaGDurANL8jnyNvqSdcIWKnNUCzvtDlofwoC50yQiD44qe9t66kzH/aTiN2Ppv4H40K8ykL/Nq+PCljl1bGYUktMwAjbYglVh2yQNzwl+oxBqudgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181680; c=relaxed/simple;
	bh=y2WHk1EElATFuPrRnMnMdPT7wRBuN+MIsDSt8uiBS7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crJ49HRqJA5Ym2aag03M23I/4IvPqzGSPRoI69A3IrktDUOH+fzXAprLWrrlAlcWKXLL5KWbN1pdWeDGkKGPjkph8SjpkAhGM0wlGrYgSXQMKLdIRm1W223se8b+BYxJEeON6AI06/va0ffhqjmbT5FFgy+PBnkgwICM77qRhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOgDPtyc; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOgDPtyc"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so130494a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 19:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789181678; x=1789786478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co3fSwJnonBc+uhQ5gB6WwuK1NTmdlfZd5Atd2jIXqI=;
        b=SOgDPtycOwsWxj1wEVkGxvsvhMA2rpqWiikMVmoDDKnSz9bcTAhNCGH5/7Uvqb6dYi
         PVM1TLGylvU9bt4ckANFcyXEbWy1qLaq9Th+ItZnwbHuLaEPw3TdPvEbOixfxYqQSp/d
         MZZVhA26iO1rztii9zTIfbR0r8EmzbdcUaZ+51PIOqPFRRpQbqXLyP5NpsplBG07ayuu
         fuFNYxkRuJxB+qmyLQ7F83zz/J2xTnA4LGkDmUBaATU7ktIghzhfQH8PDrteznNvQEX8
         UaraSgGOQAdOh8HxzqExx29tN5vauSeF7AxgeHuS5Ig5OoNk6b3f6aVF2GEAuQsHqRHR
         Py0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789181678; x=1789786478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co3fSwJnonBc+uhQ5gB6WwuK1NTmdlfZd5Atd2jIXqI=;
        b=YmrFq5p9cmu4aN9nOvbfHzZhp+tbOzE9PsIxHks8exm/4uinwtjd6TwVRYcclTaUk5
         +Ew7cwoLUxj8OI/7dLMFFoa889vc6WmKZw3hbtUj7Uz4ehlRAVXQxkY+ZOcr3RMBFYSu
         c5nGAVHbuR9z8D82EkFLhTnW3zAJAiel/PMsniXBhMCVEKuNOm6VJrSs4LqwATK87dUu
         LBkZBPx5KSY5yEuz8H2LdD4OZFVnNYoy702KJLY3gP3u3XkWMXm4STI/BGJ+cXenDLGs
         /fq1qJFI/mmXl7xJXzRjhkQGS8Qjdx0XfVW/oeb5rNBDvzlpVsS7RhZnfdJrpSv+hV25
         joxg==
X-Forwarded-Encrypted: i=1; AKwUvBzPXoFnm1m+qKl7g6npXDzWaruL8otI8K4jk1aexmBxy0MPuIRF+XpX6xab5HcBvoU8eszVE0i50ykgay3qIUI=@vger.kernel.org
X-Gm-Message-State: AFuF++m48kIq9C5eZ8k1TiWua25zMSX4IX0PH8hv/XAfqdyW2D/a1UMv
	h94hwH1Dv51mzHDWy2h5N5jyvjPKTaRBc9lS43fbft0f+yuPVi24f+ip
X-Gm-Gg: AYBFou2/AGPsBlravF4GtiJ2bVj74OmJS3bUKe5s/8XhHwqgD3z/AdDOBLMOva6zK+T
	2NEUKDxJWQR3z1zbbOEjp+oxngGGqSp4sXgaBMxVNEy7c4uFXiHrTG7B4NSVobSGu+zJ31rvLe/
	G1LiVEM1RphZXyLtD0ptrDgm4+sAjEuiS2SvGd5ksFdDG13K/3CUARK/JFSIbJLdtWg8GMmq6d2
	QxB2/OprAWJ+0B9AwA7LRrMVqt82QJ80CS09DQ+FunajjkvTH4ZkUQLgkTzSOlu0l9t0Vls4Yex
	CprXKJiMSC8p/8WkX0YxxAYebfjoZytT3Ma/WIRVvaZcmHEa6pU4vOWRNOxnM594L/z42tmVkyf
	N28f6aCQlCQmJb+4Y3qdE3GMx8yDrXpGMK7njwi0DaT1LbZx8CAyoc+w7jNOWayT1sPrepuMKqx
	GKa4ldYEWlfQrnYDSzOaIjDTZxVIYAMAdmkiXFXenFeSc8l9WKJHMjUxAsv3dPS9i2xRhQGgZ38
	0x1Ze+KG+QK0wZgG3ilYw82NzFA+5qSYaH4XfpxSS9MwJjgnKx6nYn07/e0d+/TqjB/H8FODVhh
	1w==
X-Received: by 2002:a05:6a20:7348:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3db0e0a9ea3mr1564567637.2.1789181677725;
        Fri, 11 Sep 2026 19:54:37 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm1875903a12.22.2026.09.11.19.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:54:37 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v3] selftests/alsa: Test writes to IEC958 controls
Date: Sat, 12 Sep 2026 11:54:30 +0900
Message-ID: <20260912025430.2102149-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904123334.1505003-1-sammiee5311@gmail.com>
References: <20260904123334.1505003-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing checks that the put() callback of an IEC958 control reports a
change, because write_valid skips these controls.

Where the device publishes a mask, toggle every bit in it and check each
write.  A bit the mask advertises that does not stick fails the test, the
way a rejected value fails for the other control types.

Where none is found, keep the old single guess at the non audio bit,
which the device is free to ignore, so only the notification can be
counted against it.  That path writes without checking so drop_events()
clears what those writes leave behind.

On an HDA card with four HDMI PCMs the Con Mask is 0f ff, so each control
walks eleven bits instead of one and all eleven stick:

  -# Totals: pass:212 fail:5 xfail:0 xpass:0 skip:56 error:0
  +# Totals: pass:216 fail:5 xfail:0 xpass:0 skip:52 error:0

A driver whose put() never reports a change still shows up as
event_missing.  hdmi-codec and img-spdif-out store every byte and return
0, so boards using them report one event_missing per walked bit, and
hdmi-codec advertises the whole block so that is 191 of them.  A driver
whose mask claims more than its put() keeps now fails write_valid
outright: au88x0 and ice1712 on Delta 1010 and Mediastation advertise
bytes they never store, cs46xx, oxygen and ice1724 advertise bits their
put() drops, and the RME cards regenerate the whole emphasis field from
one bit so the rest of it never reads back.  None of that hardware was
to hand, the paths were read rather than run.

write_invalid stays a skip.  Every bit pattern is a valid channel status.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
Changes in v3:
- Say check rather than grading.
- Where a mask is found, walk every bit it advertises instead of one and
  fail a bit that does not stick.
- Split the two cases into test_ctl_write_valid_iec958_mask() and
  test_ctl_write_valid_iec958_guess(), so drop_events() now runs only on
  the guess path.
- Keep the guess for the four drivers with no mask.  Adding the mask
  controls to fsl_spdif, fsl_xcvr, uniperif_player and stm32_sai_sub is a
  separate change for each of them.
- Report when the mask lookup falls back to the non audio guess, and
  report a drop_events() failure with the raw return value since three
  of the wait_for_event() paths hand back a bare -1.
- Name the drivers whose mask claims more than their put() keeps, which
  a full walk widens beyond the three v2 mentioned.

v2: https://lore.kernel.org/all/20260904123334.1505003-1-sammiee5311@gmail.com/
v1: https://lore.kernel.org/all/20260904021939.149468-1-sammiee5311@gmail.com/

 tools/testing/selftests/alsa/mixer-test.c | 255 ++++++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 0857d64c322a..53a72753bb08 100644
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
@@ -842,6 +848,251 @@ static bool test_ctl_write_valid_enumerated(struct ctl_data *ctl)
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
+ * Throw away the events from a write we are not checking, one left behind
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
+ * Toggle every bit the device advertises, one at a time.  Each one starts
+ * from the value we read since a driver can look at the rest of the block
+ * when it stores a bit, and bit 0 of the first status byte selects the
+ * layout the others are read in so leave that one alone.
+ */
+static bool test_ctl_write_valid_iec958_mask(struct ctl_data *ctl,
+					     snd_ctl_elem_value_t *orig_val,
+					     const snd_aes_iec958_t *mask)
+{
+	int err, j;
+	unsigned int byte;
+	unsigned char bit;
+	bool fail = false, found = false;
+	snd_aes_iec958_t iec958;
+	snd_ctl_elem_value_t *val;
+	snd_ctl_elem_value_alloca(&val);
+
+	snd_ctl_elem_value_copy(val, orig_val);
+
+	for (byte = 0; byte < sizeof(mask->status); byte++) {
+		for (j = 0; j < 8; j++) {
+			bit = 1 << j;
+
+			if (byte == 0 && bit == IEC958_AES0_PROFESSIONAL)
+				continue;
+			if (!(mask->status[byte] & bit))
+				continue;
+			found = true;
+
+			snd_ctl_elem_value_get_iec958(orig_val, &iec958);
+			iec958.status[byte] ^= bit;
+			snd_ctl_elem_value_set_iec958(val, &iec958);
+
+			err = write_and_verify(ctl, val, NULL);
+			if (err != 0) {
+				ksft_print_msg("%s failed to set advertised status[%u] 0x%02x\n",
+					       ctl->name, byte, bit);
+				fail = true;
+			}
+		}
+	}
+
+	if (!found)
+		ksft_print_msg("%s implements no settable status bits\n",
+			       ctl->name);
+
+	return !fail;
+}
+
+/*
+ * With nothing advertised all we can do is try non audio, and the device
+ * need not implement even that.  Write it once and ignore the result, then
+ * compare against what came back so the value cannot fail, which leaves the
+ * notification counted by event_missing.
+ */
+static bool test_ctl_write_valid_iec958_guess(struct ctl_data *ctl,
+					      snd_ctl_elem_value_t *orig_val)
+{
+	int err;
+	snd_aes_iec958_t iec958;
+	snd_ctl_elem_value_t *val, *read_val, *w_val;
+	snd_ctl_elem_value_alloca(&val);
+	snd_ctl_elem_value_alloca(&read_val);
+	snd_ctl_elem_value_alloca(&w_val);
+
+	snd_ctl_elem_value_get_iec958(orig_val, &iec958);
+	iec958.status[0] ^= IEC958_AES0_NONAUDIO;
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
+	/* Put it back where we found it, then drop the events from both */
+	snd_ctl_elem_value_copy(w_val, orig_val);
+	err = snd_ctl_elem_write(ctl->card->handle, w_val);
+	if (err < 0) {
+		ksft_print_msg("snd_ctl_elem_write() failed: %s\n",
+			       snd_strerror(err));
+		return false;
+	}
+
+	err = drop_events(ctl);
+	if (err < 0) {
+		ksft_print_msg("drop_events() failed for %s: %d\n",
+			       ctl->name, err);
+		return false;
+	}
+
+	if (snd_ctl_elem_value_compare(val, read_val)) {
+		ksft_print_msg("%s does not implement status[0] 0x%02x\n",
+			       ctl->name, IEC958_AES0_NONAUDIO);
+
+		/* Expect what came back, the notification is still checked */
+		return write_and_verify(ctl, val, read_val) == 0;
+	}
+
+	return write_and_verify(ctl, val, NULL) == 0;
+}
+
+/*
+ * Write the channel status bits and check that userspace is told about it.
+ * Where a mask was found every bit in it has to stick, otherwise we fall
+ * back to one guessed bit the device is free to ignore.
+ */
+static bool test_ctl_write_valid_iec958(struct ctl_data *ctl)
+{
+	int err;
+	snd_aes_iec958_t iec958, mask;
+	snd_ctl_elem_value_t *orig_val;
+	snd_ctl_elem_value_alloca(&orig_val);
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
+	if (!read_iec958_mask(ctl, &iec958, &mask)) {
+		ksft_print_msg("%s falling back to non audio\n", ctl->name);
+		return test_ctl_write_valid_iec958_guess(ctl, orig_val);
+	}
+
+	return test_ctl_write_valid_iec958_mask(ctl, orig_val, &mask);
+}
+
 static void test_ctl_write_valid(struct ctl_data *ctl)
 {
 	bool pass;
@@ -878,6 +1129,10 @@ static void test_ctl_write_valid(struct ctl_data *ctl)
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

